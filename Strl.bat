@echo off
::ECHO OFF SECTION 
cls
title STARLER 
color FC                                                                                                                           
echo                                          **********************************              
echo                                          *       STAR SWITCH HEROES       *                               
echo                                          *              (v)               *
echo                                          **********************************
echo. 
ping localhost -n 4 >nul
cls
color F0      
goto titlescreen


:: Variable section:
:: =================


:: /A to use the @set command -- For adding Variables: @set /A "var= %var% (+ - / *) %var2% or #"
:: If the variable is a string, it will change to an amount of numbers.

:locate
if %r% == 0 goto ValRoom1
if %r% == 1 goto ValRoom1.1
if %r% == 2 goto ValRoom1.2
if %r% == 3 goto KAPUS_City1.0
if %r% == 4 goto KAPUS_City1.1    
if %r% == 5 goto KAPUS_City1.2
if %r% == 7 goto STORE_Kapus
if %r% == 8 goto KAPUS_City1.3
if %r% == 9 goto KAPUS_City1.4
if %r% == 10 goto KAPUS_City1.5
if %r% == 11 goto KAPUS_City1.6   
if %r% == 12 goto KAPUS_OverFountain
if %r% == Over1 goto KAPUS_OVERWORLD_1.0_demo 
if %r% == Over2 goto KAPUS_OVERWORLD_1.0   
    

:SETTINGS 
cls
echo          ============================
echo          Sound Check - (1)
echo          Controls    - (2)
echo          TitleScreen - (3)
set /p num= 
if %num% == 1 goto SoundCheck
if %num% == 2 goto Control
if %num% == 3 goto titlescreen

:error
cls
color 0C 
echo                    There has been an Error. Restarting...
echo.
pause >nul
cls
ping localhost -n 3 >nul
color F0
goto titlescreen

:GAMEOVER
color 0F
cls
echo      *****************************
echo     *         GAME OVER         *
echo    *****************************
ping localhost -n 2 >nul
cls
echo                                   *****************************
echo                                  *         GAME OVER         *
echo                                 *****************************
ping localhost -n 1 >nul
color 0C
ping localhost -n 1 >nul
color 0F
ping localhost -n 1 >nul
color 0C 
ping localhost -n 3 >nul
goto titlescreen


:var1
set level=1
set HP=450
set PWR=20
set DEF=15      
set SPD=20
set MAXHP=450
set ELE=10
set ELEDEF=20
set SPR=?????
set SIGHT=10
set EXP=0   
set tp=0
set LIMIT=0
set RAGE=0
set LvCred=0
set EffectStatus=Normal
set levUpCon=5
set CARDAMOUNT=4
set mc=0
set bdr=########################################################################
set pre=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
set CardNumberA=1
set CardNumberB=2
set CardNumberC=3
set CardNumberD=0
set WS=?????
set Item1=0
set S001=YES
set S002=YES
set S003=YES
set S004=YES
goto new_game


::Level up system: Each time the player's level increases, you get level credits. 
:Battle_Win
cls
if %random% GEQ %random%(
    set NewCard=Sword 
    set CardNumberD=4 
    set CardClassD=S 
    set CardDescD=One Strike to enemy - 180DMG 
    set CardNameD=Sword
)
@set /A "EXP=%EXP%+1"
@set /A "mc=%mc%+3"
echo                         ***************************
echo                         *        -RESULTS-        *
echo                         ***************************
echo.
echo                            - Experience Gained.
echo                            - Mondle Crystal Aquired.
echo                            - %NewCard% : E.Card Obtained
echo                                    (v)
pause >nul
goto locate

:LevelUp
@set /A "level=%level%+1"
echo                     Valen leveled up! 
@set /A "MAXHP=%MAXHP%+500"
@set /A "LvCred=%LvCred%+2"
echo        +500HP
echo        +2 Level Credit
pause >nul
goto mainLevelUp

:mainLevelUp
cls
echo          Upgrade %LvCred% stats.
echo          Chose a stat to upgrade.
echo      =================================
echo               1.) POWER
echo               2.) DEFENSE
echo               3.) SPEED
echo               4.) ELEMENTAL
echo               5.) SUPER
echo               6.) SIGHT
set /p num=
if %num% == 1 (
    @set /A "PWR=%PWR%+20"
    @set /A "LvCred=%LvCred%-1"
)
if %num% == 2 (
    @set /A "DEF=%DEF%+15"
    @set /A "LvCred=%LvCred%-1"
)
if %num% == 3 (
    @set /A "SPD=%SPD%+20"
    @set /A "LvCred=%LvCred%-1"
)
if %num% == 4 (
    @set /A "ELE=%ELE%+10"
    @set /A "LvCred=%LvCred%-1"
)
if %num% == 5 (
    @set /A "SPR=%SPR%+10"
    @set /A "LvCred=%LvCred%-1"
)
if %num% == 6 (
    @set /A "SIGHT=%SIGHT%+10"
    @set /A "LvCred=%LvCred%-1"
)
if %lvCred% GEQ 2 goto mainLevelUp
if %lvCred% == 1 goto mainLevelUp
if %lvCred% LEQ 0 goto locate
else(
    goto error
)

:BattlePresets
if %random% GEQ %random% set enemy1=Score Bot
if %random% LEQ %random% set enemy1=Flare Crusher
if %random% EQU %random% set enemy1=Doom Bit
goto enemyCheck

:enemyCheck 
if not %enemy1% == Score Bot goto enemyCheck[II]
if %enemy1% == Score Bot set enemy1HP=80
if %enemy1% == Score Bot set enemy1ATK=75
if %enemy1% == Score Bot goto battle_Kapus_AreaDesc

:enemyCheck[II]
if not %enemy1% == Flare Crusher goto enemyCheck[III]
if %enemy1% == Flare Crusher set enemy1HP=160
if %enemy1% == Flare Crusher set enemy1ATKP=80
goto battle_Kapus_AreaDesc

:enemyCheck[III]
if not %enemy1% == Doom Bit goto enemyCheck
if %enemy1% == Doom Bit set enemy1HP=450
if %enemy1% == Doom Bit set enemy1ATK=100
goto battle_Kapus_AreaDesc

::Depending on the enemy, the game will go to a certain label.
:battle_Kapus_AreaDesc
if %enemy1% == Score Bot goto Area1_Battle_ScoreBot
if %enemy1% == Flare Crusher goto Area1_Battle_FlareCrusher
if %enemy1% == Doom Bit goto Area1_Battle_DoomBit

