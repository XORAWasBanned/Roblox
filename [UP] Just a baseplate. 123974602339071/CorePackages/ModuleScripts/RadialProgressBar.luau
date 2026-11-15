-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.RadialProgressBar
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.Foundation)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Image
local v_u_6 = v3.View
local v_u_7 = v3.Hooks.useTokens
local v_u_8 = require(v1.Constants)
return function(p9) -- name: RadialProgressBar
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_8
	local v10 = v_u_7()
	local v11 = v10.Color.ActionSubtle.Background
	local v12 = v10.Color.ActionSubtle.Foreground
	local v13 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, v12.Transparency),
		NumberSequenceKeypoint.new(0.4999, v12.Transparency),
		NumberSequenceKeypoint.new(0.5, v11.Transparency),
		NumberSequenceKeypoint.new(1, v11.Transparency)
	})
	local v14 = ColorSequence.new({
		ColorSequenceKeypoint.new(0, v12.Color3),
		ColorSequenceKeypoint.new(0.4999, v12.Color3),
		ColorSequenceKeypoint.new(0.5, v11.Color3),
		ColorSequenceKeypoint.new(1, v11.Color3)
	})
	local v15 = v_u_4.createElement
	local v16 = v_u_6
	local v17 = {}
	local v18 = v_u_4.createElement
	local v19 = v_u_6
	local v20 = {
		["Size"] = nil,
		["tag"] = "clip",
		["Size"] = UDim2.fromScale(0.5, 1)
	}
	local v21 = {}
	local v22 = v_u_4.createElement
	local v23 = v_u_5
	local v24 = {
		["Image"] = v_u_8.RadialFillImage,
		["Size"] = UDim2.fromScale(2, 1)
	}
	local v27 = {
		["Gradient"] = v_u_4.createElement("UIGradient", {
			["Transparency"] = v13,
			["Color"] = v14,
			["Rotation"] = p9.progress:map(function(p25)
				local v26 = p25 * 360
				return math.clamp(v26, 180, 360)
			end)
		})
	}
	v21.Image = v22(v23, v24, v27)
	v17.LeftGradient = v18(v19, v20, v21)
	local v28 = v_u_4.createElement
	local v29 = v_u_6
	local v30 = {
		["Size"] = nil,
		["tag"] = "clip position-top-center",
		["Size"] = UDim2.fromScale(0.5, 1)
	}
	local v31 = {}
	local v32 = v_u_4.createElement
	local v33 = v_u_5
	local v34 = {
		["Image"] = v_u_8.RadialFillImage,
		["Size"] = UDim2.fromScale(2, 1),
		["Position"] = UDim2.fromScale(-1, 0)
	}
	local v37 = {
		["Gradient"] = v_u_4.createElement("UIGradient", {
			["Transparency"] = v13,
			["Color"] = v14,
			["Rotation"] = p9.progress:map(function(p35)
				local v36 = p35 * 360
				return math.clamp(v36, 0, 180)
			end)
		})
	}
	v31.Image = v32(v33, v34, v37)
	v17.RightGradient = v28(v29, v30, v31)
	return v15(v16, {
		["BackgroundTransparency"] = 1,
		["tag"] = "anchor-center-center position-center-center size-full"
	}, v17)
end