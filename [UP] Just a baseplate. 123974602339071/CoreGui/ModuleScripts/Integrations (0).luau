-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations
local v1 = script:FindFirstAncestor("Settings")
local v2 = require(v1.Flags).FFlagRefactorInExpSettingsInDevelopment
local v3 = v1.Integrations
local v4
if v2 then
	v4 = require(v3.Settings)
else
	v4 = nil
end
return {
	["Settings"] = v4,
	["Constants"] = require(v3.Constants),
	["Utils"] = require(v3.Utils)
}