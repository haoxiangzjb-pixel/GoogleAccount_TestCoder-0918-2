-module(supervisor_tree_1760774040).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % Define child specifications for the supervision tree
    ChildSpecs = [
        % Example child process - this would typically be your actual worker modules
        #{id => example_worker,
          start => {example_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [example_worker]},
        
        % Another example child - you can have multiple children in your supervision tree
        #{id => another_worker,
          start => {another_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [another_worker]}
    ],
    
    % Supervisor strategy configuration
    % one_for_one: if a child process terminates, only that process is restarted
    % one_for_all: if a child process terminates, all other child processes are terminated and then all child processes are restarted
    % rest_for_one: if a child process terminates, the rest of the child processes (that is, the child processes after the terminated process in start order) are terminated and then restarted along with the terminated child process
    % simple_one_for_one: similar to one_for_one but designed for dynamically added children
    SupFlags = #{strategy => one_for_one,
                 intensity => 10,  % maximum number of restarts in time period
                 period => 100},   % time period in seconds
    
    {ok, {SupFlags, ChildSpecs}}.