-module(example_worker).
-behaviour(gen_server).

%% API
-export([start_link/0, stop/1]).
%% Gen Server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

%%% API
start_link() ->
    gen_server:start_link(?MODULE, [], []).

stop(Pid) ->
    gen_server:call(Pid, stop).

%%% Gen Server callbacks
init([]) ->
    {ok, #state{}}.

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.