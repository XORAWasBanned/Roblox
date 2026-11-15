-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.Help
local v_u_1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("TextService")
local v5 = game:GetService("CorePackages")
local v_u_6 = UserSettings().GameSettings
local v_u_7 = require(v_u_1.Modules.Settings.Utility)
local v_u_8 = require(v5.Workspace.Packages.RobloxTranslator)
local v_u_9 = require(v5.Workspace.Packages.CachedPolicyService)
local v_u_10 = require(v_u_1.Modules.Settings.Theme)
local v_u_11 = require(v5.Workspace.Packages.AppCommonLib).Create
local v_u_12 = require(v5.Packages.BuilderIcons)
local v_u_13 = v_u_12.Migration.uiblox
local v_u_14 = require(v5.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v15 = require(v5.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
v_u_1:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v_u_16 = require(v_u_1.Modules.TenFootInterface):IsEnabled()
if v_u_16 then
	v_u_16 = not v15
end
local v_u_17 = require(v5.Workspace.Packages.AppCommonLib).isSpatial
local v_u_18
if v_u_14 then
	local v19 = game:GetService("LocalizationService")
	v_u_18 = require(v5.Workspace.Packages.InExperienceLocales).Localization.new(v19.RobloxLocaleId)
else
	v_u_18 = nil
end
local v_u_20
if v_u_14 then
	v_u_20 = require(v_u_1.Modules.Settings.Resources.HelpConstants)
else
	v_u_20 = nil
end
local v_u_142 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_1, (copy) v_u_14, (copy) v_u_17, (copy) v_u_2, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_16, (copy) v_u_4, (copy) v_u_7, (copy) v_u_3, (copy) v_u_20, (ref) v_u_18, (copy) v_u_6, (copy) v_u_13, (copy) v_u_12
	local v_u_21 = require(v_u_1.Modules.Settings.SettingsPageFactory):CreateNewPage()
	v_u_21.HelpPages = {}
	v_u_21.HelpPageContents = {}
	v_u_21.ActiveHelpScheme = nil
	local v_u_22 = nil
	function v_u_21.GetCurrentInputType(_) -- name: GetCurrentInputType
		-- upvalues: (ref) v_u_14, (ref) v_u_17, (ref) v_u_22, (ref) v_u_2
		if v_u_14 and v_u_17() then
			return "SpatialGamepad"
		end
		if v_u_22 ~= nil then
			return (v_u_22 == Enum.UserInputType.Keyboard or (v_u_22 == Enum.UserInputType.MouseMovement or (v_u_22 == Enum.UserInputType.MouseButton1 or (v_u_22 == Enum.UserInputType.MouseButton2 or (v_u_22 == Enum.UserInputType.MouseButton3 or v_u_22 == Enum.UserInputType.MouseWheel))))) and "KeyboardMouse" or (v_u_22 == Enum.UserInputType.Touch and "Touch" or ((v_u_22 == Enum.UserInputType.Gamepad1 or (v_u_22 == Enum.UserInputType.Gamepad2 or (v_u_22 == Enum.UserInputType.Gamepad3 or v_u_22 == Enum.UserInputType.Gamepad4))) and "Gamepad" or "KeyboardMouse"))
		end
		local v23 = v_u_2:GetPlatform()
		return (v23 == Enum.Platform.XBoxOne or v23 == Enum.Platform.WiiU) and "Gamepad" or ((v23 == Enum.Platform.Windows or v23 == Enum.Platform.OSX) and "KeyboardMouse" or "Touch")
	end
	local function v_u_47(p24) -- name: createPCHelp
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_2, (ref) v_u_8, (ref) v_u_9
		local function v36(p25, p26) -- name: createPCGroup
			-- upvalues: (ref) v_u_11, (ref) v_u_10
			local v27 = v_u_11("Frame")({
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Name"] = nil,
				["Size"] = UDim2.new(0.3333333333333333, -4, 0, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Name"] = "PCGroupFrame" .. tostring(p25)
			})
			v_u_11("UIListLayout")({
				["FillDirection"] = Enum.FillDirection.Vertical,
				["Padding"] = UDim.new(0, 2),
				["Parent"] = v27,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
			local v28 = v_u_11("TextLabel")({
				["Position"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = nil,
				["Font"] = nil,
				["FontSize"] = nil,
				["TextColor3"] = nil,
				["TextXAlignment"] = nil,
				["TextWrapped"] = true,
				["Name"] = nil,
				["ZIndex"] = 2,
				["LayoutOrder"] = 1,
				["Parent"] = nil,
				["Position"] = UDim2.new(0, 9, 0, 0),
				["Size"] = UDim2.new(1, -9, 0, 30),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Text"] = p25,
				["Font"] = v_u_10.font(Enum.Font.SourceSansBold, "HelpTitle"),
				["FontSize"] = v_u_10.fontSize(Enum.FontSize.Size18, "HelpTitle"),
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Name"] = "PCGroupTitle" .. tostring(p25),
				["Parent"] = v27
			})
			v_u_11("UIPadding")({
				["PaddingLeft"] = UDim.new(0, 9),
				["Parent"] = v28
			})
			local v29 = v28.Size.Y.Offset
			local v30 = 0
			for v31 = 1, #p26 do
				for v32, v33 in pairs(p26[v31]) do
					local v34 = v_u_11("Frame")({
						["Size"] = nil,
						["Position"] = nil,
						["BackgroundTransparency"] = nil,
						["AutomaticSize"] = nil,
						["LayoutOrder"] = nil,
						["BorderSizePixel"] = 0,
						["ZIndex"] = 2,
						["Name"] = nil,
						["Parent"] = nil,
						["Size"] = UDim2.new(1, 0, 0, 42),
						["Position"] = UDim2.new(0, 0, 0, v29 + v30 * 44),
						["BackgroundTransparency"] = v_u_10.transparency("InputActionBackground", 0.65),
						["AutomaticSize"] = Enum.AutomaticSize.Y,
						["LayoutOrder"] = v31 + 1,
						["Name"] = "ActionInputBinding" .. tostring(v32),
						["Parent"] = v27
					})
					v34.BackgroundColor3 = v_u_10.color("InputActionBackground")
					v_u_11("UICorner")({
						["CornerRadius"] = UDim.new(0, 3),
						["Parent"] = v34
					})
					local v35 = v_u_11("TextLabel")({
						["Size"] = nil,
						["AutomaticSize"] = nil,
						["Position"] = nil,
						["BackgroundTransparency"] = 1,
						["Text"] = nil,
						["Font"] = nil,
						["FontSize"] = nil,
						["TextColor3"] = nil,
						["TextXAlignment"] = nil,
						["Name"] = nil,
						["ZIndex"] = 2,
						["Parent"] = nil,
						["TextWrapped"] = true,
						["Size"] = UDim2.new(0.4, -9, 0, 42),
						["AutomaticSize"] = Enum.AutomaticSize.Y,
						["Position"] = UDim2.new(0, 9, 0, 0),
						["Text"] = v32,
						["Font"] = v_u_10.font(Enum.Font.SourceSansBold, "HelpTitle"),
						["FontSize"] = v_u_10.fontSize(Enum.FontSize.Size18, "HelpTitle"),
						["TextColor3"] = Color3.new(1, 1, 1),
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["Name"] = v32 .. "Label",
						["Parent"] = v34
					})
					Instance.new("UITextSizeConstraint", v35).MaxTextSize = v_u_10.textSize(28)
					v_u_11("TextLabel")({
						["Size"] = nil,
						["Position"] = nil,
						["BackgroundTransparency"] = 1,
						["Text"] = nil,
						["Font"] = nil,
						["FontSize"] = nil,
						["TextColor3"] = nil,
						["TextXAlignment"] = nil,
						["Name"] = nil,
						["ZIndex"] = 2,
						["Parent"] = nil,
						["TextWrapped"] = true,
						["TextScaled"] = false,
						["AutomaticSize"] = nil,
						["Size"] = UDim2.new(0.5, 0, 0, 42),
						["Position"] = UDim2.new(0.5, -4, 0, 0),
						["Text"] = v33,
						["Font"] = v_u_10.font(Enum.Font.SourceSans, "HelpText"),
						["FontSize"] = v_u_10.fontSize(Enum.FontSize.Size18, "HelpText"),
						["TextColor3"] = Color3.new(1, 1, 1),
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["Name"] = v33 .. "Label",
						["Parent"] = v34,
						["AutomaticSize"] = Enum.AutomaticSize.Y
					})
					v30 = v30 + 1
				end
			end
			v27.Size = UDim2.new(v27.Size.X.Scale, v27.Size.X.Offset, 0, v29 + v30 * 44)
			return v27
		end
		local v37 = v_u_2:GetPlatform() == Enum.Platform.OSX
		local v38 = v36("Character Movement", {
			{
				["Move Forward"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. v_u_8:FormatByKey("InGame.HelpMenu.UpArrow")
			},
			{
				["Move Backward"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. v_u_8:FormatByKey("InGame.HelpMenu.DownArrow")
			},
			{
				["Move Left"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. v_u_8:FormatByKey("InGame.HelpMenu.LeftArrow")
			},
			{
				["Move Right"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. v_u_8:FormatByKey("InGame.HelpMenu.RightArrow")
			},
			{
				["Jump"] = "Space"
			}
		})
		v38.Parent = p24
		v38.LayoutOrder = 1
		local v39 = v_u_2:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. v_u_2:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. v_u_2:GetStringForKeyCode(Enum.KeyCode.Three) .. "..."
		local v40 = v36("Accessories", {
			{
				["Equip Tools"] = v39
			},
			{
				["Unequip Tools"] = v39
			},
			{
				["Drop Tool"] = "Backspace"
			},
			{
				["Use Tool"] = "Left Mouse Button"
			}
		})
		v40.Position = UDim2.new(0.3333333333333333, 4, 0, 0)
		v40.Parent = p24
		v40.LayoutOrder = 2
		local v41 = {}
		local v42 = {
			["UI Selection Toggle"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		}
		table.insert(v41, v42)
		local v43 = not v_u_9:IsSubjectToChinaPolicies()
		if v43 then
			table.insert(v41, {
				["Screenshot"] = v37 and "Opt + 1" or "Alt + 1"
			})
			if not v37 then
				table.insert(v41, {
					["Record Video"] = "F12"
				})
			end
		end
		if v43 then
			table.insert(v41, {
				["Dev Console"] = v37 and "F9/fn + F9" or "F9"
			})
		end
		table.insert(v41, {
			["Mouselock"] = "Shift"
		})
		if v43 then
			table.insert(v41, {
				["Graphics Level"] = v37 and "F10/fn + F10" or "F10"
			})
			table.insert(v41, {
				["Fullscreen"] = v37 and "Ctrl + Cmd + F" or "F11"
			})
		end
		if v43 then
			table.insert(v41, {
				["Perf. Stats"] = v37 and "Fn+Opt+Cmd+F7" or "Ctrl + Shift + F7"
			})
		end
		local v44 = v36("Misc", v41)
		v44.Position = UDim2.new(0.6666666666666666, 8, 0, 0)
		v44.Parent = p24
		v44.LayoutOrder = 3
		local v45 = v36("Camera Movement", {
			{
				["Rotate"] = "Right Mouse Button"
			},
			{
				["Zoom In/Out"] = "Mouse Wheel"
			},
			{
				["Zoom In"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.I)
			},
			{
				["Zoom Out"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.O)
			}
		})
		v45.Position = UDim2.new(0, 0, v38.Size.Y.Scale, v38.Size.Y.Offset + 50)
		v45.Parent = p24
		v45.LayoutOrder = 4
		local v46 = v36("Menu Items", {
			{
				["Roblox Menu"] = "Esc"
			},
			{
				["Backpack"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.Backquote)
			},
			{
				["Playerlist"] = "Tab"
			},
			{
				["Chat"] = v_u_2:GetStringForKeyCode(Enum.KeyCode.Slash)
			}
		})
		v46.Position = UDim2.new(0.3333333333333333, 4, v38.Size.Y.Scale, v38.Size.Y.Offset + 50)
		v46.Parent = p24
		v46.LayoutOrder = 5
		p24.Size = UDim2.new(p24.Size.X.Scale, p24.Size.X.Offset, 0, v46.Size.Y.Offset + v46.Position.Y.Offset)
	end
	local function v_u_71(p_u_48) -- name: createGamepadHelp
		-- upvalues: (copy) v_u_21, (ref) v_u_11, (ref) v_u_16, (ref) v_u_10, (ref) v_u_4, (ref) v_u_8
		local v49 = v_u_21.Page.AbsoluteSize.X * 0.58
		local v50 = math.max(v49, 270)
		local v51 = UDim2.new(0, v50, 0, v50 * 0.64)
		local v52 = {
			["Name"] = "GamepadImage",
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = "rbxasset://textures/ui/Settings/Help/PlatformController.png",
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = v51,
			["Position"] = UDim2.new(0.5, -v51.X.Offset / 2 + 30, 0.5, -v51.Y.Offset / 2 + 7),
			["Parent"] = p_u_48
		}
		local v_u_53 = v_u_11("ImageLabel")(v52)
		p_u_48.Size = UDim2.new(p_u_48.Size.X.Scale, p_u_48.Size.X.Offset, 0, v_u_53.Size.Y.Offset + 100)
		local v_u_54 = v_u_16 and v_u_10.fontSize(Enum.FontSize.Size36) or v_u_10.fontSize(Enum.FontSize.Size24)
		local v_u_55 = v_u_54 == v_u_10.fontSize(Enum.FontSize.Size36) and v_u_10.textSize(36) or v_u_10.textSize(24)
		local function v67(p56, p57, p58, p_u_59) -- name: createGamepadLabel
			-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_54, (copy) v_u_53, (ref) v_u_4, (copy) v_u_55, (copy) p_u_48
			local v_u_60 = v_u_11("TextLabel")({
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["AnchorPoint"] = nil,
				["Font"] = nil,
				["FontSize"] = nil,
				["TextColor3"] = nil,
				["Name"] = nil,
				["ZIndex"] = 2,
				["Parent"] = nil,
				["TextTruncate"] = nil,
				["Position"] = p57,
				["Size"] = p58,
				["Text"] = p56,
				["TextXAlignment"] = p_u_59 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
				["AnchorPoint"] = p_u_59 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5),
				["Font"] = v_u_10.font(Enum.Font.SourceSansBold, "HelpGamepad"),
				["FontSize"] = v_u_54,
				["TextColor3"] = Color3.new(1, 1, 1),
				["Name"] = p56 .. "Label",
				["Parent"] = v_u_53,
				["TextTruncate"] = Enum.TextTruncate.AtEnd
			})
			v_u_60.TextWrapped = true
			local v_u_61 = v_u_4:GetTextSize(p56, v_u_55, v_u_10.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X
			local v62 = p57.X.Offset
			local v_u_63 = math.abs(v62)
			local v_u_64 = p_u_48
			local function v_u_66() -- name: updateNameLabelSize
				-- upvalues: (copy) p_u_59, (copy) v_u_64, (copy) v_u_63, (copy) v_u_60, (ref) v_u_55, (copy) v_u_61, (ref) v_u_54
				local v65 = p_u_59 and v_u_64.AbsoluteSize.X / 2 + 30 - v_u_63 or v_u_64.AbsoluteSize.X / 2 - 30 - v_u_63
				v_u_60.Size = UDim2.new(v_u_60.Size.X.Scale, v65, v_u_60.Size.Y.Scale, v_u_55 * 2)
				v_u_60.TextScaled = false
				if v65 >= v_u_61 then
					v_u_60.FontSize = v_u_54
				end
			end
			v_u_64:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
				-- upvalues: (copy) v_u_66
				v_u_66()
			end)
			v_u_66()
		end
		local v68 = -v_u_53.Size.X.Offset / 2 - 20
		local v69 = v_u_53.Size.X.Offset / 2 - 20
		local v70 = v69 + 40
		v67("Switch Tool", UDim2.new(0.5, v68, 0, 15), UDim2.new(0, 100, 0, v_u_55), true)
		v67(v_u_8:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, v68, 0.15, 10), UDim2.new(0, 164, 0, v_u_55), true)
		v67("Move", UDim2.new(0.5, v68, 0.31, 5), UDim2.new(0, 46, 0, v_u_55), true)
		v67("Menu Navigation", UDim2.new(0.5, v68, 0.46, 0), UDim2.new(0, 164, 0, v_u_55), true)
		v67("Use Tool", UDim2.new(0.5, v69, 0, 15), UDim2.new(0, 73, 0, v_u_55))
		v67("Roblox Menu", UDim2.new(0.5, v69, 0.15, 10), UDim2.new(0, 122, 0, v_u_55))
		v67("Back", UDim2.new(0.5, v69, 0.31, 5), UDim2.new(0, 43, 0, v_u_55))
		v67("Jump", UDim2.new(0.5, v69, 0.46, 0), UDim2.new(0, 49, 0, v_u_55))
		v67("Rotate Camera", UDim2.new(0.5, v70, 0.62, -10), UDim2.new(0, 132, 0, v_u_55))
		v67("Camera Zoom", UDim2.new(0.5, v70, 0.77, -10), UDim2.new(0, 122, 0, v_u_55))
	end
	local function v_u_78(p72) -- name: updateTouchLayout
		-- upvalues: (copy) v_u_21, (ref) v_u_7
		v_u_21.ActiveHelpScheme = p72
		local v73 = v_u_7:IsPortrait()
		if v_u_21.HelpPages.Touch then
			local v74 = v_u_21.HelpPageContents.Touch
			local v75
			if p72 == Enum.TouchMovementMode.DynamicThumbstick or p72 == Enum.TouchMovementMode.Default then
				v74.MoveLabel.Position = v73 and UDim2.new(0.25, -v74.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -v74.MoveLabel.AbsoluteSize.x / 2, 0.85, -v74.MoveLabel.AbsoluteSize.y)
				v74.JumpLabel.Position = v73 and UDim2.new(0.75, -v74.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -v74.JumpLabel.AbsoluteSize.y)
				v74.RotateLabel.Position = v73 and UDim2.new(1, -v74.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -v74.RotateLabel.AbsoluteSize.x / 2, 0.02, 0)
				v74.UseToolLabel.Position = v73 and UDim2.new(0.5, -v74.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -v74.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60)
				v74.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				v74.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
				v75 = {
					["MoveImageCTM"] = true
				}
			elseif p72 == Enum.TouchMovementMode.ClickToMove then
				v74.MoveLabel.Position = v73 and UDim2.new(0.25, -v74.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -v74.MoveLabel.AbsoluteSize.x / 2, 0.5, 40)
				v74.RotateLabel.Position = v73 and UDim2.new(1, -v74.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				v74.UseToolLabel.Position = v73 and UDim2.new(0.75, -v74.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0)
				v74.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				v74.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
				v75 = {
					["MoveImageDTS"] = true,
					["JumpLabel"] = true
				}
			else
				v74.MoveLabel.Position = v73 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0)
				v74.JumpLabel.Position = v73 and UDim2.new(0.94, -v74.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0)
				v74.RotateLabel.Position = v73 and UDim2.new(1, -v74.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				v74.UseToolLabel.Position = v73 and UDim2.new(0.5, -v74.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0)
				v74.EquipLabel.Position = v73 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				v74.ZoomLabel.Position = v73 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
				v75 = {
					["MoveImageDTS"] = true,
					["MoveImageCTM"] = true,
					["JumpImage"] = true
				}
			end
			if v75 then
				for v76, v77 in pairs(v74) do
					v77.Visible = not v75[v76]
				end
			end
		end
	end
	local function v_u_103(p79) -- name: createTouchHelp
		-- upvalues: (ref) v_u_7, (ref) v_u_3, (ref) v_u_11, (ref) v_u_10
		local v80 = {}
		local v_u_81 = v_u_7:IsSmallTouchScreen()
		local v82 = v_u_3:GetScreenResolution().y - 350
		if v_u_81 then
			v82 = v_u_3:GetScreenResolution().y - 100
		end
		p79.Size = UDim2.new(1, 0, 0, v82)
		local function v89(p83, p84, p85, p86) -- name: createTouchLabel
			-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_81
			local v87 = v_u_11("TextLabel")({
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Name"] = nil,
				["Parent"] = nil,
				["Position"] = p84,
				["Size"] = p85,
				["Name"] = p83 .. "Frame",
				["Parent"] = p86
			})
			local v88 = v_u_11("TextLabel")({
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = nil,
				["Font"] = nil,
				["FontSize"] = nil,
				["TextColor3"] = nil,
				["Name"] = nil,
				["ZIndex"] = 3,
				["Parent"] = nil,
				["TextScaled"] = true,
				["TextWrapped"] = true,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Text"] = p83,
				["Font"] = v_u_10.font(Enum.Font.SourceSansBold, "HelpTouch"),
				["FontSize"] = v_u_10.fontSize(Enum.FontSize.Size14, "HelpTouch"),
				["TextColor3"] = Color3.new(1, 1, 1),
				["Name"] = p83 .. "Label",
				["Parent"] = v87
			})
			if not v_u_81 then
				v88.FontSize = v_u_10.fontSize(Enum.FontSize.Size18, "HelpTitle")
				v88.Size = UDim2.new(v88.Size.X.Scale, v88.Size.X.Offset, v88.Size.Y.Scale, v88.Size.Y.Offset + 4)
			end
			v_u_11("ImageLabel")({
				["Name"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png",
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["ZIndex"] = 2,
				["Parent"] = nil,
				["Name"] = p83 .. "BackgroundImage",
				["Size"] = UDim2.new(1.25, 0, 1.25, 0),
				["Position"] = UDim2.new(-0.125, 0, -0.065, 0),
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(12, 2, 65, 21),
				["Parent"] = v87
			})
			Instance.new("UITextSizeConstraint", v88).MaxTextSize = v_u_10.textSize(18, "HelpText")
			return v87
		end
		local v90 = v_u_81 and 0 or 30
		v80.MoveLabel = v89("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, v90 + 77, 0, 25), p79)
		local v91 = UDim2.new(0.5, -32, 1, 3)
		local v92 = {
			["Name"] = "MoveImageDTS",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 65, 0, 48),
			["Position"] = v91,
			["Parent"] = v80.MoveLabel
		}
		v80.MoveImageDTS = v_u_11("ImageLabel")(v92)
		local v93 = UDim2.new(0.5, -19, 1, 3)
		local v94 = {
			["Name"] = "MoveImageCTM",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 38, 0, 52),
			["Position"] = v93,
			["Parent"] = v80.MoveLabel
		}
		v80.MoveImageCTM = v_u_11("ImageLabel")(v94)
		v80.JumpLabel = v89("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, v90 + 77, 0, 25), p79)
		local v95 = UDim2.new(0.5, -19, 1, 3)
		local v96 = {
			["Name"] = "JumpImage",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 38, 0, 52),
			["Position"] = v95,
			["Parent"] = v80.JumpLabel
		}
		v80.JumpImage = v_u_11("ImageLabel")(v96)
		v80.EquipLabel = v89("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, v90 + 120, 0, 25), p79)
		v80.ZoomLabel = v89("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p79)
		local v97 = UDim2.new(0.5, -26, 1, 3)
		local v98 = {
			["Name"] = "ZoomImage",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 53, 0, 59),
			["Position"] = v97,
			["Parent"] = v80.ZoomLabel
		}
		v80.ZoomImage = v_u_11("ImageLabel")(v98)
		v80.RotateLabel = v89("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p79)
		local v99 = UDim2.new(0.5, -32, 1, 3)
		local v100 = {
			["Name"] = "RotateImage",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 65, 0, 48),
			["Position"] = v99,
			["Parent"] = v80.RotateLabel
		}
		v80.RotateImage = v_u_11("ImageLabel")(v100)
		v80.UseToolLabel = v89("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p79)
		local v101 = UDim2.new(0.5, -19, 1, 3)
		local v102 = {
			["Name"] = "ToolImage",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 38, 0, 52),
			["Position"] = v101,
			["Parent"] = v80.UseToolLabel
		}
		v80.ToolImage = v_u_11("ImageLabel")(v102)
		return v80
	end
	local function v_u_117(p104) -- name: createSpatialGamepadHelp
		-- upvalues: (ref) v_u_20, (ref) v_u_11, (copy) v_u_21, (ref) v_u_18, (ref) v_u_10
		local v105 = v_u_20.Images.GamepadQuest
		local v106 = v_u_20.Labels.QuestGamepadLabels
		local v107 = v105.Image
		local v108 = v105.HeightRatio
		local v109 = v106.LocalizationKeyPrefix
		local v110 = v106.LabelRelativeTextHeight
		local v111 = v106.LabelsInfo
		local v112 = v_u_11("ImageLabel")({
			["Name"] = "SpatialGamepadImage",
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["SizeConstraint"] = nil,
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, v108, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
			["Image"] = v107,
			["Parent"] = p104
		})
		local v113 = v_u_21.Page:FindFirstChildOfClass("UIPadding")
		local v114 = not v113 and 0 or v113.PaddingLeft.Offset + v113.PaddingRight.Offset
		p104.Size = UDim2.new(p104.Size.X.Scale, p104.Size.X.Offset, 0, (v_u_21.Page.AbsoluteSize.X - v114) * v108)
		for _, v115 in v111 do
			local v116 = v_u_18:Format(v109 .. v115.labelKey)
			v_u_11("TextLabel")({
				["Name"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["Font"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["ZIndex"] = 2,
				["TextScaled"] = true,
				["Parent"] = nil,
				["Name"] = v115.labelKey,
				["Position"] = UDim2.fromScale(v115.xPosition, v115.yPosition),
				["Size"] = UDim2.fromScale(v115.width, v110),
				["Text"] = v116,
				["TextXAlignment"] = v115.xAlignment or Enum.TextXAlignment.Right,
				["Font"] = v_u_10.font(nil, "HelpGamepad"),
				["TextColor3"] = v_u_10.color("TextEmphasis"),
				["TextTransparency"] = v_u_10.transparency("TextEmphasis"),
				["Parent"] = v112
			})
		end
	end
	local function v_u_121(p118) -- name: createHelpDisplay
		-- upvalues: (ref) v_u_11, (copy) v_u_47, (copy) v_u_71, (copy) v_u_103, (ref) v_u_14, (copy) v_u_117
		local v119 = nil
		local v120 = v_u_11("Frame")({
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Name"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Name"] = "HelpFrame" .. tostring(p118)
		})
		if p118 == "KeyboardMouse" then
			v_u_11("UIListLayout")({
				["FillDirection"] = nil,
				["Wraps"] = true,
				["Parent"] = nil,
				["SortOrder"] = nil,
				["Padding"] = nil,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Parent"] = v120,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 4)
			})
		end
		if p118 == "KeyboardMouse" then
			v_u_47(v120)
		elseif p118 == "Gamepad" then
			v_u_71(v120)
		elseif p118 == "Touch" then
			v119 = v_u_103(v120)
		elseif v_u_14 and p118 == "SpatialGamepad" then
			v_u_117(v120)
		end
		return v120, v119
	end
	local function v_u_124(p122) -- name: displayHelp
		-- upvalues: (copy) v_u_21, (ref) v_u_16, (ref) v_u_2
		for _, v123 in pairs(v_u_21.HelpPages) do
			if v123 == p122 then
				v123.Parent = v_u_21.Page
				v_u_21.Page.Size = v123.Size
				if not v_u_16 then
					continue
				end
				v_u_21.Page.Size = UDim2.new(v123.Size.X.Scale, v123.Size.X.Offset, v123.Size.Y.Scale, 0)
			else
				v123.Parent = nil
			end
		end
		if v_u_2:GetPlatform() == Enum.Platform.XBoxOne then
			v_u_21.HubRef.PageViewClipper.ClipsDescendants = false
			v_u_21.HubRef.PageView.ClipsDescendants = false
		end
	end
	local function v_u_132(p125) -- name: switchToHelp
		-- upvalues: (copy) v_u_21, (copy) v_u_124, (ref) v_u_6, (copy) v_u_78, (copy) v_u_121, (copy) v_u_132
		local v126 = v_u_21.HelpPages[p125]
		if v126 then
			v_u_124(v126)
			if p125 == "Touch" then
				local v127 = v_u_6.TouchMovementMode
				if v_u_21.ActiveHelpScheme ~= v127 then
					v_u_78(v127)
					return
				end
			end
		else
			local v128 = v_u_21.HelpPages
			local v129 = v_u_21.HelpPageContents
			local v130, v131 = v_u_121(p125)
			v128[p125] = v130
			v129[p125] = v131
			v_u_132(p125)
		end
	end
	function v_u_21.PageDisplayed(_) -- name: PageDisplayed
		-- upvalues: (copy) v_u_21, (ref) v_u_2, (ref) v_u_22, (copy) v_u_132
		if not v_u_21.LastInputTypeChangedConnection then
			v_u_21.LastInputTypeChangedConnection = v_u_2.LastInputTypeChanged:Connect(function(p133)
				-- upvalues: (ref) v_u_22, (ref) v_u_132, (ref) v_u_21
				if p133 ~= Enum.UserInputType.Focus and p133 ~= Enum.UserInputType.None then
					v_u_22 = p133
					v_u_132(v_u_21:GetCurrentInputType())
				end
			end)
		end
		v_u_22 = v_u_2:GetLastInputType()
		v_u_132(v_u_21:GetCurrentInputType())
	end
	function v_u_21.PageHidden(_) -- name: PageHidden
		-- upvalues: (copy) v_u_21
		if v_u_21.LastInputTypeChangedConnection then
			v_u_21.LastInputTypeChangedConnection:Disconnect()
			v_u_21.LastInputTypeChangedConnection = nil
		end
	end
	local function v_u_139(p134) -- name: adjustForScreenLayout
		-- upvalues: (copy) v_u_21, (ref) v_u_6, (ref) v_u_7, (ref) v_u_3, (copy) v_u_78
		if v_u_21:GetCurrentInputType() == "Touch" then
			local v135 = v_u_6.TouchMovementMode
			local v136 = v_u_7:IsSmallTouchScreen()
			local v137 = p134 or v_u_3:GetScreenResolution()
			local v138 = v137.y - 350
			if v136 then
				v138 = v137.y - 120
			end
			v_u_21.HelpPages.Touch.Size = UDim2.new(1, 0, 0, v138)
			v_u_78(v135)
		end
	end
	v_u_21.TabHeader.Name = "HelpTab"
	local v140 = v_u_13["icons/menu/help"]
	v_u_21.TabHeader.TabLabel.Icon.FontFace = v_u_12.Font[v140.variant]
	v_u_21.TabHeader.TabLabel.Icon.Text = v140.name
	v_u_21.TabHeader.TabLabel.Title.Text = "Help"
	v_u_21.Page.Name = "Help"
	v_u_7:OnResized(v_u_21, function(p141, _)
		-- upvalues: (copy) v_u_21, (copy) v_u_139
		if v_u_21.HelpPages.Touch then
			v_u_139(p141)
		end
	end)
	return v_u_21
end)()
v_u_142.Displayed.Event:connect(function()
	-- upvalues: (ref) v_u_142
	v_u_142:PageDisplayed()
	if v_u_142.HubRef.VersionContainer then
		v_u_142.HubRef.VersionContainer.Visible = true
	end
end)
v_u_142.Hidden.Event:connect(function()
	-- upvalues: (ref) v_u_142
	v_u_142:PageHidden()
	v_u_142.HubRef.PageViewClipper.ClipsDescendants = true
	v_u_142.HubRef.PageView.ClipsDescendants = true
	v_u_142.HubRef:ShowShield()
	if v_u_142.HubRef.VersionContainer then
		v_u_142.HubRef.VersionContainer.Visible = false
	end
end)
return v_u_142