-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.ScrollbarButton.ScrollbarButton
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Types)
local v_u_4 = require(v1.Components.InputDetector)
local v_u_5 = require(v1.Util.StyleUtil)
function ScrollbarButton(p_u_6) -- name: ScrollbarButton
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	return v_u_3.createElement("ImageButton", {
		["AnchorPoint"] = p_u_6.AnchorPoint,
		["Position"] = p_u_6.Position,
		["Rotation"] = p_u_6.Rotation,
		["Size"] = p_u_6.Size,
		["Image"] = p_u_6.Image,
		["BackgroundColor3"] = p_u_6.Color3 or v_u_5.SCROLLBAR_BUTTON_COLOR3,
		["ZIndex"] = p_u_6.ZIndex
	}, {
		["MouseDetector"] = v_u_3.createElement(v_u_4, {
			["AnchorPoint"] = p_u_6.AnchorPoint,
			["OnClick"] = function() -- name: OnClick
				-- upvalues: (copy) p_u_6
				if p_u_6.OnClick then
					p_u_6.OnClick()
				end
			end,
			["OnDragMoved"] = function(p7) -- name: OnDragMoved
				-- upvalues: (copy) p_u_6
				if p_u_6.OnMoved then
					p_u_6.OnMoved(p7)
				end
			end
		})
	})
end
return ScrollbarButton