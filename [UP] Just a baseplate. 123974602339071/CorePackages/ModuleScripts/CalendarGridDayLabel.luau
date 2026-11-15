-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.CalendarGridDayLabel
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v_u_5 = require(v1.Enums.ControlState)
local v_u_6 = require(v1.Enums.StateLayerMode)
local v_u_7 = require(v1.Components.Text)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Providers.Style.useTokens)
return function(p_u_10) -- name: CalendarGridDayLabel
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8
	local v11 = v_u_9()
	local v12
	if p_u_10.isSelected then
		v12 = v11.Inverse.Content.Emphasis.Color3
	elseif p_u_10.isSelectable and p_u_10.emphasizeText then
		v12 = v11.Color.Content.Emphasis.Color3
	else
		v12 = v11.Color.Content.Muted.Color3
	end
	local v13 = (p_u_10.isSelected or p_u_10.isSelectable and p_u_10.emphasizeText) and 0 or v_u_4.DISABLED_TRANSPARENCY
	local v14
	if p_u_10.highlight == true then
		v14 = not p_u_10.isSelected
	else
		v14 = false
	end
	local v15 = p_u_10.bandRadiusTag
	local v16 = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not v14
	}
	if v14 and (v15 and v15 ~= "") then
		v16[v15] = true
	end
	local v18 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_10, (ref) v_u_5
		return p_u_10.onHoverEnter ~= nil and function(p17)
			-- upvalues: (ref) v_u_5, (ref) p_u_10
			if p17 == v_u_5.Hover then
				p_u_10.onHoverEnter()
			end
		end or nil
	end, { p_u_10.onHoverEnter })
	local v19 = v_u_3.createElement
	local v20 = v_u_7
	local v21 = {}
	local v22
	if p_u_10.isSelected then
		v22 = v11.Color.System.Contrast
	elseif p_u_10.highlight then
		v22 = v11.Color.ActionStandard.Background
	else
		v22 = nil
	end
	v21.backgroundStyle = v22
	local v23
	if p_u_10.isSelectable then
		v23 = p_u_10.onActivated
	else
		v23 = nil
	end
	v21.onActivated = v23
	if not p_u_10.isSelectable then
		v18 = nil
	end
	v21.onStateChanged = v18
	v21.RichText = not p_u_10.isSelectable
	local v24 = {}
	local v25
	if p_u_10.isSelected then
		v25 = v_u_6.Inverse
	else
		v25 = v_u_6.Default
	end
	v24.mode = v25
	v21.stateLayer = v24
	v21.tag = v16
	v21.testId = p_u_10.testId
	local v26
	if p_u_10.isSelectable then
		v26 = p_u_10.label
	else
		v26 = ("<s>%*</s>"):format(p_u_10.label)
	end
	v21.Text = v26
	v21.textStyle = {
		["Color3"] = v12,
		["Transparency"] = v13
	}
	local v27 = v19(v20, v21)
	local v28 = v_u_3.createElement
	local v29 = v_u_8
	local v30 = {
		["LayoutOrder"] = nil,
		["tag"] = "size-full",
		["LayoutOrder"] = p_u_10.LayoutOrder
	}
	local v31 = {}
	local v32
	if p_u_10.bandPosition and p_u_10.bandSize then
		local v33 = v_u_3.createElement
		local v34 = v_u_8
		local v35 = {
			["backgroundStyle"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["tag"] = nil,
			["ZIndex"] = 0,
			["backgroundStyle"] = v11.Color.ActionStandard.Background,
			["Position"] = p_u_10.bandPosition,
			["Size"] = p_u_10.bandSize
		}
		local v36
		if p_u_10.bandRadiusTag and p_u_10.bandRadiusTag ~= "" then
			v36 = p_u_10.bandRadiusTag
		else
			v36 = nil
		end
		v35.tag = v36
		v32 = v33(v34, v35)
	else
		v32 = nil
	end
	v31.Band = v32
	v31.Day = v27
	return v28(v29, v30, v31)
end