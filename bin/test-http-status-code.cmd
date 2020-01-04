@echo off
setlocal enabledelayedexpansion

set input_file="%~1"

if [%2]==[] (
  set output_file="%~1.result"
) else (
  set output_file="%~2"
)

for /f "usebackq tokens=* delims=" %%u in (%input_file%) do call :process_url "%%u"

goto :done

:process_url
  set url=%1
  set proto=!url:~1,4!
  set proto=!proto:"=!
  if "!proto!"=="http" (
    for /f "usebackq tokens=* delims=" %%c in (`curl %curl_opts% -sk -w "%%{http_code}" -o NUL !url!`) do call :process_code "%%c" !url!
  )
  goto :eof

:process_code
  set /a "code=%~1"
  set url=%2
  set url=!url:"=!
  if !code! GEQ 200 if !code! LSS 300 (
    echo !url!>>!output_file!
  )
  goto :eof

:done
endlocal
