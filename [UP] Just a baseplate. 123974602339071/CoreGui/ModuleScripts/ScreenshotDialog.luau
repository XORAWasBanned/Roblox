-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotDialog
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = v2.Core.ImageSet.ImageSetButton
local v_u_6 = v2.Core.Style.useStyle
local v_u_7 = v2.App.Button.ButtonStack
local v_u_8 = v2.App.Button.Enum.ButtonType
local v9 = script.Parent.Parent
local v_u_10 = require(v9.Resources.Assets)
local v_u_11 = require(v9.Components.Divider)
local v_u_12 = require(v9.Components.ScreenshotHighlighter)
local v_u_13 = require(v9.Utility.VirtualKeyboardMonitor)
local v_u_14 = require(v9.Components.ScreenshotDialogPortraitModeHeader)
local v_u_15 = require(v9.Components.ScreenshotDialogLandscapeModeHeader)
require(v9.Utility.ReportAnythingAnalytics)
local v_u_16 = require(v1.Workspace.Packages.RobloxTranslator)
local function v_u_29(p_u_17) -- name: PortraitModeFooter
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_16
	local v18 = v_u_3.createElement
	local v19 = {
		["BackgroundTransparency"] = 0,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, 0, 0, 60),
		["BackgroundColor3"] = Color3.fromHex("#4F545F"),
		["AnchorPoint"] = Vector2.new(0, 1),
		["Position"] = UDim2.fromScale(0, 1)
	}
	local v20 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		})
	}
	local v21 = v_u_3.createElement
	local v22 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, 400, 1, 0)
	}
	local v23 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingBottom"] = UDim.new(0, 12),
			["PaddingLeft"] = UDim.new(0, 32),
			["PaddingRight"] = UDim.new(0, 32)
		})
	}
	local v24 = v_u_3.createElement
	local v25 = v_u_7
	local v26 = {
		["marginBetween"] = 8,
		["buttons"] = nil
	}
	local v27 = {}
	local v28 = {
		["buttonType"] = v_u_8.PrimarySystem,
		["props"] = {
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_17
				p_u_17.finishAnnotationAction(p_u_17.annotationPoints)
			end,
			["text"] = v_u_16:FormatByKey("Feature.ReportAbuse.Action.Next")
		}
	}
	__set_list(v27, 1, {v28})
	v26.buttons = v27
	v23.ActionButtons = v24(v25, v26)
	v20.Container = v21("Frame", v22, v23)
	return v18("Frame", v19, v20)
