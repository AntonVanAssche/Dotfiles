" +----------------------+
" | Bracey (live-server) |
" +----------------------+

let g:bracey_browser_command = 0                      " Use the default browser.
let g:bracey_auto_start_browser = 1                   " Start the browser when Bracey is started.
let g:bracey_refresh_on_save = 1                      " Refresh the page when saving.
let g:bracey_auto_start_server = 1                    " Start the server when Bracey is started.
let g:bracey_server_allow_remote_connections = 1      " Allow remote connections. This is useful when  if you want to view what changes will look like on other platforms at the same time.
let g:bracey_server_port = 8080                       " The port to use for the server.
let g:bracey_server_host = "http://127.0.0.1"         " The host to use for the server.
