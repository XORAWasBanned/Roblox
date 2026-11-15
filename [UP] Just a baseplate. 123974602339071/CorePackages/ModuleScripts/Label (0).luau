-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Label.Label
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Util.StyleUtil)
require(v1.Types)
local v5 = require(v1.Util.useViewportBinding)
local v_u_6 = v5.useViewportBinding
local v_u_7 = v5.useViewportVisibility
local function v_u_12(p8, p9) -- name: anchorForAlignment
	local v10 = p8 == Enum.TextXAlignment.Left and 0 or (p8 == Enum.TextXAlignment.Center and 0.5 or (p8 == Enum.TextXAlignment.Right and 1 or 0))
	local v11 = p9 == Enum.TextYAlignment.Top and 0 or (p9 == Enum.TextYAlignment.Center and 0.5 or (p9 == Enum.TextYAlignment.Bottom and 1 or 0))
	return Vector2.new(v10, v11)
end
function Label(p_u_13) -- name: Label
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4
	local v_u_14
	if p_u_13.TextXAlignment then
		v_u_14 = p_u_13.TextXAlignment
	else
		v_u_14 = Enum.TextXAlignment.Center
	end
	local v_u_15
	if p_u_13.TextYAlignment then
		v_u_15 = p_u_13.TextYAlignment
	else
		v_u_15 = Enum.TextYAlignment.Center
	end
	local v16 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_14, (copy) v_u_15
		return v_u_12(v_u_14, v_u_15)
	end, { p_u_13.TextXAlignment, p_u_13.TextYAlignment })
	local v20 = v_u_6(function(p17)
		-- upvalues: (copy) p_u_13
		local v18
		if p_u_13.Offset then
			v18 = p_u_13.Offset
		else
			v18 = Vector2.new(0, 0)
		end
		local v19 = p17.plotToView(p_u_13.Position)
		return UDim2.new(v19.X, v18.X, v19.Y, v18.Y)
	end, { p_u_13.Position, p_u_13.Offset })
	if v_u_7(function(p21)
		-- upvalues: (copy) p_u_13
		return p21.isPointInViewport(p_u_13.Position)
	end, { p_u_13.Position }) then
		return v_u_3.createElement("TextLabel", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["ZIndex"] = nil,
			["AnchorPoint"] = v16,
			["Position"] = v20,
			["Text"] = p_u_13.Text,
			["TextXAlignment"] = v_u_14,
			["TextYAlignment"] = v_u_15,
			["TextColor3"] = p_u_13.Color3 or v_u_4.GRID_LABEL_COLOR3,
			["TextSize"] = p_u_13.FontSize or v_u_4.GRID_LABEL_FONT_SIZE,
			["ZIndex"] = p_u_13.ZIndex
		}, p_u_13.children)
	else
		return nil
	end
end
return Label