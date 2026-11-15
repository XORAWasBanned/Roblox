-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ButtonGroup.ButtonGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Button)
require(v1.Enums.ButtonVariant)
local v_u_5 = require(v1.Enums.FillBehavior)
local v6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Enums.Orientation)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.devAssert)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(v1.Utility.withDefaults)
local v_u_12 = {
	["maxButtonCount"] = 3,
	["orientation"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-button-group",
	["orientation"] = v_u_7.Horizontal,
	["size"] = v6.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p13, p14) -- name: ButtonGroup
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_9, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
	local v15 = v_u_11(p13, v_u_12)
	v_u_9(#v15.buttons <= v15.maxButtonCount, (("ButtonGroup: a maximum of %* buttons is supported, got %*."):format(v15.maxButtonCount, #v15.buttons)))
	local v16 = v15.orientation == v_u_7.Vertical
	local v17 = v16 or v15.fillBehavior == v_u_5.Fill
	local v18
	if v16 or not v17 then
		v18 = nil
	else
		v18 = v_u_5.Fill
	end
	local v19 = {}
	for v20, v21 in v15.buttons do
		v19[("%*-%*"):format(v20, v21.text)] = v_u_3.createElement(v_u_4, {
			["text"] = v21.text,
			["onActivated"] = v21.onActivated,
			["variant"] = v21.variant,
			["isDisabled"] = v21.isDisabled,
			["isLoading"] = v21.isLoading,
			["icon"] = v21.icon,
			["inputDelay"] = v21.inputDelay,
			["ref"] = v21.ref,
			["size"] = v15.size,
			["fillBehavior"] = v18,
			["LayoutOrder"] = v20,
			["testId"] = v21.testId or ("%*--button-%*"):format(v15.testId, v20)
		})
	end
	local v22 = v_u_3.createElement
	local v23 = v_u_8
	local v24 = v_u_10
	local v25 = {}
	local v26 = {
		["gap-small"] = true,
		["col flex-x-fill"] = v16,
		["row"] = not v16 and v17
	}
	local v27 = not v16
	if v27 then
		v27 = not v17
	end
	v26["row wrap"] = v27
	v26["size-full-0 auto-y"] = v17
	v26["auto-xy"] = not v17
	v25.tag = v26
	v25.ref = p14
	return v22(v23, v24(v15, v25), v19)
end))