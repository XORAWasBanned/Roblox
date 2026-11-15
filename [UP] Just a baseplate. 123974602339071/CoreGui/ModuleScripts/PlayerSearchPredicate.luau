-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate
return function(p1, p2, p3) -- name: PlayerSearchPredicate
	if p1 == nil or p1 == "" then
		return true
	end
	if p3 then
		local v4 = utf8.nfdnormalize(p3)
		local v5 = utf8.nfdnormalize(p1)
		if string.find(v4:lower(), v5:lower(), 1, true) ~= nil then
			return true
		end
	end
	return string.find(p2:lower(), p1:lower(), 1, true) ~= nil
end