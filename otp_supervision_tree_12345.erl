%% OTP Supervision Tree for simple_app
%% 
%% Application: simple_app
%% Description: A simple OTP application
%% Version: 1.0.0
%%
%% Supervision Tree:
%% 
%%                    Application
%%                        |
%%                   simple_app_sup (Supervisor)
%%                        |
%%               +-------+--------+
%%               |                |
%%        simple_app_app    simple_worker (GenServer)
%%        
%% Supervisor Strategy: one_for_one
%% Max Restart: 1
%% Max Time: 5 seconds
%%
%% Child Processes:
%% - ID: simple_worker
%%   Start Function: simple_worker:start_link([])
%%   Restart: permanent
%%   Shutdown: 5000ms
%%   Type: worker
%%   Modules: [simple_worker]

-module(otp_supervision_tree_12345).

-export([describe_tree/0]).

describe_tree() ->
    io:format("OTP Supervision Tree for simple_app~n"),
    io:format("===============================~n"),
    io:format("Application: simple_app~n"),
    io:format("Description: A simple OTP application~n"),
    io:format("Version: 1.0.0~n~n"),
    
    io:format("Supervision Tree:~n"),
    io:format("               Application~n"),
    io:format("                   |~n"),
    io:format("          simple_app_sup (Supervisor)~n"),
    io:format("                   |~n"),
    io:format("         +----------+----------+~n"),
    io:format("         |                     |~n"),
    io:format(" simple_app_app      simple_worker (GenServer)~n~n"),
    
    io:format("Supervisor Strategy: one_for_one~n"),
    io:format("Max Restart: 1~n"),
    io:format("Max Time: 5 seconds~n~n"),
    
    io:format("Child Processes:~n"),
    io:format("- ID: simple_worker~n"),
    io:format("  Start Function: simple_worker:start_link([])~n"),
    io:format("  Restart: permanent~n"),
    io:format("  Shutdown: 5000ms~n"),
    io:format("  Type: worker~n"),
    io:format("  Modules: [simple_worker]~n").