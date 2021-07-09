%% @author JSN
%% @doc @todo Add description to web_app.

%%
%% Secure Sockets Layer (SSL)
%% Erlang Scripting Interface (ESI)
%% Common Gateway Interface (CGI)
%% User Authentication (using Mnesia, Dets or plain text database)
%% Common Logfile Format (with or without disk_log(3) support)
%% URL Aliasing
%% Action Mappings
%% Directory Listings

-module(web_app).

%% ====================================================================
%% API functions
%% ====================================================================

-export([start/0,service/3]). 

start() ->
   inets:start(httpd, [ 
      {modules, [ 
         mod_alias, 
         mod_auth, 
         mod_esi, 
         mod_actions, 
         mod_cgi, 
         mod_dir,
         mod_get, 
         mod_head, 
         mod_log, 
         mod_disk_log 
      ]}, 
      
      {port,8081}, 
      {server_name,"web_app"}, 
      {server_root,"C://Users/JSN/Desktop/Projetos/Desenvolvimento/Erlang"}, 
      {document_root,"C://Users/JSN/Desktop/Projetos/Desenvolvimento/Erlang"}, 
      {erl_script_alias, {"/erl", [web_app]}}, 
      {error_log, "error.log"}, 
      {security_log, "security.log"}, 
      {transfer_log, "transfer.log"}, 
      
      {mime_types,[ 
         {"html","text/html"}, {"css","text/css"}, {"js","application/x-javascript"} ]} 
   ]). 
         
service(SessionID, _Env, _Input) -> mod_esi:deliver(SessionID, [ 
 "Content-Type: text/html\r\n\r\n", "
<!DOCTYPE html>
<html>
<head>
<title>JSN Software - Erlang</title>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/*  header */
header {
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* 2 columns/boxes  floats  */
nav {
  float: left;
  width: 30%;
  height: 300px; 
  background: #ccc;
  padding: 20px;
}

/* Style  list  menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: #f1f1f1;
  height: 300px; 
}

/* Clear floats columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style  footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}

/* Responsive layout   */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>

<h2>JSN Softwar</h2>
<hr/>
<br/>
<p>Utilização de teorias, técnicas e ferramentas da Ciência da Computação para a produção e desenvolvimento de sistemas de softwares. </p>

<header>
<h2>Computação distribuída</h2>
<h2>Computação Gráfica</h2>
<h2>Segurança Computacional</h2>
</header>



<footer>
  <p>Contato github: jsnprogramer@gmail.com</p>
</footer>

</body>
</html>

" ]).