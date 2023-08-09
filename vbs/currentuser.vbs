Option Explicit
'~ On Error Resume Next
RequireAdmin

Dim objReg
Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")

' ---------------------------------------------------  !!! Incorrect Data Found !!!  -------------------------------------------------------------
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,36,00,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,31,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,35,00,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,31,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,35,00,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,31,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,37,00,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,31,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
' HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,31,00,00,00
' ------------------------------------------------------------------------------------------------------------------------------------------------

' ; Отключить Кортану
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Search", "CortanaEnabled", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Search", "CortanaConsent", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Search", "AllowSearchToUseLocation", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Search", "BingSearchEnabled", "REG_DWORD", 0
' ; Отключить историю поиска
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Search", "DeviceHistoryEnabled", "REG_DWORD", 0
' ; Отключить автоматическое скрытие полос прокрутки
RegWrite "HKCU\Control Panel\Accessibility", "DynamicScrollbars", "REG_DWORD", 0
' ; Ускорить проводник и завершение процессов
RegWrite "HKCU\Control Panel\Desktop", "AutoEndTasks", "REG_SZ", "1"
RegWrite "HKCU\Control Panel\Desktop", "HungAppTimeout", "REG_SZ", "3000"
RegWrite "HKCU\Control Panel\Desktop", "MenuShowDelay", "REG_SZ", "100"
RegWrite "HKCU\Control Panel\Desktop", "WaitToKillAppTimeout", "REG_SZ", "3000"
RegWrite "HKCU\Control Panel\Desktop", "LowLevelHooksTimeout", "REG_SZ", "3000"
' ; Разрешить исправлять размытость DPI
RegWrite "HKCU\Control Panel\Desktop", "EnablePerProcessSystemDPI", "REG_DWORD", 1
' ; Использование 100% качества картинки
RegWrite "HKCU\Control Panel\Desktop", "JPEGImportQuality", "REG_DWORD", 100
' ; Запретить веб-сайтам доступ к списку языков
RegWrite "HKCU\Control Panel\International\User Profile", "HttpAcceptLanguageOptOut", "REG_DWORD", 1
' ; Отключить предложение настроить Интернет
RegWrite "HKCU\Software\Microsoft\Internet Connection Wizard", "Completed", "REG_DWORD", 1
' ; Запретить приложениям работать в фоновом режиме
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications", "GlobalUserDisabled", "REG_DWORD", 1
' ; Ускорить автозагрузку программ
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize", "StartupDelayInMSec", "REG_DWORD", 0
' ; Запретить отслеживать запуски приложений
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Start_TrackProgs", "REG_DWORD", 0
' ; Отключить индетификатор рекламы
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo", "Enabled", "REG_DWORD", 0
' ; Отключить советы и рекомендации от Microsoft
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy", "TailoredExperiencesWithDiagnosticDataEnabled", "REG_DWORD", 0
' ; Получать обновления только от Microsoft
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization", "SystemSettingsDownLoadMode", "REG_DWORD", 1
' ; Отключить автозапуск
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers", "DisableAutoplay", "REG_DWORD", 1
' ; Отключить GameDVR
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR", "AppCaptureEnabled", "REG_DWORD", 0
' ; Отключить GameDVR
RegWrite "HKCU\System\GameConfigStore", "GameDVR_Enabled", "REG_DWORD", 0
' ; Отключить GameDVR
RegWrite "HKCU\Software\Microsoft\GameBar", "AutoGameModeEnabled", "REG_DWORD", 0
' ; Отключить встроенную проверку подлинности Windows
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "EnableNegotiate", "REG_DWORD", 0
' ; Отключить предупреждение о просмотре веб-страницы через безопасное соединение
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "WarnonZoneCrossing", "REG_DWORD", 0
' ; Отключить предупреждение "Информация переданная через Интернет..."
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1601", "REG_DWORD", 0
' ; Отключить сихронизацию
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync", "SyncPolicy", "REG_DWORD", 5
' ; Отключить сихронизацию
RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync", "Enabled", "REG_DWORD", 0
' ; Скрыть текст инструкций в ножницах
RegWrite "HKCU\Software\Microsoft\Windows\TabletPC\Snipping Tool", "DisplaySnipInstructions", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Windows\TabletPC\Snipping Tool", "IsScreenSketchBannerExpanded", "REG_DWORD", 0
' ; Отключить персонализацию рукописного ввода
RegWrite "HKCU\Software\Microsoft\Personalization\Settings", "AcceptedPrivacyPolicy", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKCU\Software\Microsoft\Input\TIPC", "Enabled", "REG_DWORD", 0
' ; Отключить формирование отзывов
RegWrite "HKCU\Software\Microsoft\Siuf\Rules", "NumberOfSIUFInPeriod", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Siuf\Rules", "PeriodInNanoSeconds", "REG_DWORD", 0
' ; Запретить приложеним использовать голосовую активацию
RegWrite "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps", "AgentActivationEnabled", "REG_DWORD", 0
RegWrite "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps", "AgentActivationOnLockScreenEnabled", "REG_DWORD", 0
' ; Скрыть вкладку "Предыдущие версии"
RegWrite "HKCU\Software\Policies\Microsoft\PreviousVersions", "DisableLocalPage", "REG_DWORD", 1
' ; Отключить возможность участия в программе по улучшению справки
RegWrite "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0", "NoExplicitFeedback", "REG_DWORD", 1
RegWrite "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0", "NoImplicitFeedback", "REG_DWORD", 1
' ; Отключить "Ознакомиться с другими результами поиска..."
RegWrite "HKCU\Software\Policies\Microsoft\Windows\Explorer", "DisableSearchBoxSuggestions", "REG_DWORD", 1
' ; Показывать полностью имена длинных файлов в проводнике
RegWrite "HKCU\Control Panel\Desktop\WindowMetrics", "IconTitleWrap", "REG_SZ", "0"
' ;  Отключить автоматическое обучение
RegWrite "HKCU\Microsoft\InputPersonalization\TrainedDataStore", "HarvestContacts", "REG_DWORD", 0
' ; Отключить автозапуск диктора
RegWrite "HKCU\Control Panel\Accessibility\SlateLaunch", "LaunchAT", "REG_DWORD", 0
RegWrite "HKCU\Control Panel\Accessibility\SlateLaunch", "ATapp", "REG_SZ", ""
' ; Отключить залипание SHIFT
RegWrite "HKCU\Control Panel\Accessibility\StickyKeys", "Flags", "REG_SZ", "506"
' ;[HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys]
' ; Включить звук переключения CAPS
' ;"Flags"="63"
' ; Включить "NumLock"
RegWrite "HKCU\Control Panel\Keyboard", "InitialKeyboardIndicators", "REG_SZ", "2"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".jpg", "REG_SZ", "PhotoViewer.FileAssoc.Jpeg"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".wdp", "REG_SZ", "PhotoViewer.FileAssoc.Wdp"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".jfif", "REG_SZ", "PhotoViewer.FileAssoc.JFIF"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".dib", "REG_SZ", "PhotoViewer.FileAssoc.Bitmap"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".png", "REG_SZ", "PhotoViewer.FileAssoc.Png"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".tiff", "REG_SZ", "PhotoViewer.FileAssoc.Tiff"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".jxr", "REG_SZ", "PhotoViewer.FileAssoc.Wdp"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".bmp", "REG_SZ", "PhotoViewer.FileAssoc.Bitmap"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".jpe", "REG_SZ", "PhotoViewer.FileAssoc.Jpeg"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".jpeg", "REG_SZ", "PhotoViewer.FileAssoc.Jpeg"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".gif", "REG_SZ", "PhotoViewer.FileAssoc.Gif"
RegWrite "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations", ".tif", "REG_SZ", "PhotoViewer.FileAssoc.Tiff"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap", "ImageOptionFlags", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\DefaultIcon", "", "REG_SZ", "%SystemRoot%\System32\imageres.dll,-70"
RegWriteKey "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget", "Clsid", "REG_SZ", "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF", "EditFlags", "REG_DWORD", 65536
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF", "ImageOptionFlags", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\DefaultIcon", "", "REG_SZ", "%SystemRoot%\System32\imageres.dll,-72"
RegWriteKey "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget", "Clsid", "REG_SZ", "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg", "EditFlags", "REG_DWORD", 65536
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg", "ImageOptionFlags", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\DefaultIcon", "", "REG_SZ", "%SystemRoot%\System32\imageres.dll,-72"
RegWriteKey "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget", "Clsid", "REG_SZ", "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png", "ImageOptionFlags", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\DefaultIcon", "", "REG_SZ", "%SystemRoot%\System32\imageres.dll,-71"
RegWriteKey "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\DropTarget", "Clsid", "REG_SZ", "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp", "EditFlags", "REG_DWORD", 65536
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp", "ImageOptionFlags", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\DefaultIcon", "", "REG_SZ", "%SystemRoot%\System32\wmphoto.dll,-400"
RegWriteKey "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command"
RegWrite "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget", "Clsid", "REG_SZ", "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"

