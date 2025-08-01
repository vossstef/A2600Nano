
@echo off
set GWSH=C:\Gowin\Gowin_V1.9.10.03_x64\IDE\bin\gw_sh

echo.
echo ============ build mega138k pro ===============
echo.
%GWSH% build_tm138k_pro.tcl
echo.
echo ============ build mega 60k  ===============
echo.
%GWSH% build_tm60k.tcl
echo.
echo ============ build primer 25k  ===============
echo.
%GWSH% build_tp25k.tcl
echo.
echo ============ build nano 20k  ===============
echo.
%GWSH% build_tn20k.tcl
echo.
echo ============ build primer 20k  ===============
echo.
%GWSH% build_tp20k.tcl
echo.
echo ============ build nano 9k  ===============
echo.
%GWSH% build_tn9k.tcl
echo.
echo ============ build nano 20k LCD ===============
echo.
%GWSH% build_tn20k_lcd.tcl
echo.
echo ============ build primer 20k LCD ===============
echo.
%GWSH% build_tp20k_lcd.tcl
echo.
echo ============ build nano 9k LCD ===============
echo.
%GWSH% build_tn9k_lcd.tcl
echo.
echo ============ build mega 60k LCD ===============
echo.
%GWSH% build_tm60k_lcd.tcl
echo.
echo ============ build mega138k pro LCD ===============
echo.
%GWSH% build_tm138k_pro_lcd.tcl
echo.
echo ============ build console 60k LCD ===============
echo.
%GWSH% build_tc60k.tcl
echo.
echo ============ build console 60k LCD bl616 ===============
echo.
%GWSH% build_tc60k_bl616.tcl
echo.
echo ============ build nano 20k bl616 ===============
echo.
%GWSH% build_tn20k_bl616.tcl
echo.
echo.
echo ============ build console 138k LCD bl616 dual switching===============
echo.
%GWSH% build_tc138k.tcl

echo "done."
dir impl\pnr\*.fs

