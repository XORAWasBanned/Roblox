-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VirtualList
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v4 = v_u_2.Component:extend("VirtualList")
function v4.init(p_u_5) -- name: init
	-- upvalues: (copy) v_u_2
	p_u_5.scrollingRef = v_u_2.createRef()
	p_u_5.state = {
		["canvasPosY"] = 0,
		["absSizeY"] = 0
	}
	function p_u_5.onScrollPropertyChanged()
		-- upvalues: (copy) p_u_5
		local v6 = p_u_5.scrollingRef.current
		if v6 then
			local v7 = v6.CanvasPosition.Y
			local v8 = v6.AbsoluteSize.Y
			if v7 ~= p_u_5.state.canvasPosY or v8 ~= p_u_5.state.absSizeY then
				p_u_5:setState({
					["canvasPosY"] = v7,
					["absSizeY"] = v8
				})
			end
		end
	end
end
function v4.connectScrollListenersIfNeeded(p9) -- name: connectScrollListenersIfNeeded
	local v10 = p9.scrollingRef.current
	if v10 == p9.connectedFrame then
		return
	else
		p9:disconnectScrollListeners()
		if v10 then
			p9.connectedFrame = v10
			p9.canvasPosConnector = v10:GetPropertyChangedSignal("CanvasPosition"):Connect(p9.onScrollPropertyChanged)
			p9.absSizeConnector = v10:GetPropertyChangedSignal("AbsoluteSize"):Connect(p9.onScrollPropertyChanged)
			p9.onScrollPropertyChanged()
		end
	end
end
function v4.disconnectScrollListeners(p11) -- name: disconnectScrollListeners
	if p11.canvasPosConnector then
		p11.canvasPosConnector:Disconnect()
		p11.canvasPosConnector = nil
	end
	if p11.absSizeConnector then
		p11.absSizeConnector:Disconnect()
		p11.absSizeConnector = nil
	end
	p11.connectedFrame = nil
end
function v4.didMount(p12) -- name: didMount
	p12:connectScrollListenersIfNeeded()
end
function v4.willUnmount(p13) -- name: willUnmount
	p13:disconnectScrollListeners()
end
function v4.didUpdate(p14, p15) -- name: didUpdate
	p14:connectScrollListenersIfNeeded()
	local v16 = p14.scrollingRef.current
	if v16 then
		local v17 = v16.AbsoluteSize.Y
		local v18 = v16.CanvasPosition.Y
		if v17 ~= p14.state.absSizeY or v18 ~= p14.state.canvasPosY then
			p14:setState({
				["absSizeY"] = v17,
				["canvasPosY"] = v18
			})
		end
		local v19 = #(p15.items or {})
		local v20 = #(p14.props.items or {})
		if v19 ~= v20 then
			local v21 = v20 * p14.props.rowHeight - v17
			local v22 = math.max(0, v21)
			local v23 = math.min(v18, v22)
			if v23 ~= v16.CanvasPosition.Y then
				v16.CanvasPosition = Vector2.new(v16.CanvasPosition.X, v23)
			end
			if v23 ~= p14.state.canvasPosY then
				p14:setState({
					["canvasPosY"] = v23
				})
			end
		end
	else
		return
	end
end
function v4.render(p24) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v25 = p24.props.items or {}
	local v26 = p24.props.rowHeight
	local v27 = p24.props.renderItem
	local v28 = #v25
	if v28 == 0 then
		return v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = 0.5,
			["BackgroundTransparency"] = 1,
			["Size"] = p24.props.size or UDim2.new(1, 0, 1, 0),
			["Position"] = p24.props.position,
			["LayoutOrder"] = p24.props.layoutOrder,
			["Text"] = p24.props.emptyText or "",
			["TextColor3"] = v_u_3.Color.Text
		})
	end
	local v29 = p24.state.canvasPosY
	local v30 = p24.state.absSizeY
	local v31 = v29 / v26
	local v32 = math.floor(v31) - 4 + 1
	local v33 = v30 / v26
	local v34 = v32 + (math.ceil(v33) + 8) - 1
	local v35 = {}
	for v36 = math.clamp(v32, 1, v28), math.clamp(v34, 1, v28) do
		v35["row" .. v36] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v26),
			["Position"] = UDim2.new(0, 0, 0, (v36 - 1) * v26)
		}, {
			["Item"] = v27(v25[v36], v36)
		})
	end
	return v_u_2.createElement("ScrollingFrame", {
		["Size"] = p24.props.size or UDim2.new(1, 0, 1, 0),
		["Position"] = p24.props.position,
		["LayoutOrder"] = p24.props.layoutOrder,
		["CanvasSize"] = UDim2.new(0, 0, 0, v28 * v26),
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["ScrollBarThickness"] = 6,
		["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar,
		[v_u_2.Ref] = p24.scrollingRef
	}, v35)
end
return v4