:Area1_Battle_ScoreBot
cls
if %HP% LEQ 0 goto GAMEOVER
if %enemy1HP% LEQ 0 goto Battle_Win
echo             %enemy1%                      %enemy1HP% ENEMY HP
echo  **************************************************************************
echo.
echo    0000000000000000000000000000000
echo   00000000000000000       000000000 ========         o
echo   \\\\\  //   (OO[]OO)  \\\\\\\\          ======== o
echo    88 88   8  (OO[]OO)  8 88 88 8                    o 
echo    === = == = == = = = == = = = = 
echo      ////////            \\\\\\\\\
echo       []  []             []  [] []
echo.
ECHO.
echo.
echo         /\  /\   /\
echo        /  \/  \//  \/\
echo       /              /
echo      vvvv   \ /vvvvv  
echo       VVVVVV[/ ( 0)] 
echo        [   /   / /\ OOO
echo      //[vvvv/ _/__/ ////
echo    ////[     ]   /////
echo    =====MMMMMMM=======
echo.
echo  **************************************************************************
echo  * %HP% *
echo  *******      Tension: %tp% '/.
echo  =====================================
echo  *(Q: DODGE LEFT) -- (E: DODGE RIGHT)* 
echo  =====================================
echo     '/,          []<>        (O_O)
echo   [(1)BASIC] [(2)E.CARD] [(3)SPECIAL] 
set /p num=
if %num% == 1 goto AIM_ScoreBot_Battle
if %num% == 2 goto CARD_BATTLE
if %num% == 3 goto Special_Battle_1
if %num% == l goto dodge_pannel_Player_left

:Need_More_TP
echo.
echo                                 ============================
echo                                 *NOT ENOUGH TENSION POINTS.*
echo                                 ============================
echo.
pause >nul
goto Area1_Battle_ScoreBot

:CARD_BATTLE
if %tp% LEQ 25 goto Need_More_TP
if %CardNumberA% == 1 (
    set CardClassA=S
    set CardNameA=Blaster
    set CardDescA=A giant blast! [200DMG]
)
if %CardNumberB% == 2 (
    set CardClassB=S 
    set CardNameB=Recover
    set CardDescB=Heal HP.
    set CardB_set=500
)
if %CardNumberC% == 3 (
    set CardClassC=G
    set CardNameC=Delta Max
    set CardDescC=(2hit) - 300
)
echo                ENERGY CARD           
echo ===================================================
echo  1 [%CardClassA%]: %CardNumberA% -- %CardNameA% 
echo     %CardDescA%
echo.
echo  2 [%CardClassB%]: %CardNumberB% -- %CardNameB%
echo     %CardDescB%                           
echo.
echo  3 [%CardClassC%]: %CardNumberC% -- %CardNameC% 
echo     %CardDescC%
echo.
echo  4 [%CardClassD%]: %CardNumberD% -- %CardNameD% 
echo     %CardDescD%      
set /p num=
if %num% == 1 @set /A "tp=%tp%-25"
if %num% == 1 goto CARD_A_BATTLE
if %num% == 2 @set /A "tp=%tp%-25"
if %num% == 2 goto CARD_B_BATTLE
if %num% == 3 @set /A "tp=%tp%-25"
if %num% == 3 goto CARD_C_BATTLE
if %num% == 4 @set /A "tp=%tp%-25"
if %num% == 4 goto CARD_D_BATTLE
else (
    goto error
)


:CARD_A_BATTLE
color 0F
ping localhost -n 1 >nul
color F0
ping localhost -n 1 >nul
color 0F
ping localhost -n 1 >nul
color F0
if %CardNumberA% == 1 @set /A "enemy1HP=%enemy1HP%-%CardA_set%" | goto battle_Kapus_AreaDesc
if %CardNumberB% == 2 goto HP_Recovery_CARD002
::add enemy turn! (Replace this goto command.)


:HP_Recovery_CARD002
::If the HP is Higher the max HP, the HP will swap to MAX HP amount.
@set /A "HP=%HP%+500"
if %HP% GEQ %MAXHP% set HP=%MAXHP% 
goto battle_Kapus_AreaDesc


:dodge_pannel_Player_left
cls
echo             %enemy1%                      %enemy1HP% ENEMY HP
echo  **************************************************************************
echo.
echo    0000000000000000000000000000000
echo   00000000000000000       000000000 ========         o
echo   \\\\\  //   (OO[]OO)  \\\\\\\\          ======== o
echo    88 88   8  (OO[]OO)  8 88 88 8                    o 
echo    === = == = == = = = == = = = = 
echo      ////////            \\\\\\\\\
echo       []  []             []  [] []
echo.
echo.
echo.
echo        /\  /\   /\
echo       /  \/  \//  \/\
echo      /              /
echo     vvvv   \ /vvvvv  
echo      VVVVVV[/ ( 0)] 
echo       [   /   / /\ OOO
echo     //[vvvv/ _/__/ ////
echo   ////[     ]   /////
echo =====MMMMMMM=======
echo.
echo  **************************************************************************
echo  * %HP% *
echo  *******      Tension: %tp% '/.
echo  =====================================
echo  *(Q: DODGE LEFT) -- (E: DODGE RIGHT)* 
echo  =====================================
echo     '/,          []<>        (O_O)
echo   [(1)BASIC] [(2)E.CARD] [(3)SPECIAL] 
echo.
ping localhost -n 2 >nul
goto Area1_Battle_ScoreBot


::player/NPC sprites
:: Battle Sprite/Player Turn 
::           
::        /\  /\   /\
::       /  \/  \//  \/\
::      /              /
::      vvvv   \ /vvvvv  
::       VVVVVV[/ ( 0)] 
::       [    /   / /\ OOO
::     //[vvvv/ _/__/ ////
::   ////[     ]   /////
::  =====MMMMMMM=======
::
:: For the battle sprite create a txt file and name it BattleSprite-MiddlePannel.txt USING THE 'TYPE' command.
:: 
:: Enemy1:ScoreBot/Targetting(Aiming for basic attack)
::
::    0000000000000000000000000000000
::   00000000000000000       000000000 ========         o
::   \\\\\  //   (OO[]OO)  \\\\\\\\          ======== o
::    88 88   8  (OO[]OO)  8 88 88 8                    o 
::    === = == = == = = = == = = = = 
::      ////////            \\\\\\\\\
::       []  []             []  [] []
:: 
::Use the type command 
::
::Normal World
:: (0_0)
:: []:[]
::  L L
::
:: Over World
:: /0_0\
:: ():()
::  / \

:AIM_ScoreBot_Battle
cls
@set /A "tp=%tp%+10"
echo.
echo        OOOOOOOOOOOOOOOOOOOOO
echo        O   ____       ____ O
echo        O                   O
echo        O       O           O
echo        O                   O
echo        OOOOOOOOOOOOOOOOOOOOO
echo         /////         \\\\\
echo         [[[[           ]]]]
echo         dddd           bbbb
choice /c 01 /n /cs /t 4 /d 0
if %errorlevel%==0 goto enemy_dodge 
if %errorlevel%==1 goto check_attack
else (
    goto error
)

:enemy_dodge 
echo                MISS!
ping localhost -n 2 >nul
goto Area1_Battle_ScoreBot

:check_attack
@set /A "enemy1HP=%enemyHP1%-%PWR%"
echo.
echo           ENEMY HIT!
echo          ------------
echo.
pause >nul
goto Area1_Battle_ScoreBot

:BATTLE_MAP
cls
echo   ------------------------------------------------------
echo   [         
echo   [
echo   [
echo   ------------------------------------------------------
echo   [    /O,O\                           [][][]
echo   [    [\ ]L                           [][][]
echo   [    /  J                            \\  \\
echo   ------------------------------------------------------
echo   [ 
echo   [
echo   [
echo   ------------------------------------------------------
ping localhost -n 4 >nul
goto Area1_Battle_ScoreBot

:: intro Section
:: =============
::
::intro, will only show up if 
:new_game
cls
echo         ********************************************
echo         * The year is 3048. The world has advanced *
echo         * from Robot Technology to a more digital  *
echo         * technology.                              *
echo         ********************************************
ping localhost -n 5 >nul
cls
echo         ********************************************
echo         * This decision was made due to all the    *
echo         * incidents revolving rogue robots. After  *
echo         * the last war. Humans were victorious.    *
echo         ********************************************
ping localhost -n 5 >nul
cls
echo         ********************************************
echo         * The robots who sided with humans were    *
echo         * to roam free while, the robots against   *
echo         * the humans were forced to be shut off    *
echo         * and locked away.                         *
echo         ********************************************
ping localhost -n 5 >nul
cls
echo          But peace... was still not found. Beings known as RAdians
echo          were mixed in with human blood. These "Radians" 
echo          have become the ruler of the OverWorld, splitting the 
echo          Over World and the normal areas. Allowing only robots 
echo          and RAdians to enter the Overworld. 
ping localhost -n 7 >nul
cls
echo           However... One boy with the RAdian blood shall bring 
echo          balance between robots and humans and stop the evil
echo          RAdians from taking over the Normal world as well...
echo.
echo                                (v)
pause >nul
goto ValRoom1

:STATUS
::Status screen variables change only. Character image of Valen will not change. 
cls
echo                    _____________
echo                  00             00
echo                 0                 0
echo                 0    0   0   0    0
echo                 0 0 0 0 0 0 0 0 0 0
echo                 0 000   0   0   0 0
echo                  0(0 (0     0) 0)0
echo                   00           00
echo                    0     ,     0
echo                     0  __ _   0
echo                      0       0
echo                       :00000:
echo                      [   :   ]     
echo            __________[   :   ]__________
echo   VALEN B.
echo.
echo   Lv.%level%
echo   %HP%/%MAXHP% HP
echo   %PWR% Base Power
echo   %DEF% Base Defense
echo   %SPD% Speed
echo   %ELE% Elemental Power
echo   %ELEDEF% Elemental Defense
echo   %SIGHT% Sight
echo   %SUPER% %WS%
echo.
pause >nul
goto MENU

:titlescreen 
cls
color F0
echo           ************************
echo           *       STARLER        *   
echo           ************************
echo.
echo             1.) NEW GAME
echo             2.) CONTINUE
echo             3.) EXIT
set /p num=
if %num% == 1 goto var1   
if %num% == 2 goto pass
if %num% == 3 exit
if %num% == 4 goto GAMEOVER

:save_menu
cls
echo %bdr%
echo                [SAVE MENU]
echo %bdr%
echo 1.) [Save Game]
echo 2.) [Title Screen] 
echo 3.) [Leave Save Menu]   
set /p errorlevel=
if %errorlevel% EQU 1 goto Memory1
if %errorlevel% EQU 2 goto titlescreen
if %errorlevel% EQU 3 goto MENU    

:Memory1
::Creates Text file (.txt) of all variables, then for the continue, it'll run 
::all variables, and set them for each one, using the /p Command.
cls
set Save_Date=%DATE%
echo %bdr% 
echo         Saving...
echo %bdr% 
echo %bdr%
echo        %DATE%
echo Saving STARLER-SAVEFILE.txt...
(
echo %level%
echo %HP%
echo %MAXHP%
echo %tp%
echo %mc%
echo %Save_Date%
echo %SPD%
echo %PWR%
echo %ELE%
echo %ELEDEF%
echo %binder%
echo %CARDAMOUNT%
echo %r%
echo %bdr%
echo %pre%
echo %SIGHT%
echo %CardNumberA%
echo %CardNumberB%
echo %CardNumberC%
echo %CardNumberD%
echo %WS%
echo %Item1%
echo %S001%
echo %S002%
echo %S003%
echo %S004%
)>STARLER-SAVEFILE.txt 
goto save_menu         


::Save file duplicates are okay as long as the name is changed for the ones not being used,
::and changeed back to normal for the ones being used.
:pass
echo                        - /!\ WARNING -
echo           ===============================================
echo            Duplicate files may cause error to save file.
echo       Please rename any old save files you are not currently
echo                            using.
echo.
set /p load=LOAD OLD FILE? [y/n]
if %load% == y goto loadingFile
if %load% == n goto titlescreen


::Opens file STARLER-SAVEFILE.txt, and uses data supplied in it, to 
::continue where you left off.
:loadingFile
cls
echo     Loading File...
ping localhost -n 4 >nul
(
set /p level=
set /p HP=
set /p MAXHP=
set /p tp=
set /p mc=
set /p last_Save=
set /p SPD=
set /p PWR=
set /p ELE=
set /p ELEDEF=
set /p binder=
set /p CARDAMOUNT=
set /p r=
set /p bdr=
set /p pre=
set /p SIGHT=
set /p CardNumberA=
set /p CardNumberB=
set /p CardNumberC=
set /p CardNumberD=
set /p WS=
set /p Item1=
set /p S001=
set /p S002=
set /p S003=
set /p S004=
)<STARLER-SAVEFILE.txt
goto locate


:MENU
cls
echo  ******************************************************************
echo  * 1.) E.CARD   *  HP: %HP%/%MAXHP% 
echo  * 2.) ITEM     *  LV.%level%
echo  * 3.) STATUS   *  =
echo  * 4.) A/W CHIP *  TENSION PERCENT: %tp% '/.
echo  * 5.) SAVE     *
echo  ******************************************************************
echo        SETTINGS ('s')          %mc% MC     %TIME% 
set /p choice=
if %choice% == 1 goto E.CARD
if %choice% == 2 goto ITEM 
if %choice% == 3 goto STATUS
if %choice% == 4 goto Armor/WeaponChip
if %choice% == 5 goto save_menu
if %choice% GEQ 6 goto locate
if %choice% LEQ 0 goto locate
if %choice% == s goto SETTINGS
if %choice% == c goto locate 

:E.CARD
cls
set binder=%CARDAMOUNT% OF 15
if %CardNumberA% == 1 (
    set CardClassA=S
    set CardNameA=Blaster
    set CardDescA=A giant blast! [200DMG]
)
if %CardNumberB% == 2 (
    set CardClassB=S 
    set CardNameB=Recover
    set CardDescB=Heal HP.
    set CardB_set=500
)
if %CardNumberC% == 3 (
    set CardClassC=G
    set CardNameC=Delta Max
    set CardDescC=(2hit) - 300
)
echo                ENERGY CARD           
echo ===================================================
echo  A [%CardClassA%]: %CardNumberA% -- %CardNameA% 
echo     %CardDescA%
echo.
echo  B [%CardClassB%]: %CardNumberB% -- %CardNameB%
echo     %CardDescB%                           
echo.
echo  C [%CardClassC%]: %CardNumberC% -- %CardNameC% 
echo     %CardDescC%
echo.
echo  D [%CardClassD%]: %CardNumberD% -- %CardNameD% 
echo     %CardDescD%  
set /p num=     [CHANGE(1)]        [See All Energy Cards(2)]
if %num% == 1 goto switch_E.Card
if %num% == 2 goto E.card_binder

:E.card_binder
if %CardNumberA% == 1 set CARD_A_IMAGE=Blaster
if %CardNumberB% == 2 set CARD_B_IMAGE=Recover
if %CardNumberC% == 3 set CARD_C_IMAGE=Delta Max
if %CardNumberD% LEQ 3 set CARD_D_IMAGE=NONE 
goto E.Card_Binder_(Images)

:E.Card_Binder_(Images) 
::All A row Cards will be in this 'IF' statement.
if %CARD_A_IMAGE% == Blaster goto CARD[001]_IMAGE
if %CARD_A_IMAGE% == ??????? goto ???????????????

:CARD[001]_IMAGE
cls
echo  *************************
echo  *       BLASTER         *
echo  *    (O_O)__[]//////////*
echo  *    /\__\  []//////////*
echo  *      J  \             *
echo  *************************
echo  %CardNameA% %CardClassA% 
echo  %CardDescA%
pause >nul
if %CARD_B_IMAGE% == Recover goto CARD[002]_IMAGE
if %CARD_B_IMAGE% == 0 goto error

:CARD[002]_IMAGE
cls
echo  *************************
echo  *      ____  ____       *
echo  *     [    \/    ]      *
echo  *     \          /      *
echo  *      \  +500  /       *
echo  *       \      /        *
echo  *        \    /         *
echo  *************************
echo  %CardNameB% %CardClassB%
echo  %CardDescB%
pause >nul
if %CARD_C_IMAGE% == Delta Max goto CARD[003]_IMAGE
if %CARD_C_IMAGE% == 0 goto error


:CARD[003]_IMAGE
cls
echo  *************************
echo  *                       *
echo  *--(O_.)...////         *
echo  *--/[/]...//////        *
echo  *---/ J...///////       *
echo  *                       *
echo  *************************
echo  %CardNameC% %CardClassC% 
echo  %CardDescC%
pause >nul
goto MENU

:: Commented out if statements until they are ready.
REM   if %CARD_C_IMAGE% == Delta Max goto CARD[003]_IMAGE
REM   if %CARD_C_IMAGE% == 0 goto error
:: --------------------------------------

:ITEM
cls
echo   *******************************************************
echo   *                       ITEM                          *
echo   *******************************************************
echo   (1) HEAL CHIP               - %Item1%
echo   (2) PYRO ELEMENTAL VPN      - %Item2%
echo   (3) HYDRO ELEMENTAL VPN     - %Item3%
echo   (4) ELECTRO ELEMENTAL VPN   - %Item4%
echo   (5) FIRE WALL               - %Item5%
echo   (6) CODE VPN                - %Item6%
echo   (7) RECOVERY CHIP           - %Item7% 
echo   ******************************************************
set /p num=--) USE AN ITEM (1-7) LEAVE ITEMS(c): 
if %num% == 1 goto HP_HealBy500
if %num% == 2 goto VPN_pyro
if %num% == 3 goto VPN_hydro
if %num% == 4 goto VPN_electro
if %num% == 5 goto F_wall
if %num% == 6 goto VPN_code
if %num% == 7 goto HP_Full-Heal
if %num% == c goto MENU

