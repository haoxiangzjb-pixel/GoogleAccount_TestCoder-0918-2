-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = {my_worker, {my_worker, start_link, []},
              permanent, 5000, worker, [my_worker]},
    {ok, { {one_for_one, 5, 60}, [Worker]} }.