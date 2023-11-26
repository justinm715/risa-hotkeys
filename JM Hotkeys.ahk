#Requires AutoHotkey v2.0

; Move mouse to center of last window
MoveMouseToCenterOfWindow(winTitle?) {
    WinGetPos &x, &y, &width, &height, ( IsSet(winTitle) ? winTitle : "ahk_exe risa3dw.exe")
    centerX := (width / 2)
    centerY := (height / 2)
    MouseMove(centerX, centerY)
}

; Positions
RCP := Map() ; RISA Control Positions
RCP["HomeTab"] := {x: 96, y: 45}
RCP["ModifyTab"] := {x: 155, y: 45}

; Quick Find
; Shift + Alt + F
HotIfWinActive "ahk_exe risa3dw.exe"
Hotkey "+!f", RISAQuickFind
RISAQuickFind(var) { 
    WinMaximize
    ; Click Home Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Quick Find
    MouseClick("left", 1285, 93)
    Sleep 200
    ; Activate Quick Find Window
    WinActivate("Quick Find")
    ; Give the textbox focus
    MouseClick("left", 212, 103)
}

; Trim
; Shift + Alt + T
HotIfWinActive "ahk_exe risa3dw.exe"
Hotkey "+!t", RISATrim
RISATrim(var) { 
    WinMaximize
    ; Click Modify Tab
    MouseClick("left", RCP["ModifyTab"].x, RCP["ModifyTab"].y)
    Sleep 200
     ; Click Trim
    MouseClick("left", 903, 93)
    MoveMouseToCenterOfWindow()
}

; Extend
; Shift + Alt + E
HotIfWinActive "ahk_exe risa3dw.exe"
Hotkey "+!e", RISAExtend
RISAExtend(var) { 
    WinMaximize
    ; Click Modify Tab
    MouseClick("left", RCP["ModifyTab"].x, RCP["ModifyTab"].y)
    Sleep 200
     ; Click Extend
    MouseClick("left", 858, 93)
    MoveMouseToCenterOfWindow()
}

; Solve
; Shift + Alt + S
HotIfWinActive "ahk_exe risa3dw.exe"
Hotkey "+!s", RISASolve
RISASolve(var) { 
    WinMaximize
    ; Click Modify Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Solve
    MouseClick("left", 1225, 90)
    MoveMouseToCenterOfWindow()
}


; ; Draw Member
; ; Shift + Alt + M
; HotIfWinActive "ahk_exe risa3dw.exe"
; Hotkey "+!m", RISADrawMember
; RISADrawMember(var) { 
;     WinMaximize
;     ; Click Modify Tab
;     MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
;     Sleep 200
;      ; Click Draw Member
;     MouseClick("left", 135, 86)
;     MoveMouseToCenterOfWindow()
; }

; ; Draw Wall Panel
; ; Shift + Alt + W
; HotIfWinActive "ahk_exe risa3dw.exe"
; Hotkey "+!w", RISADrawWallPanel
; RISADrawWallPanel(var) { 
;     WinMaximize
;     ; Click Modify Tab
;     MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
;     Sleep 200
;      ; Click Draw Wall Panel
;     MouseClick("left", 307, 98)
;     MoveMouseToCenterOfWindow()
; }

; Detailed Report
; Shift + Alt + R
HotIfWinActive "ahk_exe risa3dw.exe"
Hotkey "+!r", RISADetailedReport
RISADetailedReport(var) { 
    WinMaximize
    ; Click Modify Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Draw Wall Panel
    MouseClick("left", 307, 98)
    MoveMouseToCenterOfWindow()
}


; =========================


; Copy Global
; Shift + Alt + C
+!c::ShowCopyGlobalGUI()

global CopyGlobalGUIWindowName
CopyGlobalGUIWindowName := "JM Tools: RISA Quick Offset Copy"

