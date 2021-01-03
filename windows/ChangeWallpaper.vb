'src: https://winsourcecode.blogspot.com/2019/06/changewallpaper.html
'compile with C:\Windows\Microsoft.NET\Framework\v4.0.30319\vbc "ChangeWallpaper.vb" /out:"ChangeWallpaper.exe" /target:winexe
Imports System.Runtime.InteropServices
Imports System.Windows.Forms

Public Module SendWinKey
    Public Declare Unicode Function SystemParametersInfoW Lib "user32" (ByVal uAction As Integer, ByVal uParam As Integer, ByVal lpvParam As String, ByVal fuWinIni As Integer) As Integer
    Public Const SPI_SETDESKWALLPAPER = 20
    Public Const SPIF_SENDWININICHANGE = &H2
    Public Const SPIF_UPDATEINIFILE = &H1

Public Sub Main()
    Dim Ret as Integer
    Dim FName As String
    'Takes a filename on the command line removing quotes
    FName = Replace(Command(), """", "")
    Ret = SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, FName, SPIF_SENDWININICHANGE + SPIF_UPDATEINIFILE)
    If Ret = 0 Then Msgbox(err.lastdllerror)
End Sub

End Module