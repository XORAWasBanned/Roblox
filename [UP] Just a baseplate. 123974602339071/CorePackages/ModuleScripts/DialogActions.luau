-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Actions.DialogActions
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.ButtonGroup)
require(v1.Enums.ButtonVariant)
local v_u_5 = require(v1.Enums.DialogSize)
local v_u_6 = require(v1.Enums.FillBehavior)
local v_u_7 = require(v1.Enums.Orientation)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local v_u_12 = require(script.Parent.Parent.useDialog)
local v_u_13 = {
	["orientation"] = v_u_7.Horizontal
}
return function(p14) -- name: DialogActions
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (copy) v_u_11, (copy) v_u_12, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8
	local v15 = v_u_10(p14, v_u_13)
	local v16 = v_u_11()
	local v17 = v_u_12()
	local v18 = v17.responsiveSize == v_u_5.Small
	if v15.orientation ~= v_u_7.Vertical then
		v18 = false
	end
	local v19 = v_u_3.createElement
	local v20 = v_u_9
	local v21 = {
		["tag"] = "col size-full-0 auto-y",
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["LayoutOrder"] = v15.LayoutOrder,
		["testId"] = ("%*--actions"):format(v17.testId)
	}
	local v22 = {}
	local v23 = v_u_3.createElement
	local v24 = v_u_4
	local v25 = {
		["buttons"] = nil,
		["orientation"] = nil,
		["fillBehavior"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["buttons"] = v15.actions or {}
	}
	local v26
	if v18 then
		v26 = v_u_7.Vertical
	else
		v26 = v_u_7.Horizontal
	end
	v25.orientation = v26
	v25.fillBehavior = v_u_6.Fill
	v25.testId = ("%*--actions-container"):format(v17.testId)
	v22.ActionsContainer = v23(v24, v25)
	local v27
	if v15.label then
		v27 = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v15.label,
			["tag"] = v16.actionsLabel.tag,
			["testId"] = ("%*--actions-label"):format(v17.testId)
		})
	else
		v27 = nil
	end
	v22.ActionsLabel = v27
	return v19(v20, v21, v22)
end