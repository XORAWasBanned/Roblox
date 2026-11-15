-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.GradientBackdrop
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Cryo)
local v4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = v4.View
local v_u_7 = require(v1.Utils.getEasingNumberSequence)
local v_u_8 = v_u_5.useMemo
local v_u_9 = {
	["anchorPoint"] = nil,
	["endingTransparency"] = 1,
	["position"] = nil,
	["startingTransparency"] = 0.4,
	["anchorPoint"] = Vector2.new(0, 0),
	["position"] = UDim2.fromScale(0, 0)
}
return function(p10)
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v_u_11 = v_u_3.Dictionary.union(v_u_9, p10)
	local v12 = v_u_8(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_11
		return NumberSequence.new(v_u_7(v_u_11.startingTransparency, v_u_11.endingTransparency, 15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
	end, { v_u_11.startingTransparency, v_u_11.endingTransparency })
	local v13 = v_u_5.createElement
	local v14 = v_u_6
	local v15 = {
		["AnchorPoint"] = nil,
		["tag"] = "bg-contrast",
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = nil,
		["AnchorPoint"] = v_u_11.anchorPoint,
		["Position"] = v_u_11.position,
		["Size"] = v_u_11.size,
		["ZIndex"] = v_u_11.zIndex or 1
	}
	local v16 = {
		["UIGradient"] = v_u_5.createElement("UIGradient", {
			["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v_u_11.color3), ColorSequenceKeypoint.new(1, v_u_11.color3) }),
			["Rotation"] = v_u_11.rotation,
			["Transparency"] = v12
		})
	}
	return v13(v14, v15, v16)
end