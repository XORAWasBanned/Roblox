-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Scrollbar.Scrollbar
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.CanvasContext)
local v_u_5 = require(v1.Components.ScrollbarButton)
local v_u_6 = require(v1.Util.StyleUtil)
local v_u_7 = require(v1.Types)
local v_u_8 = require(v1.Util.useViewportBinding).useViewportBinding
function Scrollbar(p_u_9) -- name: Scrollbar
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
	local v10 = p_u_9.Distance or v_u_6.SCROLLBAR_DISTANCE
	local v11 = p_u_9.Size or v_u_6.SCROLLBAR_SIZE
	local v12 = p_u_9.ScrollButtonSize or v_u_6.SCROLLBAR_SCROLL_BUTTON_SIZE
	local v13 = p_u_9.ZoomButtonSize or v_u_6.SCROLLBAR_ZOOM_BUTTON_SIZE
	local v_u_14 = v_u_3.useContext(v_u_4)
	local v31 = v_u_8(function(p15)
		-- upvalues: (copy) p_u_9, (ref) v_u_7
		local v16
		if p_u_9.Axis == v_u_7.AXIS_X then
			v16 = p15.plotToGraphX
		else
			v16 = p15.plotToGraphY
		end
		local v17 = p15.getViewportRect()
		local v18 = v17.Min
		local v19
		if p_u_9.Axis == v_u_7.AXIS_X then
			v19 = v18.X
		else
			v19 = v18.Y
		end
		local v20 = v16(v19)
		local v21 = v17.Max
		local v22
		if p_u_9.Axis == v_u_7.AXIS_X then
			v22 = v21.X
		else
			v22 = v21.Y
		end
		local v23 = v16(v22)
		local v24 = {}
		local v25 = UDim.new(v20, 0)
		local v26 = UDim.new(0, 0)
		local v27
		if p_u_9.Axis == v_u_7.AXIS_X then
			v27 = UDim2.new(v25, v26)
		else
			v27 = UDim2.new(v26, v25)
		end
		v24.position = v27
		local v28 = UDim.new(v23 - v20)
		local v29 = UDim.new(1, 0)
		local v30
		if p_u_9.Axis == v_u_7.AXIS_X then
			v30 = UDim2.new(v28, v29)
		else
			v30 = UDim2.new(v29, v28)
		end
		v24.size = v30
		return v24
	end, { p_u_9.Axis })
	local v_u_53 = v_u_3.useCallback(function(p32)
		-- upvalues: (copy) p_u_9, (ref) v_u_7, (copy) v_u_14
		if p_u_9.OnViewChanged then
			local v33
			if p_u_9.Axis == v_u_7.AXIS_X then
				v33 = v_u_14.plotToGraphX
			else
				v33 = v_u_14.plotToGraphY
			end
			local v34
			if p_u_9.Axis == v_u_7.AXIS_X then
				v34 = v_u_14.graphToPlotX
			else
				v34 = v_u_14.graphToPlotY
			end
			local v35 = v_u_14.getViewportRect()
			local v36 = v35.Min
			local v37
			if p_u_9.Axis == v_u_7.AXIS_X then
				v37 = v36.X
			else
				v37 = v36.Y
			end
			local v38 = v33(v37)
			local v39 = v35.Max
			local v40
			if p_u_9.Axis == v_u_7.AXIS_X then
				v40 = v39.X
			else
				v40 = v39.Y
			end
			local v41 = v33(v40)
			local v42 = not p_u_9.ExpandedBounds and 0 or v33(p_u_9.ExpandedBounds.Min)
			local v43 = not p_u_9.ExpandedBounds and 1 or v33(p_u_9.ExpandedBounds.Max)
			local v44 = v38 + p32
			local v45 = v41 + p32
			local v46 = 0
			local v47 = math.min(v44, v45)
			local v48 = math.max(v44, v45)
			if v47 < v42 then
				v46 = v42 - v47
			elseif v43 < v48 then
				v46 = v43 - v48
			end
			local v49 = v44 + v46
			local v50 = v45 + v46
			local v51 = v34(v49)
			local v52 = v34(v50)
			p_u_9.OnViewChanged(v51, v52)
		end
	end, { p_u_9.OnViewChanged, p_u_9.Axis, p_u_9.ExpandedBounds })
	local v62 = v_u_3.useCallback(function(p54)
		-- upvalues: (copy) p_u_9, (ref) v_u_7, (copy) v_u_14, (copy) v_u_53
		local v55
		if p_u_9.Axis == v_u_7.AXIS_X then
			v55 = v_u_14.plotToGraphX
		else
			v55 = v_u_14.plotToGraphY
		end
		local v56 = v_u_14.getViewportRect().Min
		local v57
		if p_u_9.Axis == v_u_7.AXIS_X then
			v57 = v56.X
		else
			v57 = v56.Y
		end
		local v58 = v55(v57)
		local v59 = v_u_14.plotToView(p54)
		local v60 = v_u_53
		local v61
		if p_u_9.Axis == v_u_7.AXIS_X then
			v61 = v59.X
		else
			v61 = v59.Y
		end
		v60(v61 - v58)
	end, { v_u_53, p_u_9.Axis })
	local v74 = v_u_3.useCallback(function(p63)
		-- upvalues: (copy) p_u_9, (copy) v_u_14, (ref) v_u_7
		if p_u_9.OnViewChanged then
			local v64 = v_u_14.plotToView(p63)
			local v65 = v_u_14.graphToPlot(v64)
			local v66 = v_u_14.getGraphRect().Min
			local v67
			if p_u_9.Axis == v_u_7.AXIS_X then
				v67 = v66.X
			else
				v67 = v66.Y
			end
			local v68 = v_u_14.getViewportRect().Max
			local v69
			if p_u_9.Axis == v_u_7.AXIS_X then
				v69 = v68.X
			else
				v69 = v68.Y
			end
			local v70
			if p_u_9.Axis == v_u_7.AXIS_X then
				v70 = v65.X
			else
				v70 = v65.Y
			end
			local v71 = v69 - p_u_9.MinZoom
			local v72 = math.min(v70, v71)
			local v73 = math.max(v72, v67)
			p_u_9.OnViewChanged(v73, v69)
		end
	end, { p_u_9.OnViewChanged, p_u_9.Axis, p_u_9.MinZoom })
	local v86 = v_u_3.useCallback(function(p75)
		-- upvalues: (copy) p_u_9, (copy) v_u_14, (ref) v_u_7
		if p_u_9.OnViewChanged then
			local v76 = v_u_14.plotToView(p75)
			local v77 = v_u_14.graphToPlot(v76)
			local v78 = v_u_14.getGraphRect().Max
			local v79
			if p_u_9.Axis == v_u_7.AXIS_X then
				v79 = v78.X
			else
				v79 = v78.Y
			end
			local v80 = v_u_14.getViewportRect().Min
			local v81
			if p_u_9.Axis == v_u_7.AXIS_X then
				v81 = v80.X
			else
				v81 = v80.Y
			end
			local v82
			if p_u_9.Axis == v_u_7.AXIS_X then
				v82 = v77.X
			else
				v82 = v77.Y
			end
			local v83 = v81 + p_u_9.MinZoom
			local v84 = math.max(v82, v83)
			local v85 = math.min(v84, v79)
			p_u_9.OnViewChanged(v81, v85)
		end
	end, { p_u_9.OnViewChanged, p_u_9.Axis, p_u_9.MinZoom })
	local v87 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_53
		v_u_53(-0.04)
	end, { v_u_53 })
	local v88 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_53
		v_u_53(0.04)
	end, { v_u_53 })
	local v89 = UDim.new(0, -v12 - v13)
	local v90 = UDim.new(1, 0) + v10
	local v91
	if p_u_9.Axis == v_u_7.AXIS_X then
		v91 = UDim2.new(v89, v90)
	else
		v91 = UDim2.new(v90, v89)
	end
	local v92 = UDim.new(1, 0)
	local v93
	if p_u_9.Axis == v_u_7.AXIS_X then
		v93 = UDim2.new(v92, v11)
	else
		v93 = UDim2.new(v11, v92)
	end
	local v94 = UDim.new(0, (v12 + v13) * 2)
	local v95 = UDim.new(0, 0)
	local v96
	if p_u_9.Axis == v_u_7.AXIS_X then
		v96 = UDim2.new(v94, v95)
	else
		v96 = UDim2.new(v95, v94)
	end
	local v97 = UDim.new(0, v12)
	local v98 = UDim.new(1, 0)
	local v99
	if p_u_9.Axis == v_u_7.AXIS_X then
		v99 = UDim2.new(v97, v98)
	else
		v99 = UDim2.new(v98, v97)
	end
	local v100 = UDim.new(0, v13)
	local v101 = UDim.new(1, 0)
	local v102
	if p_u_9.Axis == v_u_7.AXIS_X then
		v102 = UDim2.new(v100, v101)
	else
		v102 = UDim2.new(v101, v100)
	end
	local v103 = p_u_9.Axis == v_u_7.AXIS_X and 0 or 90
	local v104 = v_u_3.createElement
	local v105 = "Frame"
	local v106 = {
		["Position"] = v91,
		["Size"] = v93 + v96,
		["BorderSizePixel"] = p_u_9.OutlineThickness or v_u_6.SCROLLBAR_OUTLINE_THICKNESS,
		["BorderColor3"] = p_u_9.OutlineColor3 or v_u_6.SCROLLBAR_OUTLINE_COLOR3,
		["BackgroundColor3"] = p_u_9.Color3 or v_u_6.SCROLLBAR_COLOR3,
		["ZIndex"] = p_u_9.ZIndex,
		[v_u_3.Tag] = "ScrollbarFrame"
	}
	local v107 = {
		["MinScrollButton"] = v_u_3.createElement(v_u_5, {
			["Position"] = UDim2.fromScale(0, 0),
			["Rotation"] = v103,
			["Size"] = v99,
			["Image"] = v_u_6.SCROLLBAR_LEFT_SCROLL_BUTTON_IMAGE,
			["OnClick"] = v87
		})
	}
	local v108 = v_u_3.createElement
	local v109 = v_u_5
	local v110 = {}
	local v111
	if p_u_9.Axis == v_u_7.AXIS_X then
		v111 = Vector2.new(1, 0)
	else
		v111 = Vector2.new(0, 1)
	end
	v110.AnchorPoint = v111
	local v112 = UDim.new(1, 0)
	local v113 = UDim.new(0, 0)
	local v114
	if p_u_9.Axis == v_u_7.AXIS_X then
		v114 = UDim2.new(v112, v113)
	else
		v114 = UDim2.new(v113, v112)
	end
	v110.Position = v114
	v110.Rotation = v103
	v110.Size = v99
	v110.Image = v_u_6.SCROLLBAR_RIGHT_SCROLL_BUTTON_IMAGE
	v110.OnClick = v88
	v107.MaxScrollButton = v108(v109, v110)
	local v115 = v_u_3.createElement
	local v116 = "Frame"
	local v117 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.fromScale(1, 1) - v96
	}
	local v118 = {}
	local v119 = v_u_3.createElement
	local v120 = "Frame"
	local v123 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Position"] = v31:map(function(p121)
			return p121.position
		end),
		["Size"] = v31:map(function(p122)
			return p122.size
		end)
	}
	local v124 = {}
	local v125 = v_u_3.createElement
	local v126 = v_u_5
	local v127 = {}
	local v128
	if p_u_9.Axis == v_u_7.AXIS_X then
		v128 = Vector2.new(0, 0)
	else
		v128 = Vector2.new(0, 1)
	end
	v127.AnchorPoint = v128
	local v129
	if p_u_9.Axis == v_u_7.AXIS_X then
		v129 = UDim2.fromScale(0, 0)
	else
		v129 = UDim2.fromScale(0, 1)
	end
	v127.Position = v129
	v127.Size = UDim2.fromScale(1, 1)
	v127.OnMoved = v62
	v124.MainButton = v125(v126, v127)
	local v130 = v_u_3.createElement
	local v131 = v_u_5
	local v132 = {}
	local v133
	if p_u_9.Axis == v_u_7.AXIS_X then
		v133 = Vector2.new(1, 0)
	else
		v133 = Vector2.new(0, 0)
	end
	v132.AnchorPoint = v133
	local v134
	if p_u_9.Axis == v_u_7.AXIS_X then
		v134 = UDim2.fromScale(0, 0)
	else
		v134 = UDim2.fromScale(0, 1)
	end
	v132.Position = v134
	v132.Rotation = v103
	v132.Size = v102
	v132.Image = v_u_6.SCROLLBAR_LEFT_ZOOM_BUTTON_IMAGE
	v132.OnMoved = v74
	v124.LeftButton = v130(v131, v132)
	local v135 = v_u_3.createElement
	local v136 = v_u_5
	local v137 = {}
	local v138
	if p_u_9.Axis == v_u_7.AXIS_X then
		v138 = Vector2.new(0, 0)
	else
		v138 = Vector2.new(0, 1)
	end
	v137.AnchorPoint = v138
	local v139
	if p_u_9.Axis == v_u_7.AXIS_X then
		v139 = UDim2.fromScale(1, 0)
	else
		v139 = UDim2.fromScale(0, 0)
	end
	v137.Position = v139
	v137.Rotation = v103
	v137.Size = v102
	v137.Image = v_u_6.SCROLLBAR_RIGHT_ZOOM_BUTTON_IMAGE
	v137.OnMoved = v86
	v124.RightButton = v135(v136, v137)
	v118.Body = v119(v120, v123, v124)
	v107.Inner = v115(v116, v117, v118)
	return v104(v105, v106, v107)
end
return Scrollbar