require 'Celula'

class Gride
	attr_reader :campos

	def initialize(tamanho,bombas)
	  if tamanho < 1
		raise "Tamanho Invalido"
	  end
	  if bombas < 1 or bombas > tamanho * tamanho
		raise "Numero de bombas invalido"
	  end
	  
	  @tamanho = tamanho
	  @bombas = bombas
	 
	  @campos = []
	  for i in 1..tamanho
		@campos << []
	  end
	  for coluna in @campos
		@tamanho.times{ coluna << Celula.new}
	  end
	  gerarBombas
	end
	
	def gerarBombas
		@bombas.times{
			x = rand @tamanho
			y = rand @tamanho
			while celula(x,y).bomba?
				x = rand @tamanho
				y = rand @tamanho
			end
			criarBomba(x, y)
		}		
	end
	
	def criarBomba(x,y)
		@campos[x][y] = Bomba.new
		
		aumentaValor(x-1, y-1)
		aumentaValor(x, y-1)
		aumentaValor(x+1, y-1)
		
		aumentaValor(x-1, y)
		aumentaValor(x+1, y)
		
		aumentaValor(x-1, y+1)
		aumentaValor(x, y+1)
		aumentaValor(x+1, y+1)
	end
	
	def aumentaValor(x,y)
		if x >= 0 and x < tamanho and y >= 0 and y < tamanho
			@campos[x][y].valor += 1
		end
	end
	
	def celula(x,y)
		@campos[x][y]
	end
	
	def tamanho
	  @tamanho
	end
end