; Function to show a GUI with options
ShowCopyGlobalGUI() {
    global CopyGlobalGUIWindowName
    OptionsGui := Gui(,CopyGlobalGUIWindowName)  ; Create a new GUI

    OptionsGui.Add("Text", , CopyGlobalGUIWindowName)

    OptionsGui.Add("Text", "XM", " ")
    OptionsGui.Add("Text", "XM", "Press G to open Copy Global")
    OptionsGui.Add("Text", "XM", "Press P to open Copy Point to Point")
    OptionsGui.Add("Text", "XM", " ")

    OptionsGui.Add("Text", "XM", " ")
    OptionsGui.Add("Text", "XM Section", "Global X")
    OptionsGui.Add("Button", "X+10", "-10").OnEvent("Click", boundFunc.Bind(-10,0,0))
    OptionsGui.Add("Button", "X+10", "-5").OnEvent("Click", boundFunc.Bind(-5,0,0))
    OptionsGui.Add("Button", "X+10", "-1").OnEvent("Click", boundFunc.Bind(-1,0,0))
    OptionsGui.Add("Button", "X+10", "+1").OnEvent("Click", boundFunc.Bind(1,0,0))
    OptionsGui.Add("Button", "X+10", "+5").OnEvent("Click", boundFunc.Bind(5,0,0))
    OptionsGui.Add("Button", "X+10", "+10").OnEvent("Click", boundFunc.Bind(10,0,0))

    OptionsGui.Add("Text", "XM", " ")
    OptionsGui.Add("Text", "XM Section", "Global Y")
    OptionsGui.Add("Button", "X+10", "-10").OnEvent("Click", boundFunc.Bind(0,-10,0))
    OptionsGui.Add("Button", "X+10", "-5").OnEvent("Click", boundFunc.Bind(0,-5,0))
    OptionsGui.Add("Button", "X+10", "-1").OnEvent("Click", boundFunc.Bind(0,-1,0))
    OptionsGui.Add("Button", "X+10", "+1").OnEvent("Click", boundFunc.Bind(0,1,0))
    OptionsGui.Add("Button", "X+10", "+5").OnEvent("Click", boundFunc.Bind(0,5,0))
    OptionsGui.Add("Button", "X+10", "+10").OnEvent("Click", boundFunc.Bind(0,10,0))

    OptionsGui.Add("Text", "XM", " ")
    OptionsGui.Add("Text", "XM Section", "Global Z")
    OptionsGui.Add("Button", "X+10", "-10").OnEvent("Click", boundFunc.Bind(0,0,-10))
    OptionsGui.Add("Button", "X+10", "-5").OnEvent("Click", boundFunc.Bind(0,0,-5))
    OptionsGui.Add("Button", "X+10", "-1").OnEvent("Click", boundFunc.Bind(0,0,-1))
    OptionsGui.Add("Button", "X+10", "+1").OnEvent("Click", boundFunc.Bind(0,0,1))
    OptionsGui.Add("Button", "X+10", "+5").OnEvent("Click", boundFunc.Bind(0,0,5))
    OptionsGui.Add("Button", "X+10", "+10").OnEvent("Click", boundFunc.Bind(0,0,10))

    ; Show the GUI and center it over RISA, move mouse over GUI
    OptionsGui.Show()
    OptionsGui.GetPos(&GuiX, &GuiY, &GuiWidth, &GuiHeight)
    WinGetPos &RisaWindowX, &RisaWindowY, &RISAWindowWidth, &RISAWindowHeight, "ahk_exe risa3dw.exe"
    CenterX := RisaWindowX + (RISAWindowWidth - GuiWidth) // 2
    CenterY := RisaWindowY + (RISAWindowHeight - GuiHeight) // 2
    OptionsGui.Move(CenterX, CenterY)
    WinActivate(CopyGlobalGUIWindowName)
    MouseMove(153, 87)

    boundFunc(x, y, z, *) {
        WinActivate("ahk_exe risa3dw.exe")
        WinMaximize("ahk_exe risa3dw.exe")
        ; Click Modify Tab
        MouseClick("left", RCP["ModifyTab"].x, RCP["ModifyTab"].y)
        Sleep 200
         ; Click Copy Global
        MouseClick("left", 218, 90)
        ; Clear X, Y, Z
        MouseClick("left", 238, 258) ; click X textbox
        Send("{Backspace}{Tab}{Backspace}{Tab}{Backspace}+{Tab}+{Tab}") ; last 2 tabs to go back to X textbox
        ; Populate X, Y, Z
        Send(x "{Tab}" y "{Tab}" z)
        MouseClick("left",253,459)
        OptionsGui.Destroy()
    }

}

