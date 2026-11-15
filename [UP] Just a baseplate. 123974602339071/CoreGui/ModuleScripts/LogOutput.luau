-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.LogOutput
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = game:DefineFastFlag("DevConsoleFixMultilineContext", false)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.BannerButton)
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v_u_7.DefaultFontSize.MainWindow
local v_u_9 = v_u_7.Font.Log
local v_u_10 = v_u_7.LogFormatting.IconHeight
local v_u_11 = v_u_7.LogFormatting.TextFrameHeight
local v_u_12 = v_u_7.LogFormatting.TextFramePadding
local v_u_13 = v_u_7.LogFormatting.MaxStringSize
local function v_u_23(p14, p15) -- name: countContextLines
	-- upvalues: (copy) v_u_4, (copy) v_u_23
	local v16 = 0
	for v17, v18 in p14 do
		if v17 == "_expanded" then
			continue
		end
		local v19
		if type(v18) == "table" then
			v19 = p15 + 1 < 3
		else
			v19 = false
		end
		if v_u_4 and not v19 then
			local v20 = tostring(v17)
			local v21 = tostring(v18)
			local _, v22 = string.gsub(("%*: %*"):format(v20, v21), "\n", "")
			v16 = v16 + (v22 + 1)
		else
			v16 = v16 + 1
		end
		if not (v19 and v18._expanded) then
			continue
		end
		v16 = v16 + v_u_23(v18, p15 + 1)
	end
	return v16
end
local v24 = v_u_3.Component:extend("LogOutput")
function v24.init(p_u_25, p26) -- name: init
	-- upvalues: (copy) v_u_3
	local v27 = p26.initLogOutput
	if v27 then
		v27 = p26.initLogOutput()
	end
	function p_u_25.onCanvasChange()
		-- upvalues: (copy) p_u_25
		local v28 = p_u_25.ref.current
		if v28 then
			local v29 = v28.CanvasPosition
			local v30 = v28.AbsoluteSize
			if p_u_25.state.canvasPos ~= v29 or p_u_25.state.absSize ~= v30 then
				p_u_25:setState({
					["canvasPos"] = v29,
					["absSize"] = v30,
					["autoScroll"] = v28.CanvasPosition.Y + v28.AbsoluteSize.Y == v28.CanvasSize.Y.Offset
				})
			end
		end
	end
	p_u_25.ref = v_u_3.createRef()
	p_u_25.state = {
		["logData"] = nil,
		["absSize"] = nil,
		["canvasPos"] = nil,
		["autoScroll"] = true,
		["wordWrap"] = true,
		["logData"] = v27,
		["absSize"] = Vector2.new(),
		["canvasPos"] = Vector2.new()
	}
end
function v24.willUpdate(p31, _, _) -- name: willUpdate
	p31._canvasSignal:Disconnect()
	p31._absSizeSignal:Disconnect()
end
function v24.didUpdate(p32) -- name: didUpdate
	p32._canvasSignal = p32.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p32.onCanvasChange)
	p32._absSizeSignal = p32.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p32.onCanvasChange)
	local v33 = p32.state.autoScroll and p32.ref.current
	if v33 then
		v33.CanvasPosition = Vector2.new(v33.CanvasPosition.X, p32.ref.current.CanvasSize.Y.Offset + p32.ref.current.AbsoluteSize.Y)
	end
end
function v24.didMount(p_u_34) -- name: didMount
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	p_u_34.logConnector = p_u_34.props.targetSignal:Connect(function(p35)
		-- upvalues: (copy) p_u_34, (ref) v_u_11, (ref) v_u_12
		if p_u_34.state.autoScroll or p35:getSize() ~= p35:getMaxSize() then
			p_u_34:setState({
				["logData"] = p35
			})
		else
			local v36 = p_u_34.state.canvasPos
			local v37 = v36.Y
			local v38 = p35:back()
			if v38 then
				local v39 = v38.Dims.Y
				local v40 = p_u_34.state.absSize.X - v_u_11
				if p_u_34.state.wordWrap and v40 > 0 then
					local v41 = v38.Dims.Y
					local v42 = v38.Dims.X / v40
					local v43 = v41 * math.ceil(v42)
					v39 = math.ceil(v43)
				end
				local v44 = v37 - v39 - v_u_12
				v37 = math.max(0, v44)
			end
			p_u_34:setState({
				["logData"] = p35,
				["canvasPos"] = Vector2.new(v36.X, v37)
			})
		end
	end)
	p_u_34._canvasSignal = p_u_34.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_34.onCanvasChange)
	p_u_34._absSizeSignal = p_u_34.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p_u_34.onCanvasChange)
	if p_u_34.ref.current.AbsoluteSize.Magnitude > 0 then
		p_u_34:setState({
			["absSize"] = p_u_34.ref.current.AbsoluteSize
		})
	end
