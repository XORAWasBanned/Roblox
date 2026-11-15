-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.ChromeService
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("GamepadService")
local v6 = require(v2.Workspace.Packages.SharedFlags)
local v7 = require(v2.Workspace.Packages.AppCommonLib)
local v_u_8 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v9 = require(v2.Workspace.Packages.Chrome)
local v_u_10 = v9.Enums.SideSheetPlacement
local v_u_11 = v7.Signal
local v12 = v9.FocusUtils
local v_u_13 = v12.FocusOnChromeSignal
local v_u_14 = v12.FocusOffChromeSignal
local v_u_15 = require(v1.Service.ChromeUtils)
local v_u_16 = require(v1.Service.LocalStore)
local v_u_17 = require(v1.Service.ViewportUtil)
local v_u_18 = require(v1.Service.WindowSizeSignal)
local v_u_19 = v_u_15.ObservableValue
local v_u_20 = v_u_15.NotifySignal
local v_u_21 = v_u_15.AvailabilitySignal
local v_u_22 = require(v1.Unibar.Constants)
local v_u_23 = require(v1.Service.ShortcutService)
local v_u_24 = v6.FFlagEnableConsoleExpControls
local v_u_25 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_26 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_27 = require(v1.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local v_u_28 = game:DefineFastFlag("ChromeDeprecateMRUs", false)
local v_u_29 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_30 = v6.FFlagEnableSideSheetWidgets
local v_u_31 = require(v1.Flags).FFlagEnableChromeWindowsNotInMenu
local v_u_32 = require(v1.Flags).FFlagChromeNineDotActivityIndicator
local v33 = require(v2.Workspace.Packages.InExperienceSideSheet)
local v_u_34 = v33.toggleSideSheet
local v_u_35 = v33.getSideSheetVisibility
local v_u_36 = v33.registerSideSheetIntegrations
local v_u_37 = {}
v_u_37.__index = v_u_37
v_u_37.AvailabilitySignal = v_u_15.AvailabilitySignalState
v_u_37.IntegrationStatus = {
	["None"] = 0,
	["Icon"] = 1,
	["Window"] = 2
}
function noop() -- name: noop end
local v_u_38 = {
	["id"] = "div",
	["label"] = "div",
	["initialAvailability"] = nil,
	["availability"] = nil,
	["notification"] = nil,
	["components"] = nil,
	["hideNotificationCountWhileOpen"] = false,
	["sideSheetPlacement"] = nil,
	["initialAvailability"] = v_u_37.AvailabilitySignal.Unavailable,
	["availability"] = v_u_21.new(v_u_37.AvailabilitySignal.Unavailable),
	["notification"] = v_u_20.new(),
	["components"] = {}
}
local v39
if v_u_29 then
	v39 = v_u_10.None
else
	v39 = nil
end
v_u_38.sideSheetPlacement = v39
function createUnibarLayoutInfo(p40, p41) -- name: createUnibarLayoutInfo
	return Rect.new(p40, p40 + p41)
end
function v_u_37.new() -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_24, (copy) v_u_23, (copy) v_u_15, (copy) v_u_19, (copy) v_u_20, (copy) v_u_8, (copy) v_u_32, (copy) v_u_11, (copy) v_u_25, (copy) v_u_37, (copy) v_u_17, (copy) v_u_28, (copy) v_u_13, (copy) v_u_14
	local v42 = v_u_3.RobloxLocaleId
	local v_u_43 = {}
	local v44
	if v_u_24 then
		v44 = v_u_23.new()
	else
		v44 = nil
	end
	v_u_43._shortcutService = v44
	v_u_43._layout = v_u_15.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero))
	v_u_43._menuAbsolutePosition = Vector2.zero
	v_u_43._menuAbsoluteSizeOpen = Vector2.zero
	v_u_43._currentSubMenu = v_u_15.ObservableValue.new(nil)
	v_u_43._selectedItem = v_u_15.ObservableValue.new(nil)
	v_u_43._selectedItemIdx = 0
	v_u_43._integrations = {}
	v_u_43._integrationsConnections = {}
	v_u_43._integrationsStatus = {}
	v_u_43._menuConfig = {}
	v_u_43._subMenuConfig = {}
	v_u_43._subMenuNotifications = {}
	v_u_43._menuList = v_u_19.new({})
	v_u_43._windowList = v_u_19.new({})
	v_u_43._dragConnection = {}
	v_u_43._windowPositions = v_u_19.new({})
	v_u_43._totalNotifications = v_u_20.new(true)
	v_u_43._mostRecentlyUsedAndPinnedLimit = -1
	v_u_43._localization = v_u_8.new(v42)
	v_u_43._localizedLabelKeys = {}
	v_u_43._currentShortcutBar = v_u_19.new(nil)
	v_u_43._notificationIndicator = v_u_19.new(nil)
	local v45
	if v_u_32 then
		v45 = v_u_19.new(false)
	else
		v45 = nil
	end
	v_u_43._nineDotActivityIndicatorVisible = v45
	v_u_43._nineDotActivityIndicatorKeys = v_u_32 and {} or nil
	v_u_43._orderAlignment = v_u_19.new(Enum.HorizontalAlignment.Left)
	v_u_43._onIntegrationRegistered = v_u_11.new()
	v_u_43._onIntegrationActivated = v_u_11.new()
	v_u_43._onIntegrationStatusChanged = v_u_11.new()
	v_u_43._onIntegrationHovered = v_u_11.new()
	v_u_43._triggerMenuIcon = v_u_11.new()
	local v46
	if v_u_25 then
		v46 = v_u_11.new()
	else
		v46 = nil
	end
	v_u_43._triggerVRToggleButton = v46
	local v47
	if v_u_25 then
		v47 = v_u_19.new(nil)
	else
		v47 = nil
	end
	v_u_43._topBarVisibility = v47
	v_u_43._inFocusNav = v_u_19.new(false)
	local v48 = v_u_37
	local v_u_49 = setmetatable(v_u_43, v48)
	v_u_17.viewport:connect(function(p50)
		-- upvalues: (ref) v_u_28, (copy) v_u_49
		if v_u_28 then
			v_u_49:updateWindowSizeSignals()
		else
			v_u_49:updateScreenSize(p50.size, p50.isMobileDevice, p50.portraitOrientation, p50.tinyPortrait)
		end
	end, true)
	if v_u_24 then
		v_u_43._shortcutService.onShortcutBarChanged:connect(function(p51)
			-- upvalues: (copy) v_u_49
			v_u_49._currentShortcutBar:set(p51)
		end)
	end
	if v_u_32 then
		v_u_43._currentSubMenu:connect(function()
			-- upvalues: (copy) v_u_49
			v_u_49:updateNineDotActivityIndicatorVisible()
		end)
	end
	v_u_13:connect(function(p52)
		-- upvalues: (copy) v_u_43, (copy) v_u_49
		if p52 and not v_u_43._subMenuConfig.nine_dot[p52] then
			v_u_49:setSelected(p52)
		end
		v_u_49:enableFocusNav()
	end)
	v_u_14:connect(function()
		-- upvalues: (copy) v_u_49, (ref) v_u_24
		v_u_49:disableFocusNav()
		if v_u_24 then
			v_u_49:setShortcutBar(nil)
		end
	end)
	return v_u_49
