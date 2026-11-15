-- Path: CoreGui.RobloxGui.Modules.InGameWhatsNew
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.WhatsNew)
local v3 = require(script.createInGameScopeActions)
return v2.createInGameWhatsNewHost({
	["scopeActions"] = v3()
})