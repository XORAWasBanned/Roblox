-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.useButtonMotionStates
local v1 = script:FindFirstAncestor("Foundation").Parent
require(v1.React)
local v_u_2 = require(v1.Motion)
local v_u_3 = v_u_2.TransitionPreset
return function(p4, p5) -- name: useButtonMotionStates
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = {}
	local v7 = v_u_2.createState
	local v8 = {
		["iconTransparency"] = v_u_2.transition(v_u_3.Default, {
			["easingStyle"] = nil,
			["duration"] = 0.5,
			["easingStyle"] = Enum.EasingStyle.Linear
		}),
		["transparency"] = v_u_2.transition({
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		}),
		["default"] = v_u_2.transition(v_u_3.Default, {
			["duration"] = 0.2
		})
	}
	v6.Default = v7({
		["transparency"] = nil,
		["textTransparency"] = nil,
		["iconScale"] = 1,
		["transparency"] = p4 or 0,
		["textTransparency"] = p4 or 0
	}, v8)
	local v9 = v_u_2.createState
	local v10 = {
		["iconTransparency"] = v_u_2.transition(v_u_3.Default, {
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		}),
		["default"] = v_u_2.transition(v_u_3.Default, {
			["duration"] = 0.2
		})
	}
	v6.Loading = v9({
		["transparency"] = 0,
		["textTransparency"] = 1,
		["iconTransparency"] = 1,
		["iconScale"] = 0
	}, v10)
	local v11 = v_u_2.createState
	local v12 = {
		["default"] = v_u_2.transition({
			["easingStyle"] = nil,
			["duration"] = 0.1,
			["easingStyle"] = Enum.EasingStyle.Linear
		})
	}
	v6.Disabled = v11({
		["transparency"] = p5,
		["textTransparency"] = p5
	}, v12)
	return v6
end