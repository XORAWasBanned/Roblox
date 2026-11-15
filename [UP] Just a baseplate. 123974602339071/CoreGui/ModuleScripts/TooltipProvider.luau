-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.Tooltips.TooltipProvider
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(script.Parent.TooltipContext)
function TooltipProvider(p4) -- name: TooltipProvider
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5, v_u_6 = v_u_2.useState(nil)
	local v_u_7 = v_u_2.useRef(nil)
	local v_u_8 = v_u_2.useRef(nil)
	local v_u_9 = v_u_2.useRef(nil)
	local v_u_10 = v_u_2.useRef({})
	local v_u_12 = v_u_2.useCallback(function(p11)
		-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
		v_u_6(p11)
		v_u_7.current = p11
		if v_u_7.current and (v_u_8.current and v_u_7.current.id == v_u_8.current.id) then
			v_u_8.current = nil
		end
	end, {})
	local v_u_16 = v_u_2.useCallback(function(p13)
		-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_8, (copy) v_u_10
		if v_u_7 and (v_u_7.current and v_u_7.current.id == p13) then
			v_u_12(nil)
		end
		if v_u_8 and (v_u_8.current and v_u_8.current.id == p13) then
			v_u_8.current = nil
		end
		local v14 = nil
		for _, v15 in pairs(v_u_10.current) do
			if v15.id ~= p13 then
				continue
			end
			v14 = v15
		end
		if v14 and (v14.priority and v_u_10.current[v14.priority]) then
			v_u_10.current[v14.priority] = nil
		end
	end, { v_u_5 })
	v_u_9.current = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_10, (copy) v_u_12, (copy) v_u_16, (copy) v_u_9
		if v_u_7.current or v_u_8.current then
			return
		else
			local v17 = v_u_10.current
			local v18 = {}
			for _, v19 in pairs(v17) do
				table.insert(v18, v19)
			end
			table.sort(v18, function(p20, p21)
				return p20.priority > p21.priority
			end)
			local v_u_22 = v18[1]
			if v_u_22 then
				v_u_8.current = v_u_22
				task.delay(v_u_22.showDelay / 1000, function()
					-- upvalues: (ref) v_u_12, (copy) v_u_22, (ref) v_u_16, (ref) v_u_9
					v_u_12(v_u_22)
					task.delay(v_u_22.dismissDelay / 1000, function()
						-- upvalues: (ref) v_u_16, (ref) v_u_22, (ref) v_u_9
						v_u_16(v_u_22.id)
						if v_u_9.current then
							v_u_9.current()
						end
					end)
				end)
			end
		end
	end, { v_u_5 })
	local v32 = {
		["value"] = v_u_2.useMemo(function()
			-- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_5
			return {
				["registerTooltip"] = function(p23, p24, p25, p26) -- name: registerTooltip
					-- upvalues: (ref) v_u_10, (ref) v_u_9
					if not v_u_10.current[p24] then
						local v27 = v_u_10.current
						table.insert(v27, p24, {
							["id"] = p23,
							["priority"] = p24,
							["showDelay"] = p25,
							["dismissDelay"] = p26
						})
						if v_u_9.current then
							v_u_9.current()
						end
					end
				end,
				["unregisterTooltip"] = function(p28) -- name: unregisterTooltip
					-- upvalues: (ref) v_u_16, (ref) v_u_9
					v_u_16(p28)
					if v_u_9.current then
						v_u_9.current()
					end
				end,
				["dismissTooltip"] = function(p29, _) -- name: dismissTooltip
					-- upvalues: (ref) v_u_16, (ref) v_u_9
					v_u_16(p29)
					if v_u_9.current then
						v_u_9.current()
					end
				end,
				["isCurrentTooltip"] = function(p30) -- name: isCurrentTooltip
					-- upvalues: (ref) v_u_5
					local v31 = v_u_5
					if v31 then
						v31 = v_u_5.id == p30
					end
					return v31
				end
			}
		end, { v_u_5 })
	}
	return v_u_2.createElement(v_u_3.Provider, v32, p4.children)
end
return TooltipProvider