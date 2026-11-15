-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LineGraph
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.LineGraphHoverDisplay)
local v4 = require(script.Parent.Parent.Constants)
local v_u_5 = v4.Color.Text
local v_u_6 = v4.Color.HighlightBlue
local v_u_7 = v4.GeneralFormatting.LineWidth
local v_u_8 = v4.GeneralFormatting.LineColor
local v_u_9 = v4.Graph.PointWidth
local v_u_10 = v4.Graph.PointOffset
local v_u_11 = v4.Graph.Padding
local v_u_12 = v4.Graph.Scale
local v_u_13 = v4.Graph.InnerPaddingY
local v_u_14 = v4.Graph.InnerScaleY
local v_u_15 = v4.Graph.TextPadding
local v16 = v_u_2.Component:extend("LineGraph")
function v16.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_17.onGraphInputChanged(_, p18)
		-- upvalues: (copy) p_u_17
		if p18.UserInputType == Enum.UserInputType.MouseMovement and not p_u_17.state.holdPos then
			p_u_17:setState({
				["inputPosition"] = p18.Position
			})
		end
	end
	function p_u_17.onGraphInputEnded(_, p19)
		-- upvalues: (copy) p_u_17
		if p19.UserInputType == Enum.UserInputType.MouseMovement then
			if not p_u_17.state.holdPos then
				p_u_17:setState({
					["inputPosition"] = false
				})
				return
			end
		elseif p19.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_17:setState({
				["holdPos"] = not p_u_17.state.holdPos
			})
		end
	end
	p_u_17.graphRef = v_u_2.createRef()
	p_u_17.state = {
		["selectedTimeStamps"] = {}
	}
end
function v16.didUpdate(p20) -- name: didUpdate
	if p20.state.absGraphSize ~= p20.graphRef.current.AbsoluteSize then
		p20:setState({
			["absGraphSize"] = p20.graphRef.current.AbsoluteSize,
			["absGraphPos"] = p20.graphRef.current.AbsolutePosition
		})
	end
end
function v16.didMount(p21) -- name: didMount
	p21:setState({
		["absGraphSize"] = p21.graphRef.current.AbsoluteSize,
		["absGraphPos"] = p21.graphRef.current.AbsolutePosition
	})
