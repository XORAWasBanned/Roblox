-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotReviewDialog
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.Utility.normalizeFontFace
local v_u_5 = v3.Utility.Flags.FoundationFontFaceMigration
local v_u_6 = require(v1.Packages.React)
local v_u_7 = v2.App.Button.ButtonStack
local v_u_8 = v2.App.Button.Enum.ButtonType
local v_u_9 = v2.App.Bar.HeaderBar
local v_u_10 = v2.App.Button.IconButton
local v_u_11 = v2.App.ImageSet.Enum.IconSize
local v_u_12 = v2.Core.ImageSet.ImageSetButton
local v_u_13 = v2.App.ImageSet.Images
local v_u_14 = v2.Core.Style.useStyle
local v_u_15 = v2.App.Button.Button
local v_u_16 = v2.App.Button.Enum.StandardButtonSize
local v17 = script.Parent.Parent
local v_u_18 = require(v17.Resources.Assets)
local v_u_19 = require(v17.Components.Divider)
local v_u_20 = require(v17.Components.RestartScreenshotDialog)
require(v17.Utility.ReportAnythingAnalytics)
local v_u_21 = require(v1.Workspace.Packages.Responsive)
local v_u_22 = v_u_21.usePreferredInput
local v23 = require(v1.Workspace.Packages.FocusNavigationUtils)
local v_u_24 = v23.FocusRoot
local v_u_25 = v23.FocusNavigableSurfaceIdentifierEnum
local v_u_26 = require(v1.Workspace.Packages.RobloxTranslator)
local function v_u_36(p_u_27) -- name: ScreenshotReviewDialogSmallPortraitModeHeaderRight
	-- upvalues: (copy) v_u_6, (copy) v_u_26, (copy) v_u_15, (copy) v_u_8, (copy) v_u_16
	local v28, v_u_29 = v_u_6.useState(0)
	local v31 = v_u_6.useCallback(function(p30)
		-- upvalues: (copy) v_u_29
		v_u_29(p30.AbsoluteSize.X)
	end, { v_u_29 })
	local v32 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_27
		p_u_27.setShowRestartDialog(true)
	end, { p_u_27.setShowRestartDialog })
	local v33 = v_u_6.createElement
	local v34 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v35 = {
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Text"] = v_u_6.createElement("TextLabel", {
			["LayoutOrder"] = -1,
			["Text"] = nil,
			["Font"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = 20,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = v_u_26:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"),
			["Font"] = p_u_27.font.Header2.Font,
			["TextColor3"] = p_u_27.theme.TextEmphasis.Color,
			["TextTransparency"] = p_u_27.theme.TextEmphasis.Transparency,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["Size"] = UDim2.new(0, p_u_27.viewportUISafeAreaWidth - v28 - 50, 1, 0)
		}),
		["RetakeButton"] = v_u_6.createElement(v_u_15, {
			["buttonType"] = v_u_8.Secondary,
			["text"] = v_u_26:FormatByKey("Feature.ReportAbuse.Action.Retake"),
			["fitContent"] = true,
			["standardSize"] = v_u_16.XSmall,
			["onActivated"] = v32,
			[v_u_6.Change.AbsoluteSize] = v31
		})
	}
	return v33("Frame", v34, v35)
