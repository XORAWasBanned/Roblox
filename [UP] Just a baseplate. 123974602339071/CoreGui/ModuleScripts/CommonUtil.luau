-- Path: CoreGui.RobloxGui.Modules.Common.CommonUtil
return {
	["TableConcat"] = function(p1, p2) -- name: TableConcat
		for v3 = 1, #p2 do
			p1[#p1 + 1] = p2[v3]
		end
		return p1
	end,
	["SortByName"] = function(p4) -- name: SortByName
		table.sort(p4, function(p5, p6) -- name: compareInstanceNames
			return p5.Name < p6.Name
		end)
		return p4
	end
}