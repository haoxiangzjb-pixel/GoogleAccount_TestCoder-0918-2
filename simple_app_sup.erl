-module(simple_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = #{id => simple_worker,
               start => {simple_worker, start_link, []},
               restart => permanent,
               shutdown => 5000,
               type => worker,
               modules => [simple_worker]},
    Procs = [Worker],
    {ok, {{one_for_one, 1, 5}, Procs}}.