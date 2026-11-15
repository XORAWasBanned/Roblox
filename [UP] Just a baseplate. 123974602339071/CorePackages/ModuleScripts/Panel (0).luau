-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Panel.Panel
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Util.StyleUtil)
require(v1.Types)
local v5 = require(v1.Util.useViewportBinding)
local v_u_6 = v5.useViewportBinding
local v_u_7 = v5.useViewportVisibility
function Panel(p_u_8) -- name: Panel
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4
	local v12 = v_u_6(function(p9)
		-- upvalues: (copy) p_u_8
		local v10 = p9.plotToView(p_u_8.Rect.Min)
		local v11 = p9.plotToView(p_u_8.Rect.Max)
		return {
			["position"] = UDim2.fromScale(v10.X, v10.Y),
			["size"] = UDim2.fromScale(v11.X - v10.X, v11.Y - v10.Y)
		}
	end, { p_u_8.Rect })
	if v_u_7(function(p13)
		-- upvalues: (copy) p_u_8
		return p13.isRectInViewport(p_u_8.Rect)
	end, { p_u_8.Rect }) then
		if p_u_8.Image then
			return v_u_3.createElement("ImageLabel", {
				["Position"] = v12:map(function(p14)
					return p14.position
				end),
				["Size"] = v12:map(function(p15)
					return p15.size
				end),
				["Image"] = p_u_8.Image,
				["ImageColor3"] = p_u_8.ImageColor3,
				["ImageTransparency"] = p_u_8.ImageTransparency,
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["ZIndex"] = p_u_8.ZIndex,
				[v_u_3.Tag] = p_u_8.Tag
			}, p_u_8.children)
		else
			return v_u_3.createElement("Frame", {
				["Position"] = v12:map(function(p16)
					return p16.position
				end),
				["Size"] = v12:map(function(p17)
					return p17.size
				end),
				["BackgroundColor3"] = p_u_8.BackgroundColor3 or v_u_4.GRID_BOX_BACKGROUND_COLOR3,
				["BackgroundTransparency"] = p_u_8.BackgroundTransparency or v_u_4.GRID_BOX_BACKGROUND_TRANSPARENCY,
				["BorderColor3"] = p_u_8.BorderColor3 or v_u_4.GRID_BOX_BORDER_COLOR3,
				["BorderSizePixel"] = p_u_8.BorderThickness or v_u_4.GRID_BOX_BORDER_THICKNESS,
				["ZIndex"] = p_u_8.ZIndex,
				[v_u_3.Tag] = p_u_8.Tag
			}, p_u_8.children)
		end
	else
		return nil
	end
end
return Panel