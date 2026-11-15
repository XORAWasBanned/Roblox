-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotDialogPortraitModeHeader
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.Utility.normalizeFontFace
local v_u_5 = v3.Utility.Flags.FoundationFontFaceMigration
local v_u_6 = require(v1.Packages.React)
local v_u_7 = v2.App.Bar.HeaderBar
local v_u_8 = v2.App.Button.IconButton
local v_u_9 = v2.App.ImageSet.Enum.IconSize
local v_u_10 = v2.App.ImageSet.Images
local v_u_11 = v2.Style.withStyle
return function(p12) -- name: ScreenshotDialogPortraitModeHeader
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_5, (copy) v_u_4
	local v13 = p12.isRedoEnabled or p12.isUndoEnabled
	local v14 = v_u_6.createElement
	local v15 = "Frame"
	local v16 = {
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["ZIndex"] = 2,
		["BackgroundColor3"] = Color3.fromHex("#4F545F"),
		["Size"] = UDim2.new(1, 0, 0, 48)
	}
	local v17 = {}
	local v18 = v_u_6.createElement
	local v19 = v_u_7
	local v20 = {
		["backgroundTransparency"] = 1,
		["barHeight"] = 48,
		["margin"] = 12,
		["renderLeft"] = nil,
		["renderRight"] = nil,
		["renderCenter"] = nil,
		["isSecondary"] = true
	}
	local v_u_21 = p12.backAction
	local _ = p12.isRedoEnabled
	local _ = p12.isUndoEnabled
	function v20.renderLeft()
		-- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (copy) v_u_21
		local v22 = v_u_6.createElement
		local v23 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(0, 30, 1, 0)
		}
		local v24 = {
			["Layout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["BackButton"] = v_u_6.createElement(v_u_8, {
				["iconSize"] = nil,
				["icon"] = nil,
				["layoutOrder"] = 1,
				["onActivated"] = nil,
				["iconSize"] = v_u_9.Medium,
				["icon"] = v_u_10["icons/navigation/pushBack"],
				["onActivated"] = v_u_21
			})
		}
		return v22("Frame", v23, v24)
	end
	local v25
	if v13 then
		local _ = p12.annotationPoints
		local v_u_26 = p12.undoAnnotationPoints
		local v_u_27 = p12.redoAnnotationPoints
		local v_u_28 = p12.isUndoEnabled
		local v_u_29 = p12.isRedoEnabled
		v25 = function()
			-- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (copy) v_u_28, (copy) v_u_26, (copy) v_u_29, (copy) v_u_27
			local v30 = v_u_6.createElement
			local v31 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.new(0, 60, 1, 0)
			}
			local v32 = {
				["Layout"] = v_u_6.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}),
				["UndoButton"] = v_u_6.createElement(v_u_8, {
					["iconSize"] = nil,
					["icon"] = nil,
					["isDisabled"] = nil,
					["layoutOrder"] = 1,
					["onActivated"] = nil,
					["iconSize"] = v_u_9.Medium,
					["icon"] = v_u_10["icons/actions/edit/undo"],
					["isDisabled"] = not v_u_28,
					["onActivated"] = v_u_26
				}),
				["RedoButton"] = v_u_6.createElement(v_u_8, {
					["iconSize"] = nil,
					["icon"] = nil,
					["isDisabled"] = nil,
					["layoutOrder"] = 2,
					["onActivated"] = nil,
					["iconSize"] = v_u_9.Medium,
					["icon"] = v_u_10["icons/actions/edit/redo"],
					["isDisabled"] = not v_u_29,
					["onActivated"] = v_u_27
				})
			}
			return v30("Frame", v31, v32)
		end
	else
		v25 = function() end
	end
	v20.renderRight = v25
	local v_u_33 = p12.titleText
	function v20.renderCenter()
		-- upvalues: (ref) v_u_11, (ref) v_u_6, (copy) v_u_33, (ref) v_u_5, (ref) v_u_4
		return v_u_11(function(p34)
			-- upvalues: (ref) v_u_6, (ref) v_u_33, (ref) v_u_5, (ref) v_u_4
			local v35 = game.Workspace.CurrentCamera
			local v36 = v35 == nil and 300 or v35.ViewportSize.X - 150
			local v37 = p34.Theme
			local v38 = p34.Font
			local v39 = v_u_6.createElement
			local v40 = "TextLabel"
			local v41 = {
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
				["Text"] = v_u_33
			}
			local v42
			if v_u_5 then
				v42 = nil
			else
				v42 = v38.Header2.Font
			end
			v41.Font = v42
			local v43
			if v_u_5 then
				v43 = v_u_4(p34.Tokens.Typography.TitleLarge.Font)
			else
				v43 = nil
			end
			v41.FontFace = v43
			v41.TextColor3 = v37.TextEmphasis.Color
			v41.TextTransparency = v37.TextEmphasis.Transparency
			v41.TextXAlignment = Enum.TextXAlignment.Center
			v41.TextYAlignment = Enum.TextYAlignment.Center
			v41.Size = UDim2.new(0, v36, 1, 0)
			return v39(v40, v41)
		end)
	end
	v17.Bar = v18(v19, v20)
	return v14(v15, v16, v17)
end