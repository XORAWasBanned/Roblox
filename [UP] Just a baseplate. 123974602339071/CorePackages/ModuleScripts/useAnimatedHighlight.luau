-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useAnimatedHighlight
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.Otter)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
local v_u_5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v7 = require(v1.Utility.Wrappers)
local v_u_8 = v7.Connection
local v_u_9 = v7.Instance
local v_u_10 = v7.Signal
return function(p_u_11, p_u_12, p_u_13, ...) -- name: useAnimatedHighlight
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8
	local v_u_14 = v_u_6()
	local v_u_15 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_14
		return {
			["easingStyle"] = v_u_14.Ease.StandardOut,
			["duration"] = v_u_14.Time.Time_200
		}
	end, { v_u_14 })
	local v_u_16 = v_u_3.useRef(p_u_11)
	local v_u_17
	if v_u_5.FoundationAnimatedHighlightSettling then
		v_u_17 = v_u_3.useRef(p_u_11)
	else
		v_u_17 = nil
	end
	local v18
	if v_u_5.FoundationAnimatedHighlightSettling then
		v18 = v_u_3.useCallback(function()
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			v_u_17.current = v_u_16.current
		end, {})
	else
		v18 = nil
	end
	local v19 = v_u_4.useAnimatedBinding
	local v20 = 0
	if not v_u_5.FoundationAnimatedHighlightSettling then
		v18 = nil
	end
	local v21, v_u_22 = v19(v20, v18)
	local v23, v_u_24 = v_u_4.useAnimatedBinding(0)
	local v25, v_u_26 = v_u_3.useBinding(0)
	local v_u_31 = v_u_3.useCallback(function(p27, p28)
		-- upvalues: (copy) p_u_12, (ref) v_u_5, (copy) p_u_11, (copy) v_u_17, (copy) v_u_24, (ref) v_u_4, (copy) v_u_22, (copy) v_u_15, (copy) v_u_26
		if p27.current and p_u_12.current then
			local v29 = p27.current.AbsolutePosition.X - p_u_12.current.AbsolutePosition.X
			local v30 = p27.current.AbsoluteSize.X
			if v_u_5.FoundationAnimatedHighlightSettling then
				p28 = p_u_11 == v_u_17.current
			end
			if p28 then
				v_u_24((v_u_4.instant(v30)))
				v_u_22((v_u_4.instant(v29)))
			else
				v_u_22(v_u_4.ease(v29, v_u_15))
				v_u_24(v_u_4.ease(v30, v_u_15))
			end
			v_u_26(p27.current.AbsoluteSize.Y)
		end
	end, { v_u_15, p_u_11 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_11, (copy) p_u_13, (copy) v_u_16, (copy) v_u_31, (copy) p_u_12, (ref) v_u_10, (ref) v_u_9, (ref) v_u_8
		if p_u_11 then
			local v_u_32 = p_u_13[p_u_11]
			local v_u_33 = p_u_11 == v_u_16.current
			local function v34() -- name: animateHighlight
				-- upvalues: (copy) v_u_32, (ref) v_u_31, (copy) v_u_33
				if v_u_32 then
					v_u_31(v_u_32, v_u_33)
				end
			end
			if v_u_32 and (v_u_32.current and p_u_12.current) then
				local v_u_35 = v_u_10.Connect(v_u_9.GetPropertyChangedSignal(v_u_32.current, "AbsoluteSize"), v34)
				local v_u_36 = v_u_10.Connect(v_u_9.GetPropertyChangedSignal(v_u_32.current, "AbsolutePosition"), v34)
				local v_u_37 = v_u_10.Connect(v_u_9.GetPropertyChangedSignal(p_u_12.current, "AbsoluteSize"), v34)
				return function()
					-- upvalues: (ref) v_u_8, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37
					v_u_8.Disconnect(v_u_35)
					v_u_8.Disconnect(v_u_36)
					v_u_8.Disconnect(v_u_37)
				end
			end
		end
		return function() end
	end, { p_u_11 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_11, (copy) p_u_13, (copy) p_u_12, (copy) v_u_31, (copy) v_u_16
		if p_u_11 then
			local v38 = p_u_13[p_u_11]
			if v38 and (v38.current and p_u_12.current) then
				v_u_31(v38, p_u_11 == v_u_16.current)
			end
			v_u_16.current = p_u_11
		end
	end, { p_u_11, ... })
	return {
		["activeItemHeight"] = v25,
		["highlightPosition"] = v21,
		["highlightWidth"] = v23
	}
end