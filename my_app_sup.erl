-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % Define child specifications
    ChildSpecs = [
        % Example child process - replace with your actual worker modules
        #{id => my_worker,
          start => {my_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [my_worker]}
    ],
    
    % Supervisor strategy
    SupFlags = #{strategy => one_for_one,
                 intensity => 10,
                 period => 100},
    
    {ok, {SupFlags, ChildSpecs}}.