-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Text.DialogText
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local v_u_6 = require(script.Parent.Parent.useDialog)
return function(p7) -- name: DialogText
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v8 = v_u_5()
	local v9 = v_u_6()
	return v_u_3.createElement(v_u_4, {
		["Text"] = nil,
		["RichText"] = true,
		["tag"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["Text"] = p7.Text,
		["tag"] = v8.contentText.tag,
		["LayoutOrder"] = p7.LayoutOrder,
		["testId"] = ("%*--text"):format(v9.testId)
	})
end