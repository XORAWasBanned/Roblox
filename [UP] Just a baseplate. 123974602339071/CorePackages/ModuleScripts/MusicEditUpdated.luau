-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Actions.MusicEditUpdated
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
require(v1.MomentsCommon)
return require(v1.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["musicEdit"] = p2
	}
end)