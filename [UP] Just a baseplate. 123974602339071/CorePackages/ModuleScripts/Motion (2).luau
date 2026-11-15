-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion
local v1 = require(script.Motion)
local v2 = require(script.Utility.useMotion)
local v3 = require(script.AnimatePresence.AnimatePresence)
local v4 = require(script.AnimatePresence.usePresence)
require(script.Types)
return {
	["createState"] = v1.createState,
	["animate"] = v1.animate,
	["transition"] = v1.transition,
	["useMotion"] = v2,
	["usePresence"] = v4,
	["AnimatePresence"] = v3,
	["TransitionPreset"] = require(script.Enums.TransitionPreset)
}