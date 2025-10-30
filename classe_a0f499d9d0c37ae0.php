<?php

class ClasseMagica
{
    private $propriedades = [];

    // Método mágico para definir propriedades
    public function __set($nome, $valor)
    {
        echo "Definindo propriedade '$nome' com valor '$valor'\n";
        $this->propriedades[$nome] = $valor;
    }

    // Método mágico para obter propriedades
    public function __get($nome)
    {
        echo "Obtendo valor da propriedade '$nome'\n";
        if (array_key_exists($nome, $this->propriedades)) {
            return $this->propriedades[$nome];
        } else {
            echo "A propriedade '$nome' não existe\n";
            return null;
        }
    }

    // Método mágico para verificar se uma propriedade existe
    public function __isset($nome)
    {
        echo "Verificando se a propriedade '$nome' está definida\n";
        return isset($this->propriedades[$nome]);
    }

    // Método mágico para limpar uma propriedade
    public function __unset($nome)
    {
        echo "Limpando a propriedade '$nome'\n";
        unset($this->propriedades[$nome]);
    }

    // Método mágico chamado quando o objeto é chamado como uma função
    public function __invoke($parametro = null)
    {
        echo "O objeto foi chamado como uma função";
        if ($parametro !== null) {
            echo " com parâmetro: $parametro";
        }
        echo "\n";
    }

    // Método mágico para converter o objeto em string
    public function __toString()
    {
        return "Este é um objeto da classe ClasseMagica com as seguintes propriedades: " . 
               print_r($this->propriedades, true);
    }

    // Método mágico chamado quando o objeto é clonado
    public function __clone()
    {
        echo "Objeto sendo clonado\n";
        $this->propriedades = $this->propriedades; // Cópia das propriedades
    }

    // Método mágico chamado antes da serialização
    public function __sleep()
    {
        echo "Objeto sendo serializado\n";
        return array_keys($this->propriedades); // Retorna os nomes das propriedades a serem serializadas
    }

    // Método mágico chamado após a desserialização
    public function __wakeup()
    {
        echo "Objeto sendo desserializado\n";
        if (!isset($this->propriedades)) {
            $this->propriedades = [];
        }
    }

    // Método mágico para chamar métodos inexistentes
    public function __call($nome, $argumentos)
    {
        echo "Tentando chamar o método '$nome' com os argumentos: " . 
             implode(', ', $argumentos) . "\n";
    }

    // Método mágico estático para chamar métodos estáticos inexistentes
    public static function __callStatic($nome, $argumentos)
    {
        echo "Tentando chamar o método estático '$nome' com os argumentos: " . 
             implode(', ', $argumentos) . "\n";
    }
}

// Exemplo de uso:
$objeto = new ClasseMagica();

// Usando __set
$objeto->nome = "Exemplo";
$objeto->idade = 30;

// Usando __get
echo $objeto->nome . "\n";
echo $objeto->idade . "\n";

// Usando __isset
var_dump(isset($objeto->nome));
var_dump(isset($objeto->inexistente));

// Usando __unset
unset($objeto->idade);
var_dump(isset($objeto->idade));

// Usando __toString
echo $objeto . "\n";

// Usando __invoke
$objeto("parâmetro de teste");

// Usando __call
$objeto->metodoInexistente("arg1", "arg2");

// Usando __callStatic
ClasseMagica::__callStatic("metodoEstaticoInexistente", ["arg1", "arg2"]);

// Testando __clone
$objeto2 = clone $objeto;

// Testando __sleep e __wakeup
$serializado = serialize($objeto);
$novoObjeto = unserialize($serializado);