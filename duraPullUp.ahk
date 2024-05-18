; Written by jash2260 on discord
SetTimer, OpenScript, 10
ScriptActive := False
StartMouseX := 0
StartMouseY := 0
macVersion := "v1.5"

Gui, Add, Text, x10 y10 w200 h30, Welcome to Jash's Macro (Version: %macVersion%) :>
Gui, Add, Text, x10 y25 w200 h30, Make sure you have watched the tutorial on how to set up the macro!
Gui, Add, Text, x10 y40 w200 h30, Also make sure you have full Hunger before starting the macro!
Gui, Add, Text, x10 y55 w200 h30, Controls:
Gui, Add, Text, x10 y70 w200 h30, K = Start Macro
Gui, Add, Text, x10 y85 w200 h30, L = Exit Macro
Gui, Add, Text, x10 y100 w200 h30, P = Pause Macro (Doesn't work)
Gui, Show, x245 y700 w300 h115, Jash's Pull Up Macro

OpenScript:
    SetTitleMatchMode, 2
    WinActivate, % "ahk_id " Roblox
    WinGet, Roblox, ID, ahk_exe RobloxPlayerBeta.exe
    WinMove, % "ahk_id " Roblox, , 0, 0, 810, 610
    return

Train:
if (ScriptActive) {
    Sleep, 300
    StartTime := A_TickCount
    ToolTip "FEAR NISSAN SILVIA ON ASURA!"
    Loop {
        ElapsedTime := A_TickCount - StartTime
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\W.bmp
        if (ErrorLevel = 0) {				
            SendInput, z 
        }
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\A.bmp
        if (ErrorLevel = 0) {				
            SendInput, q 
        }
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\S.bmp
        if (ErrorLevel = 0) {				
            SendInput, s 
        }
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\D.bmp
        if (ErrorLevel = 0) {				
            SendInput, d 
        }
        Sleep, 10
        if (ElapsedTime >= 60000) {
            Goto ClickDura
            break
        }
    }
}
return

ClickDura:
if (ScriptActive) {
    ; Recherche et clic sur la nouvelle image
    ImageSearch, imagex, imagey, 0, 0, 810, 610, *100 %A_ScriptDir%\bin\bar.bmp
    if (ErrorLevel = 0) {				
        Sleep, 50
        MouseMove, %imagex%, %imagey%
        Sleep, 50
        Click
        Sleep, 50
    } else {
        ToolTip "New Image not found"
    }

    Loop {
        ; Actions de clic et de recherche originales
        MouseMove, %StartMouseX%, %StartMouseY%
        Click
        ToolTip "Searching..."
        ImageSearch, imagex, imagey, 335, 340, 485, 365, *100 %A_ScriptDir%\bin\durability.bmp
        if (ErrorLevel = 0) {				
            Sleep, 50
            MouseMove, %imagex%, %imagey%
            Sleep, 50
            Click
            Sleep, 50
            MouseMove, %imagex%, %imagey%
            Click
            Goto Train
            break
        }
        ToolTip "Missing Dura Image"
    }
}
return

k:: ; fonction principale pour démarrer le processus d'entraînement
    ScriptActive := True ; Activer le script lorsque vous appuyez sur "k"
    SetTimer, OpenScript, On ; Démarrer le minuteur
    MouseGetPos, StartMouseX, StartMouseY ; Où cliquer pour trouver la barre de traction
    ImageSearch,,, 70, 50, 100, 67, *50 %A_ScriptDir%\bin\chat.bmp
    if (ErrorLevel = 0) {				
        MouseMove, 82, 54
        Sleep, 50
        Click
    }
    Sleep, 50
    Goto ClickDura
    return

p::
    ScriptActive := False ; Désactiver le script lorsque vous appuyez sur "p"
    SetTimer, OpenScript, Off ; Arrêter le minuteur
    return

l::ExitApp ; Appuyez sur "l" pour quitter le script
