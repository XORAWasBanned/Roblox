-- Path: CorePackages.Packages._Index.Graphing.Graphing.Util.GridUtil
local v1 = script:FindFirstAncestor("Graphing")
local v_u_2 = require(v1.Util.MathUtil)
local v_u_3 = require(v1.Types)
local v_u_60 = {
	["getUniformValues"] = function(p4, p5, p6, p7) -- name: getUniformValues
		if p6 < p5 then
			local v8 = p6
			p6 = p5
			p5 = v8
		end
		local v9 = p4.Unit
		local v10 = p4.Offset or 0
		local v11 = (p5 - v10) / v9 - v9 * 1e-9
		local v12 = math.ceil(v11)
		local v13 = (p6 - v10) / v9 + v9 * 1e-9
		local v14 = {}
		for v15 = v12, math.floor(v13) do
			local v16 = v10 + v15 * v9
			if p7[v16] then
				continue
			end
			table.insert(v14, v16)
		end
		return v14
	end,
	["getLogarithmicValues"] = function(p17, p18, p19, p20) -- name: getLogarithmicValues
		-- upvalues: (copy) v_u_2
		if p19 < p18 then
			local v21 = p19
			p19 = p18
			p18 = v21
		end
		local v22 = p17.Base
		local v23 = p17.Subdivision or 0
		local v24 = p17.MinExponent or -10
		local v25 = v_u_2.log
		local v26 = math.max(v24, v25(v22, p18))
		local v27 = v_u_2.log
		local v28 = math.max(v26, v27(v22, p19))
		local v29 = 0
		local v30 = {}
		for v31 = math.floor(v26), math.ceil(v28) do
			local v32 = v31 + 1 - v23
			local v33 = math.pow(v22, v32)
			local v34 = math.pow(v22, v31)
			local v35 = v31 + 1
			for v36 = v34, math.pow(v22, v35), v33 do
				if p19 < v36 then
					break
				end
				if v36 < p18 or v36 == v29 then
					continue
				end
				if p20[v36] then
					v29 = v36
				else
					table.insert(v30, v36)
					v29 = v36
				end
			end
		end
		return v30
	end,
	["getValuesValues"] = function(p37, p38, p39, p40) -- name: getValuesValues
		local v41 = {}
		for _, v42 in p37.Values do
			if p38 > v42 or (v42 > p39 or p40[v42]) then
				continue
			end
			table.insert(v41, v42)
		end
		return v41
	end,
	["getValues"] = function(p43, p44, p45, p46) -- name: getValues
		-- upvalues: (copy) v_u_3, (copy) v_u_60
		local v47 = {}
		local v48 = {}
		if p46 then
			for _, v49 in p46 do
				v48[v49] = true
			end
		end
		local v50 = p45.getViewportRect()
		local v51
		if p43 == v_u_3.AXIS_X then
			v51 = v50.Min.X
		else
			v51 = v50.Min.Y
		end
		local v52
		if p43 == v_u_3.AXIS_X then
			v52 = v50.Max.X
		else
			v52 = v50.Max.Y
		end
		if p44.Type == v_u_3.SCALE_UNIFORM then
			return v_u_60.getUniformValues(p44, v51, v52, v48)
		end
		if p44.Type == v_u_3.SCALE_LOGARITHMIC then
			return v_u_60.getLogarithmicValues(p44, v51, v52, v48)
		end
		if p44.Type == v_u_3.SCALE_VALUES then
			return v_u_60.getValuesValues(p44, v51, v52, v48)
		end
		local v53 = ("Axis schema %* not supported"):format(p44.Type)
		assert(false, v53)
		return v47
	end,
	["trimRoundingError"] = function(p54) -- name: trimRoundingError
		local v55 = string.format("%.10f", p54):gsub("^0*(.-)%.?0*$", "%1")
		if v55 == "" or v55:sub(1, 1) == "." then
			v55 = "0" .. v55
		end
		return v55
	end,
	["getAnchorPointForSide"] = function(p56) -- name: getAnchorPointForSide
		-- upvalues: (copy) v_u_3
		if p56 == v_u_3.SIDE_LEFT then
			return Vector2.new(1, 0.5)
		end
		if p56 == v_u_3.SIDE_RIGHT then
			return Vector2.new(0, 0.5)
		end
		if p56 == v_u_3.SIDE_TOP then
			return Vector2.new(0.5, 1)
		end
		if p56 == v_u_3.SIDE_BOTTOM then
			return Vector2.new(0.5, 0)
		end
		local v57 = ("Side %* not supported"):format(p56)
		assert(false, v57)
	end,
	["getTextAlignmentsFromAnchorPoint"] = function(p58) -- name: getTextAlignmentsFromAnchorPoint
		local v59
		if p58.X == 0 then
			v59 = Enum.TextXAlignment.Left
		elseif p58.X == 1 then
			v59 = Enum.TextXAlignment.Right
		else
			v59 = Enum.TextXAlignment.Center
		end
		if p58.Y == 0 then
			return v59, Enum.TextYAlignment.Top
		elseif p58.Y == 1 then
			return v59, Enum.TextYAlignment.Bottom
		else
			return v59, Enum.TextYAlignment.Center
		end
	end
}
return v_u_60