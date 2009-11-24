class Celula
	attr_accessor :valor
	def initialize
		@valor = 0
	end
	def bomba?
		false
	end
end

class Bomba < Celula
	def bomba?
		true
	end
end