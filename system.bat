@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; ��������� �������������� ����
Reg.exe add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
REM ; Prefetcher, Superfetch: 2 � ��������� ������ �������� �������, 3 � ��������� �������� ������� � ������� ����������
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "2" /f
REM ; ��������� �������� ���� (��� ������� � ����������� ������)
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d "1" /f
REM ; �� ��������� ������������ VHD �� ���������
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d "4" /f
REM ; ����������� ������ �������� ������ ����������� Microsoft
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
REM ; ������ �������������� ������������ ��� ������������ ������������� � ����������
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
REM ; ������ ��������� �� ������������� ��������
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ; ������ ������������ ��������
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
REM ; ������ Medic ������ ���������� Windows
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