end
function v_u_37.storeChromeInteracted(_) -- name: storeChromeInteracted
	-- upvalues: (copy) v_u_16
	if v_u_16.isEnabled() then
		v_u_16.storeForLocalPlayer("ChromeInteracted3", true)
	end
end
function v_u_37.updateScreenSize(p53, _, p54, p55, p56) -- name: updateScreenSize
	-- upvalues: (copy) v_u_22
	local v57
	if p54 then
		if p56 then
			v57 = v_u_22.MOBILE_TINY_PORTRAIT_SLOTS - v_u_22.CORE_SLOTS
		elseif p55 then
			v57 = v_u_22.MOBILE_PORTRAIT_SLOTS - v_u_22.CORE_SLOTS
		else
			v57 = v_u_22.MOBILE_LANDSCAPE_SLOTS - v_u_22.CORE_SLOTS
		end
	else
		v57 = v_u_22.NON_MOBILE_SLOTS - v_u_22.CORE_SLOTS
	end
	if v57 ~= p53._mostRecentlyUsedAndPinnedLimit then
		p53._mostRecentlyUsedAndPinnedLimit = v57
		p53:updateMenuList()
		p53:updateNotificationTotals()
	end
	p53:updateWindowSizeSignals()
end
function v_u_37.updateWindowSizeSignals(p58) -- name: updateWindowSizeSignals
	for _, v59 in p58._integrations do
		if not v59.windowSize then
			continue
		end
		v59.windowSize:updateConstraints()
	end
end
function v_u_37.notificationIndicator(p60) -- name: notificationIndicator
	return p60._notificationIndicator
end
function v_u_37.nineDotActivityIndicatorVisible(p61) -- name: nineDotActivityIndicatorVisible
	return p61._nineDotActivityIndicatorVisible
end
function v_u_37.setNineDotActivityIndicatorVisible(p62, p63, p64) -- name: setNineDotActivityIndicatorVisible
	p62._nineDotActivityIndicatorKeys[p63] = p64 and true or nil
	p62:updateNineDotActivityIndicatorVisible()
end
function v_u_37.updateNineDotActivityIndicatorVisible(p65) -- name: updateNineDotActivityIndicatorVisible
	local v66 = next(p65._nineDotActivityIndicatorKeys) ~= nil
	if p65._currentSubMenu:get() == "nine_dot" then
		v66 = false
	end
	p65._nineDotActivityIndicatorVisible:set(v66)
end
function v_u_37.toggleSubMenu(p67, p68) -- name: toggleSubMenu
	-- upvalues: (copy) v_u_29, (ref) v_u_34
	if v_u_29 and v_u_34 then
		v_u_34(true)
		return
	elseif p67._subMenuConfig[p68] then
		if p67._currentSubMenu:get() == p68 then
			p67._currentSubMenu:set(nil)
		else
			p67._currentSubMenu:set(p68)
		end
	else
		warn("Not a valid subMenuId:" .. p68)
		return
	end
