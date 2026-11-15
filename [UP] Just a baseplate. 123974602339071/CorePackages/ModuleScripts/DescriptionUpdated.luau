-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Actions.DescriptionUpdated
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
return require(v1.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["description"] = p2
	}
end)