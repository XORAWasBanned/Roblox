-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MergeObservedNames
return function(p1, p2, p3) -- name: mergeObservedNames
	local v4 = false
	for _, v5 in p1 do
		local v6 = v5[p3]
		if not v6 or p2[v6] then
			continue
		end
		p2[v6] = true
		v4 = true
	end
	return v4
end