end
function v_u_37.currentSubMenu(p69) -- name: currentSubMenu
	return p69._currentSubMenu
end
function v_u_37.inFocusNav(p70) -- name: inFocusNav
	return p70._inFocusNav
end
function v_u_37.enableFocusNav(p71) -- name: enableFocusNav
	-- upvalues: (copy) v_u_5, (copy) v_u_24, (copy) v_u_22
	if not v_u_5.GamepadCursorEnabled then
		if not p71._inFocusNav:get() then
			p71._inFocusNav:set(true)
		end
		if v_u_24 then
			p71:setShortcutBar(v_u_22.UNIBAR_SHORTCUTBAR_ID)
		end
	end
end
function v_u_37.disableFocusNav(p72) -- name: disableFocusNav
	-- upvalues: (copy) v_u_5
	if not v_u_5.GamepadCursorEnabled then
		if p72._inFocusNav:get() then
			p72._inFocusNav:set(false)
			p72._selectedItem:set(nil)
			p72._currentSubMenu:set(nil)
		end
	end
end
function v_u_37.toggleWindow(p73, p74) -- name: toggleWindow
	-- upvalues: (copy) v_u_37, (copy) v_u_16
	if p73._integrations[p74].components.Window then
		if p73._integrationsStatus[p74] and (p73._integrationsStatus[p74] ~= v_u_37.IntegrationStatus.None and p73._integrationsStatus[p74] ~= v_u_37.IntegrationStatus.Icon) then
			p73._integrationsStatus[p74] = v_u_37.IntegrationStatus.Icon
		else
			p73._integrationsStatus[p74] = v_u_37.IntegrationStatus.Window
		end
		p73._onIntegrationStatusChanged:fire(p74, p73._integrationsStatus[p74])
	end
	if v_u_16.isEnabled() and (p73._integrations[p74] and p73._integrations[p74].persistWindowState) then
		local v75 = v_u_16.loadForLocalPlayer("ChromeWindowStatus") or {}
		v75[p74] = p73._integrationsStatus[p74] == v_u_37.IntegrationStatus.Window
		v_u_16.storeForLocalPlayer("ChromeWindowStatus", v75)
	end
	p73:updateMenuList()
end
function v_u_37.isWindowOpen(p76, p77) -- name: isWindowOpen
	-- upvalues: (copy) v_u_37
	local v78 = p76._integrations[p77].components.Window
	if v78 then
		v78 = p76._integrationsStatus[p77] == v_u_37.IntegrationStatus.Window
	end
	return v78
end
function v_u_37.menuList(p79) -- name: menuList
	return p79._menuList
end
function v_u_37.windowList(p80) -- name: windowList
	return p80._windowList
end
function v_u_37.dragConnection(p81, p82) -- name: dragConnection
	if p81._integrations[p82] then
		return p81._dragConnection[p82]
	else
		return nil
	end
end
function v_u_37.updateLocalization(p_u_83, p84) -- name: updateLocalization
	p_u_83._localizedLabelKeys[p84.id] = {}
	p_u_83._localizedLabelKeys[p84.id].label = p84.label
	local v_u_85 = p84.label
	local function v86()
		-- upvalues: (ref) v_u_85, (copy) p_u_83
		v_u_85 = p_u_83._localization:Format(v_u_85)
	end
	local v87, v88 = pcall(v86)
	if not v87 then
		v_u_85 = p84.label
		warn(v88)
	end
	p84.label = v_u_85
	if p84.secondaryAction then
		p_u_83._localizedLabelKeys[p84.id].secondaryActionLabel = p84.secondaryAction.label
		local v_u_89 = p84.secondaryAction.label
		local function v90()
			-- upvalues: (ref) v_u_89, (copy) p_u_83
			v_u_89 = p_u_83._localization:Format(v_u_89)
		end
		local v91, v92 = pcall(v90)
		if not v91 then
			v_u_89 = p84.secondaryAction.label
			warn(v92)
		end
		p84.secondaryAction.label = v_u_89
	end
	return p84
