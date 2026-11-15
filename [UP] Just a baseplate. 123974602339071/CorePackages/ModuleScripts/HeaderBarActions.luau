-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.Actions.HeaderBarActions
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.BuilderIcons)
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.HeaderBarSlot)
local v_u_5 = require(v1.Components.IconButton)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Components.HeaderBar.constants)
local v_u_8 = require(v1.Components.HeaderBar.useHeaderBarContext)
local v_u_9 = require(v1.Providers.Style.useTokens)
return v_u_3.memo(function(p10) -- name: HeaderBarActions
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v_u_11 = v_u_8()
	local v_u_12 = v_u_9()
	local v13, v14 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_11, (ref) v_u_4, (ref) v_u_7, (copy) v_u_12
		if v_u_11.slot == v_u_4.Leading then
			return v_u_7.LEADING_ACTIONS_LAYOUT_ORDER, {
				["left"] = UDim.new(0, -v_u_12.Size.Size_200)
			}
		elseif v_u_11.slot == v_u_4.Trailing then
			return v_u_7.TRAILING_ACTIONS_LAYOUT_ORDER, {
				["right"] = UDim.new(0, -v_u_12.Size.Size_200)
			}
		else
			return nil, nil
		end
	end, { v_u_11.slot, v_u_12.Size.Size_200 })
	local v15 = {}
	for v16, v17 in p10.actions do
		local v18 = v17.id
		v15[tostring(v18)] = v_u_3.createElement(v_u_5, {
			["icon"] = v17.icon,
			["onActivated"] = v17.onActivated,
			["LayoutOrder"] = v16,
			["testId"] = ("%*--actions--%*"):format(v_u_11.testId, v17.id)
		})
	end
	return v_u_3.createElement(v_u_6, {
		["tag"] = "row align-y-center shrink gap-small auto-xy",
		["padding"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["padding"] = v14,
		["LayoutOrder"] = v13,
		["testId"] = ("%*--actions"):format(v_u_11.testId)
	}, v15)
end)