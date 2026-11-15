-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.ContentPlugin.getPanelPosition
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.PopoverAlign)
local v_u_3 = require(v1.Enums.PopoverSide)
require(v1.Providers.StudioPanels.Types)
return function(p4, p5, p6, p7, p8) -- name: getPanelPosition
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v9 = 0
	local v10
	if type(p4) == "table" then
		v10 = p4.offset
		p4 = p4.position
	else
		v10 = 0
	end
	if type(p5) == "table" then
		v9 = p5.offset
		p5 = p5.position
	end
	local v11 = v10 + (p8 or 0)
	local v12 = 0
	local v13
	if p5 == v_u_2.Center then
		v13 = 0
		v12 = 0.5
	elseif p5 == v_u_2.End then
		v13 = -v9
		v12 = 1
	else
		v13 = v9
	end
	local v14 = nil
	local v15 = nil
	local v16 = nil
	if p4 == v_u_3.Top then
		v14 = Vector2.new(v13, -v11)
		v15 = Vector2.new(v12, 0)
		v16 = Vector2.new(v12, 1)
	elseif p4 == v_u_3.Bottom then
		v14 = Vector2.new(v13, v11)
		v15 = Vector2.new(v12, 1)
		v16 = Vector2.new(v12, 0)
	elseif p4 == v_u_3.Left then
		v14 = Vector2.new(-v11, v13)
		v15 = Vector2.new(0, v12)
		v16 = Vector2.new(1, v12)
	elseif p4 == v_u_3.Right then
		v14 = Vector2.new(v11, v13)
		v15 = Vector2.new(1, v12)
		v16 = Vector2.new(0, v12)
	end
	local v17 = p7 or 0
	if v17 > 0 then
		local v18 = p4 == v_u_3.Top and true or p4 == v_u_3.Bottom
		local v19 = v17 * 2
		local v20 = v17 * 2
		local v21, v22
		if v18 then
			v21 = v19 + v9
			v22 = v20 + v11
		else
			v21 = v19 + v11
			v22 = v20 + v9
		end
		v14 = v14 + Vector2.new(v16.X * v21 - v17, v16.Y * v22 - v17)
	end
	if p6 then
		v15 = Vector2.zero
	else
		p6 = v14
	end
	return {
		["targetAnchorPoint"] = v15,
		["subjectAnchorPoint"] = v16,
		["offset"] = p6
	}
end