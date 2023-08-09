Option Explicit
'~ On Error Resume Next
RequireAdmin

Dim objReg
Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")

' ; Отключить дистанционное отслеживание приложений
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat", "AITEnable", "REG_DWORD", 0
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat", "DisableInventory", "REG_DWORD", 1
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat", "AllowTelemetry", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection", "AllowTelemetry", "REG_DWORD", 0
' ; Запретить показ уведомлений Майкрософт с предложением отправить отзыв
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection", "DoNotShowFeedbackNotifications", "REG_DWORD", 1
' ; Отключить кортану
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search", "AllowCortana", "REG_DWORD", 0
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search", "AllowCloudSearch", "REG_DWORD", 0
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search", "AllowSearchToUseLocation", "REG_DWORD", 0
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search", "DisableWebSearch", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search", "ConnectedSearchUseWeb", "REG_DWORD", 0
' ; Отключить синхронизацию приложенй
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync", "EnableBackupForWin8Apps", "REG_DWORD", 0
' ;Отключить сбор данных InPrivate
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Safety\PrivacIE", "DisableLogging", "REG_DWORD", 1
' ; Отключить сбор и хранение текста и рукописных данных
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization", "RestrictImplicitInkCollection", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization", "RestrictImplicitTextCollection", "REG_DWORD", 1
' ; Отключить отправку образцов рукописного ввода
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC", "PreventHandwritingDataSharing", "REG_DWORD", 1
' ; Не передавать отчеты об ошибках распознавания рукописного ввода
RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports", "PreventHandwritingErrorReports", "REG_DWORD", 1
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack", "Disabled", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack", "DisableAutomaticTelemetryKeywordReporting", "REG_DWORD", 1
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack", "TelemetryServiceDisabled", "REG_DWORD", 1
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Microsoft\SQMClient\Windows", "CEIPEnable", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks", "DisableAsimovUpload", "REG_DWORD", 1
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack", "Disabled", "REG_DWORD", 1
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection", "AllowTelemetry", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\Circular Kernel Context Logger", "Start", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener", "Start", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AppModel", "Start", "REG_DWORD", 0
' ; Отключить телеметрию и сбор данных
RegWrite "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SQMLogger", "Start", "REG_DWORD", 0

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