-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CircularProgressBar.CircularProgressBar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = {
	["testId"] = "--foundation-circular-progress-bar"
}
return v_u_3.memo(v_u_3.forwardRef(function(p10, p11) -- name: CircularProgressBar
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
	local v12 = v_u_8(p10, v_u_9)
	local v13 = v_u_6()
	local v14 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.5, v13.Color.Content.Muted.Transparency),
		NumberSequenceKeypoint.new(1, v13.Color.Content.Muted.Transparency)
	})
	local v15 = ColorSequence.new({
		ColorSequenceKeypoint.new(0, v13.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.4999, v13.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.5, v13.Color.Content.Muted.Color3),
		ColorSequenceKeypoint.new(1, v13.Color.Content.Muted.Color3)
	})
	local v16 = v_u_3.createElement
	local v17 = v_u_5
	local v18 = v_u_7(v12, {
		["tag"] = "size-full-full",
		["ref"] = nil,
		["ref"] = p11
	})
	local v19 = {}
	local v20 = v_u_3.createElement
	local v21 = v_u_5
	local v22 = {
		["Size"] = nil,
		["tag"] = "position-top-left clip",
		["Size"] = UDim2.fromScale(0.5, 1)
	}
	local v23 = {}
	local v24 = v_u_3.createElement
	local v25 = v_u_4
	local v26 = {
		["Image"] = "rbxasset://textures/ui/Controls/RadialFill.png",
		["Size"] = nil,
		["tag"] = "position-top-left content-emphasis",
		["testId"] = nil,
		["Size"] = UDim2.fromScale(2, 1),
		["testId"] = ("%*--left-gradient"):format(v12.testId)
	}
	local v29 = {
		["Gradient"] = v_u_3.createElement("UIGradient", {
			["Transparency"] = v14,
			["Color"] = v15,
			["Rotation"] = v12.progress:map(function(p27)
				local v28 = p27 * 360
				return math.clamp(v28, 180, 360)
			end)
		})
	}
	v23.Image = v24(v25, v26, v29)
	v19.LeftGradient = v20(v21, v22, v23)
	local v30 = v_u_3.createElement
	local v31 = v_u_5
	local v32 = {
		["Size"] = nil,
		["tag"] = "position-top-center clip",
		["Size"] = UDim2.fromScale(0.5, 1)
	}
	local v33 = {}
	local v34 = v_u_3.createElement
	local v35 = v_u_4
	local v36 = {
		["Image"] = "rbxasset://textures/ui/Controls/RadialFill.png",
		["Size"] = nil,
		["Position"] = nil,
		["tag"] = "content-emphasis",
		["testId"] = nil,
		["Size"] = UDim2.fromScale(2, 1),
		["Position"] = UDim2.fromScale(-1, 0),
		["testId"] = ("%*--right-gradient"):format(v12.testId)
	}
	local v39 = {
		["Gradient"] = v_u_3.createElement("UIGradient", {
			["Transparency"] = v14,
			["Color"] = v15,
			["Rotation"] = v12.progress:map(function(p37)
				local v38 = p37 * 360
				return math.clamp(v38, 0, 180)
			end)
		})
	}
	v33.Image = v34(v35, v36, v39)
	v19.RightGradient = v30(v31, v32, v33)
	return v16(v17, v18, v19)
end))