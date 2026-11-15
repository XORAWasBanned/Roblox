-- Path: CoreGui.RobloxGui.Modules.Settings.Theme
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v4 = require(v1.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v5 = require(v3.Modules.TenFootInterface):IsEnabled()
if v5 then
	v5 = not v4
end
local v6 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_7 = require(v1.Workspace.Packages.Style).Themes.DarkTheme
local v8 = require(v1.Packages.UIBlox)
local v9 = v8.App.ImageSet.Images
local v10 = v8.App.ImageSet.getIconSize
local v11 = v8.App.ImageSet.Enum.IconSize
local v_u_12 = require(v1.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local v13 = game:DefineFastFlag("IncreaseUtilityRowTextSizeConsole", false)
local v_u_14 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_15 = require(v3.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local v_u_16 = require(v3.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local v_u_17 = {
	[Enum.FontSize.Size14] = Enum.FontSize.Size11,
	[Enum.FontSize.Size18] = Enum.FontSize.Size14,
	[Enum.FontSize.Size24] = Enum.FontSize.Size18,
	[Enum.FontSize.Size36] = Enum.FontSize.Size28,
	[Enum.FontSize.Size48] = Enum.FontSize.Size36
}
local v_u_18 = Color3.fromRGB(0, 0, 0)
local v_u_19 = v6.default:getDefault()
local v_u_20 = v_u_17[Enum.FontSize.Size24]
local v_u_21 = {
	["MenuContainer"] = {
		["Color"] = nil,
		["Transparency"] = 0.2,
		["Color"] = Color3.new(0, 0, 0)
	},
	["IGM_TabSelection"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.new(1, 1, 1)
	},
	["White"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.new(1, 1, 1)
	},
	["IGM_Background"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = Color3.fromRGB(0, 0, 0)
	},
	["IGM_Button"] = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = Color3.fromRGB(0, 0, 0)
	},
	["IGM_ButtonNonInteractable"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.fromRGB(100, 100, 100)
	},
	["IGM_ButtonHover"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.fromRGB(56, 57, 59)
	},
	["IGM_Stroke"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.new(0.776, 0.776, 0.776)
	},
	["IGM_Selected"] = {
		["Color"] = nil,
		["Transparency"] = 0,
		["Color"] = Color3.fromRGB(217, 217, 217)
	},
	["Player_RowSelection"] = {
		["Color"] = nil,
		["Transparency"] = 0.9,
		["Color"] = Color3.new(0.396, 0.4, 0.408)
	}
}
local v_u_22 = {
	["Confirmation_Font"] = {
		["Font"] = nil,
		["RelativeSize"] = nil,
		["TextSize"] = 28.584000000000003,
		["Font"] = v6.default:getBold(),
		["RelativeSize"] = v_u_17[Enum.FontSize.Size36]
	},
	["Button_Font"] = {
		["Font"] = nil,
		["RelativeSize"] = nil,
		["TextSize"] = 17.468,
		["Font"] = v6.default:getMedium(),
		["RelativeSize"] = v_u_17[Enum.FontSize.Size24]
	}
}
local v23 = {}
local v24
if v5 then
	v24 = v_u_17[Enum.FontSize.Size24]
else
	v24 = v_u_17[Enum.FontSize.Size18]
end
v23.RelativeSize = v24
v_u_22.Username = v23
local v25 = {}
local v26
if v5 then
	v26 = Enum.FontSize.Size24
else
	v26 = Enum.FontSize.Size18
end
v25.RelativeSize = v26
v25.Font = v6.default:getMedium()
v_u_22.DisplayName = v25
v_u_22.Settings_Font = {
	["Font"] = v6.default:getDefault()
}
v_u_22.Help_Title_Font = {
	["Font"] = v6.default:getMedium(),
	["RelativeSize"] = v_u_17[Enum.FontSize.Size18]
}
v_u_22.Help_Text_Font = {
	["Font"] = nil,
	["RelativeSize"] = nil,
	["TextSize"] = 14.292000000000002,
	["Font"] = v6.default:getDefault(),
	["RelativeSize"] = v_u_17[Enum.FontSize.Size18]
}
v_u_22.Help_Gamepad_Font = {
	["Font"] = v6.default:getMedium()
}
v_u_22.Help_Touch_Font = {
	["Font"] = v6.default:getBold(),
	["RelativeSize"] = v_u_17[Enum.FontSize.Size14]
}
v_u_22.Game_Settings_Font = {
	["Font"] = v6.default:getDefault(),
	["RelativeSize"] = v_u_17[Enum.FontSize.Size24]
}
v_u_22.Conversation_Details_Font = {
	["Font"] = nil,
	["TextSize"] = 12.704,
	["Font"] = v6.default:getDefault()
}
v_u_22.Utility_Text_Font = {
	["Font"] = nil,
	["TextSize"] = 17.468,
	["Font"] = v6.default:getDefault()
}
v_u_22.Utility_Text_Small_Font = {
	["Font"] = nil,
	["TextSize"] = 12.704,
	["Font"] = v6.default:getDefault()
}
v_u_22.Utility_Row_Small_Font = {
	["Font"] = nil,
	["TextSize"] = 12.704,
	["Font"] = v6.default:getDefault()
}
v_u_22.Utility_Row_Font = {
	["Font"] = v6.default:getMedium(),
	["TextSize"] = v13 and v5 and 19.056 or 12.704
}
v_u_22.Back_Button_Font = {
	["Font"] = nil,
	["TextSize"] = 19.056,
	["Font"] = v6.default:getSemibold()
}
v_u_22.Semibold_Font = {
	["Font"] = v6.default:getSemibold()
}
v_u_22.Bold_Font = {
	["Font"] = v6.default:getMedium()
}
setmetatable(v_u_21, {
	["__index"] = function(_, p27) -- name: __index
		-- upvalues: (copy) v_u_7
		return v_u_7[p27]
	end
})
local v_u_28 = {
	["SETTINGS_SHIELD"] = "IGM_Background",
	["SETTINGS_SHIELD_TRANSPARENCY"] = "IGM_Background",
	["SELECTION_TEXT_COLOR_NORMAL"] = "White",
	["SELECTION_TEXT_COLOR_HIGHLIGHTED"] = "White",
	["HubBarContainer"] = "IGM_Background",
	["HubBarContainerTransparency"] = "IGM_Background",
	["HubBarContainerHover"] = "IGM_Background",
	["DarkenBackground"] = "Overlay",
	["PlayerRowFrame"] = "BackgroundDefault",
	["PlayerRowSelection"] = "Player_RowSelection",
	["TabSelection"] = "IGM_TabSelection",
	["DefaultButton"] = "IGM_Button",
	["DefaultButtonHover"] = "IGM_ButtonHover",
	["DefaultButtonStroke"] = "SecondaryDefault",
	["WhiteButtonText"] = "SecondaryContent",
	["MenuContainer"] = "BackgroundUIContrast",
	["ControlInputText"] = "SystemPrimaryDefault",
	["ControlInputStroke"] = "Divider",
	["ControlInputBackground"] = "BackgroundDefault",
	["ControlInputFocusedStroke"] = "IGM_TabSelection",
	["InputActionBackground"] = "BackgroundUIDefault",
	["IconButton"] = "UIDefault",
	["IconButtonHover"] = "BackgroundOnHover",
	["ImageButton"] = "Divider",
	["RowFrameBackground"] = "BackgroundDefault",
	["DropdownListBg"] = "BackgroundUIDefault",
	["DropdownListFocusBg"] = "UIDefault",
	["SELECTED_COLOR"] = "IGM_Selected",
	["NON_SELECTED_COLOR"] = "BackgroundUIDefault",
	["NotInteractableSelection"] = "UIEmphasis",
	["Confirmation"] = "Confirmation_Font",
	["Button"] = "Button_Font",
	["SettingsHub"] = "Settings_Font",
	["HelpTitle"] = "Help_Title_Font",
	["HelpText"] = "Help_Text_Font",
	["HelpGamepad"] = "Help_Gamepad_Font",
	["HelpTouch"] = "Help_Touch_Font",
	["GameSettings"] = "Game_Settings_Font",
	["ConversationDetails"] = "Conversation_Details_Font",
	["UtilityText"] = "Utility_Text_Font",
	["UtilityRow"] = "Utility_Row_Font",
	["UtilityRowSmall"] = "Utility_Row_Small_Font",
	["UtilityTextSmall"] = "Utility_Text_Small_Font",
	["BackButton"] = "Back_Button_Font",
	["Semibold"] = "Semibold_Font",
	["Bold"] = "Bold_Font",
	["ShareLinkTitle"] = "Utility_Text_Font",
	["ButtonNonInteractable"] = "IGM_ButtonNonInteractable"
}
local function v_u_29() -- name: getViewportSize
	if _G.__TESTEZ_RUNNING_TEST__ then
		return Vector2.new(1024, 1024)
	elseif workspace.CurrentCamera then
		if workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then
			return nil
		else
			return workspace.CurrentCamera.ViewportSize
		end
	else
		return nil
	end
end
local v_u_30 = v_u_29()
local v_u_31 = v_u_30 and v_u_2.TouchEnabled
if v_u_31 then
	v_u_31 = v_u_30.Y < 500 and true or v_u_30.X < 700
end
local v_u_32 = {
	["PaddingTop"] = UDim.new(0, 0),
	["PaddingLeft"] = UDim.new(0, 20),
	["PaddingRight"] = UDim.new(0, 20),
	["PaddingBottom"] = UDim.new(0, 14)
}
local v_u_33 = {
	["PaddingTop"] = UDim.new(0, 0),
	["PaddingLeft"] = UDim.new(0, 12),
	["PaddingRight"] = UDim.new(0, 12)
}
local v34
if v_u_15 and (v_u_16 == 1 or v_u_16 == 3) then
	v34 = UDim.new(0, 24)
else
	v34 = UDim.new(0, 12)
end
v_u_33.PaddingBottom = v34
local v_u_35 = {
	["AnchorPoint"] = Vector2.new(0.5, 0.5),
	["Position"] = UDim2.new(0.5, 0, 0.5, 10),
	["Size"] = UDim2.new(0, 0, 0, 0),
	["AutomaticSize"] = Enum.AutomaticSize.XY
}
local v_u_36 = {
	["AnchorPoint"] = Vector2.new(0.5, 1),
	["Position"] = UDim2.new(0.5, 0, 1, 8),
	["Size"] = UDim2.new(0, 0, 0, 0),
	["AutomaticSize"] = Enum.AutomaticSize.XY
}
return {
	["DefaultScrollBarThickness"] = 1,
	["DefaultCornerRadius"] = nil,
	["MenuContainerCornerRadius"] = nil,
	["DefaultStokeThickness"] = 1,
	["AlwaysShowBottomBar"] = nil,
	["TabHeaderIconPadding"] = 5,
	["UseInspectAndBuyPanel"] = nil,
	["ExtraHubBottomPaddingMobile"] = 12,
	["HubPadding"] = nil,
	["MenuContainerPosition"] = nil,
	["ExtraPageBottomPaddingMobile"] = 48,
	["ButtonHeight"] = 36,
	["LargeButtonHeight"] = 48,
	["SelectorArrowButtonWidth"] = 32,
	["Images"] = nil,
	["getIconSize"] = nil,
	["IconSize"] = nil,
	["SHIELD_INACTIVE_POSITION"] = nil,
	["viewportResized"] = nil,
	["color"] = nil,
	["transparency"] = nil,
	["font"] = nil,
	["fontSize"] = nil,
	["textSize"] = nil,
	["hydrateLabel"] = nil,
	["platformNameTextSize"] = 18,
	["platformNameIconSize"] = nil,
	["selectionCursor"] = nil,
	["DefaultCornerRadius"] = UDim.new(0, 8),
	["MenuContainerCornerRadius"] = UDim.new(0, 10),
	["AlwaysShowBottomBar"] = function() -- name: AlwaysShowBottomBar
		-- upvalues: (ref) v_u_31
		return not v_u_31
	end,
	["UseInspectAndBuyPanel"] = function() -- name: UseInspectAndBuyPanel
		-- upvalues: (ref) v_u_31
		return v_u_31
	end,
	["HubPadding"] = function() -- name: HubPadding
		-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_29, (copy) v_u_2, (copy) v_u_33, (copy) v_u_32, (ref) v_u_31
		if v_u_15 and v_u_16 ~= 0 then
			local v37 = v_u_29()
			local v38 = v37 and v_u_2.TouchEnabled
			if v38 then
				v38 = v37.Y < 500 and true or v37.X < 700
			end
			if v38 then
				return v_u_33
			else
				return v_u_32
			end
		elseif v_u_31 then
			return v_u_33
		else
			return v_u_32
		end
	end,
	["MenuContainerPosition"] = function(p39) -- name: MenuContainerPosition
		-- upvalues: (copy) v_u_14, (ref) v_u_31, (copy) v_u_36, (copy) v_u_35
		local v40 = v_u_14 and (p39 and p39:getMenuContainerPositionOverride())
		if v40 then
			return v40
		elseif v_u_31 then
			return v_u_36
		else
			return v_u_35
		end
	end,
	["Images"] = v9,
	["getIconSize"] = v10,
	["IconSize"] = v11,
	["SHIELD_INACTIVE_POSITION"] = UDim2.new(0, 0, 1, 36),
	["viewportResized"] = function() -- name: viewportResized
		-- upvalues: (ref) v_u_30, (copy) v_u_29, (ref) v_u_31, (copy) v_u_2
		v_u_30 = v_u_29()
		local v41 = v_u_30 and v_u_2.TouchEnabled
		if v41 then
			v41 = v_u_30.Y < 500 and true or v_u_30.X < 700
		end
		v_u_31 = v41
	end,
	["color"] = function(p42, p43) -- name: color
		-- upvalues: (copy) v_u_28, (copy) v_u_21, (copy) v_u_18
		local v44 = v_u_28[p42] or p42
		if v_u_21[v44] then
			return v_u_21[v44].Color
		else
			return p43 or v_u_18
		end
	end,
	["transparency"] = function(p45, p46) -- name: transparency
		-- upvalues: (copy) v_u_28, (copy) v_u_21
		local v47 = v_u_28[p45] or p45
		return not v_u_21[v47] and (p46 or 0) or v_u_21[v47].Transparency
	end,
	["font"] = function(p48, p49) -- name: font
		-- upvalues: (copy) v_u_19, (copy) v_u_28, (copy) v_u_22
		if p49 then
			local v50 = v_u_28[p49] or p49
			if v_u_22[v50] then
				return v_u_22[v50].Font
			else
				return p48 or v_u_19
			end
		else
			return v_u_19
		end
	end,
	["fontSize"] = function(p51, p52) -- name: fontSize
		-- upvalues: (copy) v_u_17, (copy) v_u_28, (copy) v_u_22, (copy) v_u_20
		if p52 then
			local v53 = v_u_28[p52] or p52
			if v_u_22[v53] then
				return v_u_22[v53].RelativeSize
			else
				return p51 or v_u_20
			end
		else
			return v_u_17[p51]
		end
	end,
	["textSize"] = function(p54, p55) -- name: textSize
		-- upvalues: (copy) v_u_12, (ref) v_u_31, (copy) v_u_28, (copy) v_u_22
		local v56 = v_u_12(false)
		if p55 then
			local v57 = v_u_31 and p55 == "UtilityRow" and "UtilityRowSmall" or (v_u_31 and p55 == "UtilityText" and "UtilityTextSmall" or p55)
			local v58 = v_u_28[v57] or v57
			if p54 == nil then
				return not (v_u_22[v58] and v_u_22[v58].TextSize) and (p54 * 0.794 or 19) or v_u_22[v58].TextSize
			elseif v_u_22[v58] and v_u_22[v58].TextSize then
				return v_u_22[v58].TextSize * v56
			else
				return p54 * 0.794 * v56
			end
		else
			return p54 * 0.794 * v56
		end
	end,
	["hydrateLabel"] = function(p59, p60, p61) -- name: hydrateLabel
		-- upvalues: (copy) v_u_28, (copy) v_u_21, (copy) v_u_22
		local v62 = v_u_28[p60] or p60
		if v_u_21[v62] then
			local v63 = v_u_21[v62]
			p59.TextColor3 = v63.Color
			p59.TextTransparency = v63.Transparency
		end
		if v_u_22[p61] then
			local v64 = v_u_22[v62]
			p59.Font = v64.RelativeSize * 19.2
			p59.TextSize = v64.TextSize
		end
	end,
	["platformNameIconSize"] = UDim2.fromOffset(36, 36),
	["selectionCursor"] = v_u_21.SelectionCursor
}