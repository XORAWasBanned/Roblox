-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadNavigationDialog.GamepadNavigationDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
game:GetService("LocalizationService")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = require(v1.Packages.React)
local v5 = require(v1.Packages.UIBlox)
local v6 = require(v1.Packages.Foundation)
local v_u_7 = v6.Utility.normalizeFontFace
local v_u_8 = v6.Utility.Flags.FoundationFontFaceMigration
local v_u_9 = require(v1.Workspace.Packages.Style).useDesignTokens
local v_u_10 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v11 = script:FindFirstAncestor("TopBar")
local v_u_12 = require(v11.Analytics).default
require(v11.TokenMappers.MenuNavigationPromptTokenMapper)
local v_u_13 = v5.App.Button.Button
local v_u_14 = v5.App.Button.Enum.ButtonType
local v_u_15 = {
	["ButtonSelect"] = "CoreScripts.InGameMenu.Label.ViewButton",
	["ButtonTouchpad"] = "CoreScripts.InGameMenu.Label.TouchpadButton",
	["ButtonShare"] = "CoreScripts.InGameMenu.Label.ShareButton"
}
local function v_u_30() -- name: HeaderArea
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7
	local v16 = v_u_9().LuaApps.MenuNavigationPrompt
	local v17 = v16.Typography
	local v18 = v16.Color
	local v19 = v16.Space
	local v20 = v_u_10({
		["HeaderText"] = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Title"
	})
	local v21 = v_u_4.createElement
	local v22 = "Frame"
	local v23 = {
		["AutomaticSize"] = nil,
		["LayoutOrder"] = 0,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}
	local v24 = {}
	local v25 = v_u_4.createElement
	local v26 = "TextLabel"
	local v27 = {
		["Text"] = nil,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Text"] = v20.HeaderText
	}
	local v28
	if v_u_8 then
		v28 = nil
	else
		v28 = v17.header.Font
	end
	v27.Font = v28
	local v29
	if v_u_8 then
		v29 = v_u_7(v17.header.Font)
	else
		v29 = nil
	end
	v27.FontFace = v29
	v27.TextSize = v17.header.FontSize
	v27.TextColor3 = v18.textColor.Color3
	v27.Size = UDim2.fromOffset(0, 0)
	v27.AutomaticSize = Enum.AutomaticSize.XY
	v27.TextXAlignment = Enum.TextXAlignment.Center
	v27.TextYAlignment = Enum.TextYAlignment.Center
	v24.Header = v25(v26, v27)
	v24.Padding = v_u_4.createElement("UIPadding", {
		["PaddingTop"] = UDim.new(0, v19.titlePadding),
		["PaddingBottom"] = UDim.new(0, v19.titlePadding),
		["PaddingLeft"] = UDim.new(0, v19.bodyPadding),
		["PaddingRight"] = UDim.new(0, v19.bodyPadding)
	})
	return v21(v22, v23, v24)
end
local function v_u_51() -- name: GamepadImageArea
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_15, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7
	local v31 = v_u_9().LuaApps.MenuNavigationPrompt
	local v32 = v31.Typography
	local v33 = v31.Color
	local v34 = v31.Size
	local v35 = v31.Space
	local v36 = v_u_10({
		["ButtonLabelText"] = v_u_15[v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
	})
	local v37 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonSelect)
	local v38 = v_u_4.createElement
	local v39 = "Frame"
	local v40 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 0,
		["AutomaticSize"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}
	local v41 = {
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v35.iconPadding)
		})
	}
	local v42 = v_u_4.createElement
	local v43 = "Frame"
	local v44 = {
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = 0,
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}
	local v45 = {
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v35.iconPadding)
		}),
		["Icon"] = v_u_4.createElement("ImageLabel", {
			["LayoutOrder"] = 0,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["Image"] = v37,
			["Size"] = UDim2.fromOffset(v34.iconSize, v34.iconSize)
		})
	}
	local v46 = v_u_4.createElement
	local v47 = "TextLabel"
	local v48 = {
		["Text"] = nil,
		["LayoutOrder"] = 100,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Text"] = v36.ButtonLabelText
	}
	local v49
	if v_u_8 then
		v49 = nil
	else
		v49 = v32.label.Font
	end
	v48.Font = v49
	local v50
	if v_u_8 then
		v50 = v_u_7(v32.label.Font)
	else
		v50 = nil
	end
	v48.FontFace = v50
	v48.TextSize = v32.label.FontSize
	v48.TextColor3 = v33.textColor.Color3
	v48.Size = UDim2.fromOffset(0, 0)
	v48.AutomaticSize = Enum.AutomaticSize.XY
	v48.TextXAlignment = Enum.TextXAlignment.Center
	v48.TextYAlignment = Enum.TextYAlignment.Center
	v45.ControllerButtonLabel = v46(v47, v48)
	v41.ButtonLabelGroup = v42(v43, v44, v45)
	v41.ControllerImage = v_u_4.createElement("ImageLabel", {
		["Image"] = "rbxasset://textures/ui/Gamepad/ControllerSelect.png",
		["Size"] = nil,
		["LayoutOrder"] = 100,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1)
	}, {
		["UIAspectRatioConstraint"] = v_u_4.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = v34.imageWidth / v34.imageHeight
		}),
		["UISizeConstraint"] = v_u_4.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new(v34.imageWidth, v34.imageHeight),
			["MinSize"] = Vector2.new(v34.imageWidth * 0.5, v34.imageHeight * 0.5)
		})
	})
	return v38(v39, v40, v41)
