-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.List
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.InputSize)
require(v1.Components.Types)
local v_u_4 = require(v1.Components.View)
local v_u_5 = require(v1.Utility.withCommonProps)
local v_u_6 = require(v1.Utility.withDefaults)
local v_u_7 = require(script.Parent.ListContext)
local v_u_8 = {
	["hasDivider"] = nil,
	["isContained"] = nil,
	["testId"] = "--foundation-list",
	["hasDivider"] = {
		["hasDivider"] = true,
		["isInset"] = true
	},
	["isContained"] = {
		["isContained"] = false,
		["hasMargin"] = true
	}
}
return v_u_3.memo(v_u_3.forwardRef(function(p9, p10) -- name: List
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
	local v_u_11 = v_u_6(p9, v_u_8)
	local v12 = v_u_11.hasDivider
	local v13
	if type(v12) == "boolean" then
		v13 = v_u_11.hasDivider
	else
		v13 = v_u_11.hasDivider.hasDivider
	end
	local v_u_14 = 0
	if v13 then
		v_u_3.Children.forEach(v_u_11.children, function(p15)
			-- upvalues: (ref) v_u_14
			if p15 and (p15.props and p15.props.LayoutOrder) then
				local v16 = v_u_14
				local v17 = p15.props.LayoutOrder
				v_u_14 = math.max(v16, v17)
			end
		end)
	end
	local v18 = v_u_11.isContained
	local v_u_19
	if type(v18) == "boolean" then
		v_u_19 = v_u_11.isContained
	else
		v_u_19 = v_u_11.isContained.isContained
	end
	local v_u_20
	if v_u_19 then
		v_u_20 = true
	else
		local v21 = v_u_11.isContained
		v_u_20 = type(v21) ~= "table" and true or v_u_11.isContained.hasMargin
	end
	local v22 = v_u_11.hasDivider
	local v_u_23
	if type(v22) == "boolean" then
		v_u_23 = v_u_11.hasDivider
	else
		v_u_23 = v_u_11.hasDivider.isInset
	end
	local v24 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_11, (copy) v_u_19, (copy) v_u_23, (copy) v_u_20, (ref) v_u_14
		return {
			["hasDivider"] = v_u_11.hasDivider,
			["isContained"] = v_u_19,
			["isInset"] = v_u_23,
			["hasMargin"] = v_u_20,
			["lastLayoutOrder"] = v_u_14,
			["size"] = v_u_11.size,
			["testId"] = v_u_11.testId
		}
	end, {
		v13,
		v_u_19,
		v_u_23,
		v_u_20,
		v_u_14,
		v_u_11.size,
		v_u_11.testId
	})
	return v_u_3.createElement(v_u_4, v_u_5(v_u_11, {
		["tag"] = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = v_u_19
		},
		["ref"] = p10
	}), {
		["ListContext"] = v_u_3.createElement(v_u_7.Provider, {
			["value"] = v24
		}, v_u_11.children)
	})
end))