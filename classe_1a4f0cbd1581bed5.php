<?php

class ClasseMagica {
    private $propriedades = array();

    // Método mágico para definir valores de propriedades
    public function __set($nome, $valor) {
        echo "Definindo propriedade '$nome' para '$valor'\n";
        $this->propriedades[$nome] = $valor;
    }

    // Método mágico para obter valores de propriedades
    public function __get($nome) {
        echo "Obtendo valor da propriedade '$nome'\n";
        if (array_key_exists($nome, $this->propriedades)) {
            return $this->propriedades[$nome];
        }
        return null;
    }

    // Método mágico para verificar se uma propriedade existe
    public function __isset($nome) {
        echo "Verificando se a propriedade '$nome' está definida\n";
        return isset($this->propriedades[$nome]);
    }

    // Método mágico para limpar uma propriedade
    public function __unset($nome) {
        echo "Limpando a propriedade '$nome'\n";
        unset($this->propriedades[$nome]);
    }

    // Método mágico para converter o objeto em string
    public function __toString() {
        $props = array();
        foreach ($this->propriedades as $nome => $valor) {
            $props[] = "$nome: $valor";
        }
        return "ClasseMagica: [" . implode(", ", $props) . "]";
    }

    // Método mágico chamado quando o objeto é serializado
    public function __sleep() {
        echo "Preparando para serializar o objeto\n";
        return array_keys($this->propriedades);
    }

    // Método mágico chamado quando o objeto é desserializado
    public function __wakeup() {
        echo "Objeto foi desserializado\n";
    }

    // Método mágico para chamar métodos dinamicamente
    public function __call($nome, $argumentos) {
        echo "Tentando chamar o método '$nome' com argumentos: " . implode(", ", $argumentos) . "\n";
    }

    // Método mágico estático para chamar métodos estáticos dinamicamente
    public static function __callStatic($nome, $argumentos) {
        echo "Tentando chamar o método estático '$nome' com argumentos: " . implode(", ", $argumentos) . "\n";
    }
}

// Exemplo de uso
$obj = new ClasseMagica();

$obj->nome = "Exemplo";
$obj->idade = 30;

echo $obj->nome . "\n";
echo $obj->idade . "\n";

echo $obj . "\n";

$obj->metodoInexistente("arg1", "arg2");

ClasseMagica::__callStatic("metodoEstatico", array("valor1", "valor2"));

var_dump(isset($obj->nome));
unset($obj->nome);
var_dump(isset($obj->nome));