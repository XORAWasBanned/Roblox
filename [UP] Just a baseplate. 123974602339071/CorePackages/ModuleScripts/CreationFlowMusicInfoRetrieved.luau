-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
require(v1.MomentsCommon)
return require(v1.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["musicInfos"] = p2
	}
end)