end
return function(p_u_37) -- name: ScreenshotReviewDialog
	-- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_26, (copy) v_u_6, (copy) v_u_14, (copy) v_u_24, (copy) v_u_25, (copy) v_u_20, (copy) v_u_12, (copy) v_u_18, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_13, (copy) v_u_36, (copy) v_u_15, (copy) v_u_8, (copy) v_u_16, (copy) v_u_19, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v38 = v_u_22() == v_u_21.Input.Directional
	if not v_u_26 then
		return nil
	end
	local v39 = p_u_37.isSmallPortraitMode and 104 or 60
	local v_u_40 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_37
		p_u_37.reportAnythingAnalytics.incrementPreviewBack()
		p_u_37.onBack()
	end, { p_u_37.onBack, p_u_37.reportAnythingAnalytics })
	local v41 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_37
		p_u_37.reportAnythingAnalytics.incrementPreviewAttach()
		p_u_37.onSkip()
	end, { p_u_37.onSkip, p_u_37.reportAnythingAnalytics })
	local v42, v_u_43 = v_u_6.useState(false)
	local v_u_44 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_37, (copy) v_u_43
		p_u_37.reportAnythingAnalytics.incrementRetake()
		v_u_43(true)
	end, { v_u_43, p_u_37.reportAnythingAnalytics })
	local v45 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_37
		p_u_37.reportAnythingAnalytics.setRetakeAbandon()
		p_u_37.onRestart()
	end, { p_u_37.onRestart, p_u_37.reportAnythingAnalytics })
	local v46 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_37
		p_u_37.reportAnythingAnalytics.incrementHighlightScene()
		p_u_37.onNextPage()
	end, { p_u_37.onNextPage, p_u_37.reportAnythingAnalytics })
	local v47 = v_u_14()
	local v_u_48 = v47.Theme
	local v_u_49 = v47.Font
	local v50
	if p_u_37.viewportUISafeAreaHeight >= 800 then
		v50 = UDim2.new(0, 800, 0, 800)
	else
		v50 = UDim2.new(1, 0, 1, 0)
	end
	local v51 = v_u_6.createElement
	local v52 = "TextButton"
	local v53 = {
		["Selectable"] = false,
		["AutoButtonColor"] = false,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = v_u_48.Overlay.Color,
		["BackgroundTransparency"] = v_u_48.Overlay.Transparency,
		["Size"] = UDim2.fromScale(1, 1),
		["ZIndex"] = 10,
		["Text"] = "",
		[v_u_6.Event.Activated] = v_u_40
	}
	local v54 = {}
	local v55 = v_u_6.createElement
	local v56 = "Frame"
	local v57 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["ZIndex"] = 10
	}
	if p_u_37.isSmallPortraitMode then
		v50 = UDim2.new(1, 0, 1, 0)
	end
	v57.Size = v50
	v57.Position = UDim2.fromScale(0.5, 0.5)
	v57.AnchorPoint = Vector2.new(0.5, 0.5)
	v57.BackgroundColor3 = v_u_48.Overlay.Color
	local v58 = {}
	local v59
	if v42 then
		v59 = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["FocusNavigationCoreScriptsWrapper"] = v_u_6.createElement(v_u_24, {
				["surfaceIdentifier"] = nil,
				["isIsolated"] = true,
				["isAutoFocusRoot"] = true,
				["surfaceIdentifier"] = v_u_25.CentralOverlay
			}, {
				["DialogBody"] = v_u_6.createElement(v_u_20, {
					["ZIndex"] = 3,
					["isSmallPortraitMode"] = nil,
					["onCancel"] = nil,
					["onRestart"] = nil,
					["isSmallPortraitMode"] = p_u_37.isSmallPortraitMode,
					["onCancel"] = function() -- name: onCancel
						-- upvalues: (copy) v_u_43
						v_u_43(false)
					end,
					["onRestart"] = v45
				})
			})
		})
	else
		v59 = v42
	end
	v58.RestartDialog = v59
	if v42 then
		v42 = v_u_6.createElement(v_u_12, {
			["Size"] = nil,
			["BackgroundTransparency"] = 0.2,
			["BackgroundColor3"] = nil,
			["Active"] = true,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = 1,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = v_u_48.BackgroundUIDefault.Color,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Image"] = v_u_18.Images.RoundedRect.Image,
			["ImageColor3"] = v_u_48.BackgroundUIDefault.Color,
			["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
			["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter
		}, {})
	end
	v58.RestartDialogMask = v42
	local v60 = v_u_6.createElement
	local v61 = v_u_12
	local v62 = {
		["Active"] = true,
		["Selectable"] = false,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Image"] = v_u_18.Images.RoundedRect.Image,
		["ImageColor3"] = v_u_48.BackgroundUIDefault.Color,
		["ImageTransparency"] = v_u_48.BackgroundUIDefault.Transparency,
		["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
		["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter
	}
	local v63 = {
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v64 = v_u_6.createElement
	local v65 = "Frame"
	local v66 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, -v39)
	}
	local v67 = {
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v68 = v_u_6.createElement
	local v69 = "Frame"
	local v70 = {
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["BackgroundColor3"] = Color3.fromHex("#4F545F"),
		["Size"] = UDim2.new(1, 0, 0, 48)
	}
	local v71 = {}
	local v72 = v_u_6.createElement
	local v73 = v_u_9
	local v74 = {
		["backgroundTransparency"] = 1,
		["barHeight"] = 48,
		["margin"] = 12,
		["renderLeft"] = nil,
		["renderRight"] = nil,
		["title"] = nil,
		["isSecondary"] = nil,
		["renderLeft"] = function() -- name: renderLeft
			-- upvalues: (ref) v_u_6, (ref) v_u_10, (ref) v_u_11, (ref) v_u_13, (copy) v_u_40
			return v_u_6.createElement(v_u_10, {
				["iconSize"] = v_u_11.Medium,
				["icon"] = v_u_13["icons/navigation/pushBack"],
				["onActivated"] = v_u_40
			})
		end,
		["renderRight"] = function() -- name: renderRight
			-- upvalues: (copy) p_u_37, (ref) v_u_6, (ref) v_u_36, (copy) v_u_44, (copy) v_u_49, (copy) v_u_48, (ref) v_u_15, (ref) v_u_8, (ref) v_u_26, (ref) v_u_16
			if p_u_37.isSmallPortraitMode then
				return v_u_6.createElement(v_u_36, {
					["onActivated"] = v_u_44,
					["font"] = v_u_49,
					["theme"] = v_u_48,
					["viewportUISafeAreaWidth"] = p_u_37.viewportUISafeAreaWidth
				})
			else
				return v_u_6.createElement(v_u_15, {
					["buttonType"] = nil,
					["text"] = nil,
					["fitContent"] = true,
					["standardSize"] = nil,
					["onActivated"] = nil,
					["buttonType"] = v_u_8.Secondary,
					["text"] = v_u_26:FormatByKey("Feature.ReportAbuse.Action.Retake"),
					["standardSize"] = v_u_16.XSmall,
					["onActivated"] = v_u_44
				})
			end
		end
	}
	local v75
	if p_u_37.isSmallPortraitMode then
		v75 = nil
	else
		v75 = v_u_26:FormatByKey("Feature.SettingsHub.Label.SceneCaptured")
	end
	v74.title = v75
	v74.isSecondary = p_u_37.isSmallPortraitMode
	v71.Bar = v72(v73, v74)
	v67.Header = v68(v69, v70, v71)
	v67.Divider = v_u_6.createElement(v_u_19, {
		["LayoutOrder"] = 2
	})
	local v76 = v_u_6.createElement
	local v77 = "Frame"
	local v78 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = nil,
		["ZIndex"] = 10,
		["Size"] = UDim2.new(1, 0, 1, -60)
	}
	local v79 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 16)
		}),
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v80 = v_u_6.createElement
	local v81 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 2,
		["LayoutOrder"] = 1,
		["Size"] = UDim2.new(1, 0, 1, -32)
	}
	local v82 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingBottom"] = UDim.new(0, 12),
			["PaddingLeft"] = UDim.new(0, 16),
			["PaddingRight"] = UDim.new(0, 16)
		}),
		["Screenshot"] = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BorderSizePixel"] = 2,
			["BorderMode"] = nil,
			["BorderColor3"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["BorderMode"] = Enum.BorderMode.Outline,
			["BorderColor3"] = Color3.fromRGB(255, 255, 255)
		}, {
			["UIAspectRatioConstraint"] = v_u_6.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = p_u_37.imageAspectRatio
			}),
			["ScreenshotImage"] = v_u_6.createElement(v_u_12, {
				["Active"] = true,
				["Selectable"] = not v38,
				["Size"] = UDim2.fromScale(1, 1),
				["Image"] = p_u_37.screenshot,
				["ZIndex"] = 1,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["BackgroundTransparency"] = 1,
				["ScaleType"] = Enum.ScaleType.Fit,
				["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter,
				[v_u_6.Event.Activated] = v46
			})
		})
	}
	v79.ScreenshotContainer = v80("Frame", v81, v82)
	local v83 = v_u_6.createElement
	local v84 = "TextLabel"
	local v85 = {
		["Text"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["LayoutOrder"] = 2,
		["TextColor3"] = nil,
		["TextTransparency"] = nil,
		["TextSize"] = nil,
		["TextXAlignment"] = nil,
		["TextWrapped"] = true,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = v_u_26:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene")
	}
	local v86
	if v_u_5 then
		v86 = nil
	else
		v86 = v_u_49.Header1.Font
	end
	v85.Font = v86
	local v87
	if v_u_5 then
		v87 = v_u_4(v47.Tokens.Typography.HeadingSmall.Font)
	else
		v87 = nil
	end
	v85.FontFace = v87
	v85.TextColor3 = v_u_48.TextEmphasis.Color
	v85.TextTransparency = v_u_48.TextEmphasis.Transparency
	v85.TextSize = p_u_37.isSmallPortraitMode and 12 or 20
	v85.TextXAlignment = Enum.TextXAlignment.Center
	v85.Size = UDim2.new(1, -24, 0, p_u_37.isSmallPortraitMode and 24 or 40)
	v79.Description = v83(v84, v85)
	v67.ScreenshotBody = v76(v77, v78, v79)
	v63.HeaderAndContent = v64(v65, v66, v67)
	local v88 = v_u_6.createElement
	local v89 = "Frame"
	local v90 = {
		["BackgroundTransparency"] = 0,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, 0, 0, v39),
		["BackgroundColor3"] = Color3.fromHex("#4F545F"),
		["AnchorPoint"] = Vector2.new(0, 1),
		["Position"] = UDim2.fromScale(0, 1)
	}
	local v91 = {
		["Layout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		})
	}
	local v92 = v_u_6.createElement
	local v93 = "Frame"
	local v94 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1
	}
	local v95
	if p_u_37.isSmallPortraitMode then
		v95 = UDim2.new(1, 0, 1, 0)
	else
		v95 = UDim2.new(0, p_u_37.isSmallPortraitMode and 400 or 612, 1, 0)
	end
	v94.Size = v95
	local v96 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingBottom"] = UDim.new(0, 12),
			["PaddingLeft"] = UDim.new(0, 16),
			["PaddingRight"] = UDim.new(0, 16)
		})
	}
	local v97 = v_u_6.createElement
	local v98 = v_u_7
	local v99 = {
		["forcedFillDirection"] = nil,
		["marginBetween"] = 8,
		["buttons"] = nil
	}
	local v100
	if p_u_37.isSmallPortraitMode then
		v100 = Enum.FillDirection.Vertical
	else
		v100 = nil
	end
	v99.forcedFillDirection = v100
	v99.buttons = {
		{
			["buttonType"] = v_u_8.Secondary,
			["props"] = {
				["onActivated"] = v41,
				["text"] = v_u_26:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
			}
		},
		not v38 and {
			["buttonType"] = v_u_8.PrimarySystem,
			["props"] = {
				["onActivated"] = v46,
				["text"] = v_u_26:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
			}
		} or nil
	}
	v96.ActionButtons = v97(v98, v99)
	v91.Container = v92(v93, v94, v96)
	v63.Footer = v88(v89, v90, v91)
	v58.ScreenshotDialog = v60(v61, v62, v63)
	v54.Container = v55(v56, v57, v58)
	return v51(v52, v53, v54)
end