end
local function v_u_72(p52) -- name: Body
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_15, (copy) v_u_10, (copy) v_u_4, (copy) v_u_51, (copy) v_u_8, (copy) v_u_7, (copy) v_u_13, (copy) v_u_14
	local v53 = v_u_9().LuaApps.MenuNavigationPrompt
	local v54 = v53.Typography
	local v55 = v53.Color
	local v56 = v53.Size
	local v57 = v53.Space
	local _ = v_u_15[v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
	local v58 = v_u_10({
		["OkText"] = "CoreScripts.InGameMenu.Ok",
		["Description"] = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Description"
	})
	local v59 = v_u_4.createElement
	local v60 = "Frame"
	local v61 = {
		["LayoutOrder"] = 200,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}
	local v62 = {
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v57.bodyPadding)
		}),
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v57.bodyPadding),
			["PaddingRight"] = UDim.new(0, v57.bodyPadding),
			["PaddingTop"] = UDim.new(0, v57.bodyPadding),
			["PaddingBottom"] = UDim.new(0, v57.bodyPadding)
		}),
		["GamepadImageArea"] = v_u_4.createElement(v_u_51)
	}
	local v63 = v_u_4.createElement
	local v64 = "TextLabel"
	local v65 = {
		["Text"] = nil,
		["LayoutOrder"] = 100,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextWrapped"] = true,
		["LineHeight"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Text"] = v58.Description
	}
	local v66
	if v_u_8 then
		v66 = nil
	else
		v66 = v54.caption.Font
	end
	v65.Font = v66
	local v67
	if v_u_8 then
		v67 = v_u_7(v54.caption.Font)
	else
		v67 = nil
	end
	v65.FontFace = v67
	v65.TextSize = v54.caption.FontSize
	v65.TextColor3 = v55.textColor.Color3
	v65.LineHeight = v54.caption.LineHeight
	v65.Size = UDim2.new(1, 0, 0, 0)
	v65.AutomaticSize = Enum.AutomaticSize.Y
	v65.TextXAlignment = Enum.TextXAlignment.Left
	v65.TextYAlignment = Enum.TextYAlignment.Center
	v62.ImageDescription = v63(v64, v65)
	local v68 = v_u_4.createElement
	local v69 = v_u_13
	local v70 = {
		["buttonType"] = nil,
		["layoutOrder"] = 200,
		["size"] = nil,
		["text"] = nil,
		["onActivated"] = nil,
		["icon"] = nil,
		["buttonType"] = v_u_14.PrimarySystem,
		["size"] = UDim2.new(1, 0, 0, v56.buttonHeight),
		["text"] = v58.OkText,
		["onActivated"] = p52.onDismissed
	}
	local v71
	if p52.selectButtonDismissesGamepadNavigationDialog then
		v71 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonSelect)
	else
		v71 = nil
	end
	v70.icon = v71
	v62.ConfirmationButton = v68(v69, v70)
	return v59(v60, v61, v62)
end
return function(p_u_73) -- name: GamepadNavigationDialog
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_30, (copy) v_u_72
	local v74 = v_u_9().LuaApps.MenuNavigationPrompt
	local v75 = v74.Color
	local v76 = v74.Size
	local v77 = v74.Space
	local v78 = v74.Radius
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_12, (ref) v_u_3, (copy) p_u_73
		v_u_12:onShowGamepadNavigationDialog()
		local v79 = v_u_3
		local v80 = "ConfirmBindComponentMapperTokenModule"
		local function v82(_, p81, _)
			-- upvalues: (ref) p_u_73
			if p81 == Enum.UserInputState.End then
				p_u_73.onDismissed()
			end
		end
		local v83 = false
		local v84
		if p_u_73.selectButtonDismissesGamepadNavigationDialog then
			v84 = Enum.KeyCode.ButtonSelect
		else
			v84 = Enum.KeyCode.ButtonA
		end
		v79:BindCoreAction(v80, v82, v83, v84)
		return function()
			-- upvalues: (ref) v_u_12, (ref) v_u_3
			v_u_12:onDismissGamepadNavigationDialog()
			v_u_3:UnbindCoreAction("ConfirmBindComponentMapperTokenModule")
		end
	end)
	local v85 = v_u_4.createElement
	local v86 = {
		["BackgroundColor3"] = v75.backgroundUiColor.Color3,
		["BackgroundTransparency"] = v75.backgroundUiColor.Transparency,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = UDim2.fromScale(v76.promptWidth / v76.displayWidth, 0),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	}
	local v87 = {
		["Corner"] = v_u_4.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, v78.cornerRadius)
		}),
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["HeaderArea"] = v_u_4.createElement(v_u_30),
		["Separator"] = v_u_4.createElement("Frame", {
			["LayoutOrder"] = 100,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, -2 * v77.bodyPadding, 0, 1),
			["BackgroundColor3"] = v75.separatorColor.Color3,
			["BackgroundTransparency"] = v75.separatorColor.Transparency
		}),
		["Body"] = v_u_4.createElement(v_u_72, p_u_73),
		["UISizeConstraint"] = v_u_4.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new((1 / 0), (1 / 0)),
			["MinSize"] = Vector2.new(v76.imageWidth + 2 * v77.bodyPadding, 1)
		})
	}
	return v85("Frame", v86, v87)
end