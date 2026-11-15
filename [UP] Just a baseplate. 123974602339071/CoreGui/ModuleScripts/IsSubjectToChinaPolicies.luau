-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.IsSubjectToChinaPolicies
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetIsSubjectToChinaPolicies)
return v2.createReducer(true, {
	[v4.name] = function(_, p5)
		return p5.isSubjectToChinaPolicies
	end
})