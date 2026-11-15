-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Path2DWrapper.Path2DWrapper
local v1 = script:FindFirstAncestor("Graphing").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.Signals)
local v_u_4 = nil
function Path2DWrapper(p_u_5) -- name: Path2DWrapper
	-- upvalues: (copy) v_u_2, (ref) v_u_4, (copy) v_u_3
	local v_u_6 = v_u_2.useRef(nil)
	if not v_u_4 then
		local v7 = Instance.new("Path2D")
		v_u_4 = v7:GetMaxControlPoints()
		v7:Destroy()
	end
	local v8 = v_u_4
	assert(v8, "MAX_POINTS_PER_PATH was nil")
	local v_u_9 = v_u_4
	local v10 = p_u_5.PointCount or (p_u_5.ControlPoints and (#p_u_5.ControlPoints or 0) or 0)
	local function v_u_19(p11) -- name: applyControlPoints
		-- upvalues: (copy) v_u_6, (copy) v_u_9
		local v12 = v_u_6.current
		if not v12 then
			return
		end
		local v13 = 1
		for _, v14 in v12:GetChildren() do
			local v15 = #p11
			local v16 = {}
			for v17 = v13, v13 + v_u_9 - 1 do
				if v15 < v17 then
					break
				end
				local v18 = p11[v17]
				table.insert(v16, v18)
			end
			v14:SetControlPoints(v16)
			v13 = v13 + (v_u_9 - 1)
		end
	end
	v_u_2.useLayoutEffect(function()
		-- upvalues: (copy) p_u_5, (ref) v_u_3, (copy) v_u_19
		if p_u_5.ObserveControlPoints then
			local v_u_20 = p_u_5.ObserveControlPoints
			return v_u_3.createEffect(function(p21)
				-- upvalues: (ref) v_u_19, (copy) v_u_20
				v_u_19(v_u_20(p21))
			end)
		else
			if p_u_5.ControlPoints then
				v_u_19(p_u_5.ControlPoints)
			end
			return function() end
		end
	end, { p_u_5.ObserveControlPoints, p_u_5.ControlPoints })
	local v22 = p_u_5.Tag or ""
	local v23 = p_u_5.ClipContents == nil and true or p_u_5.ClipContents
	local v24 = 1
	local v25 = {}
	for _ = 2, v10, v_u_9 - 1 do
		v25[tostring(v24)] = v_u_2.createElement("Path2D", {
			["Color3"] = p_u_5.Color3,
			["Thickness"] = p_u_5.Thickness,
			["ZIndex"] = p_u_5.ZIndex,
			[v_u_2.Tag] = v22
		})
		v24 = v24 + 1
	end
	return v_u_2.createElement(v23 and "CanvasGroup" or "Frame", {
		["ref"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["ZIndex"] = nil,
		["ref"] = v_u_6,
		["Size"] = UDim2.fromScale(1, 1),
		["ZIndex"] = p_u_5.ZIndex
	}, v25)
end
return Path2DWrapper