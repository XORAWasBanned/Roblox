-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.HoverContext
local v1 = script:FindFirstAncestor("Components").Parent.Parent
local v_u_2 = require(v1.React)
local function v3()
	warn("Wrap the component using HoverContext with a HoverContext.Provider element")
end
local v_u_4 = v_u_2.createContext({
	["registerOnHoverCallback"] = v3,
	["onHover"] = v3
})
function useHoverContext(p_u_5) -- name: useHoverContext
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v_u_6 = v_u_2.useContext(v_u_4)
	local v7, v_u_8 = v_u_2.useState(false)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_6, (copy) p_u_5, (copy) v_u_8
		v_u_6.registerOnHoverCallback(p_u_5, v_u_8)
	end, {})
	return v7, v_u_2.useCallback(function(p9)
		-- upvalues: (copy) v_u_6, (copy) p_u_5
		v_u_6.onHover(p_u_5, p9)
	end, { p_u_5 })
end
function Provider(p10) -- name: Provider
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v_u_11 = v_u_2.useRef({})
	local v15 = v_u_2.useCallback(function(p12, p13)
		-- upvalues: (copy) v_u_11
		if v_u_11.current[p12] then
			for _, v14 in v_u_11.current[p12] do
				v14(p13)
			end
		end
	end, {})
	local v19 = v_u_2.useCallback(function(p16, p17)
		-- upvalues: (copy) v_u_11
		local v18 = v_u_11.current[p16]
		if v18 then
			table.insert(v18, p17)
		else
			v_u_11.current[p16] = { p17 }
		end
	end, {})
	local v20 = {
		["value"] = {
			["onHover"] = v15,
			["registerOnHoverCallback"] = v19
		}
	}
	return v_u_2.createElement(v_u_4.Provider, v20, p10.children)
end
return {
	["useHoverContext"] = useHoverContext,
	["Provider"] = Provider
}