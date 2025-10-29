-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % 定义子进程规格
    ChildSpecs = [
        % 示例工作进程
        #{id => my_worker,
          start => {my_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [my_worker]}
    ],
    % 监督策略
    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    {ok, {SupFlags, ChildSpecs}}.