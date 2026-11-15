-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.InputDetector.InputDetector
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Types)
local v_u_4 = require(v1.CanvasContext)
local v_u_5 = require(v1.Util.MathUtil)
function InputDetector(p_u_6) -- name: InputDetector
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v_u_7 = v_u_3.useContext(v_u_4)
	local v8 = p_u_6.Inflate or 0
	local v_u_9, v_u_10 = v_u_3.useState(false)
	local _, v_u_11 = v_u_3.useState(false)
	local v_u_12, v_u_13 = v_u_3.useState(false)
	local v_u_14, v_u_15 = v_u_3.useState(false)
	local v_u_16, v_u_17 = v_u_3.useState(Vector2.zero)
	local v_u_21 = v_u_3.useCallback(function(p18)
		-- upvalues: (copy) p_u_6, (ref) v_u_5
		local v19 = p18.X
		local v20 = p18.Y
		if p_u_6.XSnap then
			v19 = v_u_5.roundToNearest(v19, p_u_6.XSnap)
		end
		if p_u_6.YSnap then
			v20 = v_u_5.roundToNearest(v20, p_u_6.YSnap)
		end
		return Vector2.new(v19, v20)
	end, { p_u_6.XSnap, p_u_6.YSnap })
	local v24 = v_u_3.useCallback(function(_, p22)
		-- upvalues: (copy) v_u_21, (copy) v_u_7, (copy) v_u_10, (copy) p_u_6, (copy) v_u_13, (copy) v_u_15
		local v23 = v_u_21(v_u_7.mouseToPlot(p22.Position))
		if p22.UserInputType == Enum.UserInputType.MouseMovement then
			v_u_10(true)
			if p_u_6.OnHoverStart then
				p_u_6.OnHoverStart(v_u_7.mouseToPlot(p22.Position), p22)
				return
			end
		elseif p22.UserInputType == Enum.UserInputType.MouseButton1 or p22.UserInputType == Enum.UserInputType.Touch then
			v_u_13(false)
			if p_u_6.OnPress then
				p_u_6.OnPress(v23, p22)
				return
			end
		elseif p22.UserInputType == Enum.UserInputType.MouseButton2 then
			v_u_15(false)
			if p_u_6.OnRightPress then
				p_u_6.OnRightPress(v23, p22)
			end
		end
	end, {
		v_u_10,
		v_u_13,
		v_u_15,
		v_u_7,
		p_u_6.OnHoverStart,
		p_u_6.OnPress,
		p_u_6.OnRightPress,
		v_u_21
	})
	local v26 = v_u_3.useCallback(function(_, p25)
		-- upvalues: (copy) p_u_6, (copy) v_u_9, (copy) v_u_21, (copy) v_u_7
		if p_u_6.OnHoverMoved and (v_u_9 and p25.UserInputType == Enum.UserInputType.MouseMovement) then
			p_u_6.OnHoverMoved(v_u_21(v_u_7.mouseToPlot(p25.Position)), p25)
		elseif p_u_6.OnScroll and p25.UserInputType == Enum.UserInputType.MouseWheel then
			p_u_6.OnScroll(p25.Position.Z, p25)
		end
	end, {
		v_u_9,
		v_u_7,
		p_u_6.OnHoverMoved,
		p_u_6.OnScroll,
		v_u_21
	})
	local v29 = v_u_3.useCallback(function(_, p27)
		-- upvalues: (copy) v_u_21, (copy) v_u_7, (copy) v_u_10, (copy) p_u_6, (copy) v_u_9, (copy) v_u_12, (copy) v_u_14
		local v28 = v_u_21(v_u_7.mouseToPlot(p27.Position))
		if p27.UserInputType == Enum.UserInputType.MouseMovement then
			v_u_10(false)
			if p_u_6.OnHoverEnded then
				p_u_6.OnHoverEnded(v28, p27)
				return
			end
		elseif p27.UserInputType == Enum.UserInputType.MouseButton1 or p27.UserInputType == Enum.UserInputType.Touch then
			if p_u_6.OnRelease then
				p_u_6.OnRelease(v28, p27)
			end
			if p_u_6.OnClick and (v_u_9 and not v_u_12) then
				p_u_6.OnClick(v28, p27)
				return
			end
		elseif p27.UserInputType == Enum.UserInputType.MouseButton2 then
			if p_u_6.OnRightRelease then
				p_u_6.OnRightRelease(v28, p27)
			end
			if p_u_6.OnRightClick and (v_u_9 and not v_u_14) then
				p_u_6.OnRightClick(v28, p27)
			end
		end
	end, {
		v_u_10,
		v_u_9,
		v_u_12,
		v_u_14,
		v_u_7,
		p_u_6.OnHoverEnded,
		p_u_6.OnClick,
		p_u_6.OnRightClick,
		p_u_6.OnRelease,
		p_u_6.OnRightRelease,
		v_u_21
	})
	local v42 = v_u_3.useCallback(function(p30, p31)
		-- upvalues: (copy) v_u_11, (copy) p_u_6, (copy) v_u_7, (copy) v_u_17, (copy) v_u_21
		v_u_11(true)
		local v32 = Vector2.zero
		local v33
		if p30.Parent then
			v33 = p30.Parent.Parent
		else
			v33 = nil
		end
		if v33 and v33:IsA("GuiObject") then
			local v34 = p_u_6.AnchorPoint or v33.AnchorPoint
			v32 = v33.AbsolutePosition + v33.AbsoluteSize * v34
		end
		local v35 = v_u_7.absToView(p31) - v_u_7.absToView(v32)
		if p_u_6.TreatMouseAsAnchor then
			v35 = Vector2.zero
		end
		v_u_17(v35)
		if p_u_6.OnDragStart then
			local v36 = v_u_7.absToView(p31) - v35
			local v37 = Vector2.new
			local v38 = v36.X
			local v39 = math.clamp(v38, 0, 1)
			local v40 = v36.Y
			local v41 = v37(v39, (math.clamp(v40, 0, 1)))
			p_u_6.OnDragStart(v_u_21(v_u_7.viewToPlot(v41)), p31)
		end
	end, {
		v_u_7,
		v_u_17,
		v_u_11,
		p_u_6.OnDragStart,
		p_u_6.AnchorPoint,
		p_u_6.TreatMouseAsAnchor,
		v_u_21
	})
	local v50 = v_u_3.useCallback(function(_, p43)
		-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) p_u_6, (copy) v_u_7, (copy) v_u_16, (copy) v_u_21
		v_u_13(true)
		v_u_15(true)
		if p_u_6.OnDragMoved then
			local v44 = v_u_7.absToView(p43) - v_u_16
			local v45 = Vector2.new
			local v46 = v44.X
			local v47 = math.clamp(v46, 0, 1)
			local v48 = v44.Y
			local v49 = v45(v47, (math.clamp(v48, 0, 1)))
			p_u_6.OnDragMoved(v_u_21(v_u_7.viewToPlot(v49)), p43)
		end
	end, {
		v_u_7,
		v_u_13,
		v_u_15,
		v_u_16,
		p_u_6.OnDragMoved,
		v_u_21
	})
	local v58 = v_u_3.useCallback(function(_, p51)
		-- upvalues: (copy) v_u_11, (copy) p_u_6, (copy) v_u_7, (copy) v_u_16, (copy) v_u_21
		v_u_11(false)
		if p_u_6.OnDragEnded then
			local v52 = v_u_7.absToView(p51) - v_u_16
			local v53 = Vector2.new
			local v54 = v52.X
			local v55 = math.clamp(v54, 0, 1)
			local v56 = v52.Y
			local v57 = v53(v55, (math.clamp(v56, 0, 1)))
			p_u_6.OnDragEnded(v_u_21(v_u_7.viewToPlot(v57)), p51)
		end
	end, {
		v_u_7,
		v_u_11,
		p_u_6.OnDragEnded,
		v_u_16,
		v_u_21
	})
	return v_u_3.createElement("Frame", {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.new(1, v8 * 2, 1, v8 * 2),
		["BackgroundTransparency"] = p_u_6.DebugColor3 == nil and 1 or 0,
		["BackgroundColor3"] = p_u_6.DebugColor3,
		["BorderSizePixel"] = 0,
		["ZIndex"] = p_u_6.ZIndex,
		[v_u_3.Event.InputBegan] = v24,
		[v_u_3.Event.InputChanged] = v26,
		[v_u_3.Event.InputEnded] = v29
	}, {
		["DragDetector"] = v_u_3.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			["ReferenceUIInstance"] = v_u_7.getViewport(),
			[v_u_3.Event.DragStart] = v42,
			[v_u_3.Event.DragContinue] = v50,
			[v_u_3.Event.DragEnd] = v58
		})
	})
end
return InputDetector