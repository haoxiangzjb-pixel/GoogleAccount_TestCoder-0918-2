# Macro para gerar métodos automaticamente
macro define_methods(*names)
  {% for name in names %}
    def {{name.id}}
      puts "Método {{name.id}} foi chamado!"
    end
  {% endfor %}
end

# Exemplo de uso do macro
class ExampleClass
  define_methods hello, world, test, crystal
  
  def show_all_methods
    puts "Chamando todos os métodos gerados:"
    hello
    world
    test
    crystal
  end
end

# Testar a classe
example = ExampleClass.new
example.show_all_methods