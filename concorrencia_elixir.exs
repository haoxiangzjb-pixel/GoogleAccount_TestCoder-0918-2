# Exemplo de concorrência em Elixir usando processos

defmodule ConcorrenciaExemplo do
  # Função para calcular o quadrado de um número (exemplo de trabalho)
  def calcular_quadrado(numero) do
    Process.sleep(1000) # Simula um trabalho que leva tempo
    numero * numero
  end

  # Função para enviar mensagem a um processo
  def enviar_mensagem(pid, mensagem) do
    send(pid, mensagem)
  end

  # Função para receber mensagens
  def receber_mensagens do
    receive do
      msg -> 
        IO.puts("Recebido: #{inspect(msg)}")
        receber_mensagens() # Recursão para continuar recebendo mensagens
    after
      2000 -> 
        IO.puts("Tempo limite atingido, não há mais mensagens.")
    end
  end
end

# Demonstração 1: Criando processos com spawn
IO.puts("=== Demonstração 1: Criando processos com spawn ===")

# Criando um processo para executar uma função
pid1 = spawn(fn -> 
  Process.sleep(1000)
  IO.puts("Processo 1 finalizado")
end)

# Criando outro processo
pid2 = spawn(fn -> 
  Process.sleep(500)
  IO.puts("Processo 2 finalizado")
end)

IO.puts("Processos criados: #{inspect(pid1)}, #{inspect(pid2)}")

# Esperando os processos finalizarem
Process.sleep(1500)

# Demonstração 2: Processos que calculam concorrentemente
IO.puts("\n=== Demonstração 2: Cálculos concorrentes ===")

# Lista de números para calcular o quadrado
numeros = [1, 2, 3, 4, 5]

# Iniciando o tempo
start_time = System.monotonic_time(:millisecond)

# Executando cálculos concorrentemente
resultados = 
  numeros
  |> Enum.map(fn n -> 
    spawn(fn -> 
      resultado = ConcorrenciaExemplo.calcular_quadrado(n)
      send(self(), {:resultado, n, resultado})
    end)
  end)
  |> Enum.map(fn _ -> 
    receive do
      {:resultado, n, resultado} -> 
        IO.puts("Quadrado de #{n} é #{resultado}")
        {n, resultado}
    after
      5000 -> {:error, "Timeout"}
    end
  end)

end_time = System.monotonic_time(:millisecond)
tempo_total = end_time - start_time

IO.puts("Tempo total para cálculos concorrentes: #{tempo_total} ms")

# Demonstração 3: Comunicação entre processos
IO.puts("\n=== Demonstração 3: Comunicação entre processos ===")

# Criando um processo receptor
receptor_pid = spawn(fn -> 
  ConcorrenciaExemplo.receber_mensagens()
end)

# Enviando mensagens para o processo receptor
spawn(fn -> ConcorrenciaExemplo.enviar_mensagem(receptor_pid, {:ola, "Mundo"}) end)
spawn(fn -> ConcorrenciaExemplo.enviar_mensagem(receptor_pid, {:numero, 42}) end)
spawn(fn -> ConcorrenciaExemplo.enviar_mensagem(receptor_pid, {:lista, [1, 2, 3]}) end)

Process.sleep(2500)

# Demonstração 4: Usando Task para concorrência
IO.puts("\n=== Demonstração 4: Usando Task para concorrência ===")

# Criando tarefas concorrentes
tarefas = 
  numeros
  |> Enum.map(fn n ->
    Task.async(fn -> 
      ConcorrenciaExemplo.calcular_quadrado(n)
    end)
  end)

# Coletando resultados das tarefas
resultados_tarefas = 
  tarefas
  |> Enum.map(&Task.await/1)

IO.puts("Resultados com Task: #{inspect(resultados_tarefas)}")

# Demonstração 5: Processos com estado (usando loop recursivo)
IO.puts("\n=== Demonstração 5: Processos com estado ===")

# Função auxiliar para o loop do contador (definida no módulo)
defmodule Contador do
  def loop_contador(valor) do
    receive do
      {:incrementar, resposta_pid} ->
        novo_valor = valor + 1
        send(resposta_pid, {:valor, novo_valor})
        loop_contador(novo_valor)
      {:resetar, resposta_pid} ->
        send(resposta_pid, {:valor, 0})
        loop_contador(0)
      :obter_valor ->
        send(self(), {:valor, valor})
        loop_contador(valor)
    end
  end
end

# Criando um processo contador
contador_pid = spawn(fn ->
  Contador.loop_contador(0)
end)

# Interagindo com o processo contador
send(contador_pid, {:incrementar, self()})
receive do
  {:valor, valor} -> IO.puts("Valor após incremento: #{valor}")
end

send(contador_pid, {:incrementar, self()})
receive do
  {:valor, valor} -> IO.puts("Valor após incremento: #{valor}")
end

send(contador_pid, {:resetar, self()})
receive do
  {:valor, valor} -> IO.puts("Valor após reset: #{valor}")
end

IO.puts("Exemplo de concorrência em Elixir concluído!")