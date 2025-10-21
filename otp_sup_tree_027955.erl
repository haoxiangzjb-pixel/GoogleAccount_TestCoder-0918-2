%% OTP Application Supervisor Tree
%% This file contains a complete OTP application with supervisor and worker

-module(otp_sup_tree_027955).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callback
-behaviour(supervisor).
-export([init/1]).

%% Start the application
start(_StartType, _StartArgs) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% Stop the application
stop(_State) ->
    ok.

%% Supervisor initialization
init([]) ->
    % Define a worker child specification
    Worker = {my_worker, {my_worker, start_link, []},
              permanent, 5000, worker, [my_worker]},
    
    % Return supervisor flags and child specifications
    {ok, { {one_for_one, 5, 60}, [Worker]} }.