-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AlertActions.AlertConstants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons).Icon
local v4 = require(v1.Enums.AlertSeverity)
require(v1.Enums.ButtonVariant)
return {
	["MAX_ACTION_COUNT"] = 3,
	["SEVERITY_TO_ICON"] = nil,
	["SEVERITY_TO_ICON"] = {
		[v4.Info] = v3.CircleI,
		[v4.Warning] = v3.TriangleExclamation,
		[v4.Success] = v3.CircleCheck,
		[v4.Error] = v3.CircleX
	}
}