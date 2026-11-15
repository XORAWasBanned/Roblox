-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.usePulseBinding.usePulseBinding
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.ReactUtils).useClock
local v_u_4 = NumberRange.new(0, 1)
return function(p5, p6) -- name: usePulseBinding
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v_u_7 = v_u_3()
	local v_u_8 = p5 or 1
	local v_u_9 = p6 or v_u_4
	return v_u_2.useMemo(function()
		-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
		return v_u_7:map(function(p10)
			-- upvalues: (ref) v_u_8, (ref) v_u_9
			local v11 = math.map
			local v12 = p10 * 3.141592653589793 / v_u_8
			return v11(math.sin(v12) ^ 2, 0, 1, v_u_9.Min, v_u_9.Max)
		end)
	end, { p5, p6 })
end