-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.useSpinnerMotionStates
local v1 = script:FindFirstAncestor("Foundation").Parent
require(v1.React)
local v_u_2 = require(v1.Motion)
local v_u_3 = v_u_2.TransitionPreset
return function() -- name: useSpinnerMotionStates
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = {}
	local v5 = v_u_2.createState
	local v6 = {
		["default"] = v_u_2.transition(v_u_3.Default, {
			["duration"] = 0.2
		}),
		["transparency"] = v_u_2.transition({
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		})
	}
	v4.Default = v5({
		["scale"] = 0,
		["transparency"] = 1
	}, v6)
	local v7 = v_u_2.createState
	local v8 = {
		["default"] = v_u_2.transition(v_u_3.Default, {
			["duration"] = 0.2,
			["delay"] = 0.1
		}),
		["transparency"] = v_u_2.transition({
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		})
	}
	v4.Loading = v7({
		["scale"] = 1,
		["transparency"] = 0
	}, v8)
	return v4
end