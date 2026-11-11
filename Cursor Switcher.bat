@echo off
chcp 65001 >nul 2>&1
title Cursor Switcher - 280 Premium Packs
color 0B
mode con: cols=70 lines=44 >nul 2>&1
setlocal EnableDelayedExpansion
set "PS1=%LOCALAPPDATA%\CursorSwitcher\apply-cursor.ps1"
set "PACKS=%LOCALAPPDATA%\CursorSwitcher\Packs"
set "ZIPURL=https://github.com/mahdi2372/cursor-switcher/releases/download/v2.0/cursor-switcher-v2.zip"
set PAGE=1
set TOTAL=280

REM === Auto-download packs if missing ===
if exist "%PACKS%\acheron" goto READY
if exist "%PACKS%" for /d %%D in ("%PACKS%\*") if exist "%%D" goto READY

echo.
echo   ????????????????????????????????????????????
echo   ?   CURSOR SWITCHER - First Time Setup     ?
echo   ????????????????????????????????????????????
echo.
echo   Packs not found locally.
echo   Downloading from GitHub...
echo.
if not exist "%LOCALAPPDATA%\CursorSwitcher" mkdir "%LOCALAPPDATA%\CursorSwitcher"
powershell -NoProfile -Command "try { [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%ZIPURL%' -OutFile '%TEMP%\cursor-switcher.zip' -UseBasicParsing; Write-Host '  [OK] Download complete' } catch { Write-Host ('  [FAIL] ' + \.Exception.Message); exit 1 }"
if errorlevel 1 (
  echo.
  echo   Manual install:
  echo   1. https://github.com/mahdi2372/cursor-switcher/releases/tag/v1.0
  echo   2. Download cursor-switcher.zip
  echo   3. Extract to %LOCALAPPDATA%\CursorSwitcher\
  echo.
  pause
  exit /b 1
)
echo   Extracting...
powershell -NoProfile -Command "try { Expand-Archive -Path '%TEMP%\cursor-switcher.zip' -DestinationPath '%LOCALAPPDATA%\CursorSwitcher' -Force; Write-Host '  [OK] Extract complete' } catch { Write-Host ('  [FAIL] ' + \.Exception.Message); exit 1 }"
if errorlevel 1 ( echo   Extract failed! & pause & exit /b 1 )
del "%TEMP%\cursor-switcher.zip" >nul 2>&1
echo.
echo   [DONE] 280 packs installed successfully!
timeout /t 2 >nul

:READY
set PS1=%LOCALAPPDATA%\CursorSwitcher\apply-cursor.ps1

