-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Reducers.CreationFlow
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Cryo)
require(v2.MomentsCommon)
local v4 = require(v2.Rodux)
local v5 = require(v1.Actions.ClearEdits)
local v6 = require(v1.Enums.CreationFlowState)
local v7 = require(v1.Actions.CreationFlowStateUpdated)
local v8 = require(v1.Actions.DescriptionUpdated)
local v9 = require(v1.Actions.MusicEditUpdated)
local v10 = require(v1.Actions.MusicSearchRetrieved)
local v11 = require(v1.Actions.SelectedCaptureUpdated)
local v12 = require(v1.Actions.TextOverlayEditsUpdated)
local v13 = require(v1.Actions.TrimEditUpdated)
local v14 = {
	["active"] = false,
	["capture"] = nil,
	["currentState"] = nil,
	["description"] = "",
	["musicList"] = nil,
	["musicEdit"] = nil,
	["textOverlayEdits"] = nil,
	["trimEdit"] = nil,
	["currentState"] = v6.Gallery,
	["musicList"] = {}
}
return v4.createReducer(v14, {
	[v7.name] = function(p15, p16)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p15, {
			["currentState"] = p16.currentState
		})
	end,
	[v10.name] = function(p17, p18)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p17, {
			["musicList"] = p18.musics
		})
	end,
	[v11.name] = function(p19, p20)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p19, {
			["capture"] = p20.capture
		})
	end,
	[v12.name] = function(p21, p22)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p21, {
			["textOverlayEdits"] = p22.textOverlayEdits
		})
	end,
	[v13.name] = function(p23, p24)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p23, {
			["trimEdit"] = p24.trimEdit
		})
	end,
	[v9.name] = function(p25, p26)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p25, {
			["musicEdit"] = p26.musicEdit
		})
	end,
	[v8.name] = function(p27, p28)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.union(p27, {
			["description"] = p28.description
		})
	end,
	[v5.name] = function(_, p29)
		return {
			["active"] = true,
			["capture"] = nil,
			["currentState"] = nil,
			["description"] = "",
			["musicList"] = nil,
			["musicEdit"] = nil,
			["textOverlayEdits"] = nil,
			["trimEdit"] = nil,
			["currentState"] = p29.newState,
			["musicList"] = {}
		}
	end
})