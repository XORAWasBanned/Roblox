-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Accordion.Accordion
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Components.View)
local v_u_5 = require(v1.Utility.withCommonProps)
local v_u_6 = require(v1.Utility.withDefaults)
local v_u_7 = require(script.Parent.AccordionContext)
require(script.Parent.useAccordion)
local v8 = require(v1.Enums.InputPlacement)
local v9 = require(v1.Enums.InputSize)
local v_u_10 = {
	["chevronPosition"] = nil,
	["isContained"] = false,
	["size"] = nil,
	["width"] = nil,
	["testId"] = "--foundation-accordion",
	["chevronPosition"] = v8.End,
	["size"] = v9.Medium,
	["width"] = UDim.new(1, 0)
}
return v_u_3.memo(v_u_3.forwardRef(function(p11, p12) -- name: Accordion
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
	local v_u_13 = v_u_6(p11, v_u_10)
	local v14 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_13
		return {
			["onAccordionItemActivated"] = v_u_13.onActivated,
			["itemSize"] = v_u_13.size,
			["isContained"] = v_u_13.isContained,
			["chevronPosition"] = v_u_13.chevronPosition,
			["testId"] = v_u_13.testId
		}
	end, {
		v_u_13.onActivated,
		v_u_13.size,
		v_u_13.isContained,
		v_u_13.chevronPosition,
		v_u_13.testId
	})
	local v15 = v_u_3.createElement
	local v16 = v_u_4
	local v17 = v_u_5(v_u_13, {
		["tag"] = "col flex-y-evenly auto-y",
		["Size"] = nil,
		["ref"] = nil,
		["Size"] = UDim2.new(v_u_13.width, UDim.new(0, 0)),
		["ref"] = p12
	})
	local v18 = {
		["AccordionContext"] = v_u_3.createElement(v_u_7.Provider, {
			["value"] = v14
		}, v_u_13.children)
	}
	return v15(v16, v17, v18)
end))