:HP_HealBy500
@set /A "Item1=%Item1%-1"
@set /A "HP=%HP%+500"
goto HP_HealBy500.2

:HP_HealBy500.2
if %HP% LEQ %MAXHP% goto ITEM
if %HP% GEQ %MAXHP% set HP=%MAXHP%
if %HP% GEQ %MAXHP% goto ITEM
else (
    goto ITEM
)



:: Movement section of the game. 
:: All the areas, and such.
::                            The main controls 
::                           123456789, WASD, EQ
::   -----------------------------------------
REM.
::            -WHY THIS IS NEW-
::      ===========================
::     Most batch games don't do this type of 
::  control they usually have the player make a decision and show a 
:: picture.




:ValRoom1
cls
color F0
set r=0
echo Press 'E' To open Menu.
echo **************************************************************************
echo *__--------____(    )_____(0_0)________________________________________/ *         
echo *  [______]    [    ]     []:]]                                        : *
echo *              [____]      L L                                         : *
echo *                                                                      : *
echo *                                                                      : *
echo *                                                                      : *
echo *                                                                      : *
echo *---------------;       ;----------------------------------------------- *
echo *               :       :                                               \*
echo **************************************************************************
set /p num= 
if %num% == q goto OVERWORLD_check
if %num% == w goto ValRoom1
if %num% == a goto ValRoom1_bed
if %num% == s goto ValRoom1.2
if %num% == d goto ValRoom1.1
if %num% == e goto MENU


