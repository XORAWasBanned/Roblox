-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.usePaginationSelectionChain
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils).useRefCache
require(v1.Components.Types)
return function(p_u_5, p_u_6, p_u_7) -- name: usePaginationSelectionChain
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v_u_8 = v_u_4()
	local v_u_9 = p_u_5[1]
	local v_u_13 = v_u_3.useCallback(function(p10)
		-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) p_u_7
		local v_u_11 = v_u_8[p10]
		return v_u_9 == p10 and p_u_7 ~= nil and function(p12)
			-- upvalues: (copy) v_u_11, (ref) p_u_7
			v_u_11.current = p12
			p_u_7(p12)
		end or v_u_11
	end, { v_u_9, p_u_7, v_u_8 })
	local v_u_21 = v_u_3.useCallback(function(p14)
		-- upvalues: (copy) p_u_5, (copy) v_u_8, (copy) p_u_6
		local v15 = table.find(p_u_5, p14)
		if v15 == nil then
			return {
				["ref"] = nil,
				["Selectable"] = false,
				["ref"] = v_u_8[p14]
			}
		end
		local v16 = {
			["ref"] = nil,
			["Selectable"] = true,
			["NextSelectionLeft"] = nil,
			["NextSelectionRight"] = nil,
			["NextSelectionUp"] = nil,
			["NextSelectionDown"] = nil,
			["ref"] = v_u_8[p14]
		}
		local v17
		if v15 > 1 then
			v17 = v_u_8[p_u_5[v15 - 1]]
		else
			v17 = nil
		end
		v16.NextSelectionLeft = v17
		local v18
		if v15 < #p_u_5 then
			v18 = v_u_8[p_u_5[v15 + 1]]
		else
			v18 = nil
		end
		v16.NextSelectionRight = v18
		local v19 = p_u_6
		if v19 then
			v19 = p_u_6.NextSelectionUp
		end
		v16.NextSelectionUp = v19
		local v20 = p_u_6
		if v20 then
			v20 = p_u_6.NextSelectionDown
		end
		v16.NextSelectionDown = v20
		return v16
	end, { p_u_5, v_u_8, p_u_6 })
	return v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_21, (copy) v_u_13
		return {
			["firstSlotId"] = v_u_9,
			["getSlotBindings"] = v_u_21,
			["getSlotRef"] = v_u_13
		}
	end, { v_u_9, v_u_21, v_u_13 })
end