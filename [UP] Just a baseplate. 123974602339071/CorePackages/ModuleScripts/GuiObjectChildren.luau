-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.GuiObjectChildren
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.AspectRatio)
local v_u_5 = require(v1.Components.CornerRadius)
local v_u_6 = require(v1.Components.Padding)
local v_u_7 = require(v1.Utility.getTestIdTag)
require(v1.Components.Types)
return function(p8) -- name: GuiObjectChildren
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6
	local v9 = p8.testId
	local v10 = {
		["Children"] = v_u_3.createElement(v_u_3.Fragment, {}, p8.children)
	}
	local v11
	if p8.aspectRatio == nil then
		v11 = nil
	else
		local v12 = v_u_3.createElement
		local v13 = v_u_4
		local v14 = {
			["value"] = p8.aspectRatio
		}
		local v15
		if v9 then
			v15 = ("%*--aspect-ratio"):format(v9)
		else
			v15 = nil
		end
		v14.testId = v15
		v11 = v12(v13, v14)
	end
	v10.AspectRatio = v11
	local v16
	if p8.cornerRadius == nil then
		v16 = nil
	else
		local v17 = v_u_3.createElement
		local v18 = v_u_5
		local v19 = {
			["value"] = p8.cornerRadius
		}
		local v20
		if v9 then
			v20 = ("%*--corner-radius"):format(v9)
		else
			v20 = nil
		end
		v19.testId = v20
		v16 = v17(v18, v19)
	end
	v10.CornerRadius = v16
	local v21
	if p8.flexItem == nil then
		v21 = nil
	else
		v21 = v_u_3.createElement("UIFlexItem", {
			["FlexMode"] = p8.flexItem.FlexMode,
			["GrowRatio"] = p8.flexItem.GrowRatio,
			["ShrinkRatio"] = p8.flexItem.ShrinkRatio,
			["ItemLineAlignment"] = p8.flexItem.ItemLineAlignment,
			[v_u_3.Tag] = v_u_7(v9, "flex-item")
		})
	end
	v10.FlexItem = v21
	local v22
	if p8.layout == nil or p8.layout.FillDirection == nil then
		v22 = nil
	else
		v22 = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = p8.layout.FillDirection,
			["ItemLineAlignment"] = p8.layout.ItemLineAlignment,
			["HorizontalAlignment"] = p8.layout.HorizontalAlignment,
			["HorizontalFlex"] = p8.layout.HorizontalFlex,
			["VerticalAlignment"] = p8.layout.VerticalAlignment,
			["VerticalFlex"] = p8.layout.VerticalFlex,
			["Padding"] = p8.layout.Padding,
			["SortOrder"] = p8.layout.SortOrder,
			["Wraps"] = p8.layout.Wraps,
			[v_u_3.Tag] = v_u_7(v9, "list-layout")
		})
	end
	v10.ListLayout = v22
	local v23
	if p8.sizeConstraint == nil then
		v23 = nil
	else
		v23 = v_u_3.createElement("UISizeConstraint", {
			["MaxSize"] = p8.sizeConstraint.MaxSize,
			["MinSize"] = p8.sizeConstraint.MinSize,
			[v_u_3.Tag] = v_u_7(v9, "size-constraint")
		})
	end
	v10.SizeConstraint = v23
	local v24
	if p8.padding == nil then
		v24 = nil
	else
		local v25 = v_u_3.createElement
		local v26 = v_u_6
		local v27 = {
			["value"] = p8.padding
		}
		local v28
		if v9 then
			v28 = ("%*--padding"):format(v9)
		else
			v28 = nil
		end
		v27.testId = v28
		v24 = v25(v26, v27)
	end
	v10.Padding = v24
	local v29
	if p8.scale == nil then
		v29 = nil
	else
		v29 = v_u_3.createElement("UIScale", {
			["Scale"] = p8.scale,
			[v_u_3.Tag] = v_u_7(v9, "scale")
		})
	end
	v10.Scale = v29
	local v30
	if p8.stroke == nil then
		v30 = nil
	else
		v30 = v_u_3.createElement("UIStroke", {
			["Color"] = p8.stroke.Color,
			["Thickness"] = p8.stroke.Thickness,
			["Transparency"] = p8.stroke.Transparency,
			["LineJoinMode"] = p8.stroke.LineJoinMode,
			["BorderStrokePosition"] = p8.stroke.BorderStrokePosition,
			[v_u_3.Tag] = v_u_7(v9, "stroke")
		})
	end
	v10.Stroke = v30
	return v10
end