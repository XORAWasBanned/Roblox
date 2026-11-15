-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenu
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Flags)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.useScaledValue)
local v_u_7 = require(v1.Utility.useBindable)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
require(v1.Enums.ControlState)
local v10 = require(v1.Enums.Radius)
require(v1.Components.Types)
local v11 = require(v1.Enums.InputSize)
local v_u_12 = require(script.Parent.BaseMenuContext)
local v_u_13 = require(script.Parent.BaseMenuScrollContainer)
local v_u_14 = require(script.Parent.useSubmenuHover)
local v_u_15 = require(script.Parent.DeclarativeBaseMenuContent)
local v_u_16 = {
	["size"] = v11.Medium
}
local v_u_17 = {
	[v10.Small] = "radius-small",
	[v10.Medium] = "radius-medium"
}
return v_u_3.memo(v_u_3.forwardRef(function(p18, p19) -- name: BaseMenu
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_14, (copy) v_u_4, (copy) v_u_15, (copy) v_u_17, (copy) v_u_12, (copy) v_u_13, (copy) v_u_8, (copy) v_u_5
	local v20, v_u_21 = v_u_3.useBinding(false)
	local v22 = table.clone(v_u_16)
	v22.Visible = v20
	local v_u_23 = v_u_9(p18, v22)
	local v_u_24 = v_u_7(v_u_23.width)
	local v25 = v_u_7(v_u_23.maxHeight)
	local v_u_26 = v_u_6(260)
	local v_u_27 = v_u_6(320)
	local v_u_28, v_u_29 = v_u_3.useState(false)
	local v_u_30 = v_u_14()
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_21
		task.delay(0, function()
			-- upvalues: (ref) v_u_21
			v_u_21(true)
		end)
	end, {})
	local v_u_31 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_29
		v_u_29(true)
	end, {})
	local v_u_33 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_24, (ref) v_u_4, (copy) v_u_26
		return v_u_24:map(function(p32)
			-- upvalues: (ref) v_u_4, (ref) v_u_26
			if p32 then
				return p32.Offset
			else
				return v_u_4.FoundationBaseMenuContentSizing and 0 or v_u_26
			end
		end)
	end, { v_u_24, v_u_26 })
	local v_u_36 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_24, (ref) v_u_4, (copy) v_u_23, (copy) v_u_27
		return v_u_24:map(function(p34)
			-- upvalues: (ref) v_u_4, (ref) v_u_23, (ref) v_u_27
			if v_u_4.FoundationBaseMenuContentSizing then
				return not p34 or v_u_23.couldGrow == true
			end
			local v35 = not p34
			if not v35 then
				if v_u_23.couldGrow == true then
					v35 = p34.Offset < v_u_27
				else
					v35 = false
				end
			end
			return v35
		end)
	end, { v_u_24, v_u_27, v_u_23.couldGrow })
	local v44 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_36, (copy) v_u_33, (ref) v_u_4, (copy) v_u_27
		local v37 = {}
		local v38 = { v_u_36, v_u_33 }
		v37.MinSize = v_u_3.joinBindings(v38):map(function(p39)
			-- upvalues: (ref) v_u_4
			local v40 = p39[1]
			local v41 = p39[2]
			if v40 then
				if v_u_4.FoundationBaseMenuContentSizing and v41 == 0 then
					return nil
				else
					return Vector2.new(v41, 0)
				end
			else
				return nil
			end
		end)
		local v42
		if v_u_4.FoundationBaseMenuContentSizing then
			v42 = nil
		else
			v42 = v_u_36:map(function(p43)
				-- upvalues: (ref) v_u_27
				if p43 then
					return Vector2.new(v_u_27, (1 / 0))
				else
					return nil
				end
			end)
		end
		v37.MaxSize = v42
		return v37
	end, { v_u_36, v_u_33, v_u_27 })
	local v45 = v_u_23.children
	if not v45 and v_u_23.items then
		v45 = v_u_3.createElement(v_u_15, {
			["items"] = v_u_23.items,
			["size"] = v_u_23.size
		})
	end
	local v46 = v_u_23.radius == nil and "" or v_u_17[v_u_23.radius]
	local v47 = {
		["value"] = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_23, (copy) v_u_28, (copy) v_u_31, (copy) v_u_30
			return {
				["onActivated"] = nil,
				["onNestedLeafActivated"] = nil,
				["size"] = nil,
				["hasLeading"] = nil,
				["setHasLeading"] = nil,
				["hoverOpenPath"] = nil,
				["hoverOpenAtDepth"] = nil,
				["hoverCloseAtDepth"] = nil,
				["hoverReset"] = nil,
				["depth"] = 1,
				["maxHeight"] = nil,
				["onActivated"] = v_u_23.onActivated,
				["onNestedLeafActivated"] = v_u_23.onNestedLeafActivated,
				["size"] = v_u_23.size,
				["hasLeading"] = v_u_28,
				["setHasLeading"] = v_u_31,
				["hoverOpenPath"] = v_u_30.openPath,
				["hoverOpenAtDepth"] = v_u_30.openAtDepth,
				["hoverCloseAtDepth"] = v_u_30.closeAtDepth,
				["hoverReset"] = v_u_30.reset,
				["maxHeight"] = v_u_23.maxHeight
			}
		end, {
			v_u_23.onActivated,
			v_u_23.onNestedLeafActivated,
			v_u_23.size,
			v_u_28,
			v_u_30.openPath,
			v_u_30.openAtDepth,
			v_u_30.closeAtDepth,
			v_u_30.reset,
			v_u_23.maxHeight
		})
	}
	local v48 = v_u_3.createElement(v_u_12.Provider, v47, v45)
	if v_u_23.maxHeight then
		return v_u_3.createElement(v_u_13, {
			["maxHeight"] = v25,
			["autoSize"] = v_u_36,
			["width"] = v_u_24,
			["scrollViewProps"] = v_u_8(v_u_23, {
				["ref"] = p19,
				["sizeConstraint"] = v44,
				["scrollingFrameRef"] = v_u_23.scrollingFrameRef,
				["tag"] = ("stroke-standard stroke-default %*"):format(v46)
			})
		}, v48)
	else
		return v_u_3.createElement(v_u_5, v_u_8(v_u_23, {
			["tag"] = ("col stroke-standard stroke-default %*"):format(v46),
			["AutomaticSize"] = v_u_36:map(function(p49)
				if p49 then
					return Enum.AutomaticSize.XY
				else
					return Enum.AutomaticSize.Y
				end
			end),
			["Size"] = v_u_3.joinBindings({ v_u_36, v_u_24 }):map(function(p50)
				local v51 = p50[1]
				local v52 = p50[2]
				if v51 then
					return nil
				else
					return UDim2.new(v52, UDim.new())
				end
			end),
			["ref"] = p19,
			["sizeConstraint"] = v44
		}), v48)
	end
end))