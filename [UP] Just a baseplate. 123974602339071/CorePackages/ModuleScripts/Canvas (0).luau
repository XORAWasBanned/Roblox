-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Canvas.Canvas
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.CanvasContext)
local v_u_6 = require(v1.Util.CanvasUtil)
local v_u_7 = require(v1.Util.StyleUtil)
require(v1.Types)
local v_u_8 = Rect.new(0, 0, 1, 1)
function Canvas(p_u_9, p10) -- name: Canvas
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3
	local v11 = v_u_4.useRef(nil)
	local v12
	if p_u_9.Position then
		v12 = p_u_9.Position
	else
		v12 = UDim2.fromOffset(0, 0)
	end
	local v13
	if p_u_9.Size then
		v13 = p_u_9.Size
	else
		v13 = UDim2.fromScale(1, 1)
	end
	local v14
	if p_u_9.ViewportPaddingLeft then
		v14 = p_u_9.ViewportPaddingLeft
	else
		v14 = UDim.new(0, 25)
	end
	local v15
	if p_u_9.ViewportPaddingRight then
		v15 = p_u_9.ViewportPaddingRight
	else
		v15 = UDim.new(0, 25)
	end
	local v16
	if p_u_9.ViewportPaddingTop then
		v16 = p_u_9.ViewportPaddingTop
	else
		v16 = UDim.new(0, 25)
	end
	local v17
	if p_u_9.ViewportPaddingBottom then
		v17 = p_u_9.ViewportPaddingBottom
	else
		v17 = UDim.new(0, 25)
	end
	local v18 = UDim2.new(v14, v16)
	local v19 = UDim2.new(v15, v17)
	local v20 = v_u_4.useRef(nil)
	if v20.current == nil then
		local v21 = p_u_9.GraphRect or v_u_8
		local v22
		if p_u_9.ViewportRect then
			v22 = p_u_9.ViewportRect
		else
			v22 = v21
		end
		local v23, v24 = v_u_6.createStableContext(v11, v21, v22, p_u_9.XAxisScaling, p_u_9.YAxisScaling, p_u_9.CullingEpsilon)
		v20.current = {
			["context"] = v23,
			["update"] = v24
		}
	end
	local v25 = v20.current
	local v26 = v25.context
	local v_u_27 = v25.update
	local v_u_28 = v_u_4.useRef({
		["graphRect"] = p_u_9.GraphRect or v_u_8,
		["viewportRect"] = p_u_9.ViewportRect or (p_u_9.GraphRect or v_u_8),
		["xAxisScaling"] = p_u_9.XAxisScaling,
		["yAxisScaling"] = p_u_9.YAxisScaling,
		["cullingEpsilon"] = p_u_9.CullingEpsilon
	})
	v_u_4.useImperativeHandle(p10, function()
		-- upvalues: (copy) v_u_28, (copy) v_u_27
		return {
			["setViewportRect"] = function(p29) -- name: setViewportRect
				-- upvalues: (ref) v_u_28, (ref) v_u_27
				local v30 = v_u_28.current
				v30.viewportRect = p29
				v_u_27(v30.graphRect, p29, v30.xAxisScaling, v30.yAxisScaling, v30.cullingEpsilon)
			end,
			["setGraphRect"] = function(p31) -- name: setGraphRect
				-- upvalues: (ref) v_u_28, (ref) v_u_27
				local v32 = v_u_28.current
				v32.graphRect = p31
				v_u_27(p31, v32.viewportRect, v32.xAxisScaling, v32.yAxisScaling, v32.cullingEpsilon)
			end,
			["update"] = function(p33, p34, p35, p36, p37) -- name: update
				-- upvalues: (ref) v_u_28, (ref) v_u_27
				local v38 = v_u_28.current
				v38.graphRect = p33
				v38.viewportRect = p34
				v38.xAxisScaling = p35
				v38.yAxisScaling = p36
				v38.cullingEpsilon = p37
				v_u_27(p33, p34, p35, p36, p37)
			end
		}
	end, {})
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) p_u_9, (copy) v_u_28, (copy) v_u_27
		if p_u_9.GraphRect then
			local v39 = p_u_9.GraphRect
			local v40
			if p_u_9.ViewportRect then
				v40 = p_u_9.ViewportRect
			else
				v40 = v39
			end
			v_u_28.current.graphRect = v39
			v_u_28.current.viewportRect = v40
			v_u_28.current.xAxisScaling = p_u_9.XAxisScaling
			v_u_28.current.yAxisScaling = p_u_9.YAxisScaling
			v_u_28.current.cullingEpsilon = p_u_9.CullingEpsilon
			v_u_27(v39, v40, p_u_9.XAxisScaling, p_u_9.YAxisScaling, p_u_9.CullingEpsilon)
		end
	end, {
		p_u_9.GraphRect,
		p_u_9.ViewportRect,
		p_u_9.XAxisScaling,
		p_u_9.YAxisScaling,
		p_u_9.CullingEpsilon
	})
	local v41 = v_u_4.createElement
	local v42 = v_u_5.Provider
	local v43 = {
		["MainPanel"] = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["ZIndex"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = v12,
			["Size"] = v13,
			["LayoutOrder"] = p_u_9.LayoutOrder,
			["ZIndex"] = p_u_9.ZIndex,
			["BackgroundColor3"] = p_u_9.CanvasBackgroundColor3 or v_u_7.CANVAS_BACKGROUND_COLOR3,
			["BackgroundTransparency"] = p_u_9.CanvasBackgroundTransparency or v_u_7.CANVAS_BACKGROUND_TRANSPARENCY
		}, v_u_3.join({
			["Viewport"] = v_u_4.createElement("CanvasGroup", {
				["Position"] = nil,
				["Size"] = nil,
				["ref"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 1,
				["Position"] = v18,
				["Size"] = UDim2.fromScale(1, 1) - (v18 + v19),
				["ref"] = v11,
				["BackgroundColor3"] = p_u_9.ViewportBackgroundColor3 or v_u_7.VIEWPORT_BACKGROUND_COLOR3,
				["BackgroundTransparency"] = p_u_9.ViewportBackgroundTransparency or v_u_7.VIEWPORT_BACKGROUND_TRANSPARENCY
			}, p_u_9.children),
			["ViewportUnclipped"] = v_u_4.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 2,
				["Position"] = v18,
				["Size"] = UDim2.fromScale(1, 1) - (v18 + v19)
			}, p_u_9.childrenUnclipped)
		}))
	}
	return v41(v42, {
		["value"] = v26
	}, v43)
end
return v_u_4.forwardRef(Canvas)