Function RegWrite(reg_keyname, reg_valuename,reg_type,ByVal reg_value)
	Dim aRegKey, Return
	aRegKey = RegSplitKey(reg_keyname)
	If IsArray(aRegKey) = 0 Then
		RegWrite = 0
		Exit Function
	End If

	Return = RegWriteKey(aRegKey)
	If Return = 0 Then
		RegWrite = 0
		Exit Function
	End If

	Select Case reg_type
		Case "REG_SZ"
			Return = objReg.SetStringValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)
		Case "REG_EXPAND_SZ"
			Return = objReg.SetExpandedStringValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)
		Case "REG_BINARY"
			If IsArray(reg_value) = 0 Then reg_value = Array()
			Return = objReg.SetBinaryValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)

		Case "REG_DWORD"
			If IsNumeric(reg_value) = 0 Then reg_value = 0
			Return = objReg.SetDWORDValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)

		Case "REG_MULTI_SZ"
			If IsArray(reg_value) = 0 Then
				If Len(reg_value) = 0 Then
					reg_value = Array()
				Else
					reg_value = Array(reg_value)
				End If
			End If
			Return = objReg.SetMultiStringValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)

		'Case "REG_QWORD"
			'Return = oReg.SetQWORDValue(aRegKey(0),aRegKey(1),reg_valuename,reg_value)
		Case Else
			RegWrite = 0
			Exit Function
	End Select

	If (Return <> 0) Or (Err.Number <> 0) Then
		RegWrite = 0
		Exit Function
	End If
	RegWrite = 1
