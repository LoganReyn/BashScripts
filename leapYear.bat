@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:LeapYearCheck
    REM Input validation and leap year calculation
    SET "year="
    SET /P year=Enter a year to check: 

    REM Validate input is a number
    ECHO !year!| FINDSTR /R "^[0-9][0-9]*$" >nul
    IF ERRORLEVEL 1 (
        ECHO Invalid input. Please enter a numeric year.
        GOTO LeapYearCheck
    )

    REM Leap Year Calculation
    SET /A "div4=!year! %% 4"
    SET /A "div100=!year! %% 100"
    SET /A "div400=!year! %% 400"

    IF !div4! NEQ 0 (
        ECHO !year! is NOT a leap year (not divisible by 4)
    ) ELSE (
        IF !div100! EQU 0 (
            IF !div400! NEQ 0 (
                ECHO !year! is NOT a leap year (divisible by 100 but not 400)
            ) ELSE (
                ECHO !year! is a LEAP YEAR (divisible by 400)
            )
        ) ELSE (
            ECHO !year! is a LEAP YEAR (divisible by 4 but not 100).
        )
    )

    REM Use CHOICE for continuation
    ECHO.
    ECHO Do you want to check another year?
    CHOICE /C YN /M "Press Y for Yes or N for No "
    
    IF ERRORLEVEL 2 GOTO End
    IF ERRORLEVEL 1 GOTO LeapYearCheck

:End
    ECHO Program Finished. 
EXIT /B 0
