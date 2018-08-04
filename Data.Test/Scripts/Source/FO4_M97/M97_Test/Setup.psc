Scriptname M97_Test:Setup extends Quest

Actor Player
bool Silent = true const

; Events
;---------------------------------------------

Event OnInit()
	Player = Game.GetPlayer()
EndEvent


Event OnQuestInit()
	Try(M97, win1897)
	Try(M97_Dev, win1897)
	Try(Fallout4, AmmoShotgunShell, 600)
EndEvent


; Functions
;---------------------------------------------

Function Try(string plugin, int formID, int amount = 1)
	If (Game.IsPluginInstalled(plugin))
		Form item = Game.GetFormFromFile(formID, plugin)
		If (item)
			Player.AddItem(item, amount, Silent)
		EndIf
	EndIf
EndFunction


; Properties
;---------------------------------------------

Group Fallout
	string Property Fallout4 = "Fallout4.esm" AutoReadOnly
	int Property AmmoShotgunShell = 0x0001F673 AutoReadOnly
	{AmmoShotgunShell "Shotgun Shell" [AMMO:0001F673]}
EndGroup

Group M97
	string Property M97 = "win1897.esp" AutoReadOnly
	string Property M97_Dev = "win1897.esm" AutoReadOnly
	int Property win1897 = 0x00004B8E AutoReadOnly
	{win1897 "Winchester 1897" [WEAP:00004B8E]}
EndGroup
