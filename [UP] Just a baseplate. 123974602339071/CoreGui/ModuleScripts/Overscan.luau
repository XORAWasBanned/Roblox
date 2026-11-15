-- Path: CoreGui.RobloxGui.Modules.Shell.Components.Overscan10ft.Overscan
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Packages.Foundation).Utility.normalizeFontFace
local v_u_6 = game:DefineFastFlag("FontFaceConsoleOverscan", false)
local v_u_7 = v4.App.Button.ButtonStack
local v_u_8 = v4.App.Button.Enum.ButtonType
local v_u_9 = require(v1.Workspace.Packages.Style).useDesignTokens
local v_u_10 = v4.Core.Style.useStyle
local v_u_11 = require(v2.Shell.GlobalSettings)
local v_u_12 = require(v2.Shell.LocalizedStrings)
local v_u_13 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_14 = require(v1.Workspace.Packages.Navigation).useNavigation
local v_u_15 = require(v2.Shell.Components.Overscan.ControllerHint)
local v_u_16 = require(script.Parent.Edges)
return function(p17) -- name: Overscan
	-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12, (copy) v_u_15, (copy) v_u_7, (copy) v_u_8, (copy) v_u_16
	local v18 = v_u_14()
	local v19 = p17.onUnmount or v18.goBack
	local v20 = v_u_13({
		["accept"] = "CommonUI.Controls.Action.Accept",
		["cancel"] = "CommonUI.Controls.Action.Cancel"
	})
	local v22 = v_u_9(function(p21)
		return {
			["buttonHeight"] = p21.Size.Size_1200,
			["marginBetween"] = p21.Size.Size_300
		}
	end)
	local v23 = v_u_10()
	local v_u_24 = v_u_3.useRef(nil)
	local v25 = v_u_3.createElement
	local v26 = "Frame"
	local v27 = {
		["Size"] = nil,
		["BorderSizePixel"] = 1,
		["BackgroundTransparency"] = nil,
		["BackgroundColor3"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundTransparency"] = p17.BackgroundTransparency,
		["BackgroundColor3"] = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941)
	}
	local v28 = { (v_u_3.createElement("ImageLabel", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 1,
			["Visible"] = nil,
			["Image"] = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png",
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundColor3"] = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941),
			["Visible"] = p17.ImageVisible
		})) }
	local v29 = v_u_3.createElement
	local v30 = "TextLabel"
	local v31 = {
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontFace"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Text"] = nil,
		["Position"] = UDim2.new(0, 230, 0, 205)
	}
	local v32
	if v_u_6 then
		v32 = nil
	else
		v32 = v_u_11.LightFont
	end
	v31.Font = v32
	local v33
	if v_u_6 then
		v33 = v_u_5(v_u_11.LightFont)
	else
		v33 = nil
	end
	v31.FontFace = v33
	v31.FontSize = v_u_11.HeaderSize
	v31.TextColor3 = v_u_11.WhiteTextColor
	v31.TextXAlignment = Enum.TextXAlignment.Left
	v31.Text = v_u_12:LocStringUA("Xbox.Old.ScreenSizeWord")
	v28.Title = v29(v30, v31)
	local v34 = v_u_3.createElement
	local v35 = "TextLabel"
	local v36 = {
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontFace"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Text"] = nil,
		["Position"] = UDim2.new(0, 230, 0, 243)
	}
	local v37
	if v_u_6 then
		v37 = nil
	else
		v37 = v_u_11.RegularFont
	end
	v36.Font = v37
	local v38
	if v_u_6 then
		v38 = v_u_5(v_u_11.RegularFont)
	else
		v38 = nil
	end
	v36.FontFace = v38
	v36.FontSize = v_u_11.ButtonSize
	v36.TextColor3 = v_u_11.WhiteTextColor
	v36.TextXAlignment = Enum.TextXAlignment.Left
	v36.Text = v_u_12:LocStringUA("Xbox.Old.ResizeScreenPrompt")
	v28.Prompt = v34(v35, v36)
	v28.Controller = v_u_3.createElement(v_u_15)
	v28.Actions = v_u_3.createElement("Frame", {
		["Size"] = UDim2.fromScale(0.4, 0),
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Position"] = UDim2.new(0.5, 0, 1, -201)
	}, { v_u_3.createElement(v_u_7, {
			["buttonHeight"] = v22.buttonHeight,
			["marginBetween"] = v22.marginBetween,
			["forcedFillDirection"] = Enum.FillDirection.Horizontal,
			["buttons"] = {
				{
					["buttonType"] = v_u_8.Secondary,
					["props"] = {
						["text"] = v20.cancel,
						["fontStyle"] = v23.Font.Header1,
						["onActivated"] = v19
					}
				},
				{
					["buttonType"] = v_u_8.PrimarySystem,
					["props"] = {
						["text"] = v20.accept,
						["fontStyle"] = v23.Font.Header1,
						["onActivated"] = function() -- name: onActivated
							-- upvalues: (copy) v_u_24
							if v_u_24.current then
								v_u_24.current.onAccept()
							end
						end
					}
				}
			}
		}) })
	v28.EdgeSelector = v_u_3.createElement(v_u_16, {
		["onSetEdges"] = v19,
		["ref"] = v_u_24
	})
	return v25(v26, v27, v28)
end