:ValRoom1_bed
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     I should probably leave for school now.
echo  0       00   00  0
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
echo                       Hm? What's this?
echo                        +1 HealChip!
@set /A "Item1=%Item1%+1"
echo.
pause 
goto ValRoom1

:ValRoom1.2
cls
color F0
set r=0
echo Press 'E' To open Menu.
echo **************************************************************************
echo *__--------____(    )__________________________________________________/ *         
echo *  [______]    [    ]                                                  : *
echo *              [____]                                                  : *
echo *                                                                      : *
echo *                 (0_0)                                                : *
echo *                 []:]]                                                : *
echo *                  L L                                                 : *
echo *---------------;       ;----------------------------------------------- *
echo *               :       :                                               \*
echo **************************************************************************
set /p num= 
if %num% == q goto OVERWORLD_check
if %num% == w goto ValRoom1
if %num% == a goto ValRoom1.2
if %num% == s goto Kapus_City1.0
if %num% == d goto ValRoom1.1
if %num% == e goto MENU



:KAPUS_City1.0
cls
set r=3
color F0
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\        (0_0)                                                 
echo      #         []:]]
echo      #          L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
set /p num=
if %num% == q goto OVERWORLD_check
if %num% == w goto ValRoom1.2
if %num% == a goto KAPUS_City1.0
if %num% == s goto KAPUS_City1.0
if %num% == d goto KAPUS_City1.1
if %num% == e goto MENU

