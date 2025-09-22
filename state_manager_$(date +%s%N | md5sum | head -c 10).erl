-module(state_manager_$(date +%s%N | md5sum | head -c 10)).
-behaviour(gen_server).

%% API
-export([start_link/0, init_state/0, get_value/1, set_value/2, delete_key/1, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {data = #{}}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init_state() ->
    gen_server:cast(?SERVER, init_state).

get_value(Key) ->
    gen_server:call(?SERVER, {get_value, Key}).

set_value(Key, Value) ->
    gen_server:cast(?SERVER, {set_value, Key, Value}).

delete_key(Key) ->
    gen_server:cast(?SERVER, {delete_key, Key}).

stop() ->
    gen_server:call(?SERVER, stop).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call({get_value, Key}, _From, State = #state{data = Data}) ->
    Value = maps:get(Key, Data, undefined),
    {reply, Value, State};

handle_call(stop, _From, State) ->
    {stop, normal, ok, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(init_state, _State) ->
    {noreply, #state{data = #{}}};

handle_cast({set_value, Key, Value}, State = #state{data = Data}) ->
    NewData = Data#{Key => Value},
    {noreply, State#state{data = NewData}};

handle_cast({delete_key, Key}, State = #state{data = Data}) ->
    NewData = maps:remove(Key, Data),
    {noreply, State#state{data = NewData}};

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.