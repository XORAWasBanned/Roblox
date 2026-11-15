-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.RestartScreenshotDialog
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.Utility.normalizeFontFace
local v_u_5 = v3.Utility.Flags.FoundationFontFaceMigration
local v_u_6 = require(v1.Packages.React)
local v_u_7 = v2.App.Button.ButtonStack
local v_u_8 = v2.App.Button.Enum.ButtonType
local v_u_9 = v2.App.Bar.HeaderBar
local v_u_10 = v2.Core.Style.useStyle
local v11 = script.Parent.Parent
local v_u_12 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_13 = require(v11.Components.Divider)
return function(p14) -- name: RestartScreenshotDialog
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_12, (copy) v_u_13, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8
	local v15 = v_u_10()
	local v16 = v15.Theme
	local v17 = v15.Font
	local v18, v19, v20
	if p14.isSmallPortraitMode then
		v18 = 100
		v19 = 260
		v20 = 84
	else
		v18 = 50
		v19 = 180
		v20 = 48
	end
	local v21 = p14.isSmallPortraitMode and 343 or 480
	local v22 = v_u_6.createElement
	local v23 = "Frame"
	local v24 = {
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["ZIndex"] = 5,
		["Size"] = UDim2.new(0, v21, 0, v19),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = Color3.fromHex("#4F545F")
	}
	local v25 = {
		["Corner"] = v_u_6.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 8)
		})
	}
	local v26 = v_u_6.createElement
	local v27 = "Frame"
	local v28 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v29 = {
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Header"] = v_u_6.createElement(v_u_9, {
			["backgroundTransparency"] = 1,
			["barHeight"] = 48,
			["renderLeft"] = nil,
			["renderRight"] = nil,
			["title"] = nil,
			["LayoutOrder"] = 1,
			["renderLeft"] = function() -- name: renderLeft end,
			["renderRight"] = function() -- name: renderRight end,
			["title"] = v_u_12:FormatByKey("Feature.ReportAbuse.Action.RetakeScene")
		}),
		["Divider"] = v_u_6.createElement(v_u_13, {
			["LayoutOrder"] = 2
		})
	}
	local v30 = v_u_6.createElement
	local v31 = "Frame"
	local v32 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = UDim2.new(1, 0, 1, -v20 - 1)
	}
	local v33 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 8),
			["PaddingBottom"] = UDim.new(0, 8),
			["PaddingLeft"] = UDim.new(0, 16),
			["PaddingRight"] = UDim.new(0, 16)
		})
	}
	local v34 = v_u_6.createElement
	local v35 = "TextLabel"
	local v36 = {
		["Text"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["LayoutOrder"] = 3,
		["TextColor3"] = nil,
		["TextTransparency"] = nil,
		["TextSize"] = 16,
		["TextWrapped"] = true,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = v_u_12:FormatByKey("Feature.ReportAbuse.Message.RetakeScene")
	}
	local v37
	if v_u_5 then
		v37 = nil
	else
		v37 = v17.Body.Font
	end
	v36.Font = v37
	local v38
	if v_u_5 then
		v38 = v_u_4(v15.Tokens.Typography.BodyLarge.Font)
	else
		v38 = nil
	end
	v36.FontFace = v38
	v36.TextColor3 = v16.TextEmphasis.Color
	v36.TextTransparency = v16.TextEmphasis.Transparency
	v36.TextXAlignment = Enum.TextXAlignment.Left
	v36.TextYAlignment = Enum.TextYAlignment.Top
	v36.Size = UDim2.new(1, 0, 0, v18)
	v33.TextBody = v34(v35, v36)
	v29.Description = v30(v31, v32, v33)
	v25.HeaderAndContent = v26(v27, v28, v29)
	local v39 = v_u_6.createElement
	local v40 = "Frame"
	local v41 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, 0, 0, v20),
		["Position"] = UDim2.new(0, 0, 1, -v20)
	}
	local v42 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 6),
			["PaddingBottom"] = UDim.new(0, 6),
			["PaddingLeft"] = UDim.new(0, 16),
			["PaddingRight"] = UDim.new(0, 16)
		})
	}
	local v43 = v_u_6.createElement
	local v44 = v_u_7
	local v45 = {}
	local v46
	if p14.isSmallPortraitMode then
		v46 = Enum.FillDirection.Vertical
	else
		v46 = Enum.FillDirection.Horizontal
	end
	v45.forcedFillDirection = v46
	local v47 = {}
	local v48 = {
		["buttonType"] = v_u_8.Secondary
	}
	local v49
	if p14.isSmallPortraitMode then
		v49 = {
			["onActivated"] = p14.onCancel,
			["text"] = v_u_12:FormatByKey("InGame.InspectMenu.Action.Cancel"),
			["size"] = UDim2.new(1, 0, 0, 28),
			["fontStyle"] = v17.Body2
		}
	else
		v49 = {
			["onActivated"] = p14.onCancel,
			["text"] = v_u_12:FormatByKey("InGame.InspectMenu.Action.Cancel")
		}
	end
	v48.props = v49
	local v50 = {
		["buttonType"] = v_u_8.PrimarySystem
	}
	local v51
	if p14.isSmallPortraitMode then
		v51 = {
			["onActivated"] = p14.onRestart,
			["text"] = v_u_12:FormatByKey("Feature.ReportAbuse.Action.BackToExperience"),
			["size"] = UDim2.new(1, 0, 0, 28),
			["fontStyle"] = v17.Body2
		}
	else
		v51 = {
			["onActivated"] = p14.onRestart,
			["text"] = v_u_12:FormatByKey("Feature.ReportAbuse.Action.BackToExperience")
		}
	end
	v50.props = v51
	__set_list(v47, 1, {v48, v50})
	v45.buttons = v47
	v42.ActionButtons = v43(v44, v45)
	v25.Footer = v39(v40, v41, v42)
	return v22(v23, v24, v25)
end