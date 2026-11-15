-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Types
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Constants)
require(v1.Enums.DialogSize)
require(v1.Enums.OnCloseCallbackReason)
return {
	["nonSelectable"] = v2.MODAL.DISABLE_SELECTION,
	["isolatedSelectionGroup"] = v2.MODAL.TRAP_FOCUS
}