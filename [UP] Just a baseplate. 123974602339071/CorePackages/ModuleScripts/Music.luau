-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Reducers.Music
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Cryo)
require(v2.MomentsCommon)
local v4 = require(v2.Rodux)
local v5 = require(v1.Actions.CreationFlowMusicInfoRetrieved)
return v4.createReducer({}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p6, p7.musicInfos)
	end
})