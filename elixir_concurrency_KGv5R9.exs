defmodule ConcurrencyExample do
  @moduledoc """
  Exemplo de uso de processos em Elixir para concorrência
  """

  def start_processes do
    # Função para executar em paralelo
    worker_function = fn worker_id ->
      Process.sleep(:rand.uniform(2000)) # Simula trabalho com tempo aleatório
      IO.puts("Worker #{worker_id} concluiu seu trabalho no processo #{inspect(self())}")
      {:result, worker_id, :rand.uniform(100)}
    end

    # Cria uma lista de tarefas
    tasks = for worker_id <- 1..5 do
      Task.async(fn -> worker_function.(worker_id) end)
    end

    # Coleta os resultados
    results = tasks
    |> Enum.map(&Task.await/1)
    |> Enum.each(fn result -> IO.inspect(result) end)

    IO.puts("Todos os workers concluíram!")
  end

  def message_passing_example do
    # Exemplo de passagem de mensagens entre processos
    parent = self()

    spawn(fn ->
      Process.sleep(1000)
      send(parent, {:child_message, "Olá do processo filho!", self()})
    end)

    receive do
      {:child_message, message, child_pid} ->
        IO.puts("Recebido do processo #{inspect(child_pid)}: #{message}")
    after
      2000 ->
        IO.puts("Nenhuma mensagem recebida após 2 segundos")
    end
  end

  def spawn_multiple_processes do
    # Exemplo de criação de múltiplos processos
    processes = for i <- 1..3 do
      spawn(fn ->
        Process.sleep(:rand.uniform(1000))
        send(self(), {:completed, i, :rand.uniform(100)})
      end)
    end

    # Aguarda mensagens dos processos
    for _ <- processes do
      receive do
        {:completed, process_id, value} ->
          IO.puts("Processo #{process_id} completou com valor #{value}")
      after
        1500 ->
          IO.puts("Timeout esperando resposta de um processo")
      end
    end
  end
end

# Execução dos exemplos
IO.puts("=== Exemplo 1: Usando Tasks ===")
ConcurrencyExample.start_processes()

IO.puts("\n=== Exemplo 2: Passagem de Mensagens ===")
ConcurrencyExample.message_passing_example()

IO.puts("\n=== Exemplo 3: Múltiplos Processos ===")
ConcurrencyExample.spawn_multiple_processes()

IO.puts("\nExemplo de concorrência em Elixir concluído!")
