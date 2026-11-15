-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.jest.config
local v1 = script.Parent
return {
	["projects"] = { require(v1.Components.Tests)["jest.config"], require(v1.Hooks.Tests)["jest.config"], require(v1.Utils.Tests)["jest.config"] }
}