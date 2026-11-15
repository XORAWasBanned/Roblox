-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Curve.Curve
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Signals)
local v_u_5 = require(v1.CanvasContext)
local v_u_6 = require(v1.Util.StyleUtil)
require(v1.Types)
local v_u_7 = require(v1.Util.useViewportBinding).useViewportVisibility
local v_u_8 = nil
local function v_u_24(p9, p10) -- name: curvePointsToControlPoints
	local v11 = {}
	for _, v12 in p10 do
		local v13 = p9.plotToView(v12.Position)
		local v14
		if v12.LeftTangent then
			v14 = v12.LeftTangent
		else
			v14 = Vector2.new(0, 0)
		end
		local v15
		if v12.RightTangent then
			v15 = v12.RightTangent
		else
			v15 = Vector2.new(0, 0)
		end
		local v16 = p9.plotToView(v12.Position + v14) - v13
		local v17 = p9.plotToView(v12.Position + v15) - v13
		local v18 = Path2DControlPoint.new
		local v19 = UDim2.fromScale(v13.X, v13.Y)
		local v20 = UDim2.fromScale(v16.X, v16.Y)
		local v21 = UDim2.fromScale
		local v22 = v17.X
		local v23 = v17.Y
		table.insert(v11, v18(v19, v20, v21(v22, v23)))
	end
	return v11
end
local function v_u_34(p25, p26, p27) -- name: applyControlPoints
	local v28 = 1
	for _, v29 in p25:GetChildren() do
		local v30 = #p26
		local v31 = {}
		for v32 = v28, v28 + p27 - 1 do
			if v30 < v32 then
				break
			end
			local v33 = p26[v32]
			table.insert(v31, v33)
		end
		v29:SetControlPoints(v31)
		v28 = v28 + (p27 - 1)
	end
end
function Curve(p_u_35) -- name: Curve
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (ref) v_u_8, (copy) v_u_4, (copy) v_u_24, (copy) v_u_34, (copy) v_u_7, (copy) v_u_6
	local v_u_36 = v_u_3.useContext(v_u_5)
	if not v_u_8 then
		local v37 = Instance.new("Path2D")
		v_u_8 = v37:GetMaxControlPoints()
		v37:Destroy()
	end
	local v38 = v_u_8
	assert(v38, "MAX_POINTS_PER_PATH was nil")
	local v_u_39 = v_u_8
	local v40 = v_u_3.useRef(nil)
	if v40.current == nil then
		local v41, v42 = v_u_4.createSignal(nil)
		v40.current = {
			["get"] = v41,
			["set"] = v42
		}
	end
	local v_u_43 = v40.current
	local v44 = p_u_35.PointCount or (p_u_35.Points and (#p_u_35.Points or 0) or 0)
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) p_u_35, (ref) v_u_4, (copy) v_u_36, (ref) v_u_24, (copy) v_u_43, (ref) v_u_34, (copy) v_u_39
		local v_u_45
		if p_u_35.ObservePoints then
			local v_u_46 = p_u_35.ObservePoints
			v_u_45 = v_u_4.createComputed(function(p47)
				-- upvalues: (ref) v_u_36, (ref) v_u_24, (copy) v_u_46
				v_u_36.viewportRectGetter(p47)
				return v_u_24(v_u_36, v_u_46(p47))
			end)
		else
			local v_u_48 = p_u_35.Points or {}
			v_u_45 = v_u_4.createComputed(function(p49)
				-- upvalues: (ref) v_u_36, (ref) v_u_24, (copy) v_u_48
				v_u_36.viewportRectGetter(p49)
				return v_u_24(v_u_36, v_u_48)
			end)
		end
		return v_u_4.createEffect(function(p50)
			-- upvalues: (ref) v_u_45, (ref) p_u_35, (ref) v_u_43, (ref) v_u_34, (ref) v_u_39
			local v51 = v_u_45(p50)
			local v52
			if p_u_35.ObserveThickness then
				v52 = p_u_35.ObserveThickness(p50)
			else
				v52 = nil
			end
			local v53 = v_u_43.get(p50)
			if v53 then
				v_u_34(v53, v51, v_u_39)
				if v52 then
					for _, v54 in v53:GetChildren() do
						v54.Thickness = v52
					end
				end
			end
		end)
	end, {
		v_u_36,
		p_u_35.ObservePoints,
		p_u_35.Points,
		p_u_35.ObserveThickness
	})
	if not v_u_7(function(p55)
		-- upvalues: (copy) p_u_35
		local v56 = p_u_35.Points
		if not v56 or #v56 == 0 then
			return true
		end
		local v57 = (1 / 0)
		local v58 = (1 / 0)
		local v59 = (-1 / 0)
		local v60 = (-1 / 0)
		for _, v61 in v56 do
			local v62 = { v61.Position }
			if v61.LeftTangent then
				local v63 = v61.Position + v61.LeftTangent
				table.insert(v62, v63)
			end
			if v61.RightTangent then
				local v64 = v61.Position + v61.RightTangent
				table.insert(v62, v64)
			end
			for _, v65 in v62 do
				if v65.X < v57 then
					v57 = v65.X
				end
				if v65.Y < v58 then
					v58 = v65.Y
				end
				if v59 < v65.X then
					v59 = v65.X
				end
				if v60 >= v65.Y then
					continue
				end
				v60 = v65.Y
			end
		end
		return p55.isRectInViewport(Rect.new(v57, v58, v59, v60))
	end, { p_u_35.Points }) then
		return nil
	end
	local v66 = p_u_35.Tag or ""
	local v67
	if p_u_35.ClipContents == nil then
		v67 = false
	else
		v67 = p_u_35.ClipContents
	end
	local v68 = 1
	local v69 = {}
	for _ = 2, v44, v_u_39 - 1 do
		v69[tostring(v68)] = v_u_3.createElement("Path2D", {
			["Color3"] = p_u_35.Color3 or v_u_6.CURVE_COLOR3,
			["Thickness"] = p_u_35.Thickness or v_u_6.CURVE_THICKNESS,
			["ZIndex"] = p_u_35.ZIndex,
			[v_u_3.Tag] = v66
		})
		v68 = v68 + 1
	end
	return v_u_3.createElement(v67 and "CanvasGroup" or "Frame", {
		["ref"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["ZIndex"] = nil,
		["ref"] = v_u_43.set,
		["Size"] = UDim2.fromScale(1, 1),
		["ZIndex"] = p_u_35.ZIndex
	}, v69)
end
return Curve