-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.MenuItems.ReportMenuItem
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = game:GetService("TextService")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Workspace.Packages.Style).AppFonts
local v5 = require(v3.Packages.UIBlox)
local v_u_6 = require(v3.Packages.Cryo)
local v_u_7 = require(v3.Packages.React)
local v_u_8 = v5.Core.Style.useStyle
local v_u_9 = require(v1.Components.Constants)
local v_u_10 = require(v1.Components.getMenuItemDimensions)
return function(p_u_11) -- name: DropdownReportMenuItem
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6
	local v_u_12 = v_u_8()
	local v13 = (p_u_11.label == "" or p_u_11.isRightComponentFullWidth) and 0 or v_u_12.Tokens.Size.Size_150
	local v14 = v_u_12.Theme
	local v_u_15 = v_u_10(p_u_11.menuContainerWidth)
	local v16 = p_u_11.menuContainerWidth - v_u_9.MenuItemDynamicWidthOffset
	local v17 = v_u_15.LeftWidth + v_u_15.RightWidth
	local v_u_18 = math.max(v16, v17)
	local v19, v_u_20 = v_u_7.useState(v_u_12.Tokens.Size.Size_1000)
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_12, (ref) v_u_2, (copy) p_u_11, (copy) v_u_15, (ref) v_u_4, (copy) v_u_18
		local v21 = v_u_20
		local v22 = v_u_12.Tokens.Size.Size_1000
		local v23 = v_u_2
		local v24 = p_u_11.label
		local v25 = v_u_15.TextSize
		local v26 = v_u_4.default:getMedium()
		local v27 = Vector2.new
		local v28
		if p_u_11.isSmallPortraitViewport then
			v28 = v_u_18
		else
			v28 = v_u_15.LeftWidth
		end
		local v29 = v23:GetTextSize(v24, v25, v26, v27(v28, (1 / 0))).Y
		v21((math.max(v22, v29)))
	end, {})
	local v30 = {}
	local v31 = v_u_7.createElement
	local v32 = "UIListLayout"
	local v33 = {}
	local v34
	if p_u_11.isSmallPortraitViewport then
		v34 = Enum.FillDirection.Vertical
	else
		v34 = Enum.FillDirection.Horizontal
	end
	v33.FillDirection = v34
	v33.VerticalAlignment = Enum.VerticalAlignment.Center
	v33.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v33.SortOrder = Enum.SortOrder.LayoutOrder
	local v35
	if p_u_11.isSmallPortraitViewport then
		v35 = UDim.new(0, v13)
	else
		v35 = UDim.new(0, 0)
	end
	v33.Padding = v35
	v30.Layout = v31(v32, v33)
	v30.Padding = v_u_7.createElement("UIPadding", {
		["PaddingTop"] = UDim.new(0, v13),
		["PaddingBottom"] = UDim.new(0, v13)
	})
	local v36
	if p_u_11.isRightComponentFullWidth then
		local v37 = p_u_11.menuContainerWidth - v_u_9.MenuItemDynamicWidthOffset
		local v38 = v_u_15.LeftWidth + v_u_15.RightWidth
		local v39 = math.max(v37, v38)
		v36 = v_u_6.Dictionary.join(v30, {
			["RightComponentWrapper"] = v_u_7.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 3,
				["AutomaticSize"] = nil,
				["Size"] = UDim2.new(0, v39, 0, v_u_9.MenuItemHeight),
				["AutomaticSize"] = Enum.AutomaticSize.Y
			}, {
				["Layout"] = v_u_7.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center
				}),
				["RightComponent"] = p_u_11.rightComponent
			})
		})
	else
		local v40 = p_u_11.menuContainerWidth - v_u_15.LeftWidth - v_u_15.RightWidth - v_u_9.MenuItemDynamicWidthOffset
		local v41 = math.max(0, v40)
		local v42 = v_u_6.Dictionary.join
		local v43 = {}
		local v44
		if p_u_11.label == "" and p_u_11.isSmallPortraitViewport then
			v44 = nil
		else
			local v45 = v_u_7.createElement
			local v46 = "TextLabel"
			local v47 = {
				["Text"] = nil,
				["Font"] = nil,
				["LayoutOrder"] = 1,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextSize"] = nil,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = p_u_11.label,
				["Font"] = v_u_4.default:getMedium(),
				["TextColor3"] = v14.TextEmphasis.Color,
				["TextTransparency"] = v14.TextEmphasis.Transparency,
				["TextSize"] = v_u_15.TextSize,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			}
			local v48
			if p_u_11.isSmallPortraitViewport then
				v48 = UDim2.new(0, v_u_18, 0, 0)
			else
				v48 = UDim2.new(0, v_u_15.LeftWidth, 0, v19)
			end
			v47.Size = v48
			v47.AutomaticSize = Enum.AutomaticSize.Y
			v44 = v45(v46, v47)
		end
		v43.Label = v44
		local v49
		if p_u_11.isSmallPortraitViewport then
			v49 = nil
		else
			v49 = v_u_7.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(0, v41, 0, v_u_9.MenuItemHeight)
			})
		end
		v43.MiddleSpaceHolder = v49
		local v50 = v_u_7.createElement
		local v51 = "Frame"
		local v52 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3
		}
		local v53
		if p_u_11.isSmallPortraitViewport then
			v53 = UDim2.new(0, v_u_18, 0, 0)
		else
			v53 = UDim2.new(0, v_u_15.RightWidth, 0, v_u_9.MenuItemHeight)
		end
		v52.Size = v53
		v52.AutomaticSize = Enum.AutomaticSize.Y
		local v54 = {}
		local v55 = v_u_7.createElement
		local v56 = "UIListLayout"
		local v57 = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}
		local v58
		if p_u_11.isSmallPortraitViewport then
			v58 = Enum.HorizontalAlignment.Left
		else
			v58 = nil
		end
		v57.HorizontalAlignment = v58
		v54.Layout = v55(v56, v57)
		v54.RightComponent = p_u_11.rightComponent
		v43.RightComponentWrapper = v50(v51, v52, v54)
		v36 = v42(v30, v43)
	end
	if p_u_11.heightOverride then
		v19 = p_u_11.heightOverride
	end
	local v59 = v_u_7.createElement
	local v60 = "Frame"
	local v61 = {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v19)
	}
	local v62
	if p_u_11.isRightComponentFullWidth or p_u_11.isSmallPortraitViewport then
		v62 = Enum.AutomaticSize.Y
	else
		v62 = nil
	end
	v61.AutomaticSize = v62
	v61.LayoutOrder = p_u_11.layoutOrder
	return v59(v60, v61, v36)
end