:MENU
cls
echo.
echo   ??????????   ??????????  ??????? ??????? ?????????
echo   ???????????? ??????????????????????????????????????
echo   ???      ??????? ???????????   ???????????   ???
echo   ???       ?????  ??????? ???   ???????????   ???
echo   ????????   ???   ???     ????????????  ???   ???
echo    ???????   ???   ???      ??????? ???  ???   ???
echo.
echo   ????????????????????????????????????????????????????
echo   ?  PREMIUM CURSOR COLLECTION   -   %TOTAL% PACKS  ?
echo   ????????????????????????????????????????????????????
echo.
set /a START=(PAGE-1)*15+1
set /a END=PAGE*15
if %END% gtr %TOTAL% set /a END=%TOTAL%
set /a IDX=0
set "PAGE_INFO=Page %PAGE% of 19"
echo   ????????????????????????????????????????????????
echo   ?  %PAGE_INFO%                           ?
echo   ????????????????????????????????????????????????
echo.
for %%P in ("acheron" "anya_forger" "arlechinno" "camellya" "cantarella" "capitaine_.windows" "capitaine_capitaine" "capitaine_capitaine-cursors-master" "carlotta" "carthenyia" "changli" "chihiya_anon" "ciaccona" "cinnamon_cursors" "cyberpunk" "ellen_joe" "felyne_bow" "felyne_great_sword" "felyne_normal_no_weapon" "frieren" "frieren_winter" "furina_2_0" "kuro" "macOS-cursor_MacOS_Win_Kaixi" "macOS-cursor_macOS-cursor" "macOS-cursor_macOS-Style-Cursor-for-Windows-main" "mauvika" "mini_mini.cur-master" "neon-100" "neon-200" "neon-201" "neon-202" "neon-203" "neon-204" "neon-205" "neon-206" "neon-208" "neon-211" "neon-212" "neon-214" "neon-216" "neon-218" "neon-223" "neon-225" "neon-227" "neon-230" "neon-231" "neon-232" "neon-233" "neon-236" "neon-237" "neon-243" "neon-244" "neon-245" "neon-246" "neon-247" "neon-248" "neon-251" "neon-253" "neon-256" "neon-257" "neon-258" "neon-259" "neon-260" "neon-261" "neon-262" "neon-263" "neon-267" "neon-268" "neon-269" "neon-270" "neon-271" "neon-272" "neon-273" "neon-274" "neon-275" "neon-276" "neon-277" "neon-278" "neon-279" "neon-280" "neon-281" "neon-282" "neon-283" "neon-284" "neon-285" "neon-286" "neon-288" "neon-289" "neon-291" "neon-292" "neon-293" "neon-294" "neon-295" "neon-296" "neon-297" "neon-298" "neon-299" "neon-300" "neon-301" "neon-302" "neon-303" "neon-304" "neon-305" "neon-306" "neon-308" "neon-310" "neon-311" "neon-312" "neon-313" "neon-314" "neon-315" "neon-316" "neon-318" "neon-322" "neon-323" "neon-324" "neon-325" "neon-326" "neon-327" "neon-329" "neon-330" "neon-331" "neon-332" "neon-334" "neon-336" "neon-339" "neon-342" "neon-343" "neon-344" "neon-345" "neon-346" "neon-347" "neon-348" "neon-349" "neon-350" "neon-351" "neon-352" "neon-353" "neon-358" "neon-359" "neon-365" "neon-366" "neon-367" "neon-368" "neon-369" "neon-370" "neon-371" "neon-372" "neon-373" "neon-374" "neon-375" "neon-376" "neon-377" "neon-378" "neon-379" "neon-380" "neon-381" "neon-382" "neon-383" "neon-384" "neon-385" "neon-386" "neon-387" "neon-388" "neon-389" "neon-39" "neon-390" "neon-391" "neon-392" "neon-393" "neon-394" "neon-395" "neon-396" "neon-397" "neon-398" "neon-399" "neon-40" "neon-401" "neon-403" "neon-404" "neon-405" "neon-406" "neon-407" "neon-408" "neon-409" "neon-41" "neon-412" "neon-414" "neon-415" "neon-419" "neon-42" "neon-420" "neon-421" "neon-422" "neon-423" "neon-424" "neon-425" "neon-426" "neon-427" "neon-428" "neon-43" "neon-430" "neon-431" "neon-432" "neon-433" "neon-434" "neon-44" "neon-45" "neon-46" "neon-47" "neon-48" "neon-49" "neon-50" "neon-51" "neon-52" "neon-53" "neon-54" "neon-55" "neon-56" "neon-57" "neon-58" "neon-59" "neon-60" "neon-61" "neon-62" "neon-63" "neon-64" "neon-65" "neon-66" "neon-67" "neon-68" "neon-69" "neon-70" "neon-71" "neon-72" "neon-73" "neon-74" "neon-75" "neon-76" "neon-77" "neon-78" "neon-79" "neon-80" "neon-81" "neon-82" "neon-83" "neon-84" "neon-85" "neon-86" "neon-87" "neon-88" "neon-89" "neon-90" "neon-91" "neon-92" "neon-93" "neon-94" "neon-95" "neon-96" "neon-97" "neon-98" "neon-99" "neuro_sama" "nezuko_cursor" "noelle" "open-ani_Kurumi Tokisaki Cursor ver.1.0.0" "open-ani_madoka-magica-normal-9f4a71cf" "open-ani_minji-newjeans-powerpuff-girls-normal-45b5fa88" "open-ani_newjeans-pack-normal-013f6be6" "open-ani_newjeans-pack-normal-0201819e" "open-ani_newjeans-pack-normal-86c65737" "open-ani_slapping-cat-dc0cc836" "shiori_novella" "shorekeeper" "sousou_no_frieren" "wanderer" "windows_11_dark" "windows_11_light" "zani") do (
  set /a IDX+=1
  if !IDX! geq !START! if !IDX! leq !END! (
    set "NAME=%%~P"
    set /a NUM=!IDX!
    echo     [!NUM!] !NAME!
  )
)
echo.
echo   ????????????????????????????????????????????????
echo   ?  [N] Next    [P] Prev    [0] Exit            ?
echo   ?  [D] Windows Default                         ?
echo   ????????????????????????????????????????????????
echo.
set /p "choice=   > Select: "

