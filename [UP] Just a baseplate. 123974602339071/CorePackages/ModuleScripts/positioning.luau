-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.positioning
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Flags)
local v_u_3 = require(v1.Enums.PopoverAlign)
local v_u_4 = require(v1.Enums.PopoverSide)
return {
	["adjustForOnScreenKeyboard"] = function(p5, p6, p7) -- name: adjustForOnScreenKeyboard
		local v8 = p6 - p7
		local v9 = p5.Max.Y
		local v10 = v8.Y
		local v11 = math.min(v9, v10)
		return Rect.new(p5.Min, Vector2.new(p5.Max.X, v11))
	end,
	["isOnScreen"] = function(p12, p13) -- name: isOnScreen
		return p12.Min.X <= p13.Max.X and (p12.Max.X >= p13.Min.X and (p12.Min.Y <= p13.Max.Y and p12.Max.Y >= p13.Min.Y))
	end,
	["calculateSide"] = function(p14, p15, p16, p17) -- name: calculateSide
		-- upvalues: (copy) v_u_4
		if p14 == v_u_4.Top then
			if p15.Min.Y - p17.Y < p16.Min.Y and p15.Max.Y + p17.Y < p16.Max.Y then
				return v_u_4.Bottom
			end
		elseif p14 == v_u_4.Bottom then
			if p15.Max.Y + p17.Y > p16.Max.Y and p15.Min.Y - p17.Y > p16.Min.Y then
				return v_u_4.Top
			end
		elseif p14 == v_u_4.Left then
			if p15.Min.X - p17.X < p16.Min.X and p15.Max.X + p17.X < p16.Max.X then
				return v_u_4.Right
			end
		elseif p14 == v_u_4.Right and (p15.Max.X + p17.X > p16.Max.X and p15.Min.X - p17.X > p16.Min.X) then
			return v_u_4.Left
		end
		return p14
	end,
	["calculatePositions"] = function(p18, p19, p20, p21, p22, p23, p24, p25) -- name: calculatePositions
		-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
		local v26 = {
			["X"] = 0,
			["Y"] = 0
		}
		local v27 = {
			["X"] = 0,
			["Y"] = 0
		}
		local v28 = {
			["X"] = 0,
			["Y"] = 0
		}
		local v29 = p18 == v_u_4.Top and true or p18 == v_u_4.Bottom
		local v30 = p18 == v_u_4.Top and true or p18 == v_u_4.Left
		local v31 = p22.Height
		local v32 = p22.Min.X
		local v33 = p22.Min.Y
		local v34 = p25.Y
		local v35 = p25.X
		local v36 = p22.Max.X
		local v37 = p22.Max.Y
		local v38 = p23.Min.Y
		local v39 = p23.Max.Y
		local v40 = p23.Min.X
		local v41 = p23.Max.X
		local v42, v43
		if v29 then
			v31 = p22.Width
			v32 = p22.Min.Y
			v33 = p22.Min.X
			v34 = p25.X
			v35 = p25.Y
			v36 = p22.Max.Y
			v37 = p22.Max.X
			v38 = p23.Min.X
			v39 = p23.Max.X
			v40 = p23.Min.Y
			v41 = p23.Max.Y
			v42 = "Y"
			v43 = "X"
		else
			v42 = "X"
			v43 = "Y"
		end
		local v44 = p19 + p24
		if v30 then
			v26[v42] = v32 - v44 - v35
			v27[v42] = v35
		else
			v26[v42] = v36 + v44
			v27[v42] = 0
		end
		if p20 == v_u_3.Start then
			v26[v43] = v33 + p21
		elseif p20 == v_u_3.Center then
			v26[v43] = v33 + v31 / 2 - v34 / 2 + p21
		else
			v26[v43] = v37 + -p21
			v28[v43] = 1
		end
		local v45 = v26[v43] - v28[v43] * v34
		local v46 = v45 + v34
		if v45 < v38 then
			v28[v43] = 0
			v26[v43] = v38
		elseif v39 < v46 then
			v28[v43] = 1
			v26[v43] = v39
		end
		local v47 = v26[v43] - v28[v43] * v34
		local v48 = v47 + v34
		local v49 = math.max(v33, v47)
		local v50 = math.min(v37, v48)
		local v51
		if v49 <= v50 then
			v51 = (v49 + v50) / 2
		elseif v48 < v33 then
			v51 = v48 - p24
		else
			v51 = v47 + p24
		end
		v27[v43] = v51 - v26[v43]
		local v52 = v26[v42]
		local v53 = v41 - v35 - v44
		local v54 = not v_u_2.FoundationPopoverClampMinBound and 0 or v40
		local v55 = math.max(v53, v54)
		v26[v42] = math.clamp(v52, v40, v55)
		v26.X = v26.X - p23.Min.X
		v26.Y = v26.Y - p23.Min.Y
		return Vector2.new(v26.X, v26.Y), Vector2.new(v27.X, v27.Y), Vector2.new(v28.X, v28.Y)
	end,
	["calculatePopoverBounds"] = function(p56, p57, p58, p59, p60) -- name: calculatePopoverBounds
		-- upvalues: (copy) v_u_4
		if p56 == v_u_4.Top or p56 == v_u_4.Bottom then
			return p60 + Vector2.new(p58, p57 + p59)
		else
			return p60 + Vector2.new(p57 + p59, p58)
		end
	end,
	["calculateAlign"] = function(p61, p62, p63, p64, p65) -- name: calculateAlign
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		if p61 == v_u_4.Top and true or p61 == v_u_4.Bottom then
			if p62 == v_u_3.Start then
				if p63.Min.X + p65.X > p64.Max.X then
					return v_u_3.End
				end
			elseif p62 == v_u_3.End and p63.Max.X - p65.X < p64.Min.X then
				return v_u_3.Start
			end
		elseif p62 == v_u_3.Start then
			if p63.Min.Y + p65.Y > p64.Max.Y then
				return v_u_3.End
			end
		elseif p62 == v_u_3.End and p63.Max.Y - p65.Y < p64.Min.Y then
			return v_u_3.Start
		end
		return p62
	end
}