-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.AdvancedPage
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("CorePackages")
local v_u_4 = UserSettings():GetService("UserGameSettings")
local v_u_5 = v_u_4:GetPropertyChangedSignal("OnScreenProfilerEnabled")
local v6 = require(v3.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.RoactRodux
local v9 = v6.t
local v10 = v6.UIBlox
local v_u_11 = require(v3.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v12 = require(v3.Packages.Foundation)
local v_u_13 = v12.Utility.normalizeFontFace
local v14 = require(v3.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_15 = v12.Utility.Flags.FoundationFontFaceMigration
local v_u_16
if v14 then
	v_u_16 = v12.UNSTABLE.withCursorMigration
else
	v_u_16 = v10.App.SelectionImage.withSelectionCursorProvider
end
local v_u_17
if v14 then
	v_u_17 = v12.Enums.CursorType
else
	v_u_17 = v10.App.SelectionImage.CursorKind
end
local v_u_18 = require(v1.RobloxGui.Modules.DevConsoleMaster)
local v19 = script.Parent.Parent.Parent
local v_u_20 = require(v19.Components.Divider)
local v_u_21 = require(v19.Utility.ExternalEventConnection)
local v_u_22 = require(script.Parent.Parent.Page)
local v_u_23 = require(script.Parent.CategoryHeader)
local v_u_24 = require(script.Parent.ToggleEntry)
local v_u_25 = require(script.Parent.VersionReporter)
local v_u_26 = require(v19.Thunks.CloseMenu)
local v_u_27 = require(script.Parent.Parent.Connection.FocusHandler)
local v_u_28 = require(v19.Localization.withLocalization)
local v_u_29 = require(v19.Utility.SendAnalytics)
local v_u_30 = require(v19.Resources.Constants)
local v31 = v19.Flags
local v_u_32 = require(v31.GetFFlagIGMGamepadSelectionHistory)
local v33 = v_u_7.PureComponent:extend("AdvancedPage")
local v34 = v9.strictInterface
local v35 = {
	["canCaptureFocus"] = v9.boolean,
	["closeMenu"] = v9.callback,
	["pageTitle"] = v9.string
}
local v36
if v_u_32() then
	v36 = v9.string or nil
else
	v36 = nil
end
v35.currentPage = v36
v35.currentZone = v_u_32() and v9.optional(v9.number) or nil
v33.validateProps = v34(v35)
function v33.init(p37) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	p37:setState({
		["microProfilerEnabled"] = v_u_4.OnScreenProfilerEnabled,
		["performanceStatsEnabled"] = v_u_4.PerformanceStatsVisible
	})
	p37.backButtonRef = v_u_7.createRef()
	p37.performanceToggleRef = v_u_7.createRef()
end
if not v_u_32() then
	function v33.didUpdate(p38, p39) -- name: didUpdate
		-- upvalues: (copy) v_u_2
		if p38.props.canCaptureFocus and not p39.canCaptureFocus then
			v_u_2.SelectedCoreObject = p38.performanceToggleRef:getValue()
		end
	end
end
function v33.renderWithSelectionCursor(p_u_40, p_u_41) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_7, (copy) v_u_22, (copy) v_u_32, (copy) v_u_27, (copy) v_u_30, (copy) v_u_2, (copy) v_u_23, (copy) v_u_24, (copy) v_u_4, (copy) v_u_29, (copy) v_u_28, (copy) v_u_13, (copy) v_u_17, (copy) v_u_18, (copy) v_u_20, (copy) v_u_25, (copy) v_u_21, (copy) v_u_5
	return v_u_11(function(p42)
		-- upvalues: (ref) v_u_15
		local v43 = {}
		local v44
		if v_u_15 then
			v44 = p42
		else
			v44 = nil
		end
		v43.Tokens = v44
		v43.Theme = {
			["TextEmphasis"] = {
				["Color"] = p42.Color.Content.Emphasis.Color3,
				["Transparency"] = p42.Color.Content.Emphasis.Transparency
			}
		}
		v43.Font = {
			["BaseSize"] = 1,
			["Header2"] = nil,
			["Header2"] = {
				["Font"] = p42.Typography.TitleLarge.Font,
				["RelativeSize"] = p42.Typography.TitleLarge.FontSize
			}
		}
		return v43
	end, function(p_u_45)
		-- upvalues: (ref) v_u_7, (ref) v_u_22, (copy) p_u_40, (ref) v_u_32, (ref) v_u_27, (ref) v_u_30, (ref) v_u_2, (ref) v_u_23, (ref) v_u_24, (ref) v_u_4, (ref) v_u_29, (ref) v_u_28, (ref) v_u_15, (ref) v_u_13, (copy) p_u_41, (ref) v_u_17, (ref) v_u_18, (ref) v_u_20, (ref) v_u_25, (ref) v_u_21, (ref) v_u_5
		local v46 = v_u_7.createElement
		local v47 = v_u_22
		local v48 = {
			["pageTitle"] = nil,
			["zIndex"] = 2,
			["position"] = nil,
			["buttonRef"] = nil,
			["NextSelectionDown"] = nil,
			["pageTitle"] = p_u_40.props.pageTitle,
			["position"] = p_u_40.props.position,
			["buttonRef"] = p_u_40.backButtonRef,
			["NextSelectionDown"] = p_u_40.performanceToggleRef
		}
		local v49 = {}
		local v50
		if v_u_32() then
			v50 = v_u_7.createElement(v_u_27, {
				["isFocused"] = p_u_40.props.canCaptureFocus,
				["shouldForgetPreviousSelection"] = p_u_40.props.currentPage ~= v_u_30.advancedSettingsPageKey and true or p_u_40.props.currentZone == 0,
				["didFocus"] = function(p51) -- name: didFocus
					-- upvalues: (ref) v_u_2, (ref) p_u_40
					v_u_2.SelectedCoreObject = p51 or p_u_40.performanceToggleRef:getValue()
				end
			}) or nil
		else
			v50 = nil
		end
		v49.FocusHandler = v50
		v49.Layout = v_u_7.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		})
		v49.AdvancedHeader = v_u_7.createElement(v_u_23, {
			["LayoutOrder"] = 1,
			["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.AdvancedSettingsTitle"
		})
		v49.PerformanceStats = v_u_7.createElement(v_u_24, {
			["LayoutOrder"] = 2,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
			["checked"] = nil,
			["onToggled"] = nil,
			["buttonRef"] = nil,
			["NextSelectionUp"] = nil,
			["checked"] = p_u_40.state.performanceStatsEnabled,
			["onToggled"] = function() -- name: onToggled
				-- upvalues: (ref) v_u_4, (ref) v_u_29, (ref) v_u_30
				v_u_4.PerformanceStatsVisible = not v_u_4.PerformanceStatsVisible
				v_u_29(v_u_30.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			["buttonRef"] = p_u_40.performanceToggleRef,
			["NextSelectionUp"] = p_u_40.backButtonRef
		})
		v49.MicroProfiler = v_u_7.createElement(v_u_24, {
			["LayoutOrder"] = 3,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler",
			["checked"] = nil,
			["onToggled"] = nil,
			["checked"] = p_u_40.state.microProfilerEnabled,
			["onToggled"] = function() -- name: onToggled
				-- upvalues: (ref) v_u_4, (ref) v_u_29, (ref) v_u_30
				v_u_4.OnScreenProfilerEnabled = not v_u_4.OnScreenProfilerEnabled
				v_u_29(v_u_30.AnalyticsSettingsChangeName, nil, {}, true)
			end
		})
		v49.DeveloperConsole = v_u_28({
			["text"] = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
		})(function(p52)
			-- upvalues: (ref) v_u_7, (copy) p_u_45, (ref) v_u_15, (ref) v_u_13, (ref) p_u_41, (ref) v_u_17, (ref) v_u_18, (ref) p_u_40
			local v53 = v_u_7.createElement
			local v54 = "TextButton"
			local v55 = {
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 54),
				["Text"] = p52.text,
				["TextColor3"] = p_u_45.Theme.TextEmphasis.Color
			}
			local v56
			if v_u_15 then
				v56 = nil
			else
				v56 = p_u_45.Font.Header2.Font
			end
			v55.Font = v56
			local v57
			if v_u_15 then
				v57 = v_u_13(p_u_45.Tokens.Typography.TitleLarge.Font)
			else
				v57 = nil
			end
			v55.FontFace = v57
			v55.TextSize = p_u_45.Font.Header2.RelativeSize * p_u_45.Font.BaseSize
			v55.TextXAlignment = Enum.TextXAlignment.Left
			v55.LayoutOrder = 4
			v55.SelectionImageObject = p_u_41(v_u_17.Square)
			v55[v_u_7.Event.Activated] = function()
				-- upvalues: (ref) v_u_18, (ref) p_u_40
				v_u_18:SetVisibility(true)
				p_u_40.props.closeMenu()
			end
			return v53(v54, v55, {
				["Padding"] = v_u_7.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 24)
				})
			})
		end)
		v49.Divider = v_u_7.createElement(v_u_20, {
			["Size"] = nil,
			["LayoutOrder"] = 5,
			["Size"] = UDim2.new(1, -24, 0, 1)
		})
		v49.VersionReporter = v_u_7.createElement(v_u_25, {
			["LayoutOrder"] = 6
		})
		local v58 = {
			["event"] = v_u_5,
			["callback"] = function() -- name: callback
				-- upvalues: (ref) p_u_40, (ref) v_u_4
				p_u_40:setState({
					["microProfilerEnabled"] = v_u_4.OnScreenProfilerEnabled
				})
			end
		}
		v49.MicroProfilerVisibilityListener = v_u_7.createElement(v_u_21, v58)
		v49.PerformanceStatsVisibilityListener = v_u_7.createElement(v_u_21, {
			["event"] = v_u_4.PerformanceStatsVisibleChanged,
			["callback"] = function() -- name: callback
				-- upvalues: (ref) p_u_40, (ref) v_u_4
				p_u_40:setState({
					["performanceStatsEnabled"] = v_u_4.PerformanceStatsVisible
				})
			end
		})
		return v46(v47, v48, v49)
	end)
end
function v33.render(p_u_59) -- name: render
	-- upvalues: (copy) v_u_16
	return v_u_16(function(p60)
		-- upvalues: (copy) p_u_59
		return p_u_59:renderWithSelectionCursor(p60)
	end)
end
return v8.UNSTABLE_connect2(function(p61)
	-- upvalues: (copy) v_u_30, (copy) v_u_32
	local v62 = p61.menuPage == "AdvancedGameSettings" and p61.displayOptions.inputType == v_u_30.InputType.Gamepad and not p61.respawn.dialogOpen
	if v62 then
		v62 = p61.currentZone == 1
	end
	local v63
	if v_u_32() then
		v63 = p61.currentZone
	else
		v63 = nil
	end
	return {
		["canCaptureFocus"] = v62,
		["currentPage"] = v_u_32() and p61.menuPage or nil,
		["currentZone"] = v63
	}
end, function(p_u_64)
	-- upvalues: (copy) v_u_26
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_64, (ref) v_u_26
			p_u_64(v_u_26)
		end
	}
end)(v33)