End Function

Function RegWriteKey(RegKeyName)
	Dim Return
	If IsArray(RegKeyName) = 0 Then
		RegKeyName = RegSplitKey(RegKeyName)
	End If

	If (IsArray(RegKeyName) = 0) Or (UBound(RegKeyName) <> 1) Then
		RegWriteKey = 0
		Exit Function
	End If

	Return = objReg.CreateKey(RegKeyName(0),RegKeyName(1))
	If (Return <> 0) Or (Err.Number <> 0) Then
		RegWriteKey = 0
		Exit Function
	End If
	RegWriteKey = 1
End Function

Function RegDelete(reg_keyname, reg_valuename)
	Dim Return,aRegKey
	aRegKey = RegSplitKey(reg_keyname)
	If IsArray(aRegKey) = 0 Then
		RegDelete = 0
		Exit Function
	End If

	Return = objReg.DeleteValue(aRegKey(0),aRegKey(1),reg_valuename)
	If (Return <> 0) And (Err.Number <> 0) Then
		RegDelete = 0
		Exit Function
	End If
	RegDelete = 1
End Function

Function RegDeleteKey(reg_keyname)
	Dim Return,aRegKey
	aRegKey = RegSplitKey(reg_keyname)
	If IsArray(aRegKey) = 0 Then
		RegDeleteKey = 0
		Exit Function
	End If

	'On Error Resume Next
	Return = RegDeleteSubKey(aRegKey(0),aRegKey(1))
	'On Error Goto 0
	If Return = 0 Then
		RegDeleteKey = 0
		Exit Function
	End If
	RegDeleteKey = 1
End Function

Function RegDeleteSubKey(strRegHive, strKeyPath)
	Dim Return,arrSubkeys,strSubkey
    objReg.EnumKey strRegHive, strKeyPath, arrSubkeys
    If IsArray(arrSubkeys) <> 0 Then
        For Each strSubkey In arrSubkeys
            RegDeleteSubKey strRegHive, strKeyPath & "\" & strSubkey
        Next
    End If

	Return = objReg.DeleteKey(strRegHive, strKeyPath)
	If (Return <> 0) Or (Err.Number <> 0) Then
		RegDeleteSubKey = 0
		Exit Function
	End If
	RegDeleteSubKey = 1
End Function

Function RegSplitKey(RegKeyName)
	Dim strHive, strInstr, strLeft
	strInstr=InStr(RegKeyName,"\")
	If strInstr = 0 Then Exit Function
	strLeft=left(RegKeyName,strInstr-1)

	Select Case strLeft
		Case "HKCR","HKEY_CLASSES_ROOT"	strHive = &H80000000
		Case "HKCU","HKEY_CURRENT_USER"	strHive = &H80000001
		Case "HKLM","HKEY_LOCAL_MACHINE"	strHive = &H80000002
		Case "HKU","HKEY_USERS" 	strHive = &H80000003
		Case "HKCC","HKEY_CURRENT_CONFIG"	strHive = &H80000005
	  Case Else Exit Function
	End Select

    RegSplitKey = Array(strHive,Mid(RegKeyName,strInstr+1))
End Function

Function RequireAdmin()
	Dim reg_valuename, WShell, Cmd, CmdLine, I

	GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")_
	.EnumValues &H80000003, "S-1-5-19\Environment",  reg_valuename
	If IsArray(reg_valuename) <> 0 Then
		RequireAdmin = 1
		Exit Function
	End If

	Set Cmd = WScript.Arguments
	For I = 0 to Cmd.Count - 1
		If Cmd(I) = "/admin" Then
			Wscript.Echo "To script you must have administrator rights!"
			'RequireAdmin = 0
			'Exit Function
			WScript.Quit
		End If
		CmdLine = CmdLine & Chr(32) & Chr(34) & Cmd(I) & Chr(34)
	Next
	CmdLine = CmdLine & Chr(32) & Chr(34) & "/admin" & Chr(34)

	Set WShell= WScript.CreateObject( "WScript.Shell")
	CreateObject("Shell.Application").ShellExecute WShell.ExpandEnvironmentStrings(_
	"%SystemRoot%\System32\WScript.exe"),Chr(34) & WScript.ScriptFullName & Chr(34) & CmdLine, "", "runas"
	WScript.Quit
End Function