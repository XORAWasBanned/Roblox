-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.CreatingExperiences
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetExperienceInfo)
return v3.createReducer({}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_2
		local v8 = p7.experienceInfo
		local v9 = v8.universeId
		local v10 = v9 ~= nil
		assert(v10, "Expected a universe id when setting an experiences\'s information.")
		local v11 = p6[v9] or {}
		local v12 = {
			[v9] = v_u_2.Dictionary.join(v11, v8)
		}
		return v_u_2.Dictionary.join(p6, v12)
	end
})