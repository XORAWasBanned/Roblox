-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.useFloating
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Enums.PopoverAlign)
require(v1.Enums.PopoverSide)
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.positioning)
require(v1.Components.Types)
local function v_u_16(p_u_5, p_u_6, p_u_7) -- name: useConnectSignals
	-- upvalues: (copy) v_u_3
	local v_u_8 = v_u_3.useRef({})
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) p_u_5, (copy) p_u_6, (copy) v_u_8, (copy) p_u_7
		if p_u_5 ~= nil then
			for _, v9 in p_u_6 do
				local v10 = p_u_5
				local v11
				if typeof(v10) == "Instance" then
					v11 = p_u_5:GetPropertyChangedSignal(v9)
				else
					v11 = p_u_5:GetPropertyChangedSignal(v9)
				end
				local v12 = v_u_8.current
				local v13 = p_u_7
				local v14
				if type(v13) == "table" then
					v14 = function()
						-- upvalues: (ref) p_u_7
						p_u_7.current()
					end
				else
					v14 = p_u_7
				end
				v12[v9] = v11:Connect(v14)
			end
		end
		return function()
			-- upvalues: (ref) v_u_8
			for _, v15 in v_u_8.current do
				v15:Disconnect()
			end
		end
	end, { p_u_5, p_u_7 })
