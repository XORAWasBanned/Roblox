-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter
local v1 = require(script.createGroupMotor)
local v2 = require(script.createSingleMotor)
local v3 = require(script.ease)
local v4 = require(script.spring)
local v5 = require(script.instant)
require(script.types)
return {
	["createGroupMotor"] = v1,
	["createSingleMotor"] = v2,
	["ease"] = v3,
	["spring"] = v4,
	["instant"] = v5,
	["__devAnimationStepSignal"] = require(script.AnimationStepSignal)
}