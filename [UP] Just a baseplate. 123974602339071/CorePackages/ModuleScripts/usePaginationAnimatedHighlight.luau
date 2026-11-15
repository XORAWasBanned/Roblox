-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.usePaginationAnimatedHighlight
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.Otter)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
require(v1.Enums.PaginationSize)
local v_u_5 = require(v1.Providers.Style.useTokens)
local v6 = require(v1.Utility.Wrappers)
local v_u_7 = v6.Connection
local v_u_8 = v6.Instance
local v_u_9 = v6.Signal
require(script.Parent.paginationSlotsUtils)
return function(p_u_10, p_u_11, p_u_12, p13, p14) -- name: usePaginationAnimatedHighlight
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7
	local v_u_15 = v_u_5().Time.Time_100
	local v16, v_u_17 = v_u_4.useAnimatedBinding(0)
	local v18, v_u_19 = v_u_4.useAnimatedBinding(0)
	local v20, v_u_21 = v_u_3.useBinding(0)
	local v22, v_u_23 = v_u_3.useBinding(false)
	local v_u_24 = v_u_3.useRef(p_u_10)
	local v_u_25 = v_u_3.useRef(false)
	local v_u_26 = v_u_3.useRef(false)
	local v_u_27 = v_u_3.useRef(nil)
	local v_u_28 = v_u_3.useRef(nil)
	local v_u_30 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_25, (copy) v_u_15, (copy) v_u_26, (copy) v_u_28
		if v_u_27.current then
			task.cancel(v_u_27.current)
		end
		v_u_25.current = true
		v_u_27.current = task.delay(v_u_15, function()
			-- upvalues: (ref) v_u_27, (ref) v_u_25, (ref) v_u_26, (ref) v_u_28
			v_u_27.current = nil
			v_u_25.current = false
			if v_u_26.current then
				v_u_26.current = false
				local v29 = v_u_28.current
				if v29 then
					v29()
				end
			end
		end)
	end, { v_u_15 })
	local v_u_37 = v_u_3.useCallback(function(p31, p32)
		-- upvalues: (copy) p_u_11, (copy) v_u_23, (copy) v_u_25, (copy) v_u_26, (copy) v_u_19, (ref) v_u_4, (copy) v_u_17, (copy) v_u_30, (copy) v_u_15, (copy) v_u_21
		if not (p31.current and p_u_11.current) then
			v_u_23(false)
			return false
		end
		local v33 = p31.current.AbsolutePosition.X - p_u_11.current.AbsolutePosition.X
		local v34 = p31.current.AbsoluteSize.X
		local v35 = p31.current.AbsoluteSize.Y
		if v34 <= 0 or v35 <= 0 then
			v_u_23(false)
			return false
		end
		if p32 and v_u_25.current then
			v_u_26.current = true
			return false
		end
		if p32 then
			v_u_19(v_u_4.instant(v34))
			v_u_17(v_u_4.instant(v33))
		else
			v_u_26.current = false
			v_u_30()
			local v36 = {
				["easingStyle"] = Enum.EasingStyle.Linear,
				["duration"] = v_u_15
			}
			v_u_17(v_u_4.ease(v33, v36))
			v_u_19(v_u_4.ease(v34, v36))
		end
		v_u_21(v35)
		v_u_23(true)
		return true
	end, { v_u_15, p_u_11, v_u_30 })
	local v_u_39 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_10, (copy) p_u_12, (copy) v_u_37
		local v38 = p_u_10 and p_u_12[p_u_10]
		if v38 then
			v_u_37(v38, true)
		end
	end, { p_u_10, p_u_12, v_u_37 })
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) p_u_10, (copy) p_u_12, (copy) v_u_24, (copy) v_u_27, (copy) v_u_25, (copy) v_u_26, (copy) p_u_11, (copy) v_u_37, (copy) v_u_23
		if p_u_10 then
			local v40 = p_u_12[p_u_10]
			local v41 = p_u_10 == v_u_24.current
			if not v41 then
				if v_u_27.current then
					task.cancel(v_u_27.current)
					v_u_27.current = nil
				end
				v_u_25.current = false
				v_u_26.current = false
			end
			if v40 and (v40.current and p_u_11.current) then
				v_u_37(v40, v41)
			else
				v_u_23(false)
			end
			v_u_24.current = p_u_10
		else
			v_u_23(false)
			v_u_24.current = nil
		end
	end, {
		p_u_10,
		p_u_12,
		v_u_37,
		p13,
		p14
	})
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_10, (copy) p_u_12, (copy) p_u_11, (ref) v_u_9, (ref) v_u_8, (copy) v_u_39, (ref) v_u_7
		if p_u_10 then
			local v42 = p_u_12[p_u_10]
			if v42 and (v42.current and p_u_11.current) then
				local v_u_43 = v_u_9.Connect(v_u_8.GetPropertyChangedSignal(v42.current, "AbsoluteSize"), v_u_39)
				local v_u_44 = v_u_9.Connect(v_u_8.GetPropertyChangedSignal(v42.current, "AbsolutePosition"), v_u_39)
				local v_u_45 = v_u_9.Connect(v_u_8.GetPropertyChangedSignal(p_u_11.current, "AbsoluteSize"), v_u_39)
				local v_u_46 = v_u_9.Connect(v_u_8.GetPropertyChangedSignal(p_u_11.current, "AbsolutePosition"), v_u_39)
				return function()
					-- upvalues: (ref) v_u_7, (copy) v_u_43, (copy) v_u_44, (copy) v_u_45, (copy) v_u_46
					v_u_7.Disconnect(v_u_43)
					v_u_7.Disconnect(v_u_44)
					v_u_7.Disconnect(v_u_45)
					v_u_7.Disconnect(v_u_46)
				end
			end
		end
		return function() end
	end, { p_u_10, p_u_12, v_u_39 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_28, (copy) v_u_39
		v_u_28.current = v_u_39
	end, { v_u_39 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_27
		return function()
			-- upvalues: (ref) v_u_27
			if v_u_27.current then
				task.cancel(v_u_27.current)
				v_u_27.current = nil
			end
		end
	end, {})
	return {
		["activeItemHeight"] = v20,
		["highlightPosition"] = v16,
		["highlightWidth"] = v18,
		["isVisible"] = v22,
		["updateHighlight"] = v_u_37
	}
end