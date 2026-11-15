-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Shortcut.Separator
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
local v5 = require(v1.Enums.ShortcutSeparator)
require(script.Parent.useShortcutVariants)
local v_u_6 = {
	[v5.Or] = "/",
	[v5.More] = "\226\128\166"
}
return function(p7) -- name: Separator
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	return v_u_3.createElement(v_u_4, {
		["Text"] = v_u_6[p7.separator],
		["tag"] = p7.variantProps.separator.tag,
		["LayoutOrder"] = p7.LayoutOrder,
		["testId"] = p7.testId
	})
end