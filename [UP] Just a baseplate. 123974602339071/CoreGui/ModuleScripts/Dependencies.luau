-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Dependencies
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.InGameMenu
local v3 = game:DefineFastFlag("SwitchTnSTranslationsPackage", false)
local v4 = {
	["BarOnTopScrollingFrame"] = v2.Components.BarOnTopScrollingFrame,
	["Divider"] = v2.Components.Divider,
	["FocusHandler"] = v2.Components.Connection.FocusHandler,
	["ThemedTextLabel"] = v2.Components.ThemedTextLabel,
	["PlayerCell"] = v2.Components.PlayerCell,
	["GameIcon"] = v2.Components.GameIcon,
	["PlayerSearchPredicate"] = v2.Utility.PlayerSearchPredicate,
	["SearchBar"] = v2.Components.SearchBar
}
local v5
if v3 then
	v5 = require(v1.Workspace.Packages.InExperienceLocales).Localization
else
	v5 = require(v2.Localization.Localization)
end
v4.Localization = v5
v4.LocalizationProvider = v2.Localization.LocalizationProvider
v4.withLocalization = v2.Localization.withLocalization
v4.playerInterface = script.Parent.Parent.Interfaces.playerInterface
return v4