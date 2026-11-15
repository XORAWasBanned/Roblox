-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotDialogLandscapeModeHeader
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.Utility.normalizeFontFace
local v_u_5 = v3.Utility.Flags.FoundationFontFaceMigration
local v_u_6 = require(v1.Packages.React)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_8 = v2.App.Button.ButtonStack
local v_u_9 = v2.App.Button.Enum.ButtonType
local v_u_10 = v2.App.Bar.HeaderBar
local v_u_11 = v2.App.Button.IconButton
local v_u_12 = v2.App.ImageSet.Enum.IconSize
local v_u_13 = v2.App.ImageSet.Images
local v_u_14 = v2.Style.withStyle
return function(p15) -- name: LandscapeModeHeader
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_14, (copy) v_u_5, (copy) v_u_4
	local v16 = v_u_6.createElement
	local v17 = {
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["ZIndex"] = 2,
		["BackgroundColor3"] = Color3.fromHex("#4F545F"),
		["Size"] = UDim2.new(1, 0, 0, 47)
	}
	local v18 = {}
	local v19 = v_u_6.createElement
	local v20 = v_u_10
	local v21 = {
		["backgroundTransparency"] = 1,
		["barHeight"] = 48,
		["renderLeft"] = nil,
		["renderRight"] = nil,
		["renderCenter"] = nil
	}
	local v_u_22 = p15.backAction
	local v_u_23 = p15.undoAnnotationPoints
	local v_u_24 = p15.redoAnnotationPoints
	local v_u_25 = p15.isRedoEnabled
	local v_u_26 = p15.isUndoEnabled
	local v_u_27 = v_u_25 or v_u_26
	function v21.renderLeft()
		-- upvalues: (ref) v_u_6, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (copy) v_u_22, (copy) v_u_27, (copy) v_u_26, (copy) v_u_23, (copy) v_u_25, (copy) v_u_24
		local v28 = v_u_6.createElement
		local v29 = "Frame"
		local v30 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(0, 120, 1, 0)
		}
		local v31 = {
			["Layout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["BackButton"] = v_u_6.createElement(v_u_11, {
				["iconSize"] = nil,
				["icon"] = nil,
				["layoutOrder"] = 1,
				["onActivated"] = nil,
				["iconSize"] = v_u_12.Medium,
				["icon"] = v_u_13["icons/navigation/pushBack"],
				["onActivated"] = v_u_22
			})
		}
		local v32 = v_u_27
		if v32 then
			v32 = v_u_6.createElement(v_u_11, {
				["iconSize"] = nil,
				["icon"] = nil,
				["isDisabled"] = nil,
				["layoutOrder"] = 2,
				["onActivated"] = nil,
				["iconSize"] = v_u_12.Medium,
				["icon"] = v_u_13["icons/actions/edit/undo"],
				["isDisabled"] = not v_u_26,
				["onActivated"] = v_u_23
			})
		end
		v31.UndoButton = v32
		local v33 = v_u_27
		if v33 then
			v33 = v_u_6.createElement(v_u_11, {
				["iconSize"] = nil,
				["icon"] = nil,
				["isDisabled"] = nil,
				["layoutOrder"] = 3,
				["onActivated"] = nil,
				["iconSize"] = v_u_12.Medium,
				["icon"] = v_u_13["icons/actions/edit/redo"],
				["isDisabled"] = not v_u_25,
				["onActivated"] = v_u_24
			})
		end
		v31.RedoButton = v33
		return v28(v29, v30, v31)
	end
	local v_u_34 = p15.finishAnnotationAction
	local v_u_35 = p15.annotationPoints
	function v21.renderRight()
		-- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_9, (copy) v_u_34, (copy) v_u_35, (ref) v_u_7
		local v36 = v_u_6.createElement
		local v37 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(0, 144, 1, 0)
		}
		local v38 = {
			["Layout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			})
		}
		local v39 = v_u_6.createElement
		local v40 = v_u_8
		local v41 = {}
		local v42 = {}
		local v43 = {
			["buttonType"] = v_u_9.PrimarySystem,
			["props"] = {
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (ref) v_u_34, (ref) v_u_35
					v_u_34(v_u_35)
				end,
				["text"] = v_u_7:FormatByKey("Feature.ReportAbuse.Action.Next")
			}
		}
		__set_list(v42, 1, {v43})
		v41.buttons = v42
		v38.Buttons = v39(v40, v41)
		return v36("Frame", v37, v38)
	end
	local v_u_44 = p15.titleText
	function v21.renderCenter()
		-- upvalues: (ref) v_u_14, (ref) v_u_6, (copy) v_u_44, (ref) v_u_5, (ref) v_u_4
		return v_u_14(function(p45)
			-- upvalues: (ref) v_u_6, (ref) v_u_44, (ref) v_u_5, (ref) v_u_4
			local v46 = p45.Theme
			local v47 = p45.Font
			local v48 = v_u_6.createElement
			local v49 = "TextLabel"
			local v50 = {
				["Text"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextSize"] = 20,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = v_u_44
			}
			local v51
			if v_u_5 then
				v51 = nil
			else
				v51 = v47.Header2.Font
			end
			v50.Font = v51
			local v52
			if v_u_5 then
				v52 = v_u_4(p45.Tokens.Typography.TitleLarge.Font)
			else
				v52 = nil
			end
			v50.FontFace = v52
			v50.TextColor3 = v46.TextEmphasis.Color
			v50.TextTransparency = v46.TextEmphasis.Transparency
			v50.TextXAlignment = Enum.TextXAlignment.Center
			v50.TextYAlignment = Enum.TextYAlignment.Center
			v50.Size = UDim2.new(1, 0, 1, 0)
			return v48(v49, v50)
		end)
	end
	v18.Bar = v19(v20, v21)
	return v16("Frame", v17, v18)
end