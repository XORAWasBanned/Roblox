-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PaddedScrollFrame
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v_u_5 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Resources.Assets)
local v_u_8 = require(v6.GlobalConfig)
local v_u_9 = v4.strictInterface({
	["Size"] = v4.optional(v4.UDim2),
	["AnchorPoint"] = v4.optional(v4.UDim2),
	["CanvasSize"] = v4.optional(v4.UDim2),
	["Position"] = v4.optional(v4.UDim2),
	[v_u_3.Children] = v4.optional(v4.table)
})
return function(p_u_10) -- name: PaddedScrollFrame
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7
	if v_u_8.propValidation then
		local v11 = v_u_9
		assert(v11(p_u_10))
	end
	return v_u_5(function(p12)
		local v13 = {}
		local v14 = {
			["UIEmphasis"] = {
				["Color"] = p12.Color.Shift.Shift_400.Color3,
				["Transparency"] = p12.Color.Shift.Shift_400.Transparency
			}
		}
		v13.Theme = v14
		return v13
	end, function(p15)
		-- upvalues: (ref) v_u_3, (ref) v_u_7, (copy) p_u_10
		return v_u_3.createElement("ScrollingFrame", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ScrollBarImageColor3"] = nil,
			["ScrollBarImageTransparency"] = nil,
			["BottomImage"] = nil,
			["MidImage"] = nil,
			["TopImage"] = nil,
			["ClipsDescendants"] = false,
			["ScrollBarThickness"] = 12,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["CanvasSize"] = nil,
			["Position"] = nil,
			["ScrollBarImageColor3"] = p15.Theme.UIEmphasis.Color,
			["ScrollBarImageTransparency"] = p15.Theme.UIEmphasis.Transparency,
			["BottomImage"] = v_u_7.Images.ScrollBottom,
			["MidImage"] = v_u_7.Images.ScrollMid,
			["TopImage"] = v_u_7.Images.ScrollTop,
			["Size"] = p_u_10.Size,
			["AnchorPoint"] = p_u_10.AnchorPoint,
			["CanvasSize"] = p_u_10.CanvasSize,
			["Position"] = p_u_10.Position
		}, p_u_10[v_u_3.Children])
	end)
end