if "!choice!"=="0" exit
if /i "!choice!"=="D" goto DEFAULT
if /i "!choice!"=="N" goto NEXT
if /i "!choice!"=="P" goto PREV
goto PICK

:NEXT
if %PAGE% lss 19 set /a PAGE+=1
goto MENU

:PREV
if %PAGE% gtr 1 set /a PAGE-=1
goto MENU

:PICK
set "TARGET="
set IDX=0
for %%P in ("acheron" "anya_forger" "arlechinno" "camellya" "cantarella" "capitaine_.windows" "capitaine_capitaine" "capitaine_capitaine-cursors-master" "carlotta" "carthenyia" "changli" "chihiya_anon" "ciaccona" "cinnamon_cursors" "cyberpunk" "ellen_joe" "felyne_bow" "felyne_great_sword" "felyne_normal_no_weapon" "frieren" "frieren_winter" "furina_2_0" "kuro" "macOS-cursor_MacOS_Win_Kaixi" "macOS-cursor_macOS-cursor" "macOS-cursor_macOS-Style-Cursor-for-Windows-main" "mauvika" "mini_mini.cur-master" "neon-100" "neon-200" "neon-201" "neon-202" "neon-203" "neon-204" "neon-205" "neon-206" "neon-208" "neon-211" "neon-212" "neon-214" "neon-216" "neon-218" "neon-223" "neon-225" "neon-227" "neon-230" "neon-231" "neon-232" "neon-233" "neon-236" "neon-237" "neon-243" "neon-244" "neon-245" "neon-246" "neon-247" "neon-248" "neon-251" "neon-253" "neon-256" "neon-257" "neon-258" "neon-259" "neon-260" "neon-261" "neon-262" "neon-263" "neon-267" "neon-268" "neon-269" "neon-270" "neon-271" "neon-272" "neon-273" "neon-274" "neon-275" "neon-276" "neon-277" "neon-278" "neon-279" "neon-280" "neon-281" "neon-282" "neon-283" "neon-284" "neon-285" "neon-286" "neon-288" "neon-289" "neon-291" "neon-292" "neon-293" "neon-294" "neon-295" "neon-296" "neon-297" "neon-298" "neon-299" "neon-300" "neon-301" "neon-302" "neon-303" "neon-304" "neon-305" "neon-306" "neon-308" "neon-310" "neon-311" "neon-312" "neon-313" "neon-314" "neon-315" "neon-316" "neon-318" "neon-322" "neon-323" "neon-324" "neon-325" "neon-326" "neon-327" "neon-329" "neon-330" "neon-331" "neon-332" "neon-334" "neon-336" "neon-339" "neon-342" "neon-343" "neon-344" "neon-345" "neon-346" "neon-347" "neon-348" "neon-349" "neon-350" "neon-351" "neon-352" "neon-353" "neon-358" "neon-359" "neon-365" "neon-366" "neon-367" "neon-368" "neon-369" "neon-370" "neon-371" "neon-372" "neon-373" "neon-374" "neon-375" "neon-376" "neon-377" "neon-378" "neon-379" "neon-380" "neon-381" "neon-382" "neon-383" "neon-384" "neon-385" "neon-386" "neon-387" "neon-388" "neon-389" "neon-39" "neon-390" "neon-391" "neon-392" "neon-393" "neon-394" "neon-395" "neon-396" "neon-397" "neon-398" "neon-399" "neon-40" "neon-401" "neon-403" "neon-404" "neon-405" "neon-406" "neon-407" "neon-408" "neon-409" "neon-41" "neon-412" "neon-414" "neon-415" "neon-419" "neon-42" "neon-420" "neon-421" "neon-422" "neon-423" "neon-424" "neon-425" "neon-426" "neon-427" "neon-428" "neon-43" "neon-430" "neon-431" "neon-432" "neon-433" "neon-434" "neon-44" "neon-45" "neon-46" "neon-47" "neon-48" "neon-49" "neon-50" "neon-51" "neon-52" "neon-53" "neon-54" "neon-55" "neon-56" "neon-57" "neon-58" "neon-59" "neon-60" "neon-61" "neon-62" "neon-63" "neon-64" "neon-65" "neon-66" "neon-67" "neon-68" "neon-69" "neon-70" "neon-71" "neon-72" "neon-73" "neon-74" "neon-75" "neon-76" "neon-77" "neon-78" "neon-79" "neon-80" "neon-81" "neon-82" "neon-83" "neon-84" "neon-85" "neon-86" "neon-87" "neon-88" "neon-89" "neon-90" "neon-91" "neon-92" "neon-93" "neon-94" "neon-95" "neon-96" "neon-97" "neon-98" "neon-99" "neuro_sama" "nezuko_cursor" "noelle" "open-ani_Kurumi Tokisaki Cursor ver.1.0.0" "open-ani_madoka-magica-normal-9f4a71cf" "open-ani_minji-newjeans-powerpuff-girls-normal-45b5fa88" "open-ani_newjeans-pack-normal-013f6be6" "open-ani_newjeans-pack-normal-0201819e" "open-ani_newjeans-pack-normal-86c65737" "open-ani_slapping-cat-dc0cc836" "shiori_novella" "shorekeeper" "sousou_no_frieren" "wanderer" "windows_11_dark" "windows_11_light" "zani") do (
  set /a IDX+=1
  if "!IDX!"=="!choice!" set "TARGET=%%~P"
)
if not defined TARGET (
  echo.
  echo   [!] Invalid choice - try again
  timeout /t 1 >nul
  goto MENU
)

