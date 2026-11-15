-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.LegacyAbuseReportMenu
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("IXPService")
local v_u_5 = game:GetService("LocalizationService")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("SafetyService")
local v8 = require(v2.Packages.Foundation)
local v_u_9 = require(v2.Packages.React)
local v_u_10 = require(v2.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_11 = require(v1.Components.ReportTypeSelector)
local v_u_12 = require(v1.Components.Constants)
local v_u_13 = v_u_12.ReportModes
local v_u_14 = v_u_12.ReportTypes
local v_u_15 = require(v1.Components.SelectInSceneReportMenu)
local v_u_16 = require(v1.Components.Containers.ReportPersonMenuItemsContainer)
local v_u_17 = require(v1.Components.Containers.ReportExperienceMenuItemsContainer)
local v_u_18 = require(v1.ReportAnything.Utility.ReportAnythingAnalytics)
local v_u_19 = require(v1.Analytics.ReportAbuseAnalytics)
local v_u_20 = require(v1.ReportAnything.Components.AnnotationModal)
local v_u_21 = require(v1.Components.ModalBasedSelectorDialogController)
local v_u_22 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_23 = require(v2.Packages.LuauPolyfill).setTimeout
local v_u_24 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_25 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_26 = require(v1.Hooks.useReportAnythingWithScreenshot)
local v_u_27 = require(v1.Utility.getMenuItemSizings)
local v_u_28 = require(v1.Reducers.analyticsReducer)
local v_u_29 = require(v1.Components.createCleanup)
local v_u_30 = v8.Hooks.useTokens
local v_u_31 = v8.Text
local v_u_32 = v8.View
local v33 = require(v2.Workspace.Packages.DsaIllegalContentReporting)
local v_u_34 = v33.isShowEUDSAIllegalContentReportingLink
local v_u_35 = v33.DSAReportLink
local v_u_36 = v33.isShowUKOSAIllegalContentReportingLink
local v_u_37 = v33.OSAReportLink
local v_u_38 = v33.isShowGenericIllegalContentReportingLink
local v_u_39 = v33.GenericReportLink
local v_u_40 = v33.getTakeItDownReportLinkVisibility
local v_u_41 = v33.TakeItDownReportLink
local v42 = require(v2.Workspace.Packages.FocusNavigationUtils)
local v_u_43 = v42.FocusRoot
local v_u_44 = v42.FocusNavigableSurfaceIdentifierEnum
local v_u_45 = require(v1.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local v_u_46 = require(v1.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local v47 = require(v2.Workspace.Packages.SharedFlags)
local v_u_48 = v47.FStringReportMenuIXPLayer
local v_u_49 = v47.FStringSelectInSceneIXPField
local v_u_50 = v47.FFlagHighlightModePreciseSelectionEnabled
local v_u_51 = require(v1.Flags.FFlagHideShortcutsOnReportDropdown)
local v_u_52 = game:DefineFastFlag("AbuseReportTabClearCapturedScreenshotOnCloseFix", false)
local v_u_53 = require(v2.Workspace.Packages.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService
local v_u_54 = game:DefineFastFlag("IEMReportScrollingFix", false)
local v_u_55 = require(v1.Flags.FFlagReportFocusNavIEMButtons)
local v_u_56 = v47.FFlagIEMTabFocusNav
local v_u_57 = v47.FFlagAddTakeItDownReportLinkToSurfaces
local v_u_58 = require(v1.Utility.isShowSelectInSceneReportMenu)
local v_u_59 = require(v2.Workspace.Packages.InGameAssetReporting).getHighlightModeVariant
local v_u_60 = require(v2.Packages.UIBlox).App.Control.SegmentedControl
local v_u_61 = { v_u_13.Classic, v_u_13.SelectInScene }
local v_u_62 = { v_u_14.Person, v_u_14.Experience }
local function v_u_169(p_u_63)
	-- upvalues: (copy) v_u_9, (copy) v_u_28, (copy) v_u_12, (copy) v_u_61, (copy) v_u_62, (copy) v_u_29, (copy) v_u_26, (copy) v_u_27, (copy) v_u_30, (copy) v_u_25, (copy) v_u_45, (copy) v_u_7, (copy) v_u_20, (copy) v_u_21, (copy) v_u_52, (copy) v_u_23, (copy) v_u_19, (copy) v_u_46, (copy) v_u_6, (copy) v_u_58, (copy) v_u_4, (copy) v_u_48, (copy) v_u_49, (copy) v_u_55, (copy) v_u_3, (copy) v_u_56, (copy) v_u_51, (copy) v_u_18, (copy) v_u_14, (copy) v_u_16, (copy) v_u_17, (copy) v_u_43, (copy) v_u_44, (copy) v_u_54, (copy) v_u_60, (copy) v_u_13, (copy) v_u_15, (copy) v_u_50, (copy) v_u_59, (copy) v_u_11, (copy) v_u_32, (copy) v_u_31, (copy) v_u_36, (copy) v_u_53, (copy) v_u_34, (copy) v_u_35, (copy) v_u_37, (copy) v_u_38, (copy) v_u_39, (copy) v_u_57, (copy) v_u_40, (copy) v_u_41
	local v_u_64, v_u_65 = v_u_9.useState(false)
	local v66, v_u_67 = v_u_9.useState(1)
	local v_u_68, v_u_69 = v_u_9.useState(1)
	local v70, v_u_71 = v_u_9.useState(nil)
	local v72, v_u_73 = v_u_9.useState(0)
	local v74, v_u_75 = v_u_9.useState(false)
	local v76, v_u_77 = v_u_9.useState(false)
	local v78, v_u_79 = v_u_9.useState(true)
	local v_u_80 = v_u_9.useRef(nil)
	local v81 = v_u_9.useRef(nil)
	local v82, v_u_83 = v_u_9.useState({
		["width"] = 0,
		["height"] = 0
	})
	local v84
	if v82.width < v82.height then
		v84 = v82.width < 700
	else
		v84 = false
	end
	local v85, v_u_86 = v_u_9.useReducer(v_u_28, v_u_12.AnalyticsInitialState)
	local v87 = v_u_61[v66]
	local v88 = v_u_62[v_u_68]
	local v89 = v_u_9.useCallback(v_u_29(v85, v_u_86, v_u_71, v88), { v85, v_u_68 })
	local v_u_90, v_u_91 = v_u_26(v_u_64, p_u_63.hideReportTab, p_u_63.showReportTab, v89)
	local v92 = v_u_27()
	local v93 = v_u_30()
	local v94 = v_u_25(v_u_12.localizationKeys)
	v_u_9.useEffect(function()
		-- upvalues: (copy) p_u_63, (copy) v_u_65, (ref) v_u_45, (copy) v_u_90, (ref) v_u_7, (ref) v_u_20, (ref) v_u_21, (copy) v_u_71, (copy) v_u_73, (ref) v_u_52, (ref) v_u_23, (ref) v_u_19, (copy) v_u_91, (ref) v_u_12, (ref) v_u_46
		p_u_63.registerOnReportTabDisplayed(function()
			-- upvalues: (ref) v_u_65, (ref) v_u_45, (ref) v_u_90, (ref) v_u_7
			v_u_65(true)
			if v_u_45() and v_u_90.screenshotContentId ~= "" then
				v_u_7:ReportMenuTabOpen()
			end
		end)
		p_u_63.registerOnReportTabHidden(function()
			-- upvalues: (ref) v_u_65, (ref) v_u_20, (ref) v_u_21, (ref) v_u_45, (ref) v_u_7
			v_u_65(false)
			v_u_20.unmountAnnotationPage()
			v_u_21.unmountModalSelector()
			if v_u_45() then
				v_u_7:ReportMenuTabClose()
			end
		end)
		p_u_63.registerSetNextPlayerToReport(function(p95)
			-- upvalues: (ref) v_u_71
			v_u_71(p95)
		end)
		p_u_63.registerOnMenuWidthChange(function(p96)
			-- upvalues: (ref) v_u_73
			v_u_73(p96)
		end)
		p_u_63.registerOnSettingsHidden(function()
			-- upvalues: (ref) v_u_52, (ref) v_u_23, (ref) v_u_19, (ref) v_u_91, (ref) v_u_12, (ref) v_u_46
			if v_u_52 then
				v_u_23(function()
					-- upvalues: (ref) v_u_19, (ref) v_u_91, (ref) v_u_12
					if v_u_19:getAbuseReportSessionEntryPoint() == "" then
						v_u_91({
							["type"] = v_u_12.ReportAnythingActions.ClearAll
						})
					end
				end, v_u_46)
			elseif v_u_19:getAbuseReportSessionEntryPoint() == "" then
				v_u_91({
					["type"] = v_u_12.ReportAnythingActions.ClearAll
				})
			end
		end)
	end, { v_u_90 })
	v_u_9.useEffect(function()
		-- upvalues: (copy) v_u_64, (copy) v_u_69, (copy) v_u_67, (copy) v_u_77, (ref) v_u_6, (copy) v_u_75
		if v_u_64 then
			if #v_u_6:GetPlayers() <= 1 then
				v_u_75(true)
				v_u_69(2)
			else
				v_u_69(1)
				v_u_75(false)
			end
		else
			v_u_69(0)
			v_u_67(1)
			v_u_77(false)
			return
		end
	end, { v_u_64 })
	v_u_9.useEffect(function()
		-- upvalues: (copy) v_u_64, (copy) v_u_86, (ref) v_u_12, (ref) v_u_19, (ref) v_u_58, (ref) v_u_4, (ref) v_u_48, (ref) v_u_49, (copy) v_u_77, (copy) v_u_83
		if v_u_64 then
			local v97 = v_u_86
			local v98 = {
				["type"] = v_u_12.AnalyticsActions.SetMenuOpenedTimestamp
			}
			local v99 = workspace:GetServerTimeNow() * 1000
			v98.timestamp = math.floor(v99)
			v97(v98)
			v_u_19:startAbuseReportSession("ReportPage")
			if v_u_58(v_u_86) then
				local function v100()
					-- upvalues: (ref) v_u_4, (ref) v_u_48
					return v_u_4:GetUserLayerVariables(v_u_48)
				end
				local v101, v102 = pcall(v100)
				local v103
				if v101 and (v102 and v102[v_u_49] ~= nil) then
					v_u_4:LogUserLayerExposure(v_u_48)
					v103 = v102[v_u_49]
				else
					v103 = false
				end
				if v103 then
					v_u_77(true)
				end
			end
		end
		local v104 = game.Workspace.CurrentCamera
		if v104 ~= nil then
			local v105 = v104.ViewportSize
			v_u_83({
				["width"] = v105.X,
				["height"] = v105.Y
			})
			v_u_86({
				["type"] = v_u_12.AnalyticsActions.SetViewportInformation,
				["viewportSizeX"] = v105.X,
				["viewportSizeY"] = v105.Y
			})
		end
	end, { v_u_64, v72 })
	if v_u_55 then
		v_u_9.useEffect(function()
			-- upvalues: (copy) v_u_64, (copy) p_u_63, (ref) v_u_3, (copy) v_u_79
			if v_u_64 then
				local v106 = v_u_79
				local v107 = p_u_63.getSettingsHubRef
				if v107 then
					v107 = v107()
				end
				if v107 then
					v107 = v107.MenuContainer
				end
				local v108
				if v_u_3.SelectedCoreObject == nil or v107 == nil then
					v108 = false
				else
					v108 = v_u_3.SelectedCoreObject:IsDescendantOf(v107)
				end
				v106(not v108)
				local v_u_112 = v_u_3:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
					-- upvalues: (ref) v_u_79, (ref) p_u_63, (ref) v_u_3
					local v109 = v_u_79
					local v110 = p_u_63.getSettingsHubRef
					if v110 then
						v110 = v110()
					end
					if v110 then
						v110 = v110.MenuContainer
					end
					local v111
					if v_u_3.SelectedCoreObject == nil or v110 == nil then
						v111 = false
					else
						v111 = v_u_3.SelectedCoreObject:IsDescendantOf(v110)
					end
					v109(not v111)
				end)
				return function()
					-- upvalues: (copy) v_u_112
					v_u_112:Disconnect()
				end
			end
		end, { v_u_64, p_u_63.getSettingsHubRef })
	end
	if v_u_56 then
		v_u_9.useEffect(function()
			-- upvalues: (copy) v_u_64, (copy) v_u_80, (copy) p_u_63
			if v_u_64 then
				local v113 = nil
				if v_u_80.current then
					v113 = v_u_80.current.tabRefs and { v_u_80.current.tabRefs[1].current:FindFirstChild("Tab"), v_u_80.current.tabRefs[2].current:FindFirstChild("Tab") } or v113
				end
				if p_u_63.setFirstSelectableObjects and v113 then
					p_u_63.setFirstSelectableObjects(v113)
				end
			end
		end, {
			v_u_64,
			v_u_80,
			p_u_63.setFirstSelectableObjects,
			v76
		})
	end
	if not v_u_64 then
		return nil
	end
	local v114 = nil
	local v115 = {
		["onReportComplete"] = p_u_63.onReportComplete
	}
	local v116
	if v_u_51 then
		v116 = p_u_63.onDropdownMenuOpenChange
	else
		v116 = nil
	end
	v115.onDropdownMenuOpenChange = v116
	v115.reportAnythingAnalytics = v_u_18
	v115.reportAnythingState = v_u_90
	v115.reportAnythingDispatch = v_u_91
	v115.hideReportTab = p_u_63.hideReportTab
	v115.isReportTabVisible = v_u_64
	v115.showReportSentPage = p_u_63.showReportSentPage
	v115.analyticsState = v85
	v115.analyticsDispatch = v_u_86
	v115.preselectedPlayer = v70
	v115.setPreselectedPlayer = v_u_71
	v115.menuWidth = v72
	v115.viewportDimension = v82
	local v117
	if v_u_55 then
		v117 = p_u_63.setLastSelectableObjects
	else
		v117 = nil
	end
	v115.setLastSelectableObjects = v117
	if v88 == v_u_14.Person then
		v114 = v_u_9.createElement(v_u_16, {
			["utilityProps"] = v115,
			["isSmallPortraitViewport"] = v84
		})
	elseif v88 == v_u_14.Experience then
		v114 = v_u_9.createElement(v_u_17, {
			["utilityProps"] = v115,
			["isSmallPortraitViewport"] = v84
		})
	end
	local v118 = v_u_9.createElement
	local v119 = "Frame"
	local v120 = {
		["ref"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["ref"] = v81,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["Position"] = UDim2.new(0, 0, 0, v92.TopPadding)
	}
	local v121 = {}
	local v122 = v_u_9.createElement
	local v123 = v_u_43
	local v124 = {
		["surfaceIdentifier"] = v_u_44.RouterView,
		["frameProps"] = {
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		},
		["isIsolated"] = not v_u_54 and true or nil,
		["isAutoFocusRoot"] = not v_u_55 and true or v78,
		["shouldRestoreFocus"] = not v_u_55
	}
	local v125 = {}
	local v126 = v_u_12.AbuseReportMenuPlaceholderFrame
	local v127 = v_u_9.createElement
	local v128 = "Frame"
	local v129 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v130 = {}
	local v131 = v_u_9.createElement
	local v132 = "Frame"
	local v133 = {
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = UDim2.new(1, 0, 0, 0)
	}
	local v134 = {
		["Layout"] = v_u_9.createElement("UIListLayout", {
			["FillDirection"] = nil,
			["SortOrder"] = nil,
			["HorizontalAlignment"] = 0,
			["Padding"] = nil,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 12)
		}),
		["Padding"] = v_u_9.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v92.ItemPadding),
			["PaddingBottom"] = UDim.new(0, v92.ItemPadding)
		})
	}
	local v135
	if v76 then
		local v136 = v_u_9.createElement
		local v137 = "Frame"
		local v138 = {
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = 0,
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0)
		}
		local v139 = {}
		local v140 = v_u_9.createElement
		local v141 = v_u_60
		local v143 = {
			["onTabActivated"] = function(p142) -- name: onTabActivated
				-- upvalues: (copy) v_u_67
				v_u_67(p142)
			end,
			["selectedTabIndex"] = v66,
			["tabs"] = {
				{
					["tabName"] = v94.BuildAReport
				},
				{
					["tabName"] = v94.SelectInScene
				}
			},
			["width"] = UDim.new(0, v72)
		}
		if not v_u_56 then
			v_u_80 = nil
		end
		v143.ref = v_u_80
		v139.SelectInSceneToggle = v140(v141, v143)
		v135 = v136(v137, v138, v139)
	else
		v135 = nil
	end
	v134.SelectInSceneToggleFrame = v135
	local v144
	if v87 == v_u_13.SelectInScene then
		local v145 = v_u_9.createElement
		local v146 = v_u_15
		local v147 = {
			["hideReportTab"] = p_u_63.hideReportTab
		}
		local v148
		if v_u_50 then
			v148 = v_u_59()
		else
			v148 = nil
		end
		v147.variant = v148
		v144 = v145(v146, v147)
	elseif v87 == v_u_13.Classic then
		local v149 = v_u_9.createElement
		local v150 = "Frame"
		local v151 = {
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Size"] = UDim2.new(1, 0, 0, 0)
		}
		local v152 = {
			["Layout"] = v_u_9.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, v92.ItemPadding)
			}),
			["ReportTypeSelector"] = v_u_9.createElement(v_u_11, {
				["label"] = nil,
				["abuseType"] = nil,
				["layoutOrder"] = 0,
				["utilityProps"] = nil,
				["isSelectionDisabled"] = nil,
				["menuWidth"] = nil,
				["isSmallPortraitViewport"] = nil,
				["onClickLeft"] = nil,
				["onClickRight"] = nil,
				["label"] = v94.ReportType,
				["abuseType"] = v94[v_u_62[v_u_68]],
				["utilityProps"] = v115,
				["isSelectionDisabled"] = v74,
				["menuWidth"] = v72,
				["isSmallPortraitViewport"] = v84,
				["onClickLeft"] = function() -- name: onClickLeft
					-- upvalues: (copy) v_u_91, (ref) v_u_12, (copy) v_u_86, (copy) v_u_69, (copy) v_u_68, (ref) v_u_62
					v_u_91({
						["type"] = v_u_12.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					v_u_86({
						["type"] = v_u_12.AnalyticsActions.IncrementExperiencePersonChanged
					})
					v_u_69((v_u_68 - 1 - 1) % #v_u_62 + 1)
				end,
				["onClickRight"] = function() -- name: onClickRight
					-- upvalues: (copy) v_u_91, (ref) v_u_12, (copy) v_u_86, (copy) v_u_69, (copy) v_u_68, (ref) v_u_62
					v_u_91({
						["type"] = v_u_12.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					v_u_86({
						["type"] = v_u_12.AnalyticsActions.IncrementExperiencePersonChanged
					})
					v_u_69((v_u_68 - 1 + 1) % #v_u_62 + 1)
				end
			}),
			["MenuItemsContainer"] = v_u_9.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["AutomaticSize"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Size"] = UDim2.new(1, 0, 0, 0)
			}, {
				["MenuItems"] = v114
			})
		}
		local v153 = v_u_9.createElement
		local v154 = v_u_32
		local v155 = {
			["tag"] = "size-full-0 auto-y",
			["LayoutOrder"] = 2
		}
		local v156 = {}
		local v157 = v_u_9.createElement
		local v158 = v_u_32
		local v159 = {
			["tag"] = "size-full col align-x-left gap-small padding-top-medium"
		}
		local v160 = {
			["Divider"] = v_u_9.createElement(v_u_32, {
				["tag"] = "size-full-0 stroke-muted padding-top-medium",
				["LayoutOrder"] = 1
			})
		}
		local v161 = v_u_9.createElement
		local v162 = v_u_31
		local v163 = {
			["Text"] = nil,
			["fontStyle"] = nil,
			["textStyle"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["tag"] = "auto-xy",
			["LayoutOrder"] = 2
		}
		local v164
		if v_u_36() then
			v164 = v94.FooterInformation2
		else
			v164 = v94.FooterInformation1
		end
		v163.Text = v164
		v163.fontStyle = v93.Typography.BodySmall
		v163.textStyle = v93.Color.Content.Muted
		v163.TextXAlignment = Enum.TextXAlignment.Left
		v160.InfoText = v161(v162, v163)
		v156.TextFrame = v157(v158, v159, v160)
		v152.FooterFrame = v153(v154, v155, v156)
		local v165
		if v_u_53 or not v_u_34() then
			v165 = nil
		else
			v165 = v_u_9.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 3,
				["AutomaticSize"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Size"] = UDim2.new(1, 0, 0, 0)
			}, {
				["DSALink"] = v_u_9.createElement(v_u_35)
			})
		end
		v152.DSALinkFrame = v165
		local v166
		if v_u_53 or not v_u_36() then
			v166 = nil
		else
			v166 = v_u_9.createElement(v_u_32, {
				["tag"] = "size-full-0 auto-y",
				["LayoutOrder"] = 3
			}, {
				["OSALink"] = v_u_9.createElement(v_u_37)
			})
		end
		v152.OSALinkFrame = v166
		local v167
		if v_u_53 and v_u_38() then
			v167 = v_u_9.createElement(v_u_32, {
				["tag"] = "size-full-0 auto-y",
				["LayoutOrder"] = 3
			}, v_u_9.createElement(v_u_39))
		else
			v167 = nil
		end
		v152.GenericIllegalContentReportLink = v167
		local v168
		if v_u_57 and v_u_40() then
			v168 = v_u_9.createElement(v_u_41, {
				["layoutOrder"] = 4
			})
		else
			v168 = nil
		end
		v152.TakeItDownReportLink = v168
		v144 = v149(v150, v151, v152)
	else
		v144 = nil
	end
	v134.Menu = v144
	v130.MenuLayoutFrame = v131(v132, v133, v134)
	v125[v126] = v127(v128, v129, v130)
	v121.FocusNavigationCoreScriptsWrapper = v122(v123, v124, v125)
	return v118(v119, v120, v121)
end
return function(p170)
	-- upvalues: (copy) v_u_22, (copy) v_u_5, (copy) v_u_9, (copy) v_u_10, (copy) v_u_24, (copy) v_u_12, (copy) v_u_169
	local v171 = v_u_22.new(v_u_5.RobloxLocaleId)
	local v172 = v_u_9.createElement
	local v173 = v_u_10
	local v174 = {
		["LocalizationProvider"] = v_u_9.createElement(v_u_24, {
			["localization"] = v171
		}, {
			[v_u_12.LegacyAbuseReportMenuRootName] = v_u_9.createElement(v_u_169, p170)
		})
	}
	return v172(v173, {}, v174)
end