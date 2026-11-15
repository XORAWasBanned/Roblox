-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.useRegistryStyleSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Enums.ColorMode)
require(v1.Enums.Device)
local v_u_3 = require(v2.React)
require(v1.Enums.ThemeName)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.StyleSheet.StyleSheetRegistry)
return function(p_u_5, p_u_6, p_u_7, p_u_8, p_u_9) -- name: useRegistryStyleSheet
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_10 = v_u_3.useRef({})
	local v_u_11 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_6, (copy) p_u_7, (copy) p_u_8, (copy) p_u_9, (copy) p_u_5
		return v_u_4.resolveStyleSheet(p_u_6, p_u_7, p_u_8, p_u_9, p_u_5)
	end, {
		p_u_5,
		p_u_6,
		p_u_7,
		p_u_8,
		p_u_9
	})
	local v_u_12 = v_u_3.useRef(v_u_11)
	v_u_12.current = v_u_11
	local v15 = v_u_3.useCallback(function(p13)
		-- upvalues: (copy) v_u_10, (ref) v_u_4, (copy) v_u_12
		for _, v14 in p13 do
			v_u_10.current[v14] = true
		end
		v_u_4.addStyleTags(v_u_12.current, p13)
	end, {})
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_10, (ref) v_u_4, (copy) v_u_11
		local v16 = {}
		for v17 in v_u_10.current do
			table.insert(v16, v17)
		end
		v_u_4.addStyleTags(v_u_11, v16)
		v_u_4.acquireStyleSheet(v_u_11)
		return function()
			-- upvalues: (ref) v_u_4, (ref) v_u_11
			v_u_4.releaseStyleSheet(v_u_11)
		end
	end, { v_u_11 })
	return v_u_11, v15
end