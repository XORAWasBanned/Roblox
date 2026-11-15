-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.getResponsiveSize
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.DialogSize)
require(v1.Providers.Style.Tokens)
local v_u_3 = require(script.Parent.useDialogVariants).DIALOG_SIZES
return function(p4, p5, p6) -- name: getResponsiveSize
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v7 = ({
		[v_u_2.Small] = p6.Padding.Large,
		[v_u_2.Medium] = p6.Padding.XLarge,
		[v_u_2.Large] = p6.Padding.XLarge
	})[p5] * 2
	local v8 = p6.Config.UI.Scale
	if p4 <= v_u_3[v_u_2.Medium] * v8 + v7 and p5 ~= v_u_2.Small then
		return v_u_2.Small
	elseif p4 <= v_u_3[v_u_2.Large] * v8 + v7 and p5 == v_u_2.Large then
		return v_u_2.Medium
	else
		return p5
	end
end