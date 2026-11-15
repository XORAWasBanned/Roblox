-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.LinkElement
local v1 = script:FindFirstAncestor("Components").Parent.Parent
local v2 = script:FindFirstAncestor("InlineLayoutElements")
local v_u_3 = require(v1.React)
local v_u_4 = require(v1.Foundation)
local v_u_5 = v_u_4.Hooks.useTokens
local v_u_6 = require(v2.InlineSpanElement)
local v_u_7 = require(v2.HoverContext)
require(v2.RenderableInlineElement)
local v8 = {}
function HoverContextWrapper(p9) -- name: HoverContextWrapper
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v10, v_u_11 = v_u_7.useHoverContext(p9.id)
	local v13 = v_u_3.useCallback(function(p12)
		-- upvalues: (copy) v_u_11, (ref) v_u_4
		v_u_11(p12 == v_u_4.Enums.ControlState.Hover)
	end, { v_u_11 })
	local v14 = v_u_5().Color.State.Hover
	local v15 = v_u_3.createElement
	local v16 = v_u_4.View
	local v17 = {
		["tag"] = "size-0-0 auto-xy row",
		["LayoutOrder"] = nil,
		["onActivated"] = nil,
		["backgroundStyle"] = nil,
		["onStateChanged"] = nil,
		["stateLayer"] = nil,
		["LayoutOrder"] = p9.LayoutOrder,
		["onActivated"] = p9.onActivated
	}
	if not v10 then
		v14 = nil
	end
	v17.backgroundStyle = v14
	v17.onStateChanged = v13
	v17.stateLayer = {
		["affordance"] = v_u_4.Enums.StateLayerAffordance.None
	}
	return v15(v16, v17, p9.children)
end
function v8.new(p18, p19) -- name: new
	-- upvalues: (copy) v_u_6
	return v_u_6.new(HoverContextWrapper, p19, p18)
end
return v8