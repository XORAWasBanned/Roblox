-- Path: CoreGui.RobloxGui.Modules.CoreScriptsRhodiumTest.Helpers.withFlag
return function(p1, p2) -- name: withFlag
	local v3 = game:SetFastFlagForTesting(p1, true)
	local v4, v5 = pcall(p2)
	game:SetFastFlagForTesting(p1, v3)
	local v6 = tostring(v5)
	assert(v4, v6)
end