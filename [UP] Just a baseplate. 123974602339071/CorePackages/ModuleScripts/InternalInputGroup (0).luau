-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInputGroup.InternalInputGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = v1.Components
local v_u_5 = require(v4.Text)
require(v4.Types)
local v_u_6 = require(v4.View)
local v_u_7 = require(v1.Providers.Style.useTokens)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v10 = require(v1.Enums.InputPlacement)
local v11 = require(v1.Enums.InputSize)
local v_u_12 = require(script.Parent.InputGroupContext)
local v_u_13 = require(script.Parent.useInputGroupVariants)
local v_u_14 = {
	["size"] = nil,
	["placement"] = nil,
	["testId"] = "--foundation-internal-input-group",
	["size"] = v11.Medium,
	["placement"] = v10.Start
}
return v_u_3.memo(v_u_3.forwardRef(function(p15, p16) -- name: InternalInputGroup
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_7, (copy) v_u_13, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5
	local v_u_17 = v_u_9(p15, v_u_14)
	local v18 = v_u_13(v_u_7(), v_u_17.size)
	local v19 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_17
		return {
			["size"] = v_u_17.size,
			["placement"] = v_u_17.placement
		}
	end, { v_u_17.size, v_u_17.placement })
	local v20 = v_u_3.createElement
	local v21 = v_u_6
	local v22 = v_u_8(v_u_17, {
		["tag"] = v18.container.tag,
		["ref"] = p16
	})
	local v23 = {}
	local v24 = v_u_3.createElement
	local v25 = v_u_12.Provider
	local v26 = {
		["value"] = v19
	}
	local v27 = {}
	local v28
	if v_u_17.legend == nil or v_u_17.legend == "" then
		v28 = nil
	else
		v28 = v_u_3.createElement(v_u_5, {
			["Text"] = nil,
			["tag"] = nil,
			["testId"] = nil,
			["LayoutOrder"] = 0,
			["Text"] = v_u_17.legend,
			["tag"] = v18.legend.tag,
			["testId"] = ("%*--label"):format(v_u_17.testId)
		})
	end
	v27.GroupLabel = v28
	v27.Children = v_u_3.createElement(v_u_6, {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = v18.children.tag
	}, v_u_17.children)
	v23.InputGroupContext = v24(v25, v26, v27)
	return v20(v21, v22, v23)
end))