end
function v_u_37.register(p_u_93, p_u_94) -- name: register
	-- upvalues: (copy) v_u_29, (copy) v_u_10, (copy) v_u_37, (copy) v_u_21, (copy) v_u_20, (copy) v_u_18, (copy) v_u_22, (copy) v_u_24, (copy) v_u_5
	if p_u_93._integrations[p_u_94.id] then
		warn(string.format(p_u_94.id .. "already registered", debug.traceback()))
		for _, v95 in p_u_93._integrationsConnections[p_u_94.id] do
			v95:disconnect()
		end
	end
	p_u_93._integrationsConnections[p_u_94.id] = {}
	local v96 = p_u_93._integrationsConnections[p_u_94.id]
	if v_u_29 and p_u_94.sideSheetPlacement == nil then
		p_u_94.sideSheetPlacement = v_u_10.BelowFold
	end
	if p_u_94.initialAvailability == nil then
		p_u_94.initialAvailability = v_u_37.AvailabilitySignal.Unavailable
	end
	if p_u_94.availability == nil then
		p_u_94.availability = v_u_21.new(p_u_94.initialAvailability or v_u_37.AvailabilitySignal.Unavailable)
	end
	if p_u_94.notification == nil then
		p_u_94.notification = v_u_20.new()
	end
	if p_u_94.components == nil then
		p_u_94.components = {}
	end
	if p_u_94.availability then
		v96[#v96 + 1] = p_u_94.availability:connect(function()
			-- upvalues: (copy) p_u_93, (ref) p_u_94
			p_u_93:availabilityChanged(p_u_94)
		end)
	end
	if p_u_94.notification and not p_u_94.notification:excludeFromTotalCounts() then
		v96[#v96 + 1] = p_u_94.notification:connect(function()
			-- upvalues: (copy) p_u_93
			p_u_93:updateNotificationTotals()
		end)
	end
	if p_u_94.windowSize == nil and (p_u_94.components and p_u_94.components.Window) then
		p_u_94.windowSize = v_u_18.new()
	end
	if v_u_37:getWindowStatusFromStore(p_u_94.id) and p_u_94.persistWindowState or p_u_94.windowDefaultOpen then
		p_u_93._integrationsStatus[p_u_94.id] = v_u_37.IntegrationStatus.Window
		p_u_93._onIntegrationStatusChanged:fire(p_u_94.id, p_u_93._integrationsStatus[p_u_94.id])
	end
	local v97 = UDim2.fromOffset(v_u_22.MENU_ICON_SCREEN_SIDE_OFFSET, v_u_22.WINDOW_DEFAULT_PADDING)
	if p_u_94.startingWindowPosition then
		if p_u_94.persistWindowState then
			v97 = p_u_93:getWindowPositionFromStore(p_u_94.id) or p_u_94.startingWindowPosition
		else
			v97 = p_u_94.startingWindowPosition
		end
	end
	p_u_93._windowPositions[p_u_94.id] = v97
	local v_u_98 = p_u_93:updateLocalization(p_u_94)
	local v_u_99 = v_u_98
	p_u_93._integrations[v_u_98.id] = v_u_99
	if v_u_24 and v_u_98.selected then
		v96[#v96 + 1] = p_u_93:selectedItem():connect(function(p100)
			-- upvalues: (copy) v_u_99, (ref) v_u_5, (ref) v_u_98
			if v_u_99.id == p100 then
				if v_u_5.GamepadCursorEnabled then
					return
				end
				v_u_98.selected(v_u_99)
			end
		end)
	end
	return v_u_99
end
function v_u_37.createIconProps(p_u_101, p_u_102, p103) -- name: createIconProps
	-- upvalues: (copy) v_u_38
	local v104 = p103 or 0
	return p_u_101._integrations[p_u_102] and {
		["id"] = nil,
		["children"] = nil,
		["order"] = nil,
		["component"] = nil,
		["integration"] = nil,
		["isDivider"] = false,
		["activated"] = nil,
		["id"] = p_u_102,
		["children"] = {},
		["order"] = v104,
		["component"] = p_u_101._integrations[p_u_102].components.Icon,
		["integration"] = p_u_101._integrations[p_u_102],
		["activated"] = function() -- name: activated
			-- upvalues: (copy) p_u_101, (copy) p_u_102
			p_u_101:activate(p_u_102)
		end
	} or {
		["id"] = p_u_102,
		["children"] = {},
		["order"] = v104,
		["activated"] = noop,
		["integration"] = v_u_38
	}
end
function v_u_37.createWidgetProps(p105, p106, p107) -- name: createWidgetProps
	local v108 = p105._integrations[p106]
	return v108 and v108.components.Widget and {
		["id"] = p106,
		["children"] = {},
		["order"] = p107 or 0,
		["component"] = v108.components.Widget,
		["integration"] = v108,
		["activated"] = noop
	} or nil
end
function v_u_37.isIntegrationValid(p109, p110) -- name: isIntegrationValid
	-- upvalues: (copy) v_u_37
	local v111 = p109._integrations[p110]
	if not v111 then
		return false
	end
	local v112 = v111.availability
	if v112 then
		v112 = v112:get() ~= v_u_37.AvailabilitySignal.Unavailable
	end
	return v112
