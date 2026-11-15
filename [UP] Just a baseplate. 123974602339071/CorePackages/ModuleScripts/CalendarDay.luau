-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.CalendarDay
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.StateLayerMode)
local v_u_5 = require(v1.Components.Text)
local v_u_6 = require(v1.Providers.Style.useTokens)
return function(p7) -- name: CalendarDay
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v8 = v_u_6()
	local v9
	if p7.isSelected then
		v9 = v8.Inverse.Content.Emphasis.Color3
	elseif p7.isSelectable and p7.emphasizeText then
		v9 = v8.Color.Content.Emphasis.Color3
	else
		v9 = v8.Color.Content.Muted.Color3
	end
	local v10 = (p7.isSelected or p7.isSelectable and p7.emphasizeText) and 0 or 0.5
	local v11 = v_u_3.createElement
	local v12 = v_u_5
	local v13 = {
		["textStyle"] = nil,
		["backgroundStyle"] = nil,
		["LayoutOrder"] = nil,
		["onActivated"] = nil,
		["RichText"] = nil,
		["stateLayer"] = nil,
		["Text"] = nil,
		["tag"] = "auto-xy text-title-small text-align-x-center text-align-y-center",
		["testId"] = nil,
		["textStyle"] = {
			["Color3"] = v9,
			["Transparency"] = v10
		}
	}
	local v14
	if p7.isSelected then
		v14 = v8.Color.System.Contrast
	elseif p7.highlight then
		v14 = v8.Color.ActionStandard.Background
	else
		v14 = nil
	end
	v13.backgroundStyle = v14
	v13.LayoutOrder = p7.LayoutOrder
	local v15
	if p7.isSelectable then
		v15 = p7.onActivated
	else
		v15 = nil
	end
	v13.onActivated = v15
	v13.RichText = not p7.isSelectable
	local v16 = {}
	local v17
	if p7.isSelected then
		v17 = v_u_4.Inverse
	else
		v17 = v_u_4.Default
	end
	v16.mode = v17
	v13.stateLayer = v16
	local v18
	if p7.isSelectable then
		v18 = p7.Text
	else
		v18 = ("<s>%*</s>"):format(p7.Text)
	end
	v13.Text = v18
	v13.testId = p7.testId
	return v11(v12, v13)
end