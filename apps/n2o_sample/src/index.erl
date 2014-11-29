-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").

peer()    -> io_lib:format("~p",[wf:peer(?REQ)]).
message() -> wf:js_escape(wf:html_encode(wf:q(message))).

main()    -> #dtl{file="index",app=n2o_sample,bindings=[{body,body()}]}.

body() ->[ 
       #span{body="User: "++ wf:user()},
       #panel{id=history},
       #textbox{id=message},
       #button{id=send,body="Chat",postback={chat},source=[message]} ].

event(init) -> wf:reg({topic,room});

event({chat}) -> wf:send({topic,room},{client,{peer(), message()}});

event(X={client,{Peer,Message}}) ->
  wf:insert_bottom(history,#span{body=Peer++Message}),
  io:format("Client Received: ~p",[X]);

event(Event) -> skip.

