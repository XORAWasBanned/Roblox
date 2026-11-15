-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.useDialog
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.DialogSize)
local v_u_4 = require(script.Parent.DialogContext)
return function() -- name: useDialog
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.useContext(v_u_4)
end