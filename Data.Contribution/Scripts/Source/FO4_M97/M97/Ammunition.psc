Scriptname M97:Ammunition extends ObjectReference
{Attaches to: }
import M97:Log
import M97:Papyrus

Actor Player

; Animation Events
;---------------------------------------------
; WPNReload

string CullWeaponMagazine = "CullBone.WeaponMagazine" const ; no event received
string UnCullWeaponMagazine = "UnCullBone.WeaponMagazine" const ; no event received
string WPNwin1897pumpback = "SoundPlay.WPNwin1897pumpback" const ; no event received
string WPNwin1897pumpforward = "SoundPlay.WPNwin1897pumpforward" const ; no event received
string WPNwin1897shell = "SoundPlay.WPNwin1897shell" const ; no event received

string WeaponFire = "weaponFire" const
string EjectShellCasing = "EjectShellCasing" const
string ReloadComplete = "reloadComplete" const
string InitiateStart = "initiateStart" const
string ReloadEnd = "reloadEnd" const

; Controls
;---------------------------------------------
string ReloadControl = "ReadyWeapon" const ; `R` does not work


; Events
;---------------------------------------------

Event OnEquipped(Actor akActor)
	Player = akActor
	RegisterForControl(ReloadControl)

	RegisterForAnimationEvent(Player, WeaponFire)
	RegisterForAnimationEvent(Player, EjectShellCasing)
	RegisterForAnimationEvent(Player, ReloadComplete)
	RegisterForAnimationEvent(Player, InitiateStart)
	RegisterForAnimationEvent(Player, ReloadEnd)

	RegisterForAnimationEvent(Player, CullWeaponMagazine)
	RegisterForAnimationEvent(Player, UnCullWeaponMagazine)
	RegisterForAnimationEvent(Player, WPNwin1897pumpback)
	RegisterForAnimationEvent(Player, WPNwin1897pumpforward)
	RegisterForAnimationEvent(Player, WPNwin1897shell)
	WriteLine(self, "OnEquipped")
EndEvent


Event OnUnequipped(Actor akActor)
	UnregisterForControl(ReloadControl)

	UnregisterForAnimationEvent(Player, WeaponFire)
	UnregisterForAnimationEvent(Player, EjectShellCasing)
	UnregisterForAnimationEvent(Player, ReloadComplete)
	UnregisterForAnimationEvent(Player, InitiateStart)
	UnregisterForAnimationEvent(Player, ReloadEnd)

	UnregisterForAnimationEvent(Player, CullWeaponMagazine)
	UnregisterForAnimationEvent(Player, UnCullWeaponMagazine)
	UnregisterForAnimationEvent(Player, WPNwin1897pumpback)
	UnregisterForAnimationEvent(Player, WPNwin1897pumpforward)
	UnregisterForAnimationEvent(Player, WPNwin1897shell)
	WriteLine(self, "OnUnequipped")
EndEvent


Event OnControlDown(string control)
	WriteLine(self, "OnControlDown", "'"+control+"'")
EndEvent


Event OnControlUp(string control, float time)
	WriteLine(self, "OnControlUp", "'"+control+"', time:"+time)
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	WriteLine(self, "OnAnimationEvent", "'"+asEventName+"'")

	; If (asEventName == EjectShellCasing)
	; 	Player.PlayIdle(M97_ReloadEnd)
	; 	Player.PlayIdle(M97_ReloadEnd3rd)
	; 	WriteLine(self, "OnAnimationEvent", "Stopped reload animation.")
	; EndIf
EndEvent


Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
	WriteLine(self, "OnAnimationEventUnregistered", "'"+asEventName+"'")
EndEvent


; Properties
;---------------------------------------------

Group Properties
	Idle Property M97_ReloadEnd Auto Const Mandatory
	Idle Property M97_ReloadEnd3rd Auto Const Mandatory
EndGroup