:KAPUS_City1.1
cls
set r=4
color F0
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                (0_0)                                                 
echo      #                 []:]]
echo      #                  L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
set /p num=
if %num% == q goto OVERWORLD_check
if %num% == w goto KAPUS_City1.1
if %num% == a goto KAPUS_City1.0
if %num% == s goto KAPUS_City1.0
if %num% == d goto KAPUS_City1.2
if %num% == e goto MENU

:KAPUS_City1.2
cls
set r=5
color F0
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                                          (0_0)                                                 
echo      #                                           []:]]
echo      #                                            L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
set /p num=
if %num% == q goto OVERWORLD_check
if %num% == w goto SHOP_Kapus
if %num% == a goto KAPUS_City1.1
if %num% == s goto KAPUS_City1.2
if %num% == d goto cutscene_check_KAPUS
if %num% == e goto MENU

:cutscene_check_KAPUS
if %S001% == OFF goto KAPUS_City1.3
if %S001% == YES goto KAPUS_City1.3_Cutscene

:KAPUS_City1.3_Cutscene
cls
color F0
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                                                                  (0_0)                                                 
echo      #                                                                   []:]]
echo      #                                                                    L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     Finally... The new year is starting... It'll be my first time 
echo  0       00   00  0  well rather first year here... I wonder how this'll play out...
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                                                                  (0_0)                                                 
echo      #                                                                   []:]]
echo      #                                                                    L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     
echo  0       00   00  0       Hm? Whose that?
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00         
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________?_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     
echo  0       00   00  0      .....................?
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00         
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________?_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                         Student:
echo            Are you headed to the Hydro Surfer?
echo                       (v)
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________?_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     
echo  0       00   00  0      Yes? Is something wrong?
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00     
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________!_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                           Student:
echo          The Over fountain connected to the OverWorld suddenly stopped working... The Hydro Surfer is 
echo         stuck in the middle of the lake... 
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     
echo  0       00   00  0      And we won't be able to call the Over Admins while it's out...
echo  0   0 0(O)0 0(O)0 0    
echo   0   0      0   00   
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00     
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________?_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                   Student:
echo          Darn it! Of course I'm missing the first day of school!
pause >nul
cls
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]________________?_________________________
echo      #\                                                                  (0_0)     (-_-)                                            
echo      #                                                                   []:]]     [[:[]
echo      #                                                                    L L       d d
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     
echo  0       00   00  0      Maybe there is something I can do...
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0       
echo   0 0   0  /  0
echo    0  0 0000
echo     00     
pause >nul
cls
set S001=OFF
goto KAPUS_City1.3


:SHOP_Kapus
cls
set r=7
color F0
echo             #############################################################
echo             #                                                           #
echo             #                                 (-o-o)                    #
echo             #                                 /[__]\                    #
echo             #                                  //\\                     #
echo             #                                                           #
echo             #                                                           #
echo             #                                 (0_0)                     #
echo             #                                 []:]]                     #
echo             #                                  L L                      #
echo             #------------------------------               --------------#
echo             #                             ]               [             #
echo             #############################################################
set /p num= [PRESS Q TO OPEN SHOP] 
if %num% == q goto SHOPPING1
if %num% == s goto KAPUS_City1.2
if %num% == a goto KAPUS_Store
if %num% == w goto KAPUS_Store
if %num% == d goto KAPUS_Store
if %num% == e goto MENU 

:SHOPPING1
echo.
echo            SHOPPING:
echo            **********************
echo            1.) %Item1% - 10 MC 
echo            2.) CARD005 SIGMA BLASTER - 1200 DMG (G) - 50 MC
echo            3.) Exit SHOP
set /p num=
if %num% == 1 goto MC_check_SHOP_kapus.1
if %num% == 2 goto MC_check_SHOP_kapus.2
if %num% == 3 goto SHOP_Kapus

:MC_check_SHOP_kapus.1
if not %mc% == 10 goto Not_enough-(Kapus_SHOP)
if %mc% GEQ 10 @set /A "mc=%mc%-10"
if %mc% GEQ 10 @set /A "Item1=%Item1%+1"
echo ----------------------------------
echo           Valen got Heal Chip!  
echo                   (v)
pause >nul
goto SHOPPING1


