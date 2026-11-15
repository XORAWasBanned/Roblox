-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.Item.useOptionSelectorGroupItemMotionStates
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.React)
local v_u_3 = require(v1.Providers.Style.useTokens)
local v_u_4 = require(v2.Motion)
local v_u_5 = v_u_4.TransitionPreset
return function(p6, p7) -- name: useOptionSelectorGroupItemMotionStates
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_3()
	local v9 = {}
	local v10 = v_u_4.createState
	local v11 = {
		["iconTransparency"] = v_u_4.transition(v_u_5.Default, {
			["easingStyle"] = Enum.EasingStyle.Linear,
			["duration"] = v8.Time.Time_500
		}),
		["transparency"] = v_u_4.transition({
			["easingStyle"] = Enum.EasingStyle.Linear,
			["duration"] = v8.Time.Time_200
		}),
		["default"] = v_u_4.transition(v_u_5.Default, {
			["duration"] = v8.Time.Time_200
		})
	}
	v9.Default = v10({
		["transparency"] = p6 or 0,
		["textTransparency"] = p6 or 0
	}, v11)
	local v12 = v_u_4.createState
	local v13 = {
		["default"] = v_u_4.transition({
			["easingStyle"] = Enum.EasingStyle.Linear,
			["duration"] = v8.Time.Time_100
		})
	}
	v9.Disabled = v12({
		["transparency"] = p7,
		["textTransparency"] = p7
	}, v13)
	return v9
end