; Copy Point to Point - Do nothing, just activate the RISA tool
HotIfWinActive CopyGlobalGUIWindowName
Hotkey "p", RISACopyPointToPoint
RISACopyPointToPoint(var) { 
    WinActivate("ahk_exe risa3dw.exe")
    WinMaximize("ahk_exe risa3dw.exe")
    ; Click Modify Tab
    MouseClick("left", RCP["ModifyTab"].x, RCP["ModifyTab"].y)
    Sleep 200
     ; Click Copy Point to Point
    MouseClick("left", 308, 85)
    global CopyGlobalGUIWindowName
    MoveMouseToCenterOfWindow()
    WinClose(CopyGlobalGUIWindowName)
}

; Copy Global - Do nothing, just activate the RISA tool
HotIfWinActive CopyGlobalGUIWindowName
Hotkey "g", RISACopyGlobal
RISACopyGlobal(var) { 
    WinActivate("ahk_exe risa3dw.exe")
    WinMaximize("ahk_exe risa3dw.exe")
    ; Click Modify Tab
    MouseClick("left", RCP["ModifyTab"].x, RCP["ModifyTab"].y)
    Sleep 200
    ; Click Copy Global
    MouseClick("left", 218, 90)
    ; Click in X textbox
    MouseClick("left", 245,260)
    WinActivate("ahk_exe risa3dw.exe")
    MoveMouseToCenterOfWindow()
    global CopyGlobalGUIWindowName
    WinClose(CopyGlobalGUIWindowName)
}


; =========================


; Draw
; Shift + Alt + D
+!d::ShowDrawGUI()

global DrawGUIWindowName
DrawGUIWindowName := "JM Tools: RISA Draw"

; Function to show a GUI with options
ShowDrawGUI() {
    global DrawGUIWindowName
    OptionsGui := Gui(,DrawGUIWindowName)  ; Create a new GUI

    OptionsGui.Add("Text", , DrawGUIWindowName)

    OptionsGui.Add("Text", "XM", " ")
    OptionsGui.Add("Text", "XM", "Press M to draw Member")
    OptionsGui.Add("Text", "XM", "Press A to draw Area Load")
    OptionsGui.Add("Text", "XM", "Press W to draw Wall Panel")
    OptionsGui.Add("Text", "XM", " ")

    ; Show the GUI and center it over RISA, move mouse over GUI
    OptionsGui.Show()
    OptionsGui.GetPos(&GuiX, &GuiY, &GuiWidth, &GuiHeight)
    WinGetPos &RisaWindowX, &RisaWindowY, &RISAWindowWidth, &RISAWindowHeight, "ahk_exe risa3dw.exe"
    CenterX := RisaWindowX + (RISAWindowWidth - GuiWidth) // 2
    CenterY := RisaWindowY + (RISAWindowHeight - GuiHeight) // 2
    OptionsGui.Move(CenterX, CenterY)
    WinActivate(DrawGUIWindowName)
    MouseMove(153, 87)

}

; Draw Member
HotIfWinActive DrawGUIWindowName
Hotkey "m", RISADrawMember
RISADrawMember(var) { 
    WinActivate("ahk_exe risa3dw.exe")
    WinMaximize("ahk_exe risa3dw.exe")
    ; Click Home Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Draw Member
    MouseClick("left", 130, 97)
    global DrawGUIWindowName
    MoveMouseToCenterOfWindow()
    WinClose(DrawGUIWindowName)
}

; Draw Area Load
HotIfWinActive DrawGUIWindowName
Hotkey "a", RISADrawAreaLoad
RISADrawAreaLoad(var) { 
    WinActivate("ahk_exe risa3dw.exe")
    WinMaximize("ahk_exe risa3dw.exe")
    ; Click Home Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Draw Area Load
    MouseClick("left", 859, 93)
    global DrawGUIWindowName
    MoveMouseToCenterOfWindow()
    WinClose(DrawGUIWindowName)
}

; Draw Wall Panel
HotIfWinActive DrawGUIWindowName
Hotkey "w", RISADrawWallPanel
RISADrawWallPanel(var) { 
    WinActivate("ahk_exe risa3dw.exe")
    WinMaximize("ahk_exe risa3dw.exe")
    ; Click Home Tab
    MouseClick("left", RCP["HomeTab"].x, RCP["HomeTab"].y)
    Sleep 200
     ; Click Draw Wall Panel
    MouseClick("left", 306, 92)
    global DrawGUIWindowName
    MoveMouseToCenterOfWindow()
    WinClose(DrawGUIWindowName)
}