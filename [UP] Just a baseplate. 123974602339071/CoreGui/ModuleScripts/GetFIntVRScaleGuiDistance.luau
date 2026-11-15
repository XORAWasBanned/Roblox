-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntVRScaleGuiDistance
game:DefineFastInt("VRScaleGuiDistance", 100)
return function()
	return game:GetFastInt("VRScaleGuiDistance")
end