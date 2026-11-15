-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayouts.GamepadControls
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.UIBlox
local v6 = script.Parent.Parent.Parent.Parent
local v_u_7 = require(script.Parent.Parent.ControlLayoutContainer)
local v_u_8 = require(v6.Components.ThemedTextLabel)
local v_u_9 = require(v6.Resources.Assets)
local v_u_10 = require(v6.Resources.Controls)
local v_u_11 = require(v2.Packages.React)
local v_u_12 = require(v6.Localization.withLocalization)
local v_u_13 = v5.Core.ImageSet.ImageSetLabel
local v_u_14 = require(v2.Packages.Foundation).Image
local v_u_15 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_16 = #v_u_10.gamepadLabels.right * 43 + 62
local function v_u_22(p_u_17) -- name: verticalControlsList
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_8
	return v_u_12(p_u_17.controls)(function(p18)
		-- upvalues: (ref) v_u_4, (ref) v_u_8, (copy) p_u_17
		local v19 = {
			["ListLayout"] = v_u_4.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 21)
			})
		}
		for v20, v21 in ipairs(p18) do
			v19["controlLabel_" .. v20] = v_u_4.createElement(v_u_8, {
				["fontKey"] = "Header2",
				["themeKey"] = "TextEmphasis",
				["TextXAlignment"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["LayoutOrder"] = nil,
				["TextXAlignment"] = p_u_17.TextXAlignment,
				["Size"] = UDim2.new(0, 1, 0, 22),
				["Text"] = v21,
				["LayoutOrder"] = v20
			})
		end
		return v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = p_u_17.Position,
			["Size"] = UDim2.new(0, 0, 1, 0)
		}, v19)
	end)
end
return function(p23) -- name: GamepadControls
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_7, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11, (copy) v_u_22, (copy) v_u_10, (copy) v_u_16
	local v24 = v_u_1:GetPlatform()
	local v25 = v24 == Enum.Platform.XBox360 and true or v24 == Enum.Platform.XBoxOne
	local v26 = v_u_4.createElement
	local v27 = v_u_7
	local v28 = {
		["titleText"] = "CoreScripts.InGameMenu.Controls.GamepadTitle",
		["closeButtonRef"] = nil,
		["closeButtonRef"] = p23.closeButtonRef
	}
	local v29 = {}
	local v30 = v_u_4.createElement
	local v31
	if v_u_15 then
		v31 = v_u_14
	else
		v31 = v_u_13
	end
	v29.GamepadImage = v30(v31, {
		["BackgroundTransparency"] = not v_u_15 and 1 or nil,
		["backgroundStyle"] = v_u_15 and {
			["Transparency"] = 1
		} or nil,
		["Image"] = v25 and v_u_9.Images.GamepadXbox or v_u_9.Images.Gamepad,
		["Size"] = UDim2.new(0, 473, 0, 465),
		["Position"] = UDim2.new(0.5, 16.5, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["testId"] = v_u_15 and "GamepadInstructions" or nil,
		[v_u_11.Tag] = not v_u_15 and "data-testid=GamepadInstructions" or nil
	}, {
		["LeftControlsList"] = v_u_4.createElement(v_u_22, {
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["Position"] = UDim2.new(0, -26, 0, 62),
			["controls"] = v_u_10.gamepadLabels.left
		}),
		["RightControlsList"] = v_u_4.createElement(v_u_22, {
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Position"] = UDim2.new(1, -7, 0, 62),
			["controls"] = v_u_10.gamepadLabels.right
		}),
		["RightIconsControlslIst"] = v_u_4.createElement(v_u_22, {
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Position"] = UDim2.new(1, 26, 0, v_u_16),
			["controls"] = v_u_10.gamepadLabels.camera
		})
	})
	return v26(v27, v28, v29)
end