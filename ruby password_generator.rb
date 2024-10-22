class PasswordGenerator
  def initialize(length, include_numbers: true, include_symbols: true)
    @length = length
    @include_numbers = include_numbers
    @include_symbols = include_symbols
    @characters = ('a'..'z').to_a + ('A'..'Z').to_a  # Letras minúsculas e maiúsculas
    @characters += ('0'..'9').to_a if @include_numbers  # Números
    @characters += %w[! @ # $ % ^ & * ( ) _ + - =] if @include_symbols  # Símbolos
  end

  def generate
    Array.new(@length) { @characters.sample }.join  # Gera uma senha aleatória
  end
end

# Interação com o usuário
puts "Bem-vindo ao Gerador de Senhas!"
print "Digite o comprimento da senha: "
length = gets.chomp.to_i
print "Incluir números? (s/n): "
include_numbers = gets.chomp.downcase == 's'
print "Incluir símbolos? (s/n): "
include_symbols = gets.chomp.downcase == 's'

generator = PasswordGenerator.new(length, include_numbers: include_numbers, include_symbols: include_symbols)
password = generator.generate

puts "Sua senha gerada é: #{password}"