end
function v16.render(p22) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_2, (copy) v_u_7, (copy) v_u_13, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (copy) v_u_15, (copy) v_u_8, (copy) v_u_5, (copy) v_u_11, (copy) v_u_12
	local v23 = p22.props.size
	local v24 = p22.props.pos
	local v25 = p22.props.graphData
	local v26 = p22.props.getX
	local v27 = p22.props.getY
	local v28 = p22.props.stringFormatX
	local v29 = p22.props.stringFormatY
	local v30 = p22.props.axisLabelX
	local v31 = p22.props.axisLabelY
	local v32 = p22.props.layoutOrder
	local v33 = p22.state.inputPosition
	local v34 = p22.state.absGraphSize
	local v35 = p22.state.absGraphPos
	local v36 = v26(v25:back())
	local v37 = v26(v25:front())
	local v38 = p22.props.maxY
	local v39 = p22.props.minY
	local v40 = nil
	local v41 = {}
	if v34 then
		local v42 = v25:iterator()
		local v43 = v42:next()
		local v44 = {}
		while v43 do
			local v45 = v27(v43)
			local v46 = v26(v43)
			local v47 = v36 - v37
			local v48 = v47 > 0 and ((v46 - v37) / v47 or 0) or 0
			local v49 = v38 - v39
			local v50 = v49 > 0 and ((v45 - v39) / v49 or 1) or 1
			table.insert(v44, {
				["X"] = v48,
				["Y"] = v50,
				["data"] = v43
			})
			v43 = v42:next()
		end
		for v51 = 2, #v44 do
			local v52 = v44[v51].X * v34.X
			local v53 = v44[v51].Y * v34.Y * v_u_14
			local v54 = v44[v51 - 1].X * v34.X
			local v55 = v44[v51 - 1].Y * v34.Y * v_u_14
			if v52 == v54 then
				continue
			end
			local v56 = (v52 + v54) / 2
			local v57 = (v53 + v55) / 2
			local v58 = v52 - v54
			local v59 = v53 - v55
			local v60 = v58 * v58 + v59 * v59
			local v61 = math.sqrt(v60)
			local v62 = math.atan2(v59, v58)
			local v63 = math.deg(v62)
			local v64 = v_u_2.createElement
			local v65 = {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Rotation"] = nil,
				["Size"] = UDim2.new(0, v61, 0, v_u_7),
				["Position"] = UDim2.new(0, v56 - v61 / 2, 1 - v_u_13, -v57),
				["BackgroundColor3"] = v_u_6,
				["Rotation"] = -v63
			}
			table.insert(v41, v64("Frame", v65))
			local v66 = v_u_2.createElement
			local v67 = {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_9, 0, v_u_9),
				["Position"] = UDim2.new(0, v52, 1 - v_u_13, -v53 - v_u_10),
				["BackgroundColor3"] = v_u_6
			}
			table.insert(v41, v66("Frame", v67))
			if not v33 then
				continue
			end
			local v68 = v33.X - v35.X
			if v68 >= v52 or v54 >= v68 then
				continue
			end
			local v69 = v26(v44[v51].data)
			local v70 = v26(v44[v51 - 1].data)
			local v71 = v27(v44[v51].data)
			local v72 = v27(v44[v51 - 1].data)
			local v73 = (v68 - v54) / v58
			v40 = v55 + v59 * v73
			local v74 = {
				["hoverLineX"] = v68,
				["hoverLineY"] = v40,
				["hoverValX"] = (v69 - v70) * v73 + v70,
				["hoverValY"] = (v71 - v72) * v73 + v72,
				["stringFormatX"] = v28,
				["stringFormatY"] = v29
			}
			v41.HoverDetails = v_u_2.createElement(v_u_3, v74)
		end
		if #v44 > 0 then
			local v75 = v44[#v44].Y * v34.Y * v_u_14
			local v76 = v27(v44[#v44].data)
			local v77
			if v40 then
				local v78 = v75 - v40
				v77 = math.abs(v78) < 10
			else
				v77 = v40
			end
			local v79 = not v77
			if v40 then
				v40 = math.abs(v40) < 10
			end
			local v80 = not v40 and math.abs(v75) >= 10 and true or false
			if v79 then
				v41.LatestEntryLine = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = 0.5,
					["BorderSizePixel"] = 0,
					["Size"] = UDim2.new(1, v_u_15, 0, v_u_7),
					["Position"] = UDim2.new(0, -v_u_15, 1 - v_u_13, -v75),
					["BackgroundColor3"] = v_u_8
				})
				local v81 = v_u_2.createElement
				local v82 = "TextLabel"
				local v83 = {
					["Text"] = nil,
					["TextColor3"] = nil,
					["TextXAlignment"] = nil,
					["Position"] = nil,
					["BackgroundTransparency"] = 1
				}
				if v29 then
					v76 = v29(v76) or v76
				end
				v83.Text = v76
				v83.TextColor3 = v_u_5
				v83.TextXAlignment = Enum.TextXAlignment.Right
				v83.Position = UDim2.new(0, -v_u_15 - 2, 1 - v_u_13, -v75)
				v41.LatestEntryText = v81(v82, v83)
			end
			if v80 then
				local v84 = v_u_2.createElement
				local v85 = "TextLabel"
				local v86 = {
					["Text"] = nil,
					["TextColor3"] = nil,
					["TextXAlignment"] = nil,
					["Position"] = nil,
					["BackgroundTransparency"] = 1
				}
				if v29 then
					v39 = v29(v39) or v39
				end
				v86.Text = v39
				v86.TextColor3 = v_u_5
				v86.TextXAlignment = Enum.TextXAlignment.Right
				v86.Position = UDim2.new(0, -v_u_15 - 2, 1 - v_u_13, 0)
				v41.AxisTextY0 = v84(v85, v86)
			end
			v41.AxisX = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_7),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_8
			})
			v41.AxisY = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_7, 1, 0),
				["BackgroundColor3"] = v_u_8
			})
		end
	end
	local v87 = 2 * v_u_15 + 2
	local v88 = v_u_2.createElement
	local v89 = "Frame"
	local v90 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v23,
		["Position"] = v24,
		["LayoutOrder"] = v32
	}
	local v91 = {
		["name"] = v_u_2.createElement("TextLabel", {
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = v31,
			["TextColor3"] = v_u_5,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Position"] = UDim2.new(v_u_11, 0, v_u_11, -v_u_15)
		})
	}
	local v92 = v_u_2.createElement
	local v93 = "TextLabel"
	local v94 = {
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1
	}
	if v28 then
		v37 = v28(v37) or v37
	end
	v94.Text = v37
	v94.TextColor3 = v_u_5
	v94.TextXAlignment = Enum.TextXAlignment.Center
	v94.Position = UDim2.new(v_u_11, 0, v_u_11 + v_u_12, v87)
	v91.minX = v92(v93, v94)
	local v95 = v_u_2.createElement
	local v96 = "TextLabel"
	local v97 = {
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1
	}
	if v28 then
		v36 = v28(v36) or v36
	end
	v97.Text = v36
	v97.TextColor3 = v_u_5
	v97.TextXAlignment = Enum.TextXAlignment.Center
	v97.Position = UDim2.new(v_u_11 + v_u_12, 0, v_u_11 + v_u_12, v87)
	v91.maxX = v95(v96, v97)
	v91.axisLabelX = v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = v30,
		["TextColor3"] = v_u_5,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["Position"] = UDim2.new(0.5, 0, v_u_11 + v_u_12, v87)
	})
	v91.graph = v_u_2.createElement("Frame", {
		["Position"] = UDim2.new(v_u_11, 0, v_u_11, 0),
		["Size"] = UDim2.new(v_u_12, 0, v_u_12, 0),
		["BackgroundTransparency"] = 1,
		[v_u_2.Ref] = p22.graphRef,
		[v_u_2.Event.InputChanged] = p22.onGraphInputChanged,
		[v_u_2.Event.InputEnded] = p22.onGraphInputEnded
	}, v41)
	return v88(v89, v90, v91)
end
return v16