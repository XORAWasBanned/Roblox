-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.ModalBasedSelector
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.Foundation)
local v_u_4 = require(v2.Packages.React)
local v_u_5 = v3.Icon
local v_u_6 = v3.Text
local v_u_7 = v3.View
local v_u_8 = require(v1.Components.ModalBasedSelectorDialogController)
local v_u_9 = require(v1.Flags.FFlagHideShortcutsOnReportDropdown)
return function(p_u_10) -- name: ModalBasedSelector
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	local v_u_11
	if v_u_9 then
		v_u_11 = v_u_4.useCallback(function()
			-- upvalues: (copy) p_u_10
			p_u_10.onMenuOpenChange(true)
		end, { p_u_10.onMenuOpenChange })
	else
		v_u_11 = nil
	end
	local v_u_12 = v_u_4.useCallback(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) p_u_10
		v_u_8.unmountModalSelector()
		if v_u_9 then
			p_u_10.onMenuOpenChange(false)
		end
	end, { p_u_10.onMenuOpenChange })
	local v13 = v_u_4.createElement
	local v14 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, p_u_10.selectorHeight)
	}
	local v15 = {}
	local v16 = v_u_4.createElement
	local v17 = v_u_7
	local v18 = {
		["tag"] = "size-full stroke-thicker stroke-emphasis radius-medium",
		["onActivated"] = nil,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_8, (copy) p_u_10, (copy) v_u_12, (ref) v_u_11
			v_u_8.mountModalSelector(p_u_10.viewportHeight, p_u_10.viewportWidth, p_u_10.selections, p_u_10.onSelect, v_u_12, v_u_11)
		end
	}
	local v19 = {
		["Text"] = v_u_4.createElement(v_u_6, {
			["Text"] = nil,
			["tag"] = "size-full anchor-center-center position-center-center",
			["TextTruncate"] = nil,
			["Text"] = p_u_10.selectedValue or p_u_10.placeholderText,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		}),
		["Icon"] = v_u_4.createElement(v_u_5, {
			["name"] = "icons/actions/truncationExpand",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 0)
		})
	}
	v15.ControlButton = v16(v17, v18, v19)
	return v13("Frame", v14, v15)
end