require 'test\unit'
require 'Gride'
require 'Celula'

class GrideStub < Gride
	def gerarBombas
	end
	
	def povoar (bombas)
		for bomba in bombas
			criarBomba(bomba[0],bomba[1])	
		end
	end
end

class TestGride < Test::Unit::TestCase
	#def testClasseExiste
	#	obj = Gride.new(3,3)
	#end
	
	def testCriarGrid
		Gride.new(3,3)
	end
	
	def testTamanhoValido
		begin
			gride = Gride.new(-1,4)
			assert false
		rescue => e
			assert_equal e.message, "Tamanho Invalido"
		end			
	end
	
	def testRetornarTamanho
	  gride = Gride.new(4,4)
	  assert_equal gride.tamanho, 4
    end
	
	def testNumeroBombasValido
		begin
			gride = Gride.new(4,-4)
			assert false
		rescue => e
			assert_equal e.message, "Numero de bombas invalido"
		end
	end
	
	def testMaisBombasQueCampos
		begin
			gride = Gride.new(4,18)
			assert false
		rescue => e
			assert_equal e.message, "Numero de bombas invalido"
		end
	end
	
	def testQuantidadeDeBombasCorretas
		gride = Gride.new(4,4)
		soma = 0
		for i in 0..3
			for j in 0..3
				soma += 1 if gride.celula(i,j).bomba?
			end
		end
		assert_equal soma, 4
	end
	
	def testGerarBombas_2x2
		gride = Gride.new(2,1)
		for i in 0..1
			for j in 0..1
				if not gride.celula(i,j).bomba?
					assert_equal gride.celula(i,j).valor, 1
				end
			end
		end
	end
	
	#	1 1 1
	#	2 * 1
	#	* 2 1
	def testCriarBombas_3x3
		gride = GrideStub.new(3,2)
		gride.povoar [[1,1],[0,2]]
		
		assert_equal gride.celula(0,0).valor, 1
		assert_equal gride.celula(1,0).valor, 1
		assert_equal gride.celula(2,0).valor, 1
		
		assert_equal gride.celula(0,1).valor, 2
		assert_equal gride.celula(2,1).valor, 1
		
		assert_equal gride.celula(1,2).valor, 2
		assert_equal gride.celula(2,2).valor, 1
	end	
	
end

