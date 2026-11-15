-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.SidePositioner.SidePositioner
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Types)
local v5 = require(v1.Util.useViewportBinding)
local v_u_6 = v5.useViewportBinding
local v_u_7 = v5.useViewportVisibility
function SidePositioner(p_u_8) -- name: SidePositioner
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_3
	local v13 = v_u_6(function(p9)
		-- upvalues: (copy) p_u_8, (ref) v_u_4
		local v10 = 0
		local v11 = 0
		local v12 = p_u_8.Side
		if v12 == v_u_4.SIDE_TOP and true or v12 == v_u_4.SIDE_BOTTOM then
			v10 = p9.plotToViewX(p_u_8.Position)
			if p_u_8.Side == v_u_4.SIDE_BOTTOM then
				v11 = 1
			end
		else
			v11 = p9.plotToViewY(p_u_8.Position)
			if p_u_8.Side == v_u_4.SIDE_RIGHT then
				v10 = 1
			end
		end
		return UDim2.fromScale(v10, v11)
	end, { p_u_8.Side, p_u_8.Position })
	if v_u_7(function(p14)
		-- upvalues: (copy) p_u_8, (ref) v_u_4
		local v15 = p_u_8.Side
		if v15 == v_u_4.SIDE_TOP and true or v15 == v_u_4.SIDE_BOTTOM then
			return p14.isPointInViewportX(p_u_8.Position)
		else
			return p14.isPointInViewportY(p_u_8.Position)
		end
	end, { p_u_8.Side, p_u_8.Position }) then
		return v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = v13,
			["Size"] = UDim2.fromOffset(0, 0),
			["ZIndex"] = p_u_8.ZIndex
		}, p_u_8.children)
	else
		return nil
	end
end
return SidePositioner