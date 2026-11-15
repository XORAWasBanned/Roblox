-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Context.CreationFlowContext
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.Dash)
return require(v1.React).createContext({
	["captures"] = {},
	["capturesPagesIsFinished"] = v2.noop,
	["createMoment"] = v2.noop,
	["exitCreationFlow"] = v2.noop,
	["fetchAdditionalCaptures"] = v2.noop,
	["fetchInitialCaptures"] = v2.noop,
	["fireEvent"] = v2.noop,
	["getLocalization"] = v2.noop,
	["getUserConfiguration"] = v2.noop,
	["isTextFiltered"] = v2.noop,
	["setScreenOrientation"] = v2.noop
})