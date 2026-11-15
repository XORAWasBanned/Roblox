-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.Types
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Constants)
require(v1.Enums.DialogSize)
require(v2.React)
return {
	["nonSelectable"] = v3.MODAL.DISABLE_SELECTION,
	["isolatedSelectionGroup"] = v3.MODAL.TRAP_FOCUS
}