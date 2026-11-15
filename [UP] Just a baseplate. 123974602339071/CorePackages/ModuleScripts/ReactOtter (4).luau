-- Path: CorePackages.Packages._Index.ReactOtter.ReactOtter
local v1 = require(script.Parent.Otter)
return {
	["useAnimatedBinding"] = require(script.useAnimatedBinding),
	["useMotor"] = require(script.useMotor),
	["ease"] = v1.ease,
	["spring"] = v1.spring,
	["instant"] = v1.instant
}