end
function v24.willUnmount(p45) -- name: willUnmount
	p45.logConnector:Disconnect()
	p45.logConnector = nil
end
function v24.render(p_u_46) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4, (copy) v_u_12, (copy) v_u_23, (copy) v_u_7, (copy) v_u_10, (copy) v_u_13, (copy) v_u_2
	local v47 = p_u_46.props.layoutOrder
	local v48 = p_u_46.props.size
	local v49 = p_u_46.state.logData
	local v50 = p_u_46.state.absSize
	local v51 = p_u_46.state.canvasPos
	local v52 = p_u_46.state.wordWrap
	local v53 = {}
	local v54 = 1
	local v55 = 0
	if p_u_46.ref.current and v49 then
		local v56 = v50.X - v_u_11
		local function v_u_85(p57, p58, p59, p60, p61) -- name: addContextEntries
			-- upvalues: (ref) v_u_3, (ref) v_u_6, (ref) v_u_8, (copy) p_u_46, (ref) v_u_9, (copy) v_u_85, (ref) v_u_4, (ref) v_u_12
			if p60 < 3 then
				local v62 = {}
				for v63 in p58 do
					if v63 == "_expanded" then
						continue
					end
					table.insert(v62, v63)
				end
				table.sort(v62, function(p64, p65)
					return tostring(p64) < tostring(p65)
				end)
				local v66 = p60 * 20 + 20
				for _, v67 in v62 do
					local v_u_68 = p58[v67]
					p61.i = p61.i + 1
					local v69 = p61.i
					local v70 = ("Ctx_%*_%*"):format(p60, (tostring(v67)))
					if type(v_u_68) == "table" and p60 + 1 < 3 then
						local v71 = v_u_3.createElement
						local v72 = v_u_6
						local v73 = {
							["size"] = nil,
							["isExpanded"] = nil,
							["isExpandable"] = true,
							["layoutOrder"] = nil,
							["hideLines"] = true,
							["onButtonPress"] = nil,
							["size"] = UDim2.new(1, 0, 0, v_u_8),
							["isExpanded"] = v_u_68._expanded,
							["layoutOrder"] = v69,
							["onButtonPress"] = function() -- name: onButtonPress
								-- upvalues: (copy) v_u_68, (ref) p_u_46
								v_u_68._expanded = not v_u_68._expanded
								p_u_46:setState({})
							end
						}
						local v74 = {
							["Label"] = v_u_3.createElement("TextLabel", {
								["Text"] = nil,
								["TextSize"] = nil,
								["Font"] = nil,
								["TextColor3"] = nil,
								["BackgroundTransparency"] = 1,
								["Size"] = nil,
								["Position"] = nil,
								["TextXAlignment"] = nil,
								["Text"] = ("%*: {...}"):format((tostring(v67))),
								["TextSize"] = v_u_8,
								["Font"] = v_u_9,
								["TextColor3"] = p59,
								["Size"] = UDim2.new(1, -(v66 + 20), 1, 0),
								["Position"] = UDim2.fromOffset(v66 + 20, 0),
								["TextXAlignment"] = Enum.TextXAlignment.Left
							})
						}
						p57[v70] = v71(v72, v73, v74)
						if not v_u_68._expanded then
							continue
						end
						v_u_85(p57, v_u_68, p59, p60 + 1, p61)
					elseif v_u_4 then
						local v75 = tostring(v67)
						local v76 = tostring(v_u_68)
						local _, v77 = string.gsub(("%*: %*"):format(v75, v76), "\n", "")
						local v78 = v77 + 1
						local v79 = v_u_3.createElement
						local v80 = {
							["Text"] = nil,
							["TextSize"] = nil,
							["Font"] = nil,
							["TextColor3"] = nil,
							["BackgroundTransparency"] = 1,
							["Size"] = nil,
							["LayoutOrder"] = nil,
							["TextXAlignment"] = nil,
							["Text"] = ("%*: %*"):format(tostring(v67), (tostring(v_u_68))),
							["TextSize"] = v_u_8,
							["Font"] = v_u_9,
							["TextColor3"] = p59,
							["Size"] = UDim2.new(1, 0, 0, v78 * v_u_8 + (v78 - 1) * v_u_12),
							["LayoutOrder"] = v69,
							["TextXAlignment"] = Enum.TextXAlignment.Left
						}
						local v81 = {
							["Padding"] = v_u_3.createElement("UIPadding", {
								["PaddingLeft"] = UDim.new(0, v66 + 20)
							})
						}
						p57[v70] = v79("TextLabel", v80, v81)
					else
						local v82 = v_u_3.createElement
						local v83 = {
							["Text"] = nil,
							["TextSize"] = nil,
							["Font"] = nil,
							["TextColor3"] = nil,
							["BackgroundTransparency"] = 1,
							["Size"] = nil,
							["LayoutOrder"] = nil,
							["TextXAlignment"] = nil,
							["Text"] = ("%*: %*"):format(tostring(v67), (tostring(v_u_68))),
							["TextSize"] = v_u_8,
							["Font"] = v_u_9,
							["TextColor3"] = p59,
							["Size"] = UDim2.new(1, 0, 0, v_u_8),
							["LayoutOrder"] = v69,
							["TextXAlignment"] = Enum.TextXAlignment.Left
						}
						local v84 = {
							["Padding"] = v_u_3.createElement("UIPadding", {
								["PaddingLeft"] = UDim.new(0, v66 + 20)
							})
						}
						p57[v70] = v82("TextLabel", v83, v84)
					end
				end
			end
		end
		local v86 = v49:iterator()
		local v_u_87 = v86:next()
		local v88 = -1
		local v89 = 0
		while v_u_87 do
			local v90 = v_u_87.Message
			local v91 = v_u_87.CharCount
			local v92 = v_u_87.Dims.Y
			if v52 and v56 > 0 then
				local v93 = v_u_87.Dims.Y
				local v94 = v_u_87.Dims.X / v56
				local v95 = v93 * math.ceil(v94)
				v92 = math.ceil(v95)
			end
			local v96
			if v_u_87.Context then
				v96 = v_u_8 + v_u_12
				if v_u_87.Expanded then
					v96 = v96 + v_u_23(v_u_87.Context, 0) * (v_u_8 + v_u_12)
				end
			else
				v96 = 0
			end
			local v97 = v92 + v96
			v54 = v54 + 1
			if v55 + v97 >= v51.Y then
				if v89 < v50.Y then
					local v98 = v_u_7.Color.Text
					local v99 = ""
					if v_u_87.Type == Enum.MessageType.MessageOutput.Value then
						v98 = v_u_7.Color.Text
					elseif v_u_87.Type == Enum.MessageType.MessageInfo.Value then
						v98 = v_u_7.Color.HighlightBlue
						v99 = v_u_7.Image.Info
					elseif v_u_87.Type == Enum.MessageType.MessageWarning.Value then
						v98 = v_u_7.Color.WarningYellow
						v99 = v_u_7.Image.Warning
					elseif v_u_87.Type == Enum.MessageType.MessageError.Value then
						v98 = v_u_7.Color.ErrorRed
						v99 = v_u_7.Image.Error
					end
					local v100 = {}
					if v_u_87.Context then
						v100.Layout = v_u_3.createElement("UIListLayout", {
							["SortOrder"] = Enum.SortOrder.LayoutOrder,
							["Padding"] = UDim.new(0, v_u_12)
						})
						v100.Header = v_u_3.createElement(v_u_6, {
							["size"] = nil,
							["isExpanded"] = nil,
							["isExpandable"] = true,
							["layoutOrder"] = 0,
							["hideLines"] = true,
							["onButtonPress"] = nil,
							["size"] = UDim2.new(1, 0, 0, v_u_8),
							["isExpanded"] = v_u_87.Expanded,
							["onButtonPress"] = function()
								-- upvalues: (copy) v_u_87, (copy) p_u_46
								v_u_87.Expanded = not v_u_87.Expanded
								p_u_46:setState({})
							end
						}, {
							["Label"] = v_u_3.createElement("TextLabel", {
								["Text"] = "Context: {...}",
								["TextSize"] = nil,
								["Font"] = nil,
								["TextColor3"] = nil,
								["BackgroundTransparency"] = 1,
								["Size"] = nil,
								["Position"] = nil,
								["TextXAlignment"] = nil,
								["TextSize"] = v_u_8,
								["Font"] = v_u_9,
								["TextColor3"] = v98,
								["Size"] = UDim2.new(1, -20, 1, 0),
								["Position"] = UDim2.fromOffset(20, 0),
								["TextXAlignment"] = Enum.TextXAlignment.Left
							})
						})
						if v_u_87.Expanded then
							v_u_85(v100, v_u_87.Context, v98, 0, {
								["i"] = 0
							})
						end
					end
					local v101 = v_u_3.createElement
					local v102 = "Frame"
					local v103 = {
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["LayoutOrder"] = nil,
						["Size"] = UDim2.new(1, 0, 0, v97),
						["LayoutOrder"] = v54
					}
					local v104 = {
						["image"] = v_u_3.createElement("ImageLabel", {
							["Image"] = nil,
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundTransparency"] = 1,
							["Image"] = v99,
							["Size"] = UDim2.new(0, v_u_10, 0, v_u_10),
							["Position"] = UDim2.new(0, v_u_10 / 4, 0, (v_u_8 - v_u_10) / 2)
						}),
						["msg"] = v_u_3.createElement("TextLabel", {
							["Text"] = nil,
							["TextColor3"] = nil,
							["TextSize"] = nil,
							["Font"] = nil,
							["TextXAlignment"] = nil,
							["TextWrapped"] = nil,
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundTransparency"] = 1,
							["Text"] = v90,
							["TextColor3"] = v98,
							["TextSize"] = v_u_8,
							["Font"] = v_u_9,
							["TextXAlignment"] = Enum.TextXAlignment.Left,
							["TextWrapped"] = v52,
							["Size"] = UDim2.new(1, 0, 0, v92),
							["Position"] = UDim2.new(0, v_u_11, 0, 0)
						})
					}
					local v105 = v_u_87.Context
					if v105 then
						v105 = v_u_3.createElement("Frame", {
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundTransparency"] = 1,
							["Size"] = UDim2.new(1, -v_u_11, 0, v96),
							["Position"] = UDim2.new(0, v_u_11, 0, v92 + v_u_12)
						}, v100)
					end
					v104.context = v105
					v53[v54] = v101(v102, v103, v104)
				end
				if v88 < 0 then
					v88 = v55
				else
					v89 = v89 + v97 + v_u_12
				end
			end
			v55 = v55 + v97 + v_u_12
			if v91 < v_u_13 then
				v_u_87 = v86:next()
			else
				local v106 = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", v91, v_u_13)
				v_u_87 = {
					["Message"] = v106,
					["CharCount"] = #v106,
					["Type"] = v_u_87.Type,
					["Dims"] = v_u_2:GetTextSize(v106, v_u_8, v_u_9, Vector2.new())
				}
			end
		end
		v53.UIListLayout = v_u_3.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_12)
		})
		v53.WindowingPadding = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v88)
		})
	end
	return v_u_3.createElement("ScrollingFrame", {
		["Size"] = v48,
		["BackgroundTransparency"] = 1,
		["VerticalScrollBarInset"] = 1,
		["ScrollBarThickness"] = 6,
		["CanvasSize"] = UDim2.new(0, 0, 0, v55),
		["CanvasPosition"] = v51,
		["LayoutOrder"] = v47,
		[v_u_3.Ref] = p_u_46.ref
	}, v53)
end
return v24