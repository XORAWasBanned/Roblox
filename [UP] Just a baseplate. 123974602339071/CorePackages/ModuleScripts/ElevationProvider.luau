-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Elevation.ElevationProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.elevation)
local v_u_5 = require(v1.Enums.ElevationLayer)
local v_u_6 = v_u_3.createContext(nil)
local v_u_7 = v_u_3.createContext(nil)
return {
	["ElevationProvider"] = function(p8) -- name: ElevationProvider
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		local v_u_9 = v_u_3.useRef({
			[v_u_5.Popover] = 0,
			[v_u_5.Drawer] = 0,
			[v_u_5.Sheet] = 0,
			[v_u_5.Dialog] = 0,
			[v_u_5.Notification] = 0
		})
		local v20 = {
			["value"] = v_u_3.useMemo(function()
				-- upvalues: (ref) v_u_4, (copy) v_u_9
				return {
					["acquire"] = function(p10, p11) -- name: acquire
						-- upvalues: (ref) v_u_4, (ref) v_u_9
						local v12 = v_u_4.ELEVATION_LAYERS[p10]
						local v13 = -1
						local v14 = true
						local v15
						if p11.owner then
							v15 = p11.owner.zIndex + 1
							v14 = p11.owner.zIndex <= v12.finish
						elseif p11.reserve then
							v13 = v_u_9.current[p10] or 0
							v15 = v12.start + (v13 + 1) * v12.step
							v_u_9.current[p10] = v13 + 1
						else
							v15 = v12.start
						end
						if v14 and v12.finish < v15 then
							warn(string.format("Layer \'%s\' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(p10), v15, v12.finish, v12.finish))
							v15 = v12.finish
						end
						return {
							["layer"] = p10,
							["index"] = v13,
							["zIndex"] = v15
						}
					end,
					["peek"] = function(p16) -- name: peek
						-- upvalues: (ref) v_u_9
						return v_u_9.current[p16] or 0
					end,
					["releaseIfTop"] = function(p17, p18) -- name: releaseIfTop
						-- upvalues: (ref) v_u_9
						local v19 = v_u_9.current[p17] or 0
						if p18 ~= nil and (p18 >= 0 and p18 == v19 - 1) then
							v_u_9.current[p17] = v19 - 1
						end
					end
				}
			end, {})
		}
		return v_u_3.createElement(v_u_6.Provider, v20, p8.children)
	end,
	["ElevationOwnerScope"] = function(p21) -- name: ElevationOwnerScope
		-- upvalues: (copy) v_u_3, (copy) v_u_7
		return v_u_3.createElement(v_u_7.Provider, {
			["value"] = p21.owner
		}, p21.children)
	end,
	["useElevationManager"] = function() -- name: useElevationManager
		-- upvalues: (copy) v_u_3, (copy) v_u_6
		local v22 = v_u_3.useContext(v_u_6)
		if not v22 then
			error("useElevationManager must be used under <ElevationProvider>")
		end
		return v22
	end,
	["useOwnerToken"] = function() -- name: useOwnerToken
		-- upvalues: (copy) v_u_3, (copy) v_u_7
		return v_u_3.useContext(v_u_7)
	end
}