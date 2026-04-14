-module(sequence_generator).
-export([main/0]).

%% Função principal que gera uma sequência usando list comprehension
%% e salva em um arquivo com nome aleatório
main() ->
    %% Gera uma sequência de 1 a 20 usando list comprehension
    Sequence = [X * X || X <- lists:seq(1, 20)],
    
    %% Gera um nome aleatório para o arquivo
    RandomSuffix = rand:uniform(999999),
    FileName = io_lib:format("sequence_~B.txt", [RandomSuffix]),
    
    %% Converte a sequência para string
    Content = io_lib:format("Sequência de quadrados (1-20): ~p~n", [Sequence]),
    
    %% Escreve no arquivo
    ok = file:write_file(FileName, Content),
    
    %% Imprime mensagem de confirmação
    io:format("Arquivo criado: ~s~n", [FileName]),
    io:format("Conteúdo: ~s", [Content]).
