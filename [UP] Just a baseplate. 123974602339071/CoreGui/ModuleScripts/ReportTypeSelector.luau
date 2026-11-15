-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.ReportTypeSelector
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.Style).AppFonts
local v4 = require(v2.Packages.UIBlox)
local v_u_5 = require(v2.Packages.React)
local v_u_6 = v4.App.ImageSet.Images
local v_u_7 = v4.Core.Style.useStyle
local v_u_8 = require(v1.Components.Constants)
local v_u_9 = require(v1.Components.getMenuItemDimensions)
local v_u_10 = require(v1.Utility.getMenuItemSizings)
local v_u_11 = v4.App.Button.TextButton
local v_u_12 = v4.App.Button.IconButton
local v_u_13 = v4.App.ImageSet.Enum.IconSize
return function(p14)
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_12, (copy) v_u_13, (copy) v_u_6, (copy) v_u_11
	local v15 = v_u_7().Tokens.Size.Size_200
	local v16 = v_u_9(p14.menuWidth)
	local v17 = v_u_10()
	local v18 = v_u_8.MenuItemHeightTight
	local v19 = p14.menuWidth - v_u_8.MenuItemDynamicWidthOffset
	local v20 = v16.LeftWidth + v16.RightWidth
	local v21 = math.max(v19, v20)
	local v22 = p14.isSmallPortraitViewport
	local v23 = v_u_5.createElement
	local v24 = "Frame"
	local v25 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v26 = {}
	local v27 = v_u_5.createElement
	local v28 = "UIListLayout"
	local v29 = {}
	local v30
	if v22 then
		v30 = Enum.FillDirection.Vertical
	else
		v30 = Enum.FillDirection.Horizontal
	end
	v29.FillDirection = v30
	v29.SortOrder = Enum.SortOrder.LayoutOrder
	v29.HorizontalAlignment = Enum.HorizontalAlignment.Center
	local v31
	if v22 then
		v31 = UDim.new(0, v15)
	else
		v31 = UDim.new(0, 0)
	end
	v29.Padding = v31
	v26.Layout = v27(v28, v29)
	local v32 = v_u_5.createElement
	local v33 = "TextLabel"
	local v34 = {
		["Text"] = nil,
		["Font"] = nil,
		["LayoutOrder"] = 1,
		["TextColor3"] = nil,
		["TextTransparency"] = 0,
		["TextSize"] = nil,
		["AutomaticSize"] = nil,
		["TextWrapped"] = true,
		["TextXAlignment"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = p14.label,
		["Font"] = v_u_3.default:getMedium(),
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextSize"] = v16.TextSize,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	}
	local v35
	if v22 then
		v35 = UDim2.fromOffset(v21, 0)
	else
		v35 = UDim2.new(0, v16.LeftWidth, 0, v_u_8.MenuItemHeight)
	end
	v34.Size = v35
	v26.Label = v32(v33, v34)
	local v36
	if v22 then
		v36 = nil
	else
		local v37 = v_u_5.createElement
		local v38 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2
		}
		local v39 = UDim2.new
		local v40 = p14.menuWidth - v16.LeftWidth - v16.RightWidth - 100
		v38.Size = v39(0, math.max(0, v40), 0, v_u_8.MenuItemHeight)
		v36 = v37("Frame", v38)
	end
	v26.MiddleWidthHolder = v36
	local v41 = v_u_5.createElement
	local v42 = "Frame"
	local v43 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3
	}
	local v44
	if v22 then
		v44 = UDim2.fromOffset(v21, v18)
	else
		v44 = UDim2.new(0, v16.RightWidth, 1, 0)
	end
	v43.Size = v44
	local v45 = {}
	local v46 = v_u_5.createElement
	local v47 = "UIListLayout"
	local v48 = {
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	}
	local v49
	if v22 then
		v49 = Enum.HorizontalAlignment.Left
	else
		v49 = Enum.HorizontalAlignment.Center
	end
	v48.HorizontalAlignment = v49
	v48.VerticalAlignment = Enum.VerticalAlignment.Center
	v45.Layout = v46(v47, v48)
	local v50
	if p14.isSelectionDisabled then
		v50 = nil
	else
		v50 = v_u_5.createElement(v_u_12, {
			["size"] = nil,
			["iconSize"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 1,
			["size"] = UDim2.fromOffset(32, 32),
			["iconSize"] = v_u_13.Medium,
			["icon"] = v_u_6["icons/actions/cycleLeft"],
			["onActivated"] = p14.onClickLeft
		})
	end
	v45.LeftChevron = v50
	v45.ButtonContainer = v_u_5.createElement("Frame", {
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["Size"] = UDim2.new(0, v16.RightWidth - 64, 0, 0)
	}, {
		["ToggleButton"] = v_u_5.createElement(v_u_11, {
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 2,
			["isDisabled"] = nil,
			["fontStyle"] = nil,
			["verticalPadding"] = nil,
			["size"] = UDim2.new(1, 0, 1, 0),
			["text"] = p14.abuseType,
			["onActivated"] = p14.onClickRight,
			["isDisabled"] = p14.isSelectionDisabled,
			["fontStyle"] = v17.FontStyle,
			["verticalPadding"] = v17.ButtonInsideVerticalPadding
		})
	})
	local v51
	if p14.isSelectionDisabled then
		v51 = nil
	else
		v51 = v_u_5.createElement(v_u_12, {
			["size"] = nil,
			["iconSize"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 3,
			["size"] = UDim2.fromOffset(32, 32),
			["iconSize"] = v_u_13.Medium,
			["icon"] = v_u_6["icons/actions/cycleRight"],
			["onActivated"] = p14.onClickRight
		})
	end
	v45.RightChevron = v51
	v26.Container = v41(v42, v43, v45)
	return v23(v24, v25, v26)
end