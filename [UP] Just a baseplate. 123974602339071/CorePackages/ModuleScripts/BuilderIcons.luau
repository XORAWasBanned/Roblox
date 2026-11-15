-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons
local v1 = require(script.Icon)
local v2 = require(script.IconVariant)
local v3 = require(script.Font)
local v4 = require(script.Migration)
local v5 = require(script.builderIconPlatformUtils)
return {
	["Icon"] = v1,
	["IconVariant"] = v2,
	["Font"] = v3,
	["Migration"] = v4,
	["getBuilderIconForKeycode"] = v5.getBuilderIconForKeycode,
	["getBuilderIconForCurrentPlatform"] = v5.getBuilderIconForCurrentPlatform
}