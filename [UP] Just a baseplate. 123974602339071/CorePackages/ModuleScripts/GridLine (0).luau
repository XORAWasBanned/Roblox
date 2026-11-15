-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.GridLine.GridLine
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Util.StyleUtil)
local v_u_5 = require(v1.Types)
local v6 = require(v1.Util.useViewportBinding)
local v_u_7 = v6.useViewportBinding
local v_u_8 = v6.useViewportVisibility
function GridLine(p_u_9) -- name: GridLine
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3
	local v10 = p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL and true or p_u_9.Orientation == v_u_5.ORIENTATION_HORIZONTAL
	local v11 = ("Invalid orientation %*"):format(p_u_9.Orientation)
	assert(v10, v11)
	local v12 = p_u_9.Color3 or v_u_4.GRID_LINE_COLOR3
	local v13 = p_u_9.Transparency or v_u_4.GRID_LINE_TRANSPARENCY
	local v_u_14 = p_u_9.Thickness or v_u_4.GRID_LINE_THICKNESS
	local v21 = v_u_7(function(p15)
		-- upvalues: (copy) p_u_9, (ref) v_u_5, (copy) v_u_14
		local v16
		if p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL then
			v16 = p15.plotToViewX(p_u_9.Position)
		else
			v16 = p15.plotToViewY(p_u_9.Position)
		end
		local v17, v18
		if p_u_9.OppositeAxisBounds then
			if p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL then
				v17 = p15.plotToViewY(p_u_9.OppositeAxisBounds.Min)
				v18 = p15.plotToViewY(p_u_9.OppositeAxisBounds.Max)
			else
				v17 = p15.plotToViewX(p_u_9.OppositeAxisBounds.Min)
				v18 = p15.plotToViewX(p_u_9.OppositeAxisBounds.Max)
			end
		else
			v17 = 0
			v18 = 1
		end
		local v19, v20
		if p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL then
			v19 = UDim2.fromScale(v16, (v17 + v18) / 2)
			v20 = UDim2.new(0, v_u_14, v18 - v17, 0)
		else
			v19 = UDim2.fromScale((v17 + v18) / 2, v16)
			v20 = UDim2.new(v18 - v17, 0, 0, v_u_14)
		end
		return {
			["position"] = v19,
			["size"] = v20
		}
	end, {
		p_u_9.Orientation,
		p_u_9.Position,
		p_u_9.OppositeAxisBounds,
		v_u_14
	})
	if v_u_8(function(p22)
		-- upvalues: (copy) p_u_9, (ref) v_u_5
		if p_u_9.OppositeAxisBounds then
			if p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL then
				return p22.isRectInViewport(Rect.new(p_u_9.Position, p_u_9.OppositeAxisBounds.Min, p_u_9.Position, p_u_9.OppositeAxisBounds.Max))
			else
				return p22.isRectInViewport(Rect.new(p_u_9.OppositeAxisBounds.Min, p_u_9.Position, p_u_9.OppositeAxisBounds.Max, p_u_9.Position))
			end
		elseif p_u_9.Orientation == v_u_5.ORIENTATION_VERTICAL then
			return p22.isPointInViewportX(p_u_9.Position)
		else
			return p22.isPointInViewportY(p_u_9.Position)
		end
	end, { p_u_9.Orientation, p_u_9.Position, p_u_9.OppositeAxisBounds }) then
		return v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["ZIndex"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = v21:map(function(p23)
				return p23.position
			end),
			["Size"] = v21:map(function(p24)
				return p24.size
			end),
			["BackgroundColor3"] = v12,
			["BackgroundTransparency"] = v13,
			["ZIndex"] = p_u_9.ZIndex
		}, p_u_9.children)
	else
		return nil
	end
end
return GridLine