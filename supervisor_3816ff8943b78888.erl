-module(supervisor_3816ff8943b78888).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([]) ->
    SupFlags = #{
        strategy => one_for_one,
        intensity => 5,
        period => 10
    },

    %% Example child specification template:
    %% ChildSpec = #{
    %%     id => my_worker,
    %%     start => {my_worker, start_link, []},
    %%     restart => permanent,
    %%     shutdown => 5000,
    %%     type => worker,
    %%     modules => [my_worker]
    %% },

    ChildSpecs = [],
    {ok, {SupFlags, ChildSpecs}}.
