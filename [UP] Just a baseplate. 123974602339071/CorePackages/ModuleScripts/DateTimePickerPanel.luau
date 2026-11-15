-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.DateTimePickerPanel
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Utilities.DateTimeCalendarConstants)
local v_u_5 = require(script.Parent.Utilities.DateTimeLayoutUtilities)
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v1.Enums.ButtonVariant)
local v_u_8 = require(v1.Components.Divider)
local v_u_9 = require(v1.Utility.Localization.Translator)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.useScaledValue)
local v_u_12 = require(v1.Providers.Style.useTokens)
return function(p13) -- name: DateTimePickerPanel
	-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8
	local v14 = v_u_12()
	local v15 = v_u_11(v_u_5.PANE_WIDTH)
	local v16 = v_u_11(v_u_5.CALENDAR_WIDTH)
	local v17 = v_u_11(v_u_5.TIME_LIST_WIDTH)
	local v18 = v_u_3.createElement(v_u_6, {
		["isDisabled"] = nil,
		["LayoutOrder"] = 2,
		["onActivated"] = nil,
		["testId"] = nil,
		["text"] = nil,
		["variant"] = nil,
		["isDisabled"] = p13.isApplyButtonDisabled,
		["onActivated"] = p13.onApply,
		["testId"] = ("%*--apply-button"):format(p13.testId),
		["text"] = v_u_9:FormatByKey("CommonUI.Controls.Action.Apply"),
		["variant"] = v_u_7.Emphasis
	})
	local v19 = v_u_3.createElement(v_u_6, {
		["LayoutOrder"] = 3,
		["onActivated"] = nil,
		["testId"] = nil,
		["text"] = nil,
		["variant"] = nil,
		["onActivated"] = p13.onCancel,
		["testId"] = ("%*--cancel-button"):format(p13.testId),
		["text"] = v_u_9:FormatByKey("CommonUI.Controls.Action.Cancel"),
		["variant"] = v_u_7.Standard
	})
	local v20 = p13.isSectioned and "padding-x-large padding-y-large" or "padding-top-large"
	local v21
	if p13.showReset and p13.onReset then
		v21 = v_u_3.createElement(v_u_10, {
			["LayoutOrder"] = 3,
			["tag"] = nil,
			["tag"] = ("row align-y-center gap-small size-full-0 auto-y %*"):format(v20)
		}, {
			["ResetButton"] = v_u_3.createElement(v_u_6, {
				["isDisabled"] = nil,
				["LayoutOrder"] = 1,
				["onActivated"] = nil,
				["testId"] = nil,
				["text"] = nil,
				["variant"] = nil,
				["isDisabled"] = p13.isResetButtonDisabled,
				["onActivated"] = p13.onReset,
				["testId"] = ("%*--reset-button"):format(p13.testId),
				["text"] = v_u_9:FormatByKey("CommonUI.Controls.Action.ResetAll"),
				["variant"] = v_u_7.Utility
			}),
			["PrimaryActions"] = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = 2,
				["tag"] = "row align-x-right grow gap-small auto-y"
			}, {
				["ApplyButton"] = v18,
				["CancelButton"] = v19
			})
		})
	else
		v21 = v_u_3.createElement(v_u_10, {
			["LayoutOrder"] = 3,
			["tag"] = nil,
			["tag"] = ("row flex-fill gap-small size-full-0 auto-y %*"):format(v20)
		}, {
			["ApplyButton"] = v18,
			["CancelButton"] = v19
		})
	end
	local v22 = 2 * v15 + 3 * v14.Padding.Large
	local v23 = v_u_5.computeSingleWithTimeLayout(v16, v17, v14, v_u_4.NUM_CALENDAR_GRID_ROWS).contentWidth
	if p13.sectionedLayout == "dual" then
		v23 = v22
	elseif p13.sectionedLayout ~= "singleWithTime" then
		v23 = nil
	end
	local v24 = p13.isSectioned == true
	local v25
	if v24 then
		v25 = p13.sectionedLayout ~= nil
	else
		v25 = v24
	end
	local v26 = v_u_3.createElement
	local v27 = v_u_10
	local v28 = {}
	local v29
	if v23 then
		v29 = UDim2.fromOffset(v23, 0)
	else
		v29 = nil
	end
	v28.Size = v29
	v28.tag = {
		["col"] = true,
		["bg-surface-200"] = true,
		["stroke-default"] = true,
		["radius-large"] = true,
		["auto-y"] = v25,
		["auto-xy"] = not v25,
		["clip"] = v24,
		["padding-large"] = not v24
	}
	local v30 = {
		["Content"] = p13.children
	}
	local v31
	if p13.isSectioned then
		v31 = v_u_3.createElement(v_u_8, {
			["LayoutOrder"] = 2
		})
	else
		v31 = nil
	end
	v30.ActionsDivider = v31
	v30.Actions = v21
	return v26(v27, v28, v30)
end