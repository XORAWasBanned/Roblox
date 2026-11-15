-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuScrollContainer
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.ScrollView)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.withCommonProps)
local function v_u_8(p7) -- name: computeAutomaticSize
	if p7.autoSize then
		if p7.isOverMaxHeight then
			return Enum.AutomaticSize.X
		else
			return Enum.AutomaticSize.XY
		end
	elseif p7.isOverMaxHeight then
		return Enum.AutomaticSize.None
	else
		return Enum.AutomaticSize.Y
	end
end
local function v_u_11(p9) -- name: computeSize
	local v10
	if p9.isOverMaxHeight and p9.maxHeight then
		v10 = UDim.new(0, p9.maxHeight)
	else
		v10 = UDim.new()
	end
	if p9.autoSize then
		return UDim2.new(UDim.new(), v10)
	else
		return UDim2.new(p9.width or UDim.new(), v10)
	end
end
return function(p12) -- name: BaseMenuScrollContainer
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_11, (copy) v_u_5
	local v13 = v_u_3.useBinding(true)
	local v14 = v_u_3.useBinding(nil)
	local v15 = p12.autoSize or v13
	local v16 = p12.width or v14
	local v_u_17 = p12.maxHeight
	local v_u_18, v_u_19 = v_u_3.useBinding(UDim2.fromScale(0, 1))
	local v23 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_18, (copy) v_u_17
		local v20 = {
			["canvasSize"] = v_u_18,
			["maxHeight"] = v_u_17
		}
		return v_u_3.joinBindings(v20):map(function(p21)
			local v22
			if p21.maxHeight == nil then
				v22 = false
			else
				v22 = p21.canvasSize.Y.Offset > p21.maxHeight
			end
			return v22
		end)
	end, { v_u_17 })
	local v25 = v_u_3.useCallback(function(p24)
		-- upvalues: (copy) v_u_19
		return v_u_19(UDim2.fromOffset(p24.AbsoluteSize.X, p24.AbsoluteSize.Y))
	end, { v_u_19 })
	local v26 = v_u_3.joinBindings({
		["autoSize"] = v15,
		["isOverMaxHeight"] = v23
	}):map(v_u_8)
	local v27 = v_u_3.createElement
	local v28 = v_u_4
	local v29 = v_u_6
	local v30 = p12.scrollViewProps
	local v31 = {
		["ref"] = p12.scrollViewProps.ref,
		["sizeConstraint"] = p12.scrollViewProps.sizeConstraint,
		["tag"] = p12.scrollViewProps.tag,
		["InputSink"] = p12.scrollViewProps.InputSink,
		["scrollingFrameRef"] = p12.scrollViewProps.scrollingFrameRef,
		["scroll"] = {
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["AutomaticSize"] = v26,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["CanvasSize"] = v_u_18
		},
		["AutomaticSize"] = v26,
		["Size"] = v_u_3.joinBindings({
			["autoSize"] = v15,
			["width"] = v16,
			["isOverMaxHeight"] = v23,
			["maxHeight"] = v_u_17
		}):map(v_u_11)
	}
	return v27(v28, v29(v30, v31), v_u_3.createElement(v_u_5, {
		["tag"] = "col size-full-0 auto-y",
		["onAbsoluteSizeChanged"] = nil,
		["onAbsoluteSizeChanged"] = v25
	}, p12.children))
end