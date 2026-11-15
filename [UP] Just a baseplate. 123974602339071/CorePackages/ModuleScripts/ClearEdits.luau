-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Actions.ClearEdits
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.Rodux)
require(v1.Enums.CreationFlowState)
return v3.makeActionCreator(script.Name, function(p4)
	return {
		["newState"] = p4
	}
end)