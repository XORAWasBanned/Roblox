-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.ResizablePanel.ResizablePanel
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.CanvasContext)
local v_u_6 = require(v1.Components.InputDetector)
local v_u_7 = require(v1.Components.Panel)
local v_u_8 = require(v1.Types)
local function v_u_26(p9, p10, p11) -- name: onDrag
	if p9.SetRect then
		local v12 = p9.MinSize or Vector2.zero
		local v13 = p9.Rect.Min.X
		local v14 = p9.Rect.Min.Y
		local v15 = p9.Rect.Max.X
		local v16 = p9.Rect.Max.Y
		if p11.X == 0 then
			local v17 = p10.X
			local v18 = v15 - v12.X
			v13 = math.min(v17, v18)
		end
		if p11.X == 1 then
			local v19 = p10.X
			local v20 = v13 + v12.X
			v15 = math.max(v19, v20)
		end
		if p11.Y == 0 then
			local v21 = p10.Y
			local v22 = v16 - v12.Y
			v14 = math.min(v21, v22)
		end
		if p11.Y == 1 then
			local v23 = p10.Y
			local v24 = v14 + v12.Y
			v16 = math.max(v23, v24)
		end
		local v25 = p9.SetRect ~= nil
		assert(v25, "props.SetRect is nil")
		p9.SetRect(Rect.new(v13, v14, v15, v16))
	end
end
function ResizablePanel(p_u_27) -- name: ResizablePanel
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_8, (copy) v_u_26, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v28 = v_u_4.useContext(v_u_5)
	local v_u_29 = v28.getXAxisScaling().Direction == v_u_8.DIRECTION_REVERSED
	local v_u_30 = v28.getYAxisScaling().Direction == v_u_8.DIRECTION_REVERSED
	local v33 = v_u_4.useCallback(function(p31)
		-- upvalues: (copy) p_u_27
		if p_u_27.SetRect then
			local v32 = p_u_27.SetRect
			assert(v32, "props.SetRect was nil")
			p_u_27.SetRect(Rect.new(p31.X, p31.Y, p31.X + p_u_27.Rect.Width, p31.Y + p_u_27.Rect.Height))
		end
	end, { p_u_27.Rect, p_u_27.SetRect })
	local v35 = v_u_4.useCallback(function(p34)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29
		v_u_26(p_u_27, p34, Vector2.new(v_u_29 and 1 or 0, 0.5))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29
	})
	local v37 = v_u_4.useCallback(function(p36)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29
		v_u_26(p_u_27, p36, Vector2.new(v_u_29 and 0 or 1, 0.5))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29
	})
	local v39 = v_u_4.useCallback(function(p38)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_30
		v_u_26(p_u_27, p38, Vector2.new(0.5, v_u_30 and 0 or 1))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_30
	})
	local v41 = v_u_4.useCallback(function(p40)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_30
		v_u_26(p_u_27, p40, Vector2.new(0.5, v_u_30 and 1 or 0))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_30
	})
	local v43 = v_u_4.useCallback(function(p42)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29, (copy) v_u_30
		v_u_26(p_u_27, p42, Vector2.new(v_u_29 and 1 or 0, v_u_30 and 0 or 1))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29,
		v_u_30
	})
	local v45 = v_u_4.useCallback(function(p44)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29, (copy) v_u_30
		v_u_26(p_u_27, p44, Vector2.new(v_u_29 and 0 or 1, v_u_30 and 0 or 1))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29,
		v_u_30
	})
	local v47 = v_u_4.useCallback(function(p46)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29, (copy) v_u_30
		v_u_26(p_u_27, p46, Vector2.new(v_u_29 and 1 or 0, v_u_30 and 1 or 0))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29,
		v_u_30
	})
	local v49 = v_u_4.useCallback(function(p48)
		-- upvalues: (ref) v_u_26, (copy) p_u_27, (copy) v_u_29, (copy) v_u_30
		v_u_26(p_u_27, p48, Vector2.new(v_u_29 and 0 or 1, v_u_30 and 1 or 0))
	end, {
		p_u_27.Rect,
		p_u_27.SetRect,
		p_u_27.MinSize,
		v_u_29,
		v_u_30
	})
	local v50 = v_u_4.createElement
	local v51 = v_u_7
	local v52 = v_u_3.join
	local v53 = {
		["Rect"] = p_u_27.Rect
	}
	local v54 = v_u_3.join
	local v55 = p_u_27.children
	local v56 = {}
	local v57 = p_u_27.DragEnabled
	if v57 then
		v57 = v_u_4.createElement(v_u_6, {
			["AnchorPoint"] = nil,
			["XSnap"] = nil,
			["YSnap"] = nil,
			["OnDragMoved"] = nil,
			["ZIndex"] = 0,
			["AnchorPoint"] = Vector2.new(0, 0),
			["XSnap"] = p_u_27.XSnap,
			["YSnap"] = p_u_27.YSnap,
			["OnDragMoved"] = v33
		})
	end
	v56.CenterInput = v57
	local v58 = p_u_27.EdgeLeftEnabled
	if v58 then
		v58 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 1,
			["Position"] = UDim2.fromScale(0, 0),
			["Size"] = UDim2.fromScale(0, 1)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v35
			})
		})
	end
	v56.Left = v58
	local v59 = p_u_27.EdgeRightEnabled
	if v59 then
		v59 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 1,
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.fromScale(0, 1)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v37
			})
		})
	end
	v56.Right = v59
	local v60 = p_u_27.EdgeTopEnabled
	if v60 then
		v60 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 1,
			["Position"] = UDim2.fromScale(0, 0),
			["Size"] = UDim2.fromScale(1, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v39
			})
		})
	end
	v56.Top = v60
	local v61 = p_u_27.EdgeBottomEnabled
	if v61 then
		v61 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 1,
			["Position"] = UDim2.fromScale(0, 1),
			["Size"] = UDim2.fromScale(1, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v41
			})
		})
	end
	v56.Bottom = v61
	local v62 = p_u_27.CornerTopLeftEnabled
	if v62 then
		v62 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Position"] = UDim2.fromScale(0, 0),
			["Size"] = UDim2.fromScale(0, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v43
			})
		})
	end
	v56.TopLeft = v62
	local v63 = p_u_27.CornerTopRightEnabled
	if v63 then
		v63 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.fromScale(0, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v45
			})
		})
	end
	v56.TopRight = v63
	local v64 = p_u_27.CornerBottomLeftEnabled
	if v64 then
		v64 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Position"] = UDim2.fromScale(0, 1),
			["Size"] = UDim2.fromScale(0, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v47
			})
		})
	end
	v56.BottomLeft = v64
	local v65 = p_u_27.CornerBottomRightEnabled
	if v65 then
		v65 = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Position"] = UDim2.fromScale(1, 1),
			["Size"] = UDim2.fromScale(0, 0)
		}, {
			["Input"] = v_u_4.createElement(v_u_6, {
				["Inflate"] = 5,
				["XSnap"] = nil,
				["YSnap"] = nil,
				["OnDragMoved"] = nil,
				["XSnap"] = p_u_27.XSnap,
				["YSnap"] = p_u_27.YSnap,
				["OnDragMoved"] = v49
			})
		})
	end
	v56.BottomRight = v65
	v53.children = v54(v55, v56)
	return v50(v51, v52(p_u_27, v53))
end
return ResizablePanel