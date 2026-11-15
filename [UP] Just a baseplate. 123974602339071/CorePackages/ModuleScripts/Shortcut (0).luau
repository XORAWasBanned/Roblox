-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Shortcut.Shortcut
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
require(v1.Enums.InputPlatform)
local v6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Enums.Placement)
require(v1.Enums.ShortcutSeparator)
local v8 = require(v1.Enums.ShortcutVariant)
local v_u_9 = require(v1.Utility.useInputPlatform)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(script.Parent.KeyCap)
local v_u_14 = require(script.Parent.Separator)
local v_u_15 = require(script.Parent.keyDisplay)
local v_u_16 = require(script.Parent.useShortcutVariants)
local v_u_17 = {
	["size"] = nil,
	["placement"] = nil,
	["variant"] = nil,
	["testId"] = "--foundation-shortcut",
	["size"] = v6.XSmall,
	["placement"] = v_u_7.Start,
	["variant"] = v8.Standard
}
return v_u_3.memo(v_u_3.forwardRef(function(p18, p19) -- name: Shortcut
	-- upvalues: (copy) v_u_12, (copy) v_u_17, (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_3, (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_5, (copy) v_u_11, (copy) v_u_7, (copy) v_u_4
	local v20 = v_u_12(p18, v_u_17)
	local v21 = v_u_10()
	local v22 = v_u_9()
	local v23 = v_u_16(v21, v20.size, v20.variant)
	local v24 = {}
	local v25 = 0
	local v26 = 0
	for v27, v28 in v20.shortcut do
		if v28.separator == nil then
			if v28.keyCode == nil or v_u_15.isNonDisplayable(v28.keyCode) then
				continue
			end
			v25 = v25 + 1
			v24[("Key%*"):format(v25)] = v_u_3.createElement(v_u_13, {
				["keyCode"] = v28.keyCode,
				["platform"] = v22,
				["variantProps"] = v23,
				["LayoutOrder"] = v27,
				["testId"] = ("%*--key-%*"):format(v20.testId, v25)
			})
		else
			v26 = v26 + 1
			v24[("Separator%*"):format(v26)] = v_u_3.createElement(v_u_14, {
				["separator"] = v28.separator,
				["variantProps"] = v23,
				["LayoutOrder"] = v27,
				["testId"] = ("%*--separator-%*"):format(v20.testId, v26)
			})
		end
	end
	local v29 = v_u_3.createElement
	local v30 = v_u_5
	local v31 = v_u_11(v20, {
		["tag"] = v23.container.tag,
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v23.container.gap),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		},
		["ref"] = p19
	})
	local v32 = {
		["Keys"] = v_u_3.createElement(v_u_5, {
			["tag"] = v23.keys.tag,
			["LayoutOrder"] = v20.placement == v_u_7.End and 2 or 1,
			["testId"] = ("%*--keys"):format(v20.testId)
		}, v24)
	}
	local v33
	if v20.keybinding == nil or v20.keybinding == "" then
		v33 = nil
	else
		v33 = v_u_3.createElement(v_u_4, {
			["Text"] = v20.keybinding,
			["tag"] = v23.keybinding.tag,
			["LayoutOrder"] = v20.placement == v_u_7.End and 1 or 2,
			["testId"] = ("%*--keybinding"):format(v20.testId)
		})
	end
	v32.Keybinding = v33
	return v29(v30, v31, v32)
end))