-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation
local v1 = script.Parent
local v2 = require(v1.FocusNavigation)
local v3 = require(script.FocusNavigationContext)
local v4 = require(script.useActiveEventMap)
local v5 = require(script.useFocusedGuiObject)
local v6 = require(script.useFocusGuiObject)
local v7 = require(script.useEventMap)
local v8 = require(script.useEventHandler)
local v9 = require(script.useEventHandlerMap)
local v10 = require(script.useContainerFocusBehavior)
local v11 = require(script.useDispatchSyntheticEvent)
local v12 = require(script.useEventDispatched)
local v13 = require(script.FocusBehaviorHooks)
return {
	["FocusNavigationService"] = v2.FocusNavigationService,
	["EngineInterface"] = v2.EngineInterface,
	["FocusNavigationContext"] = v3,
	["useActiveEventMap"] = v4,
	["useFocusedGuiObject"] = v5,
	["useEventDispatched"] = v12,
	["useFocusGuiObject"] = v6,
	["useEventMap"] = v7,
	["useEventHandler"] = v8,
	["useEventHandlerMap"] = v9,
	["useContainerFocusBehavior"] = v10,
	["useDefaultFocusBehavior"] = v13.useDefaultFocusBehavior,
	["useMostRecentFocusBehavior"] = v13.useMostRecentFocusBehavior,
	["useMostRecentOrDefaultFocusBehavior"] = v13.useMostRecentOrDefaultFocusBehavior,
	["useDispatchSyntheticEvent"] = v11
}