:Not_enough-(Kapus_SHOP)
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     I don't have enough Mondle Crystals...
echo  0       00   00  0    I have... %mc%MC...
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
goto SHOPPING1

::OverworldCheck(
:OVERWORLD_check
if %SSHERO% == active goto OverWorld.Valen's_Room
if not %SSHERO% == active goto No_OverWorld
else(
    goto error
    )
::)
    
    
:KAPUS_City1.3
cls
set r=8
color F0
echo      ###################################################################################################
echo      #       ________                         ____________
echo      #      /________\                       /____________\
echo      #      [  ____  ]nnnnnnn                [   STORE    ]
echo      #      [ [    ] ] @@@  n                [ [------]   ]
echo      #      [ [o   ] ] @@@  n                [ [======]   ]
echo      #______[_[____]_]nnnnnnn________________[_[======]___]__________________________________________
echo      #\                                                                  (0_0)                                                 
echo      #                                                                   []:]]
echo      #                                                                    L L 
echo      #=======================================================\\--------------------------------------
echo      #--------------------------------------------------------=\\        (O_O)
echo      #ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       [[:]]
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooooooo=\\       d b
echo      #=====================================================oooooo=\\
echo      #oooooooooooooooooooooooooooooooooooooooooooooooooooooo=ooooo=\\
echo      ###################################################################################################
set /p num=
if %num% == q goto TalkToNPC_Kapus1.3
if %num% == w goto KAPUS_City1.3
if %num% == a goto KAPUS_City1.2
if %num% == s goto KAPUS_City1.3
if %num% == d goto KAPUS_City1.4 
if %num% == e goto MENU


:TalkToNPC_Kapus1.3
if %S002% == OFF goto TalkToNPC_again_Kapus1.3
echo                                            MAN:
echo   With out the Over Admins... We won't be able to do anything... Why did they have to split 
echo  the overworld areas and the normal areas completely?!
pause >nul
goto KAPUS_City1.3
:: ---------------------------------
:TalkToNPC_again_Kapus1.3
echo                                           MAN:
echo    I'm happy they split the overworld areas with the normal areas! 
echo    It was an excellent Idea!
echo                                          (v)
pause >nul
goto KAPUS_City1.3

:KAPUS_City1.4
cls
set r=9
echo     ##################################################################################################
echo     #==={HIGH RADIATION}[]        [] }   {    }    {    }    {    }    {    }   {[]]          [      #
echo     #===================[]        []  {    }    }    {    }    {    }    {    }  []]          [ (~~~)#
echo     #===================[]        []{   }{   }{   }{   }{   }{   }{   }{   }{   }[]]          [ [] []#
echo     #-------------------------------------------------------------------------------          -------#
echo     #                                                                                                #
echo     #                                                                                                #
echo     #  (0_0)                                                                                         #
echo     #  []:]]                                                                                         #
echo     #   L L                                                                                          #
echo     ##################################################################################################
set /p num=
if %num% == q goto OVERWORLD_check
if %num% == w goto KAPUS_City1.4
if %num% == a goto KAPUS_City1.3
if %num% == s goto KAPUS_City1.4
if %num% == d goto KAPUS_City1.5
if %num% == e goto MENU


:KAPUS_City1.5
cls
set r=10
echo     ##################################################################################################
echo     #==={HIGH RADIATION}[]        [] }   {    }    {    }    {    }    {    }   {[]]          [      #
echo     #===================[]        []  {    }    }    {    }    {    }    {    }  []]          [ (~~~)#
echo     #===================[]        []{   }{   }{   }{   }{   }{   }{   }{   }{   }[]]          [ [] []#
echo     #-------------------------------------------------------------------------------          -------#
echo     #                                                                                                #
echo     #                                                                                                #
echo     #                      (0_0)                                                                     #
echo     #                      []:]]                                                                     #
echo     #                       L L                                                                      #
echo     ##################################################################################################
set /p num=
if %num% == q goto OVERWORLD_check
if %num% == w goto KAPUS_OverFountain
if %num% == a goto KAPUS_City1.4
if %num% == s goto KAPUS_City1.5
if %num% == d goto KAPUS_City1.6
if %num% == e goto MENU


:KAPUS_City1.6
cls
set r=11
if not %S003% == YES goto KAPUS_City1.61
echo     ##################################################################################################
echo     #==={HIGH RADIATION}[]        [] }   {    }    {    }    {    }    {    }   {[]]          [      #
echo     #===================[]        []  {    }    }    {    }    {    }    {    }  []]          [ (~~~)#
echo     #===================[]        []{   }{   }{   }{   }{   }{   }{   }{   }{   }[]]          [ [] []#
echo     #-------------------------------------------------------------------------------          -------#
echo     #                                                                                                #
echo     #                                                                                                #
echo     #                      (0_0)                                                                     #
echo     #                      []:]]                                                                     #
echo     #                       L L                                                                      #
echo     ##################################################################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0     I should see what I can do here first...
echo  0       00   00  0    
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
goto KAPUS_City1.5

:KAPUS_City1.61
cls
set r=11
echo     ##################################################################################################
echo     #==={HIGH RADIATION}[]        [] }   {    }    {    }    {    }    {    }   {[]]          [      #
echo     #===================[]        []  {    }    }    {    }    {    }    {    }  []]          [ (~~~)#
echo     #===================[]        []{   }{   }{   }{   }{   }{   }{   }{   }{   }[]]          [ [] []#
echo     #-------------------------------------------------------------------------------          -------#
echo     #                                                                                                #
echo     #                                                                                                #
echo     #                                                 (0_0)                                          #
echo     #                                                 []:]]                                          #
echo     #                                                  L L                                           #
echo     ##################################################################################################
set /p num=
if %num% == q goto OVERWORLD_Check
if %num% == w goto KAPUS_City1.61
if %num% == a goto KAPUS_City1.5
if %num% == s goto KAPUS_City1.61
if %num% == d goto KAPUS_City1.7
if %num% == e goto MENU


