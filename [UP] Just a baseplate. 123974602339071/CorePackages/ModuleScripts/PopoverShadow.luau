-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.PopoverShadow
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Constants)
local v_u_5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = v4.SHADOW_IMAGE
local v_u_10
if v_u_5.FoundationPopoverPluginOverlayMeasurement and v_u_5.FoundationPluginShadowSize then
	v_u_10 = v4.PLUGIN_SHADOW_SIZE
else
	v_u_10 = v4.SHADOW_SIZE
end
return function(p11) -- name: PopoverShadow
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9
	local v12 = v_u_8()
	if v_u_5.FoundationPopoverPluginOverlayMeasurement and v_u_5.FoundationPluginShadowSize then
		local v13 = v_u_3.createElement
		local v14 = v_u_7
		local v16 = {
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = nil,
			["Transparency"] = 1,
			["tag"] = nil,
			["testId"] = nil,
			["Size"] = p11.contentSize:map(function(p15)
				-- upvalues: (ref) v_u_10
				return p15 + UDim2.fromOffset(v_u_10, v_u_10)
			end),
			["Position"] = p11.position,
			["ZIndex"] = p11.ZIndex,
			["tag"] = {
				[p11.radiusTag] = true
			},
			["testId"] = p11.testId
		}
		return v13(v14, v16, v_u_3.createElement("UIShadow", {
			["Offset"] = nil,
			["Transparency"] = 0.92,
			["BlurRadius"] = nil,
			["Color"] = nil,
			["ZIndex"] = -1,
			["Spread"] = nil,
			["Offset"] = UDim2.fromOffset(0, 2),
			["BlurRadius"] = UDim.new(0, 4),
			["Color"] = v12.Color.Extended.Black.Black_100.Color3,
			["Spread"] = UDim2.fromOffset(-1, -1)
		}))
	else
		local v17 = v_u_3.createElement
		local v18 = v_u_6
		local v20 = {
			["AnchorPoint"] = p11.AnchorPoint,
			["Image"] = v_u_9,
			["Size"] = p11.contentSize:map(function(p19)
				-- upvalues: (ref) v_u_10
				return p19 + UDim2.fromOffset(v_u_10, v_u_10)
			end),
			["Position"] = p11.position,
			["ZIndex"] = p11.ZIndex,
			["slice"] = {
				["center"] = Rect.new(v_u_10, v_u_10, v_u_10 + 1, v_u_10 + 1)
			},
			["imageStyle"] = v12.Color.Extended.Black.Black_20,
			["testId"] = p11.testId
		}
		return v17(v18, v20)
	end
end