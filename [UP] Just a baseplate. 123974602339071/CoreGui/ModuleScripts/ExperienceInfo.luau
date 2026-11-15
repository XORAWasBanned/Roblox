-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Models.ExperienceInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.MockId)
local v_u_3 = require(v1.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
return {
	["mock"] = function() -- name: mock
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return {
			["universeId"] = v_u_2(),
			["name"] = "",
			["rootPlaceId"] = v_u_2(),
			["isPlayable"] = true,
			["playabilityStatus"] = v_u_3.Playable
		}
	end,
	["fromGetPlayabilityStatus"] = function(p4) -- name: fromGetPlayabilityStatus
		local v5 = {}
		local v6 = p4.universeId
		v5.universeId = tostring(v6)
		v5.isPlayable = p4.isPlayable
		v5.playabilityStatus = p4.playabilityStatus
		return v5
	end,
	["fromGetExperienceInfo"] = function(p7) -- name: fromGetExperienceInfo
		local v8 = {}
		local v9 = p7.id
		v8.universeId = tostring(v9)
		local v10 = p7.rootPlaceId
		v8.rootPlaceId = tostring(v10)
		v8.name = p7.name
		return v8
	end
}