:KAPUS_OverFountain
cls
set r=12
echo     ############################################################
echo     #[]========================================================#
echo     #[]00000000000000000000000000000000000000000000000000000000#
echo     #[]{}{}{{}{}{}{}{}{}{}{}{}(OVWFNTN){}{}{}{}{}{}{}{}{}{}{}{}#
echo     #[]                      [\_______/]                       #
echo     #[]                      \[_______]/                       #
echo     #[]                                                        #
echo     #[]                                                        #
echo     #[]                        (0_0)                           # 
echo     #[]                        []:]]                           #
echo     #[]                         L L                            #
echo     #====================[]                []==================#   
echo     ############################################################
set /p num=
if %num% == q goto Cutscene_Check_OverFountain 
if %num% == w goto KAPUS_OverFountain
if %num% == a goto KAPUS_OverFountain
if %num% == s goto KAPUS_City1.5
if %num% == d goto KAPUS_OverFountain
if %num% == e goto MENU

:Cutscene_Check_OverFountain
if %S004% == YES goto Beginning_OverWorld_Cutscene
if %S004% == OFF goto Valen_Speak_KAPUS_OverFountain
else(
    goto error
    )

:Valen_Speak_KAPUS_OverFountain
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0      Seems the Over Fountain is working well...
echo  0       00   00  0    
echo  0   0 0(O)0 0(O)0 0
echo   0   0      0   00
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
goto KAPUS_OverFountain

:Beginning_OverWorld_Cutscene
cls
echo     ############################################################
echo     #[]========================================================#
echo     #[]00000000000000000000000000000000000000000000000000000000#
echo     #[]{}{}{{}{}{}{}{}{}{}{}{}(OVWFNTN){}{}{}{}{}{}{}{}{}{}{}{}#
echo     #[]                      [\_______/]                       #
echo     #[]                      \[_______]/                       #
echo     #[]                                                        #
echo     #[]                                                        #
echo     #[]                        (0_0)                           # 
echo     #[]                        []:]]                           #
echo     #[]                         L L                            #
echo     #====================[]                []==================#   
echo     ############################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0      Huh-? It's on... I don't see anything
echo  0       00   00  0    wrong with it... Maybe i should take a
echo  0   0 0(O)0 0(O)0 0   closer look...
echo   0   0      0   00
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
cls
echo     ############################################################
echo     #[]========================================================#
echo     #[]00000000000000000000000000000000000000000000000000000000#
echo     #[]{}{}{{}{}{}{}{}{}{}{}{}(OVWFNTN){}{}{}{}{}{}{}{}{}{}{}{}#
echo     #[]               (0_-)  [\_______/]                       #
echo     #[]               \\:\\  \[_______]/                       #
echo     #[]                J J                                     #
echo     #[]                                                        #
echo     #[]                                                        # 
echo     #[]                                                        #
echo     #[]                                                        #
echo     #====================[]                []==================#   
echo     ############################################################
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0      Wait... What's this? A chip? Like one 
echo  0       00   00  0    for a digi-bot?  It seems to be absorbing 
echo  0   0 0(O)0 0(O)0 0   most of the radiation... Of course people
echo   0   0      0   00    aren't connected... What if I pull it out...
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
pause >nul
cls
echo                                  VALEN:
echo        _____             
echo    0000    000000
echo   00             0      Huh-? What's happeniing!!
echo  0       00   00  0    GAAAAAAAAAAHHHHH!!!!
echo  0   0 0(O)0 0(O)0 0   
echo   0   0      0   00
echo    0 0      '   0                   (v)
echo   0 0   0  /  0
echo    0  0 0000
echo     00                               
ping localhost -n 1 >nul
color 50
ping localhost -n 1 >nul
color F0
ping localhost -n 1 >nul
color 50
ping localhost -n 1 >nul
color F0
pause >nul
goto KAPUS_OVERWORLD_1.0_Cutscene

:KAPUS_OVERWORLD_1.0_Cutscene
cls
color 05
set r=Over1
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()                        ]                *
echo  *    / \                         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
echo                                  VALEN:
echo  00 0 0 0 0 0 0 0
echo  0 0 0 0 0 0 0 0 0     W-What is this!.... It's amazing...
echo  0                o
echo  0       00   00  0    
echo  0   0 0(@)0 0(O)0 0
echo   0   0 /V/     000
echo    0 0 /V/  '   0                   (v)
echo   0 0   0 __  0
echo    0  0 0000
echo     00                    
pause >nul
cls
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()          [0.0]         ]                *
echo  *    / \           // \\         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
echo                                  VALEN:
echo  00 0 0 0 0 0 0 0
echo  0 0 0 0 0 0 0 0 0     Huh-?
echo  0                o
echo  0       00   00  0    
echo  0   0 0(@)0 0(O)0 0
echo   0   0 /V/     000
echo    0 0 /V/  '   0                   (v)
echo   0 0   0 __  0
echo    0  0 0000
echo     00                    
pause >nul
cls
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()          [0.0]         ]                *
echo  *    / \           // \\         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
echo                                  VALEN:
echo  00 0 0 0 0 0 0 0
echo  0 0 0 0 0 0 0 0 0      I-is that a-!
echo  0                o    It's coming this way!!
echo  0       00   00  0    
echo  0   0 0(@)0 0(O)0 0
echo   0   0 /V/     000
echo    0 0 /V/  '   0                   (v)
echo   0 0   0 //// 0
echo    0  0 0000
echo     00                    
pause >nul
set enemy1=Score Bot
goto enemyCheckDemo


:enemyCheckDemo
set enemy1HP=80
set enemy1ATK=75
goto Area1_Battle_ScoreBot_BATTLE_DEMO


