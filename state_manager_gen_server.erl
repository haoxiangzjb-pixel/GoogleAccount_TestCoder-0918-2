-module(state_manager_gen_server).
-behaviour(gen_server).

%% API
-export([start_link/0, get_state/0, set_state/1, increment_counter/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {
    data = #{} :: map(),
    counter = 0 :: integer()
}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get_state() ->
    gen_server:call(?SERVER, get_state).

set_state(NewData) ->
    gen_server:call(?SERVER, {set_state, NewData}).

increment_counter() ->
    gen_server:cast(?SERVER, increment_counter).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(get_state, _From, State) ->
    {reply, {ok, State}, State};

handle_call({set_state, NewData}, _From, _State) ->
    NewState = #state{data=NewData, counter=0},
    {reply, ok, NewState};

handle_call(_Request, _From, State) ->
    {reply, error, State}.

handle_cast(increment_counter, State = #state{counter=Counter}) ->
    NewState = State#state{counter=Counter+1},
    {noreply, NewState};

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================