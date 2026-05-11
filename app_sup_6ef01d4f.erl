-module(app_sup_6ef01d4f).
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

    %% Example child specifications
    %% Add your actual worker/supervisor children here
    ChildSpecs = [
        %% Example worker:
        %% #{
        %%     id => worker_name,
        %%     start => {worker_module, start_link, []},
        %%     restart => permanent,
        %%     shutdown => 5000,
        %%     type => worker,
        %%     modules => [worker_module]
        %% }
    ],

    {ok, {SupFlags, ChildSpecs}}.
