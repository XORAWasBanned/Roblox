-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetIsSubjectToChinaPolicies
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["isSubjectToChinaPolicies"] = p2
	}
end)