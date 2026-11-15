-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Responsive.Hooks.useBreakpoint
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactUtils).usePrevious
local v_u_6 = require(v1.Utility.Wrappers).Instance
require(v1.Enums.Breakpoint)
local v_u_7 = require(v1.Constants)
require(v1.Providers.Responsive.ResponsiveContext)
local v_u_8 = require(v1.Providers.Responsive.useResponsive)
local v_u_9 = require(v1.Utility.withDefaults)
return function(p_u_10, p11) -- name: useBreakpoint
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	local v_u_12 = v_u_9(p11 or {}, {
		["throttleTime"] = v_u_7.DEFAULT_DELAY_TIME
	})
	local v_u_13 = v_u_8().config.breakpoint
	local v_u_14, v_u_15 = v_u_4.useState(Vector2.zero)
	local v16 = v_u_14.X
	local v_u_17 = v_u_13.order[#v_u_13.order]
	for _, v18 in v_u_13.order do
		if v16 > v_u_13.widths[v18] then
			continue
		end
		v_u_17 = v18
	end
	local v19, v_u_20 = v_u_4.useState(v_u_17)
	local v_u_21 = v_u_5(v19)
	local v_u_22 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_15, (copy) v_u_12
		return v_u_3.throttle(v_u_15, v_u_12.throttleTime, {
			["leading"] = true,
			["trailing"] = true
		})
	end, { v_u_12.throttleTime })
	v_u_4.useEffect(function()
		-- upvalues: (copy) p_u_10, (ref) v_u_6, (copy) v_u_22, (copy) v_u_15
		local v_u_23
		if p_u_10 then
			v_u_23 = v_u_6.GetPropertyChangedSignal(p_u_10, "AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_22, (ref) p_u_10
				v_u_22(p_u_10.AbsoluteSize)
			end)
			v_u_15(p_u_10.AbsoluteSize)
		else
			v_u_23 = nil
		end
		return function()
			-- upvalues: (ref) v_u_23
			if v_u_23 then
				v_u_23:Disconnect()
			end
		end
	end, { p_u_10 })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_17, (copy) v_u_21, (ref) v_u_3, (copy) v_u_20
		local v24 = v_u_13
		local v25 = v_u_14.X
		local v_u_26 = v_u_17
		local v_u_27 = v_u_21
		local v28
		if v_u_27 then
			if v_u_26 == v_u_27 then
				v28 = false
			elseif v_u_3.findIndex(v24.order, function(p29)
				-- upvalues: (copy) v_u_27
				return p29 == v_u_27
			end) < v_u_3.findIndex(v24.order, function(p30)
				-- upvalues: (copy) v_u_26
				return p30 == v_u_26
			end) then
				v28 = v24.widths[v_u_27] + 5 < v25
			else
				v28 = v25 < v24.widths[v_u_26] - 5
			end
		else
			v28 = true
		end
		if v28 then
			v_u_20(v_u_17)
		end
	end, {
		v_u_13,
		v_u_14.X,
		v_u_17,
		v_u_21
	})
	return v19, v_u_14
end