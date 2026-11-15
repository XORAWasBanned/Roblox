-- Path: CorePackages.Packages._Index.RbxDesignFoundations-31ab8d40-1.1.108.RbxDesignFoundations
local v1 = script.tokens
require(v1.Schema.Types.ComponentType)
require(v1.Schema.Types.GlobalType)
require(v1.Schema.Types.SemanticType)
local v2 = {}
local v3 = {}
local v4 = {}
local v5 = {
	["Dark"] = {
		["Component"] = require(v1.Common.Builder.Dark.Component),
		["Global"] = require(v1.Common.Builder.Dark.Global),
		["Semantic"] = require(v1.Common.Builder.Dark.Semantic)
	},
	["Light"] = {
		["Component"] = require(v1.Common.Builder.Light.Component),
		["Global"] = require(v1.Common.Builder.Light.Global),
		["Semantic"] = require(v1.Common.Builder.Light.Semantic)
	}
}
v4.Builder = v5
v4.Dark = {
	["Component"] = require(v1.Common.Dark.Component),
	["Global"] = require(v1.Common.Dark.Global),
	["Semantic"] = require(v1.Common.Dark.Semantic)
}
v4.Light = {
	["Component"] = require(v1.Common.Light.Component),
	["Global"] = require(v1.Common.Light.Global),
	["Semantic"] = require(v1.Common.Light.Semantic)
}
v3.Common = v4
local v6 = {
	["Dark"] = {
		["Component"] = require(v1.Console.Dark.Component),
		["Global"] = require(v1.Console.Dark.Global),
		["Semantic"] = require(v1.Console.Dark.Semantic)
	},
	["Light"] = {
		["Component"] = require(v1.Console.Light.Component),
		["Global"] = require(v1.Console.Light.Global),
		["Semantic"] = require(v1.Console.Light.Semantic)
	}
}
v3.Console = v6
local v7 = {}
local v8 = {
	["Dark"] = {
		["Component"] = require(v1.Desktop.Builder.Dark.Component),
		["Global"] = require(v1.Desktop.Builder.Dark.Global),
		["Semantic"] = require(v1.Desktop.Builder.Dark.Semantic)
	},
	["Light"] = {
		["Component"] = require(v1.Desktop.Builder.Light.Component),
		["Global"] = require(v1.Desktop.Builder.Light.Global),
		["Semantic"] = require(v1.Desktop.Builder.Light.Semantic)
	}
}
v7.Builder = v8
v7.Dark = {
	["Component"] = require(v1.Desktop.Dark.Component),
	["Global"] = require(v1.Desktop.Dark.Global),
	["Semantic"] = require(v1.Desktop.Dark.Semantic)
}
v7.Light = {
	["Component"] = require(v1.Desktop.Light.Component),
	["Global"] = require(v1.Desktop.Light.Global),
	["Semantic"] = require(v1.Desktop.Light.Semantic)
}
v3.Desktop = v7
local v9 = {
	["Map"] = {
		["Component"] = require(v1.Schema.Map.Component),
		["Global"] = require(v1.Schema.Map.Global),
		["Semantic"] = require(v1.Schema.Map.Semantic)
	},
	["Validators"] = {
		["validateComponent"] = require(v1.Schema.Validators.validateComponent),
		["validateGlobal"] = require(v1.Schema.Validators.validateGlobal),
		["validateSemantic"] = require(v1.Schema.Validators.validateSemantic)
	}
}
v3.Schema = v9
v2.tokens = v3
return v2