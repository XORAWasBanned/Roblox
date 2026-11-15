-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Point.Point
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Types)
local v_u_4 = require(v1.Components.Positioner)
local v_u_5 = require(v1.Util.StyleUtil)
function Point(p6) -- name: Point
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v7 = p6.Size or v_u_5.POINT_HANDLE_SIZE
	local v8 = p6.OutlineThickness or v_u_5.POINT_HANDLE_OUTLINE_THICKNESS
	local v9 = p6.Color3 or v_u_5.POINT_HANDLE_COLOR3
	local v10 = p6.OutlineColor3 or v_u_5.POINT_HANDLE_OUTLINE_COLOR3
	local v11 = v_u_3.createElement
	local v12 = v_u_4
	local v13 = {
		["Position"] = p6.Position,
		["ZIndex"] = p6.ZIndex,
		["ref"] = p6.positionerRef
	}
	local v14 = {}
	local v15 = v_u_3.createElement
	local v16 = "ImageButton"
	local v17 = {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.fromOffset(v7 + 2 * v8, v7 + 2 * v8),
		["Image"] = p6.Image or v_u_5.POINT_HANDLE_IMAGE
	}
	if v8 == 0 then
		v10 = v9
	end
	v17.ImageColor3 = v10
	v17.ImageTransparency = p6.Transparency
	v17.BackgroundTransparency = 1
	v17.ZIndex = 1
	v17[v_u_3.Tag] = p6.Tag
	v14.Outer = v15(v16, v17, p6.children)
	local v18
	if v8 > 0 then
		v18 = v_u_3.createElement("ImageButton", {
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Size"] = UDim2.fromOffset(v7, v7),
			["Interactable"] = false,
			["Selectable"] = false,
			["Image"] = p6.Image or v_u_5.POINT_HANDLE_IMAGE,
			["ImageColor3"] = v9,
			["ImageTransparency"] = p6.Transparency,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			[v_u_3.Tag] = p6.Tag
		})
	else
		v18 = false
	end
	v14.Inner = v18
	return v11(v12, v13, v14)
end
return Point