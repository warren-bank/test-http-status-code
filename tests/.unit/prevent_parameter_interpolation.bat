@echo off

for /l %%n in (1,1,9) do shift
call :process_file %%%%0 %%%%1 %%%%2 %%%%3 %%%%4 %%%%5 %%%%6 %%%%7 %%%%8 %%%%9
goto :done

:process_file
  shift
  echo %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
  goto :eof

:done
pause
