-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntCanHideGuiGroupId
return function()
	local v1, v2 = pcall(function()
		return game:GetFastInt("CanHideGuiGroupId")
	end)
	return v1 and v2
end