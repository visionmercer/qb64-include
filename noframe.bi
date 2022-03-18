
Declare CustomType Library
    Function FindWindow& (ByVal ClassName As _Offset, WindowName$)
End Declare

Declare Dynamic Library "User32"
    Function GetWindowLongA& (ByVal hWnd As _Offset, Byval nIndex As Long)
    Function SetWindowLongA& (ByVal hWnd As _Offset, Byval nIndex As Long, Byval dwNewLong As Long)
    Function SetWindowPos&   (ByVal hWnd As _Offset, Byval hWndInsertAfter As Long, Byval x As Long, Byval y As Long, Byval cx As Long, Byval cy As Long, Byval wFlags As Long)
End Declare

Const GWL_STYLE      = -16
Const WS_BORDER      = &H800000
Const WS_CAPTION     = &H00C00000
Const WS_THICKFRAME  = &H00040000
Const WS_MINIMIZEBOX = &H00020000
Const WS_MAXIMIZEBOX = &H00010000
Const WS_SYSMENU     = &H00080000

Do: Loop Until _ScreenExists

Dim hwnd As _Offset
Dim As Long winstyle, Style, a

hwnd     = _WindowHandle
winstyle = GetWindowLongA(hwnd, GWL_STYLE)
Style    = (WS_CAPTION Or WS_THICKFRAME Or WS_MINIMIZEBOX Or WS_MAXIMIZEBOX Or WS_SYSMENU)
a        = SetWindowLongA&(hwnd, GWL_STYLE, winstyle And Not Style)