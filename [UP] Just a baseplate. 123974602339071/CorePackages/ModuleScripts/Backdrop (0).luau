-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Backdrop.Backdrop
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Constants)
local v_u_6 = require(v1.Enums.StateLayerAffordance)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Utility.mapBindable)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(v1.Utility.withDefaults)
local v_u_12 = {
	["transparency"] = 0,
	["Size"] = nil,
	["testId"] = "--foundation-backdrop",
	["Size"] = UDim2.fromScale(2, 2)
}
return v_u_4.memo(v_u_4.forwardRef(function(p13, p14) -- name: Backdrop
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7, (copy) v_u_10, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v15 = v_u_11(p13, v_u_12)
	local v_u_16 = v_u_9()
	local v17 = v_u_4.createElement
	local v18 = v_u_7
	local v19 = v_u_10
	local v23 = {
		["Size"] = v15.Size,
		["backgroundStyle"] = v_u_8(v15.transparency, function(p20)
			-- upvalues: (copy) v_u_16
			local v21 = {
				["Color3"] = v_u_16.Color.Common.Backdrop.Color3
			}
			local v22 = v_u_16.Color.Common.Backdrop.Transparency
			v21.Transparency = math.lerp(v22, 1, p20)
			return v21
		end),
		["onActivated"] = v15.onActivated or v_u_3.noop,
		["selection"] = v_u_5.MODAL.DISABLE_SELECTION,
		["stateLayer"] = {
			["affordance"] = v_u_6.None
		},
		["tag"] = {
			["position-center-center"] = v15.Position == nil,
			["anchor-center-center"] = v15.AnchorPoint == nil
		},
		["ref"] = p14
	}
	return v17(v18, v19(v15, v23))
end))