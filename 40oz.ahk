/*
    Just a little too much of the shauce...
    by: Daniel Essig
*/
#singleinstance force
#NoTrayIcon
DebugMode := 0  ;1 = show params, 0 = invisible
, CountHic := 0 ; start the count for hiccups
, slurcount := 0 ; start the count for slurrs
, rand := Random(Random(Random(1,50),Random(50,100)),Random(Random(1,50),Random(50,100))) ; get first random hiccup #
, randslur := Random(Random(Random(1,8),Random(8,13)),Random(Random(1,8),Random(10,13))) ; get first random slurr #

Loop {
    Input, Var, L1 V
    Hiccups()
}
return

:c1*:s::
    Slurs("sh|s")
return

:c1*b0: s::
    Slurs(" sh| s")
return

:c1*:ss::
    Slurs("ssh|ss")
return

:c1?:ss::
    Slurs("ssh |ss ")
return

:c1?:s::
    Slurs("sh |s ")
return
 
;___________________________________________________________-
;___________Functions______ ... HIC! ... ___________________-
;___________________________________________________________-
Slurs(Type) {
    global slurcount, randslur, DebugMode
    if ( DebugMode ) {
        i := Random(Random(Random(25,70),Random(70,130)),Random(Random(20,60),Random(60,150)))  
        i1 = rSlur = %randslur% `ncSlur = %slurcount% `n`nrHic = %rand% `ncHic = %countHic%
        traytip, Hiccer, %i% `r`n %i1%
    }
    StringSplit, Output, type, |
    If ( randslur = slurcount ) {
        sendinput %output1%
        slurcount = 0
        randslur := Random(Random(Random(1,8),Random(8,13)),Random(Random(1,8),Random(10,13)))
        return
    } Else {
        sendinput %output2%
        slurcount++
        return
    }
}
 
Hiccups() {
    global
    if ( DebugMode ) {
        i := Random(Random(Random(25,70),Random(70,130)),Random(Random(20,60),Random(60,150))) 
        i1 = rSlur = %randslur% `ncSlur = %slurcount% `n`nrHic = %rand% `ncHic = %countHic%
        traytip, Hiccer, %i% `r`n %i1%
    }
    If ( rand = countHic ) {
        SendInput {space}... HIC{!} ...{space}
        countHic = 0
        rand := Random(Random(Random(25,70),Random(70,130)),Random(Random(20,60),Random(60,150)))  ; get new random hiccup #
        return
    } Else {
        countHic++
        return
    }
}

Random(min,max){
    Random, x, %min%, %max%
    return x
}

^esc::ExitApp