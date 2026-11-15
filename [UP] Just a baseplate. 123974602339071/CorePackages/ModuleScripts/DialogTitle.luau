-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Title.DialogTitle
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v_u_5 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Providers.Style.useTokens)
local v_u_8 = require(script.Parent.Parent.useDialog)
local v_u_9 = require(script.Parent.Parent.useDialogVariants).useDialogVariants
return function(p10) -- name: DialogTitle
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v11 = v_u_7()
	local v12 = v_u_8()
	local v13 = v_u_9()
	local v14 = v_u_3.createElement
	local v15 = v_u_6
	local v16 = {
		["tag"] = v13.title.tag,
		["LayoutOrder"] = v_u_4.MIN_LAYOUT_ORDER + 1
	}
	local v17 = {}
	local v18
	if v12.hasHeroMedia then
		v18 = nil
	else
		v18 = UDim.new(0, v13.closeAffordance.offset + v11.Size.Size_1000)
	end
	v17.right = v18
	local v19
	if v12.hasHeroMedia then
		v19 = nil
	else
		v19 = UDim.new(0, v11.Size.Size_500)
	end
	v17.top = v19
	v16.padding = v17
	v16.testId = ("%*--title"):format(v12.testId)
	return v14(v15, v16, {
		["Title"] = v_u_3.createElement(v_u_5, {
			["tag"] = v13.titleText.tag,
			["Text"] = p10.text
		})
	})
end