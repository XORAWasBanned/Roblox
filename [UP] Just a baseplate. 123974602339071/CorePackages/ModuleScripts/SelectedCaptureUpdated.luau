-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Actions.SelectedCaptureUpdated
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
return require(v1.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["capture"] = p2
	}
end)