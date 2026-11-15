-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.useCursor
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.ColorNamespace)
local v_u_6 = require(script.Parent.CursorContext)
local v_u_7 = require(script.Parent.KeyUtilities)
local v8 = require(v1.Providers.Style.PresentationContext)
require(v1.Components.Types)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = v8.usePresentationContext
return function(p_u_11) -- name: useCursor
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3
	local v_u_12 = v_u_9()
	local v13 = v_u_10()
	local v_u_14
	if v13.colorNamespace then
		v_u_14 = v13.colorNamespace
	else
		v_u_14 = v_u_5.Color
	end
	local v15 = v_u_4.useContext(v_u_6)
	local v16 = v15.refCache
	local v_u_17 = v15.setMountedCursors
	local v_u_19 = v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_11, (ref) v_u_7, (copy) v_u_12, (copy) v_u_14
		local v18 = p_u_11
		if typeof(v18) == "table" then
			return v_u_7.encodeKey(v_u_12, p_u_11.radius, p_u_11.offset, p_u_11.borderWidth, v_u_14)
		elseif p_u_11 == nil then
			return v_u_7.encodeKey(v_u_12, nil, nil, nil, v_u_14)
		else
			return v_u_7.encodeCursorTypeKey(p_u_11, v_u_14)
		end
	end, { p_u_11, v_u_12, v_u_14 })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_17, (copy) v_u_19, (ref) v_u_3
		v_u_17(function(p20)
			-- upvalues: (ref) v_u_19, (ref) v_u_3
			if p20[v_u_19] ~= nil then
				return p20
			end
			local v21 = {
				[v_u_19] = true
			}
			return v_u_3.join(p20, v21)
		end)
	end, { v_u_19 })
	return v16[v_u_19]
end