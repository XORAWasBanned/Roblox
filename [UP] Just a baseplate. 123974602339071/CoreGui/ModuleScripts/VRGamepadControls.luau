-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayouts.VRGamepadControls
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v5 = script:FindFirstAncestor("InGameMenu")
local v_u_6 = require(v1.Packages.LuauPolyfill).Array
local v_u_7 = require(script.Parent.Parent.ControlLayoutContainer)
local v_u_8 = require(v5.Components.ThemedTextLabel)
local v_u_9 = require(v5.Resources.Assets)
local v_u_10 = require(v5.Resources.Controls)
local v_u_11 = require(v1.Packages.React)
local v_u_12 = require(v5.Localization.withLocalization)
local v_u_13 = v4.Core.ImageSet.ImageSetLabel
local v_u_14 = require(v1.Packages.Foundation).Image
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_16 = {
	["ResetCameraLabel"] = "CoreScripts.InGameMenu.Controls.ResetCameraLabel",
	["MenuLabel"] = "CoreScripts.InGameMenu.Controls.MenuLabel",
	["SelectItemLabel"] = "CoreScripts.InGameMenu.Controls.SelectItemLabel",
	["BackExitLabel"] = "CoreScripts.InGameMenu.Controls.BackExitLabel",
	["FirstPersonCameraLabel"] = "CoreScripts.InGameMenu.Controls.FirstPersonCameraLabel",
	["JumpSelectLabel"] = "CoreScripts.InGameMenu.Controls.JumpSelectLabel"
}
return function(_) -- name: GamepadControls
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11, (copy) v_u_6, (copy) v_u_10, (copy) v_u_16, (copy) v_u_12, (copy) v_u_8
	local v17 = v_u_3.createElement
	local v18 = v_u_7
	local v19 = {
		["titleText"] = "CoreScripts.InGameMenu.Controls.GamepadTitle"
	}
	local v20 = {}
	local v21 = v_u_3.createElement
	local v22
	if v_u_15 then
		v22 = v_u_14
	else
		v22 = v_u_13
	end
	v20.GamepadImage = v21(v22, {
		["BackgroundTransparency"] = not v_u_15 and 1 or nil,
		["backgroundStyle"] = v_u_15 and {
			["Transparency"] = 1
		} or nil,
		["Image"] = v_u_9.Images.GamepadQuest,
		["Size"] = UDim2.new(1, 0, 0.6, 0),
		["Position"] = UDim2.new(0.5, 16.5, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
		["testId"] = v_u_15 and "VRGamepadInstructions" or nil,
		[v_u_11.Tag] = not v_u_15 and "data-testid=VRGamepadInstructions" or nil
	}, { v_u_6.map(v_u_10.questGamepadLabels, function(p_u_23, p_u_24)
			-- upvalues: (ref) v_u_16, (ref) v_u_12, (ref) v_u_3, (ref) v_u_8
			return v_u_12({ v_u_16[p_u_23.labelKey] })(function(p25)
				-- upvalues: (ref) v_u_3, (ref) v_u_8, (copy) p_u_23, (copy) p_u_24
				return v_u_3.createElement(v_u_8, {
					["key"] = nil,
					["fontKey"] = "Header2",
					["themeKey"] = "TextEmphasis",
					["TextXAlignment"] = nil,
					["Size"] = nil,
					["Text"] = nil,
					["LayoutOrder"] = nil,
					["Position"] = nil,
					["TextScaled"] = true,
					["key"] = p_u_23.labelKey,
					["TextXAlignment"] = p_u_23.xAlignment or Enum.TextXAlignment.Right,
					["Size"] = UDim2.new(p_u_23.width, 0, 0.026, 0),
					["Text"] = p25[1],
					["LayoutOrder"] = p_u_24,
					["Position"] = UDim2.new(p_u_23.xPosition, 0, p_u_23.yPosition, 0)
				})
			end)
		end) })
	return v17(v18, v19, v20)
end