end
return function(p_u_17, p_u_18, p_u_19, p_u_20, p_u_21, p_u_22, p_u_23) -- name: useFloating
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_16
	local v24, v_u_25 = v_u_3.useBinding(Vector2.new())
	local v26, v_u_27 = v_u_3.useBinding(true)
	local v28, v_u_29 = v_u_3.useBinding(UDim2.new())
	local v30, v_u_31 = v_u_3.useBinding(Vector2.new())
	local v32, v_u_33 = v_u_3.useBinding(Vector2.new())
	local v34, v_u_35 = v_u_3.useBinding(Vector2.new(0, 0))
	local v_u_36 = v_u_3.useRef(function() end)
	local v_u_37 = v_u_3.useRef({})
	local v_u_38 = v_u_3.useRef(false)
	local v_u_76 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_17, (copy) p_u_18, (copy) p_u_19, (copy) p_u_20, (copy) v_u_27, (ref) v_u_4, (copy) v_u_37, (copy) p_u_21, (copy) p_u_22, (copy) p_u_23, (copy) v_u_29, (copy) v_u_31, (copy) v_u_33, (copy) v_u_25, (copy) v_u_35
		if p_u_17 and (p_u_18 and (p_u_19 and p_u_20)) then
			local v39 = p_u_18.AbsolutePosition
			local v40 = p_u_18.AbsoluteSize
			local v41 = p_u_19.AbsoluteSize
			local v42 = p_u_20.AbsoluteSize
			local v43 = p_u_20.AbsolutePosition
			local v44 = Rect.new(v39, v39 + v40)
			local v45 = Rect.new(v43, v43 + v42)
			if v_u_4.isOnScreen(v44, v45) then
				local v46 = nil
				for _, v47 in v_u_37.current do
					local v48 = Rect.new(v47.AbsolutePosition, v47.AbsolutePosition + v47.AbsoluteSize)
					if v46 == nil then
						v46 = v48
					else
						local v49 = Rect.new
						local v50 = Vector2.new
						local v51 = v46.Min.X
						local v52 = v48.Min.X
						local v53 = math.max(v51, v52)
						local v54 = v46.Min.Y
						local v55 = v48.Min.Y
						local v56 = v50(v53, (math.max(v54, v55)))
						local v57 = Vector2.new
						local v58 = v46.Max.X
						local v59 = v48.Max.X
						local v60 = math.min(v58, v59)
						local v61 = v46.Max.Y
						local v62 = v48.Max.Y
						v46 = v49(v56, v57(v60, (math.min(v61, v62))))
					end
				end
				if v46 and not v_u_4.isOnScreen(v44, v46) then
					v_u_27(false)
				else
					local v63 = p_u_21
					local v64
					if type(v63) == "table" then
						v64 = p_u_21.position
					else
						v64 = p_u_21
					end
					local v65 = p_u_21
					local v66 = type(v65) ~= "table" and 0 or p_u_21.offset
					local v67 = p_u_22
					local v68 = p_u_22
					local v69
					if type(v68) == "table" then
						v67 = p_u_22.position
						v69 = p_u_22.offset
					else
						v69 = 0
					end
					local v70 = p_u_23 or 0
					local v71 = v_u_4.calculatePopoverBounds(v64, v66, v69, v70, v41)
					local v72 = v_u_4.calculateSide(v64, v44, v45, v71)
					local v73, v74, v75 = v_u_4.calculatePositions(v72, v66, v67, v69, v44, v45, v70, v41)
					v_u_29(UDim2.fromOffset(v41.X, v41.Y))
					v_u_31(v42)
					v_u_33(v74 + v73)
					v_u_25(v73)
					v_u_35(v75)
					v_u_27(true)
					local _ = p_u_19.AbsolutePosition
				end
			else
				v_u_27(false)
				return
			end
		else
			v_u_27(false)
			return
		end
	end, {
		p_u_17,
		p_u_18,
		p_u_19,
		p_u_20,
		p_u_21,
		p_u_22,
		p_u_23
	})
	function v_u_36.current()
		-- upvalues: (copy) v_u_38, (copy) v_u_76
		if not v_u_38.current then
			v_u_38.current = true
			task.defer(function()
				-- upvalues: (ref) v_u_38, (ref) v_u_76
				v_u_38.current = false
				v_u_76()
			end)
		end
	end
	v_u_16(p_u_18, { "AbsolutePosition", "AbsoluteSize" }, v_u_36)
	v_u_16(p_u_19, { "AbsoluteSize" }, v_u_36)
	v_u_16(p_u_20, { "AbsoluteSize" }, v_u_36)
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) p_u_17, (copy) p_u_18, (copy) v_u_37, (copy) v_u_36
		if p_u_17 then
			local v77 = p_u_18
			if typeof(v77) == "Instance" and p_u_18:IsA("GuiObject") then
				local v_u_78 = p_u_18
				local v_u_79 = v_u_37
				local v_u_80 = {}
				local function v90() -- name: rebuild
					-- upvalues: (copy) v_u_80, (copy) v_u_78, (ref) v_u_36, (copy) v_u_79
					for _, v81 in v_u_80 do
						v81:Disconnect()
					end
					table.clear(v_u_80)
					local v82 = v_u_78.Parent
					local v83 = {}
					while v82 and v82:IsA("GuiObject") do
						if v82.ClipsDescendants then
							table.insert(v83, v82)
							local v84 = v_u_80
							local v85 = v82:GetPropertyChangedSignal("AbsolutePosition")
							local function v86()
								-- upvalues: (ref) v_u_36
								v_u_36.current()
							end
							table.insert(v84, v85:Connect(v86))
							local v87 = v_u_80
							local v88 = v82:GetPropertyChangedSignal("AbsoluteSize")
							local function v89()
								-- upvalues: (ref) v_u_36
								v_u_36.current()
							end
							table.insert(v87, v88:Connect(v89))
						end
						v82 = v82.Parent
					end
					v_u_79.current = v83
					if #v83 > 0 then
						v_u_36.current()
					end
				end
				v90()
				local v_u_91 = v_u_78.AncestryChanged:Connect(v90)
				return function()
					-- upvalues: (copy) v_u_91, (copy) v_u_80, (copy) v_u_79
					v_u_91:Disconnect()
					for _, v92 in v_u_80 do
						v92:Disconnect()
					end
					v_u_79.current = {}
				end
			end
		end
	end, { p_u_18, p_u_17 })
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_76
		v_u_76()
	end, { v_u_76 })
	return v24, v26, v28, v32, v30, v34
end