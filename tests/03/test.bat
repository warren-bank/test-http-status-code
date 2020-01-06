@echo off

set PATH=%~dp0..\..\bin;%PATH%

set curl_opts=-H "User-Agent: Mozilla"

set file_in="%~dp0.\in.txt"
set file_out="%~dp0.\out-win.txt"

test-http-status-code %file_in% %file_out%
