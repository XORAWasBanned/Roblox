-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Elevation.useElevation
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.ElevationLayer)
local v4 = require(script.Parent.ElevationProvider)
require(script.Parent.elevation)
local v_u_5 = v4.useElevationManager
local v_u_6 = v4.useOwnerToken
return function(p_u_7, p_u_8) -- name: useElevation
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	local v_u_9 = v_u_5()
	local v_u_10 = v_u_6()
	local v_u_13 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_10, (copy) p_u_7, (copy) p_u_8, (copy) v_u_9
		local v11
		if v_u_10 == nil then
			v11 = false
		else
			v11 = v_u_10.layer == p_u_7
		end
		if not p_u_8.stackAboveOwner then
			return v_u_9.acquire(p_u_7, {
				["reserve"] = v11
			})
		end
		if not v_u_10 then
			return v_u_9.acquire(p_u_7, {
				["reserve"] = false
			})
		end
		if not v11 then
			return {
				["layer"] = nil,
				["index"] = -1,
				["zIndex"] = nil,
				["layer"] = p_u_7,
				["zIndex"] = v_u_10.zIndex + 1
			}
		end
		local v12 = {
			["reserve"] = true,
			["owner"] = nil,
			["owner"] = v_u_10
		}
		return v_u_9.acquire(p_u_7, v12)
	end, {
		p_u_7,
		v_u_10,
		v_u_9,
		p_u_8.stackAboveOwner
	})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_9, (copy) p_u_7
		return function()
			-- upvalues: (ref) v_u_13, (ref) v_u_9, (ref) p_u_7
			if v_u_13.index ~= nil and v_u_13.index >= 0 then
				v_u_9.releaseIfTop(p_u_7, v_u_13.index)
			end
		end
	end, { p_u_7, v_u_13.index })
	return v_u_13
end