-- Path: CorePackages.Packages._Index.Graphing.Graphing.Util.CanvasUtil
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.Signals)
local v_u_4 = require(v1.Util.MathUtil)
local v_u_5 = require(v1.Types)
local v_u_6 = {}
local v_u_7 = v_u_3.createSignal(Rect.new(0, 0, 1, 1))
local v_u_8 = {
	["current"] = nil
}
v_u_6.DEFAULT_XSCALING = {
	["Type"] = v_u_5.SCALING_LINEAR,
	["Direction"] = v_u_5.DIRECTION_FORWARD
}
v_u_6.DEFAULT_YSCALING = {
	["Type"] = v_u_5.SCALING_LINEAR,
	["Direction"] = v_u_5.DIRECTION_REVERSED
}
function v_u_6.createFunctions(p_u_9, p_u_10, p_u_11, p12, p13, p14) -- name: createFunctions
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v_u_15 = p12 or v_u_6.DEFAULT_XSCALING
	local v_u_16 = p13 or v_u_6.DEFAULT_YSCALING
	assert(v_u_15, "xAxisScaling was nil")
	local v17 = v_u_16
	assert(v17, "yAxisScaling was nil")
	local v_u_18 = p14 or 0.0001
	local v19 = v_u_18
	assert(v19, "defaultEpsilon was nil")
	local function v_u_25(p20, p21) -- name: scaled
		-- upvalues: (ref) v_u_5, (ref) v_u_4
		if p21.Type == v_u_5.SCALING_LINEAR then
			return p20
		end
		if p21.Type == v_u_5.SCALING_POWER then
			local v22 = p21.Power
			return v_u_4.signedPow(p20, v22)
		end
		if p21.Type == v_u_5.SCALING_LOGARITHMIC then
			local v23 = p21.Base
			return v_u_4.log(v23, p20)
		end
		local v24 = ("Scaling type %* not supported"):format(p21)
		assert(false, v24)
		return p20
	end
	local function v_u_31(p26, p27) -- name: unscaled
		-- upvalues: (ref) v_u_5, (ref) v_u_4
		if p27.Type == v_u_5.SCALING_LINEAR then
			return p26
		end
		if p27.Type == v_u_5.SCALING_POWER then
			local v28 = p27.Power
			return v_u_4.signedPow(p26, 1 / v28)
		end
		if p27.Type == v_u_5.SCALING_LOGARITHMIC then
			local v29 = p27.Base
			return math.pow(v29, p26)
		end
		local v30 = ("Scaling type %* not supported"):format(p27)
		assert(false, v30)
		return p26
	end
	local v_u_32 = Rect.new(v_u_25(p_u_9.Min.X, v_u_15), v_u_25(p_u_9.Min.Y, v_u_16), v_u_25(p_u_9.Max.X, v_u_15), v_u_25(p_u_9.Max.Y, v_u_16))
	local v_u_33 = Rect.new(v_u_25(p_u_10.Min.X, v_u_15), v_u_25(p_u_10.Min.Y, v_u_16), v_u_25(p_u_10.Max.X, v_u_15), v_u_25(p_u_10.Max.Y, v_u_16))
	local function v_u_35(p34) -- name: graphToPlotY
		-- upvalues: (ref) v_u_16, (ref) v_u_5, (copy) v_u_31, (ref) v_u_4, (copy) v_u_32
		if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
			p34 = 1 - p34
		end
		return v_u_31(v_u_4.lerp(v_u_32.Min.Y, v_u_32.Max.Y, p34), v_u_16)
	end
	local function v_u_42(p36) -- name: plotToView
		-- upvalues: (ref) v_u_4, (copy) v_u_33, (copy) v_u_25, (ref) v_u_15, (ref) v_u_5, (ref) v_u_16
		local v37 = Vector2.new
		local v38 = p36.X
		local v39 = v_u_4.inverseLerp(v_u_33.Min.X, v_u_33.Max.X, v_u_25(v38, v_u_15))
		if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
			v39 = 1 - v39
		end
		local v40 = p36.Y
		local v41 = v_u_4.inverseLerp(v_u_33.Min.Y, v_u_33.Max.Y, v_u_25(v40, v_u_16))
		if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
			v41 = 1 - v41
		end
		return v37(v39, v41)
	end
	local function v_u_44(p43) -- name: viewToPlotY
		-- upvalues: (ref) v_u_16, (ref) v_u_5, (copy) v_u_31, (ref) v_u_4, (copy) v_u_33
		if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
			p43 = 1 - p43
		end
		return v_u_31(v_u_4.lerp(v_u_33.Min.Y, v_u_33.Max.Y, p43), v_u_16)
	end
	local function v_u_53(p45) -- name: viewToPlot
		-- upvalues: (ref) v_u_15, (ref) v_u_5, (ref) v_u_4, (copy) v_u_33, (copy) v_u_44
		local v46 = Vector2.new
		local v47 = p45.X
		if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
			v47 = 1 - v47
		end
		local v48 = v_u_4.lerp(v_u_33.Min.X, v_u_33.Max.X, v47)
		local v49 = v_u_15
		if v49.Type ~= v_u_5.SCALING_LINEAR then
			if v49.Type == v_u_5.SCALING_POWER then
				local v50 = v49.Power
				v48 = v_u_4.signedPow(v48, 1 / v50)
			elseif v49.Type == v_u_5.SCALING_LOGARITHMIC then
				local v51 = v49.Base
				v48 = math.pow(v51, v48)
			else
				local v52 = ("Scaling type %* not supported"):format(v49)
				assert(false, v52)
			end
		end
		return v46(v48, v_u_44(p45.Y))
	end
	local function v_u_60(p54) -- name: absToView
		-- upvalues: (copy) p_u_11, (copy) p_u_10, (ref) v_u_4
		local v55 = p_u_11.current
		if not v55 then
			return p_u_10.Min
		end
		local v56 = v55.AbsolutePosition
		local v57 = v55.AbsoluteSize
		local v58 = v_u_4.inverseLerp(v56.X, v56.X + v57.X, p54.X)
		local v59 = v_u_4.inverseLerp(v56.Y, v56.Y + v57.Y, p54.Y)
		return Vector2.new(v58, v59)
	end
	local function v_u_67(p61) -- name: viewToAbs
		-- upvalues: (copy) p_u_11, (copy) p_u_10, (ref) v_u_4
		local v62 = p_u_11.current
		if not v62 then
			return p_u_10.Min
		end
		local v63 = v62.AbsolutePosition
		local v64 = v62.AbsoluteSize
		local v65 = v_u_4.lerp(v63.X, v63.X + v64.X, p61.X)
		local v66 = v_u_4.lerp(v63.X, v63.X + v64.X, p61.Y)
		return Vector2.new(v65, v66)
	end
	local function v_u_69(p68) -- name: mouseToView
		-- upvalues: (copy) v_u_60
		return v_u_60(Vector2.new(p68.X, p68.Y))
	end
	return {
		["getViewport"] = function() -- name: getViewport
			-- upvalues: (copy) p_u_11
			return p_u_11.current
		end,
		["getGraphRect"] = function() -- name: getGraphRect
			-- upvalues: (copy) p_u_9
			return p_u_9
		end,
		["getViewportRect"] = function() -- name: getViewportRect
			-- upvalues: (copy) p_u_10
			return p_u_10
		end,
		["getXAxisScaling"] = function() -- name: getXAxisScaling
			-- upvalues: (ref) v_u_15
			return v_u_15
		end,
		["getYAxisScaling"] = function() -- name: getYAxisScaling
			-- upvalues: (ref) v_u_16
			return v_u_16
		end,
		["plotToGraph"] = function(p70) -- name: plotToGraph
			-- upvalues: (ref) v_u_4, (copy) v_u_32, (copy) v_u_25, (ref) v_u_15, (ref) v_u_5, (ref) v_u_16
			local v71 = Vector2.new
			local v72 = p70.X
			local v73 = v_u_4.inverseLerp(v_u_32.Min.X, v_u_32.Max.X, v_u_25(v72, v_u_15))
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				v73 = 1 - v73
			end
			local v74 = p70.Y
			local v75 = v_u_4.inverseLerp(v_u_32.Min.Y, v_u_32.Max.Y, v_u_25(v74, v_u_16))
			if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
				v75 = 1 - v75
			end
			return v71(v73, v75)
		end,
		["plotToGraphX"] = function(p76) -- name: plotToGraphX
			-- upvalues: (ref) v_u_4, (copy) v_u_32, (copy) v_u_25, (ref) v_u_15, (ref) v_u_5
			local v77 = v_u_4.inverseLerp(v_u_32.Min.X, v_u_32.Max.X, v_u_25(p76, v_u_15))
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				v77 = 1 - v77
			end
			return v77
		end,
		["plotToGraphY"] = function(p78) -- name: plotToGraphY
			-- upvalues: (ref) v_u_4, (copy) v_u_32, (copy) v_u_25, (ref) v_u_16, (ref) v_u_5
			local v79 = v_u_4.inverseLerp(v_u_32.Min.Y, v_u_32.Max.Y, v_u_25(p78, v_u_16))
			if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
				v79 = 1 - v79
			end
			return v79
		end,
		["graphToPlot"] = function(p80) -- name: graphToPlot
			-- upvalues: (ref) v_u_15, (ref) v_u_5, (ref) v_u_4, (copy) v_u_32, (copy) v_u_35
			local v81 = Vector2.new
			local v82 = p80.X
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				v82 = 1 - v82
			end
			local v83 = v_u_4.lerp(v_u_32.Min.X, v_u_32.Max.X, v82)
			local v84 = v_u_15
			if v84.Type ~= v_u_5.SCALING_LINEAR then
				if v84.Type == v_u_5.SCALING_POWER then
					local v85 = v84.Power
					v83 = v_u_4.signedPow(v83, 1 / v85)
				elseif v84.Type == v_u_5.SCALING_LOGARITHMIC then
					local v86 = v84.Base
					v83 = math.pow(v86, v83)
				else
					local v87 = ("Scaling type %* not supported"):format(v84)
					assert(false, v87)
				end
			end
			return v81(v83, v_u_35(p80.Y))
		end,
		["graphToPlotX"] = function(p88) -- name: graphToPlotX
			-- upvalues: (ref) v_u_15, (ref) v_u_5, (copy) v_u_31, (ref) v_u_4, (copy) v_u_32
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				p88 = 1 - p88
			end
			return v_u_31(v_u_4.lerp(v_u_32.Min.X, v_u_32.Max.X, p88), v_u_15)
		end,
		["graphToPlotY"] = v_u_35,
		["plotToView"] = v_u_42,
		["plotToViewX"] = function(p89) -- name: plotToViewX
			-- upvalues: (ref) v_u_4, (copy) v_u_33, (copy) v_u_25, (ref) v_u_15, (ref) v_u_5
			local v90 = v_u_4.inverseLerp(v_u_33.Min.X, v_u_33.Max.X, v_u_25(p89, v_u_15))
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				v90 = 1 - v90
			end
			return v90
		end,
		["plotToViewY"] = function(p91) -- name: plotToViewY
			-- upvalues: (ref) v_u_4, (copy) v_u_33, (copy) v_u_25, (ref) v_u_16, (ref) v_u_5
			local v92 = v_u_4.inverseLerp(v_u_33.Min.Y, v_u_33.Max.Y, v_u_25(p91, v_u_16))
			if v_u_16.Direction ~= v_u_5.DIRECTION_FORWARD then
				v92 = 1 - v92
			end
			return v92
		end,
		["viewToPlot"] = v_u_53,
		["viewToPlotX"] = function(p93) -- name: viewToPlotX
			-- upvalues: (ref) v_u_15, (ref) v_u_5, (copy) v_u_31, (ref) v_u_4, (copy) v_u_33
			if v_u_15.Direction == v_u_5.DIRECTION_REVERSED then
				p93 = 1 - p93
			end
			return v_u_31(v_u_4.lerp(v_u_33.Min.X, v_u_33.Max.X, p93), v_u_15)
		end,
		["viewToPlotY"] = v_u_44,
		["absToView"] = v_u_60,
		["viewToAbs"] = v_u_67,
		["absToPlot"] = function(p94) -- name: absToPlot
			-- upvalues: (copy) v_u_53, (copy) v_u_60
			return v_u_53(v_u_60(p94))
		end,
		["plotToAbs"] = function(p95) -- name: plotToAbs
			-- upvalues: (copy) v_u_67, (copy) v_u_42
			return v_u_67(v_u_42(p95))
		end,
		["mouseToView"] = v_u_69,
		["mouseToPlot"] = function(p96) -- name: mouseToPlot
			-- upvalues: (copy) v_u_53, (copy) v_u_69
			return v_u_53(v_u_69(p96))
		end,
		["isPointInViewport"] = function(p97, p98) -- name: isPointInViewport
			-- upvalues: (ref) v_u_18, (copy) p_u_10
			local v99 = p97.X
			local v100 = p98 or v_u_18
			local v101
			if p_u_10.Min.X - v100 <= v99 then
				v101 = v99 <= p_u_10.Max.X + v100
			else
				v101 = false
			end
			if v101 then
				local v102 = p97.Y
				local v103 = p98 or v_u_18
				if p_u_10.Min.Y - v103 <= v102 then
					v101 = v102 <= p_u_10.Max.Y + v103
				else
					v101 = false
				end
			end
			return v101
		end,
		["isPointInViewportX"] = function(p104, p105) -- name: isPointInViewportX
			-- upvalues: (ref) v_u_18, (copy) p_u_10
			local v106 = p105 or v_u_18
			local v107
			if p_u_10.Min.X - v106 <= p104 then
				v107 = p104 <= p_u_10.Max.X + v106
			else
				v107 = false
			end
			return v107
		end,
		["isPointInViewportY"] = function(p108, p109) -- name: isPointInViewportY
			-- upvalues: (ref) v_u_18, (copy) p_u_10
			local v110 = p109 or v_u_18
			local v111
			if p_u_10.Min.Y - v110 <= p108 then
				v111 = p108 <= p_u_10.Max.Y + v110
			else
				v111 = false
			end
			return v111
		end,
		["isRectInViewport"] = function(p112, p113) -- name: isRectInViewport
			-- upvalues: (ref) v_u_18, (copy) p_u_10
			local v114 = p113 or v_u_18
			local v115
			if p112.Min.X <= p_u_10.Max.X + v114 and (p112.Max.X >= p_u_10.Min.X - v114 and p112.Min.Y <= p_u_10.Max.Y + v114) then
				v115 = p112.Max.Y >= p_u_10.Min.Y - v114
			else
				v115 = false
			end
			return v115
		end,
		["viewportRectGetter"] = v_u_7
	}
end
function v_u_6.createStableContext(p_u_116, p117, p118, p119, p120, p121) -- name: createStableContext
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v122 = p117 or Rect.new(0, 0, 1, 1)
	local v123 = p118 or v122
	local v124, v_u_125 = v_u_3.createSignal(v123)
	local v_u_126 = v_u_6.createFunctions(v122, v123, p_u_116, p119, p120, p121)
	v_u_126.viewportRectGetter = v124
	return v_u_126, function(p127, p128, p129, p130, p131) -- name: update
		-- upvalues: (ref) v_u_6, (copy) p_u_116, (copy) v_u_126, (copy) v_u_125
		for v132, v133 in v_u_6.createFunctions(p127, p128, p_u_116, p129, p130, p131) do
			if v132 == "viewportRectGetter" then
				continue
			end
			v_u_126[v132] = v133
		end
		v_u_125(p128)
	end
end
function v_u_6.createDefaultFunctions() -- name: createDefaultFunctions
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	return v_u_6.createFunctions(Rect.new(0, 0, 1, 1), Rect.new(0, 0, 1, 1), v_u_8)
end
return v_u_6