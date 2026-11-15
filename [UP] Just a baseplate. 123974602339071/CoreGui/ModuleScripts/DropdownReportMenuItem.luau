-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.MenuItems.DropdownReportMenuItem
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.UIBlox)
local v_u_4 = require(v2.Packages.React)
local v_u_5 = require(v2.Workspace.Packages.Style).AppFonts
local v_u_6 = v3.App.Menu.DropdownMenu
local v_u_7 = require(v1.Components.MenuItems.ReportMenuItem)
local v_u_8 = v3.Core.Style.useStyle
local v_u_9 = require(v1.Utility.getMenuItemSizings)
local v_u_10 = require(v1.Flags.FFlagHideShortcutsOnReportDropdown)
local v_u_11 = require(v2.Packages.Cryo)
return function(p12) -- name: DropdownReportMenuItem
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7
	local v13 = v_u_8().Theme
	local v14 = v_u_9()
	local v15
	if p12.readonlyValue == nil then
		local v16 = v_u_4.createElement
		local v17 = v_u_6
		local v19 = {
			["placeholder"] = nil,
			["onChange"] = nil,
			["height"] = nil,
			["screenSize"] = nil,
			["errorState"] = false,
			["showDropShadow"] = true,
			["fixedListHeight"] = 180,
			["cellDatas"] = nil,
			["onMenuOpenChange"] = nil,
			["placeholder"] = p12.placeholderText,
			["onChange"] = p12.onSelect,
			["height"] = UDim.new(0, 48),
			["screenSize"] = Vector2.new(2400, 1800),
			["cellDatas"] = v_u_11.List.map(p12.selections, function(p18)
				return {
					["text"] = p18
				}
			end)
		}
		local v20
		if v_u_10 then
			v20 = p12.onMenuOpenChange
		else
			v20 = nil
		end
		v19.onMenuOpenChange = v20
		v15 = v16(v17, v19)
	else
		local v21 = v_u_4.createElement
		local v22 = "TextLabel"
		local v23 = {
			["Text"] = nil,
			["Font"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = p12.readonlyValue,
			["Font"] = v_u_5.default:getMedium(),
			["TextColor3"] = v13.TextEmphasis.Color,
			["TextTransparency"] = v13.TextMuted.Transparency,
			["TextSize"] = v14.DropdownTextSize
		}
		local v24
		if p12.isSmallPortraitViewport then
			v24 = Enum.TextXAlignment.Left
		else
			v24 = Enum.TextXAlignment.Center
		end
		v23.TextXAlignment = v24
		v23.AutomaticSize = Enum.AutomaticSize.Y
		v23.Size = UDim2.new(1, 0, 0, p12.minHeight)
		v15 = v21(v22, v23)
	end
	return v_u_4.createElement(v_u_7, {
		["label"] = p12.label,
		["layoutOrder"] = p12.layoutOrder,
		["rightComponent"] = v15,
		["menuContainerWidth"] = p12.menuContainerWidth,
		["isSmallPortraitViewport"] = p12.isSmallPortraitViewport
	})
end