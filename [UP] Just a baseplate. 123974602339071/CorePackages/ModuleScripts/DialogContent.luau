-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Content.DialogContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.ScrollView)
require(v1.Components.Types)
local v_u_5 = require(v1.Enums.Visibility)
local v_u_6 = require(v1.Utility.withCommonProps)
local v_u_7 = require(script.Parent.useScrollBarPadding)
local v_u_8 = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local v_u_9 = require(script.Parent.Parent.useDialog)
return function(p10) -- name: DialogContent
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v11, v12, v13 = v_u_7()
	local v14 = v_u_8()
	p10.testId = ("%*--content"):format(v_u_9().testId)
	local v15 = (p10.Selectable == nil and true or p10.Selectable) and v11
	local v16 = v_u_3.createElement
	local v17 = v_u_4
	local v18 = v_u_6
	local v19 = {}
	local v20 = {
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
		["CanvasSize"] = UDim2.new(0, 0, 0, 0)
	}
	local v21
	if v11 then
		v21 = v_u_5.Auto
	else
		v21 = v_u_5.None
	end
	v20.scrollBarVisibility = v21
	v19.scroll = v20
	v19.layout = {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalFlex"] = Enum.UIFlexAlignment.Fill,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	}
	v19.selection = {
		["Selectable"] = v15,
		["NextSelectionUp"] = p10.NextSelectionUp,
		["NextSelectionDown"] = p10.NextSelectionDown,
		["NextSelectionLeft"] = p10.NextSelectionLeft,
		["NextSelectionRight"] = p10.NextSelectionRight
	}
	v19.onAbsoluteCanvasSizeChanged = v13
	v19.onAbsoluteWindowSizeChanged = v13
	v19.tag = v14.content.tag
	return v16(v17, v18(p10, v19), {
		["ScrollPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingRight"] = v12:map(function(p22)
				return UDim.new(0, p22)
			end)
		}),
		["ScrollContent"] = v_u_3.createElement(v_u_3.Fragment, nil, p10.children)
	})
end