:Area1_Battle_ScoreBot_BATTLE_DEMO
cls
if %HP% LEQ 0 goto GAMEOVER
if %enemy1HP% LEQ 0 goto Battle_Win
echo             %enemy1%                      %enemy1HP% ENEMY HP
echo  **************************************************************************
echo.
echo    0000000000000000000000000000000
echo   00000000000000000       000000000 ========         o
echo   \\\\\  //   (OO[]OO)  \\\\\\\\          ======== o
echo    88 88   8  (OO[]OO)  8 88 88 8                    o 
echo    === = == = == = = = == = = = = 
echo      ////////            \\\\\\\\\
echo       []  []             []  [] []
echo.
echo.
echo.
echo         /\  /\   /\
echo        /  \/  \//  \/\
echo       /              /
echo      vvvv   \ /vvvvv  
echo       VVVVVV[/ ( 0)] 
echo        [   /   / /\ OOO
echo      //[vvvv/ _/__/ ////
echo    ////[     ]   /////
echo    =====MMMMMMM=======
echo.
echo  **************************************************************************
echo  * %HP% *
echo  *******      Tension: %tp% '/.
echo  =====================================
echo  *(Q: DODGE LEFT) -- (E: DODGE RIGHT)* 
echo  =====================================
echo     '/,          []<>        (O_O)
echo   [(1)BASIC] [(2)E.CARD] [(3)SPECIAL] 
set /p num=
if %num% == 1 goto AIM_ScoreBot_Battle
if %num% == 2 goto CARD_BATTLE
if %num% == 3 goto Special_Battle_1
if %num% == l goto dodge_pannel_Player_left

:Need_More_TP
echo.
echo                                 ============================
echo                                 *NOT ENOUGH TENSION POINTS.*
echo                                 ============================
echo.
pause >nul
goto Area1_Battle_ScoreBot_BATTLE_DEMO

:CARD_BATTLE_Demo
if %tp% LEQ 25 goto Need_More_TP
if %CardNumberA% == 1 (
    set CardClassA=S
    set CardNameA=Blaster
    set CardDescA=A giant blast! [200DMG]
)
if %CardNumberB% == 2 (
     set CardClassB=S 
     set CardNameB=Recover
     set CardDescB=Heal HP.
     set CardB_set=500
)
if %CardNumberC% == 3 (
     set CardClassC=G
     set CardNameC=Delta Max
     set CardDescC=(2hit) - 300
)
echo                ENERGY CARD           
echo ===================================================
echo  1 [%CardClassA%]: %CardNumberA% -- %CardNameA% 
echo     %CardDescA%
echo.
echo  2 [%CardClassB%]: %CardNumberB% -- %CardNameB%
echo     %CardDescB%                           
echo.
echo  3 [%CardClassC%]: %CardNumberC% -- %CardNameC% 
echo     %CardDescC%
echo.
echo  4 [%CardClassD%]: %CardNumberD% -- %CardNameD% 
echo     %CardDescD%      
set /p num=
if %num% == 1 @set /A "tp=%tp%-25"
if %num% == 1 goto CARD_A_BATTLE_Demo
if %num% == 2 @set /A "tp=%tp%-25"
if %num% == 2 goto CARD_B_BATTLE_Demo
if %num% == 3 @set /A "tp=%tp%-25"
if %num% == 3 goto CARD_C_BATTLE_Demo
if %num% == 4 @set /A "tp=%tp%-25"
if %num% == 4 goto CARD_D_BATTLE_Demo
else(
    goto error
)


:CARD_A_BATTLE_Demo
color 0F
ping localhost -n 1 >nul
color F0
ping localhost -n 1 >nul
color 0F
ping localhost -n 1 >nul
color F0
if %CardNumberA% == 1 @set /A "enemy1HP=%enemy1HP%-%CardA_set%" | goto battle_Kapus_AreaDesc_Demo
if %CardNumberB% == 2 goto HP_Recovery_CARD002
::add enemy turn! (Replace this goto command.)


:HP_Recovery_CARD002_Demo
::If the HP is Higher the max HP, the HP will swap to MAX HP amount.
@set /A "HP=%HP%+500"
if %HP% GEQ %MAXHP% set HP=%MAXHP% 
goto Area1_Battle_ScoreBot_BATTLE_DEMO


:dodge_pannel_Player_left_Demo
cls
echo             %enemy1%                      %enemy1HP% ENEMY HP
echo  **************************************************************************
echo.
echo    0000000000000000000000000000000
echo   00000000000000000       000000000 ========         o
echo   \\\\\  //   (OO[]OO)  \\\\\\\\          ======== o
echo    88 88   8  (OO[]OO)  8 88 88 8                    o 
echo    === = == = == = = = == = = = = 
echo      ////////            \\\\\\\\\
echo       []  []             []  [] []
echo.
echo.
echo                             MISS!
echo        /\  /\   /\
echo       /  \/  \//  \/\
echo      /              /
echo     vvvv   \ /vvvvv  
echo      VVVVVV[/ ( 0)] 
echo       [   /   / /\ OOO
echo     //[vvvv/ _/__/ ////
echo   ////[     ]   /////
echo =====MMMMMMM=======
echo.
echo  **************************************************************************
echo  * %HP% *
echo  *******      Tension: %tp% '/.
echo.
echo   Enemy Attacked.  OVERALL: Miss
echo.
ping localhost -n 2 >nul
@set /A "tp=%tp%+5"
goto Area1_Battle_ScoreBot_Demo





:KAPUS_OVERWORLD_1.0_demo
cls
set r=Over1
echo.
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()                        ]                *
echo  *    / \                         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
echo  PRESS E TO ACCESS MENU. 
echo  Go to checkpoints to Heal.
echo  SAVE in the MENU.
echo              (v)
pause >nul
cls
echo.
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()                        ]                *
echo  *    / \                         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
echo  At the top is your current HP. If it reaches 0, 
echo  in battle its game over... But if you are not,
echo  you will be in danger! 
echo               (v)
pause >nul
goto KAPUS_OVERWORLD_1.0

:KAPUS_OVERWORLD_1.0
cls
set r=Over2
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *===/0_0\=========================                *
echo  *   ():()                        ]                *
echo  *    / \                         ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  *                                ]                *
echo  ***************************************************
set /p num=
if %num% == w goto KAPUS_OVERWORLD_1.0
if %num% == a goto KAPUS_OVERWORLD_1.0
if %num% == s goto KAPUS_OVERWORLD_1.1
if %num% == d goto KAPUS_OVERWORLD_1.0
if %num% == e goto MENU

:KAPUS_OVERWORLD1.1
cls
set r=Over3
echo  VALEN: %HP%
echo  ***************************************************
echo  * __                __                            *
echo  * []                []                            *
echo  * []                []                            *
echo  * []                []                            *
echo  *=================================                *
echo  *                                ]                *
echo  *                                ]                *
echo  *   /0_0\                        ]                *
echo  *   ():()                        ]                *
echo  *    / \                         ]                *
echo  ***************************************************
set /p num=
if %num% == w goto KAPUS_OVERWORLD_1.0
if %num% == a goto KAPUS_OVERWORLD_1.1
if %num% == s goto KAPUS_OVERWORLD_2.0
if %num% == d goto KAPUS_OVERWORLD_1.1
if %num% == e goto MENU


::
