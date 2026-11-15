-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Reducers.EmotesWheel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.FocusSegment)
local v6 = require(v4.HideMenu)
local v_u_7 = {
	["focusedSegmentIndex"] = 0
}
return v3.createReducer(v_u_7, {
	[v5.name] = function(p8, p9)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p8, {
			["focusedSegmentIndex"] = p9.segmentIndex
		})
	end,
	[v6.name] = function(p10, _)
		-- upvalues: (copy) v_u_2, (copy) v_u_7
		return v_u_2.Dictionary.join(p10, v_u_7)
	end
})