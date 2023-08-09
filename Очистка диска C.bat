REM Запуск меню очистки
REM cleanmgr /sageset:1

REM Запуск очистки
cleanmgr /sagerun:1

REM Анализ хранилища WinSxS
Dism.exe /online /cleanup-image /AnalyzeComponentStore

REM Очистка хранилища WinSxS
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

REM Отключить гибернацию
powercfg -h off

REM Уменьшить размер файла гибернации
powercfg -h -type reduced

REM Включить гибернацию
powercfg -h on

REM Отключить зарезервированное хранилище
DISM /Online /Set-ReservedStorageState /State:Disabled

REM Включить зарезервированное хранилище
DISM /Online /Set-ReservedStorageState /State:Enabled

REM Проверить сжатие системы
compact /CompactOS:query

REM Сжать систему
compact /CompactOS:always

REM Отменить сжатие системы
REM compact /CompactOS:never