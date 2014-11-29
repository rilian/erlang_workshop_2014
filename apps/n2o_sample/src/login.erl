-module(login).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").

main() -> #dtl{file="login",app=n2o_sample,bindings=[{body,body()}]}.

body() ->
   [
    #span{id=display}, #br{},
	
	#span{body="Login: "}, #textbox{id=user,autofocus=true}, #br{},

	#span{body="Pass: "}, #textbox{id=pass}, #br{},
	
	#button{id=login,body="Login",postback=login,source=[user,pass]}
	].

log_modules() -> [
  index,login
].

event(init) ->
	wf:info(?MODULE, "Pid ~p ~n", [self()]);

event(login) -> 
  wf:info(?MODULE, "Login pressed ~p ~p ~n", [
    wf:q(user),wf:q(pass)]),

  wf:user(wf:js_escape(wf:html_encode(wf:q(user)))),

  wf:redirect("/index");

  	

event(_) -> ok.