cls
echo.
echo   ????????????????????????????????????????????????????
echo   ?           APPLYING CURSOR PACK...               ?
echo   ????????????????????????????????????????????????????
echo.
echo     Pack: !TARGET!
echo.
echo     [?????????????????????????????] Please wait...
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%LOCALAPPDATA%\CursorSwitcher\apply-cursor.ps1" -PackName "!TARGET!"
echo.
echo   ????????????????????????????????????????????????
echo   ?  Applied! Press any key to continue...       ?
echo   ????????????????????????????????????????????????
pause >nul
goto MENU

:DEFAULT
cls
echo.
echo   ????????????????????????????????????????????????????
echo   ?        RESTORING WINDOWS DEFAULT...             ?
echo   ????????????????????????????????????????????????????
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name '(default)' -Value 'Windows Default'; \='C:\Windows\Cursors'; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Arrow -Value \"\\aero_arrow.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Hand -Value \"\\aero_link.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Help -Value \"\\aero_helpsel.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name AppStarting -Value \"\\aero_busy.ani\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Wait -Value \"\\aero_busy.ani\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Crosshair -Value \"\\cross_cur.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name IBeam -Value \"\\ibeam.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name NWPen -Value \"\\pen.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name No -Value \"\\no.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name SizeNS -Value \"\\size_ns.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name SizeWE -Value \"\\size_we.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name SizeNWSE -Value \"\\size_nwse.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name SizeNESW -Value \"\\size_nesw.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name SizeAll -Value \"\\size_all.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name UpArrow -Value \"\\up.cur\"; Set-ItemProperty 'HKCU:\Control Panel\Cursors' -Name Sizing -Value \"\\size_ns.cur\"; \='[DllImport(\"user32.dll\")] public static extern IntPtr SendMessageTimeout(IntPtr hWnd,uint Msg,UIntPtr wParam,IntPtr lParam,uint fuFlags,uint uTimeout,ref UIntPtr lpdwResult);'; \=Add-Type -MemberDefinition \ -Name W -Namespace U -PassThru; \=[UIntPtr]::Zero; [void]\::SendMessageTimeout([IntPtr]0xffff,0x1A,[UIntPtr]::Zero,[IntPtr]::Zero,2,5000,[ref]\); [void]\::SendMessageTimeout([IntPtr]0xffff,0x15,[UIntPtr]::Zero,[IntPtr]::Zero,2,5000,[ref]\); Add-Type -Namespace W -Name S -MemberDefinition '[DllImport(\"user32.dll\")] public static extern bool SystemParametersInfo(int a,int b,IntPtr c,int d);'; [void][W.S]::SystemParametersInfo(0x57,0,[IntPtr]::Zero,0); Write-Host '  [OK] Windows Default restored'"
echo.
echo   ????????????????????????????????????????????????
echo   ?  Done! Press any key to continue...          ?
echo   ????????????????????????????????????????????????
pause >nul
goto MENU