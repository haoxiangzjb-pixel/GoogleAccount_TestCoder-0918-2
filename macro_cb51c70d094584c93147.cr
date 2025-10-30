# Macro em Crystal para gerar métodos com nomes dinâmicos
macro generate_methods(*method_names)
  {% for name in method_names %}
    # Método gerado dinamicamente: {{name.id}}
    def {{name.id}}
      puts "Executando o método: {{name.id}}"
      return "Resultado do método {{name.id}}"
    end
    
    # Método com sufixo _with_params
    def {{name.id}}_with_params(*args)
      puts "Método {{name.id}} chamado com argumentos: \#{args}"
      return "Resultado do método {{name.id}} com argumentos: \#{args}"
    end
  {% endfor %}
end

# Exemplo de uso do macro
class DynamicMethodsClass
  generate_methods get_user, save_data, validate_input, process_item
  
  def demonstrate_all_methods
    puts "Demonstrando métodos gerados dinamicamente:"
    
    result1 = get_user
    puts "Resultado: \#{result1}"
    
    result2 = save_data
    puts "Resultado: \#{result2}"
    
    result3 = validate_input
    puts "Resultado: \#{result3}"
    
    result4 = process_item
    puts "Resultado: \#{result4}"
    
    puts "\nTestando métodos com parâmetros:"
    param_result = get_user_with_params("João", 25)
    puts "Resultado: \#{param_result}"
    
    param_result2 = process_item_with_params("item1", true)
    puts "Resultado: \#{param_result2}"
  end
end

# Criando instância e testando
puts "Criando instância da classe com métodos gerados..."
dynamic_instance = DynamicMethodsClass.new
dynamic_instance.demonstrate_all_methods