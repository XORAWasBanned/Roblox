-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInput.useInputMotionStates
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Components.Types)
require(v1.Providers.Style.Tokens)
require(v2.React)
local v_u_3 = require(v2.Motion)
local v_u_4 = v_u_3.TransitionPreset
return function(p5, p6) -- name: useInputMotionStates
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v7
	if p6 and p6.backgroundStyle then
		v7 = p6.backgroundStyle
	else
		v7 = p5.Color.Content.Default
	end
	local v8
	if p6 and p6.checkedStyle then
		v8 = p6.checkedStyle
	else
		v8 = p5.Color.ActionSubEmphasis.Background
	end
	local v9 = p5.Color.Content.Emphasis
	local v10 = {}
	local v11 = v_u_3.createState
	local v12 = {
		["backgroundStyle"] = {
			["Color3"] = v7.Color3,
			["Transparency"] = not (p6 and p6.backgroundStyle) and 1 or p6.backgroundStyle.Transparency
		},
		["strokeStyle"] = v7,
		["labelStyle"] = v9
	}
	v10.Default = v11(v12, {
		["default"] = v_u_3.transition(v_u_4.Default, {
			["duration"] = 0.2
		}),
		["transparency"] = v_u_3.transition({
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		})
	})
	v10.Checked = v_u_3.createState({
		["backgroundStyle"] = v8,
		["strokeStyle"] = v8,
		["labelStyle"] = v9
	}, {
		["default"] = v_u_3.transition(v_u_4.Default, {
			["duration"] = 0.2
		}),
		["transparency"] = v_u_3.transition({
			["easingStyle"] = nil,
			["duration"] = 0.2,
			["easingStyle"] = Enum.EasingStyle.Linear
		})
	})
	return v10
end