end
function v_u_37.updateMenuList(p_u_113) -- name: updateMenuList
	-- upvalues: (copy) v_u_38, (copy) v_u_29, (copy) v_u_31
	local v_u_114 = 0
	local v_u_115 = 0
	local function v_u_117(p116) -- name: iconProps
		-- upvalues: (ref) v_u_115, (copy) p_u_113
		v_u_115 = v_u_115 + 1
		return p_u_113:createIconProps(p116, v_u_115)
	end
	local function v_u_119(p118) -- name: windowProps
		-- upvalues: (ref) v_u_115, (copy) p_u_113, (ref) v_u_38
		v_u_115 = v_u_115 + 1
		return p_u_113._integrations[p118] and {
			["id"] = p118,
			["children"] = {},
			["order"] = v_u_115,
			["component"] = p_u_113._integrations[p118].components.Window,
			["activated"] = noop,
			["integration"] = p_u_113._integrations[p118]
		} or {
			["id"] = p118,
			["children"] = {},
			["order"] = v_u_115,
			["activated"] = noop,
			["integration"] = v_u_38
		}
	end
	local function v_u_120(_) -- name: divider
		-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_38
		v_u_114 = v_u_114 + 1
		v_u_115 = v_u_115 + 1
		return {
			["id"] = nil,
			["order"] = nil,
			["isDivider"] = true,
			["children"] = nil,
			["activated"] = nil,
			["integration"] = nil,
			["id"] = "DIV" .. v_u_114,
			["order"] = v_u_115,
			["children"] = {},
			["activated"] = noop,
			["integration"] = v_u_38
		}
	end
	local function v_u_138(p121, p122, p123) -- name: collectMenu
		-- upvalues: (copy) v_u_120, (ref) v_u_114, (copy) v_u_138, (ref) v_u_29, (copy) p_u_113, (ref) v_u_115, (copy) v_u_119, (copy) v_u_117
		local v124 = 0
		for v125, v126 in pairs(p121) do
			if type(v126) == "table" then
				if false then
					local v127 = p122.children
					local v128 = v_u_120(v_u_114)
					table.insert(v127, v128)
				end
				if v_u_138(v126, p122, p123) <= 0 then
					continue
				end
				local v129 = p122.children
				local v130 = v_u_120(v_u_114)
				table.insert(v129, v130)
			else
				if typeof(v126) ~= "string" then
					error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v126, v125)))
				end
				if v_u_29 or not p_u_113._subMenuConfig[v126] then
					if not p_u_113:isIntegrationValid(v126) then
						continue
					end
					if p_u_113:isWindowOpen(v126) then
						local v131 = v_u_119(v126)
						table.insert(p123, v131)
						local v132 = p122.children
						local v133 = v_u_117
						table.insert(v132, v133(v126))
						v124 = v124 + 1
					else
						local v134 = p122.children
						local v135 = v_u_117
						table.insert(v134, v135(v126))
						v124 = v124 + 1
					end
				else
					if not p_u_113:isIntegrationValid(v126) then
						continue
					end
					v_u_115 = v_u_115 + 1
					local v136 = p_u_113:createIconProps(v126, v_u_115)
					v124 = v124 + 1
					v_u_138(p_u_113._subMenuConfig[v126], v136, p123)
					if #v136.children <= 0 then
						continue
					end
					local v137 = p122.children
					table.insert(v137, v136)
				end
			end
		end
		return v124
	end
	local v139 = {
		["children"] = {}
	}
	local v140 = {}
	v_u_138(p_u_113._menuConfig, v139, v140)
	if v139.children[#v139.children] and v139.children[#v139.children].isDivider then
		table.remove(v139.children, #v139.children)
	end
	if v_u_31 then
		local v141 = {}
		for _, v142 in v140 do
			v141[v142.id] = true
		end
		for v143, _ in p_u_113._integrations do
			if not p_u_113:isWindowOpen(v143) or v141[v143] then
				continue
			end
			local v144 = v_u_119(v143)
			table.insert(v140, v144)
		end
	end
	p_u_113._menuList:set(v139.children)
	p_u_113._windowList:set(v140)
	p_u_113:repairSelected()
end
if v_u_29 then
	function v_u_37.updateSideSheet(p_u_145) -- name: updateSideSheet
		-- upvalues: (copy) v_u_10, (copy) v_u_30, (copy) v_u_26, (ref) v_u_36
		local v_u_146 = 0
		local v_u_147 = {}
		local v_u_148 = {}
		local v_u_149 = {}
		local v_u_150 = {}
		local v_u_151 = {}
		local v_u_152 = {}
		local function v171(p153) -- name: addIntegration
			-- upvalues: (copy) p_u_145, (ref) v_u_10, (copy) v_u_148, (ref) v_u_146, (copy) v_u_147, (copy) v_u_149, (copy) v_u_150, (ref) v_u_30, (ref) v_u_26, (copy) v_u_151, (copy) v_u_152
			local v154 = p_u_145._integrations[p153]
			if v154 and (v154.sideSheetPlacement ~= v_u_10.None and p_u_145:isIntegrationValid(p153)) then
				if v154.sideSheetPlacement == v_u_10.Unibar then
					local v155 = v_u_148
					local v156 = p_u_145
					local v157 = v_u_146
					table.insert(v155, v156:createIconProps(p153, v157))
					return
				elseif v154.sideSheetPlacement == v_u_10.AboveFold then
					local v158 = v_u_147
					local v159 = p_u_145
					local v160 = v_u_146
					table.insert(v158, v159:createIconProps(p153, v160))
					return
				elseif v154.sideSheetPlacement == v_u_10.BelowFold then
					local v161 = v_u_149
					local v162 = p_u_145
					local v163 = v_u_146
					table.insert(v161, v162:createIconProps(p153, v163))
					return
				elseif v154.sideSheetPlacement == v_u_10.SessionAction then
					local v164 = v_u_150
					local v165 = p_u_145
					local v166 = v_u_146
					table.insert(v164, v165:createIconProps(p153, v166))
				elseif v154.sideSheetPlacement == v_u_10.ScrollableContentTop then
					local v167 = (v_u_30 or v_u_26()) and p_u_145:createWidgetProps(p153, v_u_146)
					if v167 then
						local v168 = v_u_151
						table.insert(v168, v167)
						return
					end
				else
					local v169 = v154.sideSheetPlacement == v_u_10.ScrollableContentBottom and (v_u_30 or v_u_26()) and p_u_145:createWidgetProps(p153, v_u_146)
					if v169 then
						local v170 = v_u_152
						table.insert(v170, v169)
					end
				end
			else
				return
			end
		end
		local v172 = v_u_146
		for _, v173 in p_u_145._menuConfig do
			for _, v174 in v173 do
				v_u_146 = v172 + 1
				v171(v174)
				v172 = v_u_146
			end
		end
		for _, v175 in p_u_145._subMenuConfig do
			for _, v176 in v175 do
				v_u_146 = v172 + 1
				v171(v176)
				v172 = v_u_146
			end
		end
		v_u_36({
			["unibarIntegrations"] = v_u_148,
			["aboveFoldIntegrations"] = v_u_147,
			["belowFoldIntegrations"] = v_u_149,
			["sessionActionIntegrations"] = v_u_150,
			["scrollableContentTopWidgetIntegrations"] = v_u_151,
			["scrollableContentBottomWidgetIntegrations"] = v_u_152
		})
	end
end
function v_u_37.availabilityChanged(p177, _) -- name: availabilityChanged
	-- upvalues: (copy) v_u_29
	p177:updateNotificationTotals()
	p177:updateMenuList()
	if v_u_29 then
		p177:updateSideSheet()
	end
end
function v_u_37.subMenuNotifications(p178, p179) -- name: subMenuNotifications
	-- upvalues: (copy) v_u_20
	if not p178._subMenuNotifications[p179] then
		p178._subMenuNotifications[p179] = v_u_20.new(true)
	end
	return p178._subMenuNotifications[p179]
end
function v_u_37.totalNotifications(p180) -- name: totalNotifications
	return p180._totalNotifications
end
function v_u_37.onIntegrationRegistered(p181) -- name: onIntegrationRegistered
	return p181._onIntegrationRegistered
end
function v_u_37.onIntegrationActivated(p182) -- name: onIntegrationActivated
	return p182._onIntegrationActivated
end
function v_u_37.onIntegrationHovered(p183) -- name: onIntegrationHovered
	return p183._onIntegrationHovered
end
function v_u_37.onIntegrationStatusChanged(p184) -- name: onIntegrationStatusChanged
	return p184._onIntegrationStatusChanged
end
function v_u_37.integrations(p185) -- name: integrations
	return p185._integrations
end
function v_u_37.updateNotificationTotals(p186) -- name: updateNotificationTotals
	-- upvalues: (copy) v_u_37
	local v187 = 0
	for _, v188 in p186._integrations do
		if v188.availability:get() == v_u_37.AvailabilitySignal.Unavailable or (v188.availability:get() == v_u_37.AvailabilitySignal.Pinned or v188.notification:excludeFromTotalCounts()) then
			continue
		end
		local v189 = v188.notification:get()
		if not v189 or v189.type ~= "count" then
			continue
		end
		local v190 = v189.value
		local v191 = typeof(v190) == "number"
		assert(v191, "Expected count value to be number")
		v187 = v187 + v189.value
	end
	p186._totalNotifications:fireCount(v187)
	for v192, v193 in p186._subMenuNotifications do
		local v194 = p186:withinCurrentTopLevelMenu(v192)
		local v195 = 0
		if not v194 then
			continue
		end
		for _, v196 in v194.children do
			if p186:withinCurrentTopLevelMenu(v196.id) or (v196.integration.availability:get() == v_u_37.AvailabilitySignal.Unavailable or v196.integration.notification:excludeFromTotalCounts()) then
				continue
			end
			local v197 = v196.integration.notification:get()
			if not v197 or v197.type ~= "count" then
				continue
			end
			local v198 = v197.value
			local v199 = typeof(v198) == "number"
			assert(v199, "Expected count value to be number")
			v195 = v195 + v197.value
		end
		v193:fireCount(v195)
	end
end
function v_u_37.configureMenu(p200, p201) -- name: configureMenu
	p200._menuConfig = p201
	p200:updateNotificationTotals()
	p200:updateMenuList()
end
function v_u_37.configureSubMenu(p202, p203, p204) -- name: configureSubMenu
	-- upvalues: (copy) v_u_20, (copy) v_u_29
	p202._subMenuConfig[p203] = p204
	if not p202._subMenuNotifications[p203] then
		p202._subMenuNotifications[p203] = v_u_20.new(true)
	end
	p202:updateNotificationTotals()
	p202:updateMenuList()
	if v_u_29 then
		p202:updateSideSheet()
	end
end
if v_u_24 then
	function v_u_37.registerShortcut(p205, p206) -- name: registerShortcut
		-- upvalues: (copy) v_u_37
		p205._shortcutService:registerShortcut(p206)
		local v_u_207 = p205._shortcutService:getShortcut(p206.id)
		if v_u_207.integration and p205._integrations[v_u_207.integration] then
			local v_u_208 = p205._integrations[v_u_207.integration]
			if v_u_208.availability:get() == v_u_37.AvailabilitySignal.Unavailable then
				v_u_207.availability:unavailable()
			end
			v_u_208.availability:connect(function()
				-- upvalues: (copy) v_u_208, (ref) v_u_37, (copy) v_u_207
				local v209 = v_u_208.availability:get()
				if v209 == v_u_37.AvailabilitySignal.Unavailable then
					v_u_207.availability:unavailable()
				elseif v209 == v_u_37.AvailabilitySignal.Available or v209 == v_u_37.AvailabilitySignal.Pinned then
					v_u_207.availability:available()
				end
			end)
		end
	end
	function v_u_37.activateShortcut(p210, p211) -- name: activateShortcut
		-- upvalues: (copy) v_u_27
		local v212 = p210._shortcutService:getShortcut(p211)
		if v212.integration then
			if not v212.activated then
				if v_u_27 then
					p210:activate(v212.integration, {
						["fromShortcut"] = true
					})
				else
					p210:activate(v212.integration)
				end
			end
			if v_u_27 then
				p210._shortcutService:activateShortcut(p211)
				p210._onIntegrationActivated:fire(v212.integration, {
					["fromShortcut"] = true
				})
				return
			end
		else
			p210._shortcutService:activateShortcut(p211)
		end
	end
	function v_u_37.configureShortcutBar(p213, p214, p215) -- name: configureShortcutBar
		p213._shortcutService:configureShortcutBar(p214, p215)
	end
	function v_u_37.setShortcutBar(p216, p217) -- name: setShortcutBar
		p216._shortcutService:setShortcutBar(p217)
	end
	function v_u_37.getCurrentShortcutBar(p218) -- name: getCurrentShortcutBar
		return p218._currentShortcutBar
	end
	function v_u_37.getShortcutsFromBar(p219, p220) -- name: getShortcutsFromBar
		return p219._shortcutService:getShortcutsFromBar(p220, p219._integrations)
	end
	function v_u_37.getCurrentShortcuts(p221) -- name: getCurrentShortcuts
		return p221:getShortcutsFromBar(p221._currentShortcutBar:get())
	end
	function v_u_37.onShortcutBarChanged(p222) -- name: onShortcutBarChanged
		return p222._shortcutService.onShortcutBarChanged
	end
	function v_u_37.selectMenuIcon(p223) -- name: selectMenuIcon
		p223._triggerMenuIcon:fire()
	end
	function v_u_37.onTriggerMenuIcon(p224) -- name: onTriggerMenuIcon
		return p224._triggerMenuIcon
	end
	function v_u_37.setHideShortcutBar(p225, p226, p227) -- name: setHideShortcutBar
		p225._shortcutService:setHideShortcutBar(p226, p227)
	end
	function v_u_37.getHideShortcutBar(p228) -- name: getHideShortcutBar
		return p228._shortcutService:getHideShortcutBar()
	end
end
if v_u_25 then
	function v_u_37.onTriggerVRToggleButton(p229) -- name: onTriggerVRToggleButton
		return p229._triggerVRToggleButton
	end
	function v_u_37.showTopBar(p230) -- name: showTopBar
		return p230._topBarVisibility:get()
	end
	function v_u_37.getTopBarVisibiity(p231) -- name: getTopBarVisibiity
		return p231._topBarVisibility
	end
	function v_u_37.connectTopBarVisibility(p232, p233) -- name: connectTopBarVisibility
		p232._topBarVisibility = p233
	end
end
function v_u_37.gesture(p234, p235, p236, p237) -- name: gesture
	if p234._integrations[p235] then
		p234._dragConnection[p235] = {
			["connection"] = p236,
			["inputObject"] = p237
		}
	end
end
function v_u_37.withinCurrentTopLevelMenu(p238, p239) -- name: withinCurrentTopLevelMenu
	for v240, v241 in p238._menuList:get() do
		if v241.id ~= p239 then
			continue
		end
		return v241, v240
	end
	return nil, 0
end
function v_u_37.withinCurrentSubmenu(p242, p243) -- name: withinCurrentSubmenu
	local v244 = p242._currentSubMenu:get()
	if not v244 then
		return false
	end
	local v245 = nil
	for _, v246 in p242._menuList:get() do
		if v246.id ~= v244 then
			continue
		end
		v245 = v246.children
	end
	if not v245 then
		return false
	end
	for _, v247 in v245 do
		if v247.id ~= p243 then
			continue
		end
		return true
	end
	return false
end
if v_u_29 then
	function v_u_37.withinOpenSideSheet(p248, p249) -- name: withinOpenSideSheet
		-- upvalues: (ref) v_u_35, (copy) v_u_10
		if not v_u_35() then
			return false
		end
		for _, v250 in p248._integrations do
			if v250.id ~= p249 or v250.sideSheetPlacement == v_u_10.None then
				continue
			end
			return true
		end
		return false
	end
end
function v_u_37.windowPosition(p251, p252) -- name: windowPosition
	return p251._windowPositions[p252]
end
function v_u_37.updateWindowPosition(p253, p254, p255) -- name: updateWindowPosition
	-- upvalues: (copy) v_u_16
	if v_u_16.isEnabled() and (p253._integrations[p254] and p253._integrations[p254].persistWindowState) then
		local v256 = v_u_16.loadForLocalPlayer("ChromeWindowPosition") or {}
		v256[p254] = {
			p255.X.Scale,
			p255.X.Offset,
			p255.Y.Scale,
			p255.Y.Offset
		}
		v_u_16.storeForLocalPlayer("ChromeWindowPosition", v256)
	end
	p253._windowPositions[p254] = p255
end
function v_u_37.getWindowStatusFromStore(_, p257) -- name: getWindowStatusFromStore
	-- upvalues: (copy) v_u_16
	if v_u_16.isEnabled() then
		return (v_u_16.loadForLocalPlayer("ChromeWindowStatus") or {})[p257] or false
	else
		return nil
	end
end
function v_u_37.getWindowPositionFromStore(_, p258) -- name: getWindowPositionFromStore
	-- upvalues: (copy) v_u_16
	if v_u_16.isEnabled() then
		local v259 = (v_u_16.loadForLocalPlayer("ChromeWindowPosition") or {})[p258] or nil
		if v259 then
			return UDim2.new(v259[1], v259[2], v259[3], v259[4])
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_37.activate(p_u_260, p_u_261, p262) -- name: activate
	-- upvalues: (copy) v_u_27, (copy) v_u_24
	local v263 = nil
	local v264
	if p_u_260._integrations[p_u_261] then
		local v_u_265 = p_u_260._integrations[p_u_261].activated
		if v_u_27 then
			p_u_260._onIntegrationActivated:fire(p_u_261, p262)
		else
			p_u_260._onIntegrationActivated:fire(p_u_261)
		end
		p_u_260:storeChromeInteracted()
		if v_u_265 then
			local function v266()
				-- upvalues: (copy) v_u_265, (copy) p_u_260, (copy) p_u_261, (ref) v_u_24
				v_u_265(p_u_260._integrations[p_u_261])
				if not v_u_24 then
					p_u_260:disableFocusNav()
				end
			end
			local v267
			v267, v264 = pcall(v266)
			if v267 then
				v264 = v263
			else
				warn("ChromeService: activate error thrown for " .. p_u_261)
			end
		else
			if p_u_260._subMenuConfig[p_u_261] then
				p_u_260:toggleSubMenu(p_u_261)
			end
			p_u_260:toggleWindow(p_u_261)
			v264 = v263
		end
		if p_u_260._currentSubMenu:get() ~= p_u_261 then
			p_u_260._currentSubMenu:set(nil)
		end
	else
		v264 = v263
	end
	if v264 then
		error(v264)
	end
end
function v_u_37.selectedItem(p268) -- name: selectedItem
	return p268._selectedItem
end
function v_u_37.setSelected(p269, p270) -- name: setSelected
	-- upvalues: (copy) v_u_4
	local v271, v272 = p269:withinCurrentTopLevelMenu(p270 or "")
	if v271 then
		local v273 = v_u_4:GetLastInputType()
		local v274 = v273 == Enum.UserInputType.MouseButton1 and true or v273 == Enum.UserInputType.Touch
		local v275 = p269._currentSubMenu:get()
		if v275 and (v275 ~= p270 and not v274) then
			p269:toggleSubMenu(v275)
		end
		p269._selectedItemIdx = v272
		p269._selectedItem:set(p270)
	end
end
function v_u_37.setSelectedByOffset(p276, p277) -- name: setSelectedByOffset
	local v278 = p276._menuList:get()
	local _, v279 = p276:withinCurrentTopLevelMenu(p276._selectedItem:get() or "")
	if v279 > 0 then
		local v280 = v279 + p277
		local v281 = #v278
		p276:setSelected(v278[math.clamp(v280, 1, v281)].id)
	end
end
function v_u_37.repairSelected(p282) -- name: repairSelected
	if p282._selectedItem:get() then
		local _, v283 = p282:withinCurrentTopLevelMenu(p282._selectedItem:get() or "")
		if v283 == 0 then
			v283 = p282._selectedItemIdx
		end
		local v284 = p282._menuList:get()
		local v285 = #v284
		p282:setSelected(v284[math.clamp(v283, 1, v285)].id)
	end
end
function v_u_37.configureOrderAlignment(p286, p287) -- name: configureOrderAlignment
	if p286._orderAlignment:get() ~= p287 then
		p286._orderAlignment:set(p287)
		p286:updateMenuList()
	end
end
function v_u_37.orderAlignment(p288) -- name: orderAlignment
	return p288._orderAlignment
end
function v_u_37.setMenuAbsolutePosition(p289, p290) -- name: setMenuAbsolutePosition
	if p290 ~= p289._menuAbsolutePosition then
		p289._menuAbsolutePosition = p290
		p289._layout:set(createUnibarLayoutInfo(p290, p289._menuAbsoluteSizeOpen))
	end
end
function v_u_37.setMenuAbsoluteSize(p291, p292) -- name: setMenuAbsoluteSize
	if p292 ~= p291._menuAbsoluteSizeOpen then
		p291._menuAbsoluteSizeOpen = p292
		p291._layout:set(createUnibarLayoutInfo(p291._menuAbsolutePosition, p292))
	end
end
function v_u_37.layout(p293) -- name: layout
	return p293._layout
end
return v_u_37