end
return function(p_u_30) -- name: ScreenshotDialog
	-- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_10, (copy) v_u_14, (copy) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_29
	local v31 = v_u_6().Theme
	local v_u_32 = v_u_13.getInstance()
	local v_u_33, v_u_34 = v_u_3.useState(v_u_4.Dictionary.join({}, p_u_30.initialAnnotationPoints or {}))
	local v_u_35, v_u_36 = v_u_3.useState({})
	local v_u_37 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_34, (copy) v_u_33
		v_u_34(table.clone(v_u_33))
	end, { v_u_34, v_u_33 })
	local v38 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_30
		p_u_30.reportAnythingAnalytics.incrementAnnotationBack()
		p_u_30.backAction()
	end, { p_u_30.backAction, p_u_30.reportAnythingAnalytics })
	local v39 = v_u_3.useCallback(function(_)
		-- upvalues: (copy) p_u_30, (copy) v_u_37, (copy) v_u_36
		p_u_30.reportAnythingAnalytics.incrementAnnotationPlace()
		v_u_37()
		v_u_36({})
	end, { v_u_36, v_u_37, p_u_30.reportAnythingAnalytics })
	local v42 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_33, (copy) p_u_30, (copy) v_u_35, (copy) v_u_37
		if #v_u_33 > 0 then
			p_u_30.reportAnythingAnalytics.incrementAnnotationUndo()
			local v40 = v_u_35
			local v41 = v_u_33[#v_u_33]
			table.insert(v40, 1, v41)
			table.remove(v_u_33, #v_u_33)
			v_u_37()
		end
	end, {
		v_u_37,
		v_u_33,
		v_u_35,
		p_u_30.reportAnythingAnalytics
	})
	local v45 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_35, (copy) p_u_30, (copy) v_u_33, (copy) v_u_37
		if #v_u_35 > 0 then
			p_u_30.reportAnythingAnalytics.incrementAnnotationRedo()
			local v43 = v_u_33
			local v44 = v_u_35[1]
			table.insert(v43, v44)
			table.remove(v_u_35, 1)
			v_u_37()
		end
	end, {
		v_u_37,
		v_u_33,
		v_u_35,
		p_u_30.reportAnythingAnalytics
	})
	local v47 = v_u_3.useCallback(function(p46)
		-- upvalues: (copy) p_u_30
		p_u_30.reportAnythingAnalytics.setAnnotationNext()
		p_u_30.finishAnnotationAction(p46)
	end, { p_u_30.finishAnnotationAction, p_u_30.reportAnythingAnalytics })
	local v48 = #v_u_33 > 0
	local v49 = #v_u_35 > 0
	local v50 = v_u_3.createElement
	local v51 = "TextButton"
	local v52 = {
		["AutoButtonColor"] = false,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = v31.Overlay.Color,
		["BackgroundTransparency"] = v31.Overlay.Transparency,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["ZIndex"] = 10,
		["Text"] = "",
		[v_u_3.Event.Activated] = function()
			-- upvalues: (copy) v_u_32, (copy) p_u_30
			warn("OverlayActivated")
			if not v_u_32:isKeyboardJustOff() then
				if p_u_30.dismissAction then
					warn("Menu dismissed")
					p_u_30.dismissAction()
				end
			end
		end
	}
	local v53 = {}
	local v54 = v_u_3.createElement
	local v55 = v_u_5
	local v56 = {
		["Active"] = true,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Image"] = v_u_10.Images.RoundedRect.Image,
		["ImageColor3"] = v31.BackgroundUIDefault.Color,
		["ImageTransparency"] = v31.BackgroundUIDefault.Transparency,
		["ScaleType"] = v_u_10.Images.RoundedRect.ScaleType,
		["SliceCenter"] = v_u_10.Images.RoundedRect.SliceCenter
	}
	local v57 = {}
	local v58 = v_u_3.createElement
	local v59 = "Frame"
	local v60 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, p_u_30.isSmallPortraitMode and -60 or 0)
	}
	local v61 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v62
	if p_u_30.isSmallPortraitMode then
		v62 = v_u_3.createElement(v_u_14, {
			["titleText"] = p_u_30.titleText,
			["backAction"] = v38,
			["undoAnnotationPoints"] = v42,
			["redoAnnotationPoints"] = v45,
			["isRedoEnabled"] = v49,
			["isUndoEnabled"] = v48,
			["annotationPoints"] = v_u_33
		})
	else
		v62 = v_u_3.createElement(v_u_15, {
			["titleText"] = p_u_30.titleText,
			["backAction"] = v38,
			["finishAnnotationAction"] = v47,
			["undoAnnotationPoints"] = v42,
			["redoAnnotationPoints"] = v45,
			["isRedoEnabled"] = v49,
			["isUndoEnabled"] = v48,
			["annotationPoints"] = v_u_33
		})
	end
	v61.Header = v62
	v61.Divider = v_u_3.createElement(v_u_11, {
		["LayoutOrder"] = 2
	})
	v61.ScreenshotAnnotation = v_u_3.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = nil,
		["ZIndex"] = 1,
		["Size"] = UDim2.new(1, 0, 1, -49)
	}, {
		["Container"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.fromScale(1, 1),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5)
		}, {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			}),
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 16),
				["PaddingBottom"] = UDim.new(0, 16),
				["PaddingLeft"] = UDim.new(0, 16),
				["PaddingRight"] = UDim.new(0, 16)
			}),
			["AnnotationLayer"] = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["BorderSizePixel"] = 2,
				["BorderMode"] = nil,
				["BorderColor3"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BorderMode"] = Enum.BorderMode.Outline,
				["BorderColor3"] = Color3.fromRGB(255, 255, 255)
			}, {
				["UIAspectRatioConstraint"] = v_u_3.createElement("UIAspectRatioConstraint", {
					["AspectRatio"] = p_u_30.imageAspectRatio
				}),
				["ScreenshotImage"] = v_u_3.createElement("ImageLabel", {
					["Size"] = nil,
					["Image"] = nil,
					["ScaleType"] = nil,
					["ZIndex"] = 1,
					["Size"] = UDim2.fromScale(1, 1),
					["Image"] = p_u_30.screenshot,
					["ScaleType"] = Enum.ScaleType.Fit
				}, {}),
				["Highlighter"] = v_u_3.createElement(v_u_12, {
					["annotationPoints"] = nil,
					["handleAnnotationPoints"] = nil,
					["setAnnotationCircleRadius"] = nil,
					["setAnnotationAreaDimensions"] = nil,
					["ZIndex"] = 3,
					["annotationPoints"] = v_u_33,
					["handleAnnotationPoints"] = v39,
					["setAnnotationCircleRadius"] = p_u_30.setAnnotationCircleRadius,
					["setAnnotationAreaDimensions"] = p_u_30.setAnnotationAreaDimensions
				}, {})
			})
		})
	})
	v57.HeaderAndContent = v58(v59, v60, v61)
	local v63
	if p_u_30.isSmallPortraitMode then
		v63 = v_u_3.createElement(v_u_29, {
			["finishAnnotationAction"] = v47,
			["annotationPoints"] = v_u_33
		})
	else
		v63 = nil
	end
	v57.Footer = v63
	v53.ScreenshotDialog = v54(v55, v56, v57)
	return v50(v51, v52, v53)
end