-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.VariantsContext
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
function getOrSet(p3, p4, p5, ...) -- name: getOrSet
	local v6 = p3[p4]
	if not v6 then
		v6 = p5(...)
		p3[p4] = v6
	end
	return v6
end
function useVariantsState() -- name: useVariantsState
	-- upvalues: (copy) v_u_2
	local v_u_7 = v_u_2.useRef({})
	local v_u_8 = v_u_2.useRef(nil)
	return v_u_2.useCallback(function(p9, p10, p11)
		-- upvalues: (copy) v_u_8, (copy) v_u_7
		if v_u_8.current ~= p11 then
			table.clear(v_u_7.current)
			v_u_8.current = p11
		end
		return getOrSet(v_u_7.current, p9, p10, p11)
	end, {})
end
local v_u_12 = v_u_2.createContext(nil)
function useVariants(p13, p14, p15) -- name: useVariants
	-- upvalues: (copy) v_u_2, (copy) v_u_12
	local v16 = v_u_2.useContext(v_u_12)
	if v16 == nil then
		error("VariantsContext hasn\'t been instantiated")
	end
	return v16(p13, p14, p15)
end
return {
	["useVariants"] = useVariants,
	["useVariantsState"] = useVariantsState,
	["Provider"] = v_u_12.Provider
}