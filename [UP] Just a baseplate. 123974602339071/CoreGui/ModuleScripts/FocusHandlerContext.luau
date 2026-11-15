-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.FocusHandlerUtils.FocusHandlerContext
local v1 = game:GetService("CorePackages")
return require(v1.Packages.InGameMenuDependencies).Roact.createContext({
	["currentHandlerId"] = nil,
	["candidateHandlerId"] = nil,
	["previousSelections"] = nil,
	["requestFocusForHandlerId"] = nil,
	["forgetLastSelectionForHandlerId"] = nil,
	["blurCurrentFocusHandler"] = nil,
	["previousSelections"] = {},
	["requestFocusForHandlerId"] = function() -- name: requestFocusForHandlerId end,
	["forgetLastSelectionForHandlerId"] = function() -- name: forgetLastSelectionForHandlerId end,
	["blurCurrentFocusHandler"] = function() -- name: blurCurrentFocusHandler end
})