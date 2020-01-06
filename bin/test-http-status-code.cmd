@echo off
setlocal enabledelayedexpansion

if [%1]==[] (
  echo Input file path is not defined
  exit /b 1
) else (
  set input_file="%~1"
)

if not exist %input_file% (
  echo Input file path does not exist
  exit /b 2
)

if [%2]==[] (
  set output_file="%~1.result"
) else (
  set output_file="%~2"
)

if exist %output_file% (
  del /F /Q %output_file%
)

for /l %%n in (1,1,9) do shift
call :process_file %%%%0 %%%%1 %%%%2 %%%%3 %%%%4 %%%%5 %%%%6 %%%%7 %%%%8 %%%%9
goto :done

:process_file
  shift
  for /f "usebackq tokens=* delims=" %%u in (%input_file%) do call :process_url "%%u"
  goto :eof

:process_url
  set url=%1
  set proto=!url:~1,4!
  set proto=!proto:"=!
  if "!proto!"=="http" (
    for /f "usebackq tokens=* delims=" %%c in (`curl -X GET %curl_opts% -sk -w "%%{http_code}" -H "Range: bytes=0-1" -o NUL !url!`) do call :process_code "%%c" !url:%%=%%%%!
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
