-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu.MenuNavigationToggleDialog
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = game:GetService("UserInputService")
v2:WaitForChild("RobloxGui")
local v5 = require(v1.Packages.ReactUtils)
local v_u_6 = require(v1.Packages.React)
require(v1.Packages.UIBlox)
local v7 = require(v1.Workspace.Packages.SharedFlags)
local v8 = require(v1.Packages.Foundation)
local v_u_9 = v8.Utility.normalizeFontFace
local v_u_10 = v7.FFlagEnableConsoleExpControls
local v_u_11 = v8.Utility.Flags.FoundationFontFaceMigration
local v_u_12 = v5.useEventConnection
local v_u_13 = require(v1.Workspace.Packages.Style).GetTextSize
local v_u_14 = require(v1.Workspace.Packages.Style).useDesignTokens
local v15 = script.Parent.Parent.Parent.Parent
local v16 = v15.Parent.Chrome
local v_u_17 = require(v1.Workspace.Packages.Chrome).Enabled()
local v_u_18
if v_u_10 and not v_u_17 then
	v_u_18 = nil
else
	v_u_18 = require(v15.Components.GamepadConnector)
end
local v_u_19 = require(v16.ChromeShared.Hooks.useObservableValue)
local v_u_20 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_21 = require(v2.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog)
return function(p22) -- name: MenuNavigationToggleDialog
	-- upvalues: (copy) v_u_14, (copy) v_u_21, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_12, (copy) v_u_20, (copy) v_u_13, (copy) v_u_17, (copy) v_u_10, (copy) v_u_19, (copy) v_u_18, (copy) v_u_11, (copy) v_u_9
	local v23 = v_u_14()
	local v_u_24 = v23.Typography.CaptionMedium
	local v25 = v23.Size.Size_400
	local v26 = v23.Size.Size_150
	local v27 = v23.Radius.Medium
	local v28 = v23.Size.Size_600
	local v29 = v23.Color.OverMedia.OverMedia_0
	local v30 = v23.Color.Content.Emphasis.Color3
	local v31 = v23.Size.Size_100
	local v32 = not (v_u_21 and game:GetEngineFeature("GetImageForKeyCode")) and "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png" or v_u_4:GetImageForKeyCode(Enum.KeyCode.ButtonSelect)
	local v_u_33, v_u_34
	if v_u_21 then
		local v_u_35, v_u_36 = v_u_6.useState(v_u_3.RobloxLocaleId)
		v_u_12(v_u_3:GetPropertyChangedSignal("RobloxLocaleId"), function()
			-- upvalues: (copy) v_u_36, (ref) v_u_3
			v_u_36(v_u_3.RobloxLocaleId)
		end)
		v_u_33, v_u_34 = v_u_6.useMemo(function()
			-- upvalues: (ref) v_u_20, (copy) v_u_35
			local v37 = v_u_20.new(v_u_35)
			local v38 = v37.Format
			local v39, v40 = pcall(v38, v37, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon")
			local v41 = v37.Format
			local v42, v43 = pcall(v41, v37, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon")
			local v44 = not v39 and "Some experiences require pressing" or v40
			if v42 then
				return v44, v43
			else
				return v44, "to toggle menu navigation"
			end
		end, { v_u_35 })
	else
		v_u_34 = " to toggle menu navigation"
		v_u_33 = "Some experiences require pressing "
	end
	local v45, v46 = v_u_6.useMemo(function()
		-- upvalues: (ref) v_u_13, (ref) v_u_33, (copy) v_u_24, (ref) v_u_34
		return v_u_13(v_u_33, v_u_24.FontSize, v_u_24.Font, Vector2.new((1 / 0), (1 / 0))), v_u_13(v_u_34, v_u_24.FontSize, v_u_24.Font, Vector2.new((1 / 0), (1 / 0)))
	end, {
		v_u_24.FontSize,
		v_u_24.Font,
		v_u_33,
		v_u_34
	})
	local v47 = nil
	if v_u_17 then
		if v_u_10 then
			v47 = v_u_19(v_u_18:getSelectedCoreObject())
		end
	else
		v47 = nil
	end
	local v48 = v_u_6.createElement
	local v49 = "Frame"
	local v50 = {
		["BackgroundColor3"] = v29.Color3,
		["BackgroundTransparency"] = v29.Transparency,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = p22.Position,
		["Visible"] = not (v_u_17 and v_u_10) and true or v47 ~= nil
	}
	local v51 = {
		["Corner"] = v_u_6.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, v27)
		})
	}
	local v52 = v_u_6.createElement
	local v53 = "UIListLayout"
	local v54 = {
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center
	}
	local v55
	if v_u_21 then
		v55 = UDim.new(0, v31)
	else
		v55 = nil
	end
	v54.Padding = v55
	v51.Layout = v52(v53, v54)
	local v56 = v_u_6.createElement
	local v57 = "TextLabel"
	local v58 = {
		["Size"] = nil,
		["Text"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["TextColor3"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextWrapped"] = false,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 0,
		["Size"] = UDim2.fromOffset(v45.X, v45.Y),
		["Text"] = v_u_33,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["TextColor3"] = v30
	}
	local v59
	if v_u_11 then
		v59 = nil
	else
		v59 = v_u_24.Font
	end
	v58.Font = v59
	local v60
	if v_u_11 then
		v60 = v_u_9(v_u_24.Font)
	else
		v60 = nil
	end
	v58.FontFace = v60
	v58.TextSize = v_u_24.FontSize
	v51.LeftText = v56(v57, v58)
	v51.Icon = v_u_6.createElement("ImageLabel", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 100,
		["Image"] = nil,
		["Size"] = UDim2.fromOffset(v28, v28),
		["Image"] = v32
	})
	local v61 = v_u_6.createElement
	local v62 = "TextLabel"
	local v63 = {
		["Size"] = nil,
		["Text"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["TextColor3"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextWrapped"] = false,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 200,
		["Size"] = UDim2.fromOffset(v46.X, v46.Y),
		["Text"] = v_u_34,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["TextColor3"] = v30
	}
	local v64
	if v_u_11 then
		v64 = nil
	else
		v64 = v_u_24.Font
	end
	v63.Font = v64
	local v65
	if v_u_11 then
		v65 = v_u_9(v_u_24.Font)
	else
		v65 = nil
	end
	v63.FontFace = v65
	v63.TextSize = v_u_24.FontSize
	v51.RightText = v61(v62, v63)
	v51.Padding = v_u_6.createElement("UIPadding", {
		["PaddingTop"] = UDim.new(0, v26),
		["PaddingBottom"] = UDim.new(0, v26),
		["PaddingLeft"] = UDim.new(0, v25),
		["PaddingRight"] = UDim.new(0, v25)
	})
	return v48(v49, v50, v51)
end