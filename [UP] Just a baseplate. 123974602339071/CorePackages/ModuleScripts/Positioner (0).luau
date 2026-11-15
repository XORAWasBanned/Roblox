-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Positioner.Positioner
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Types)
local v4 = require(v1.Util.useViewportBinding)
local v_u_5 = v4.useViewportBinding
local v_u_6 = v4.useViewportVisibility
function Positioner(p7, p8) -- name: Positioner
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	local v9 = p7.Position
	if typeof(v9) == "Vector2" then
		local v_u_10 = p7.Position
		local v13 = v_u_5(function(p11)
			-- upvalues: (copy) v_u_10
			local v12 = p11.plotToView(v_u_10)
			return UDim2.fromScale(v12.X, v12.Y)
		end, { v_u_10 })
		if v_u_6(function(p14)
			-- upvalues: (copy) v_u_10
			return p14.isPointInViewport(v_u_10)
		end, { v_u_10 }) then
			return v_u_3.createElement("Frame", {
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = v13,
				["Size"] = UDim2.fromOffset(0, 0),
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["ZIndex"] = p7.ZIndex,
				["ref"] = p8,
				[v_u_3.Tag] = p7.Tag
			}, p7.children)
		else
			return nil
		end
	else
		return v_u_3.createElement("Frame", {
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = p7.Position,
			["Size"] = UDim2.fromOffset(0, 0),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = p7.ZIndex,
			["ref"] = p8,
			[v_u_3.Tag] = p7.Tag
		}, p7.children)
	end
end
return v_u_3.forwardRef(Positioner)