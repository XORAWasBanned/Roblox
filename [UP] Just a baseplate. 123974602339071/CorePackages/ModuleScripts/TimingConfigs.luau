-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.0.7.Motion.Utility.TimingConfigs
local v1 = script.Parent.Parent
require(v1.Types)
local v_u_2 = require(v1.Enums.TransitionPreset)
local v_u_3 = {}
local v4 = {
	[v_u_2.Default] = {
		["duration"] = 0.3,
		["easingStyle"] = nil,
		["delay"] = 0,
		["easingStyle"] = {
			0.2,
			0,
			0,
			1
		}
	},
	[v_u_2.Quick] = {
		["duration"] = 0.05,
		["easingStyle"] = nil,
		["delay"] = 0,
		["easingStyle"] = {
			0.2,
			0,
			0,
			1
		}
	},
	[v_u_2.Slow] = {
		["duration"] = 1,
		["easingStyle"] = nil,
		["delay"] = 0,
		["easingStyle"] = {
			0.2,
			0,
			0,
			1
		}
	}
}
v_u_3.presets = v4
function v_u_3.getDefaultTransition() -- name: getDefaultTransition
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = v_u_3.presets[v_u_2.Default]
	return {
		["duration"] = v5.duration,
		["easingStyle"] = v5.easingStyle,
		["delay"] = v5.delay
	}
end
function v_u_3.createDefaultTransitionState() -- name: createDefaultTransitionState
	-- upvalues: (copy) v_u_3
	return {
		["default"] = v_u_3.getDefaultTransition()
	}
end
return v_u_3