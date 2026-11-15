-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.AnimatePresence.AnimatePresence
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.PresenceChild)
local v_u_5 = require(v1.Enums.PresenceState)
return function(p6) -- name: AnimatePresence
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v_u_7 = p6.children
	local v8
	if p6.childData == nil then
		v8 = nil
	else
		v8 = p6.childData
	end
	local v_u_9
	if p6.onExitComplete == nil then
		v_u_9 = nil
	else
		v_u_9 = p6.onExitComplete
	end
	local v_u_10, v_u_11 = v_u_3.useState({})
	local v_u_12 = v_u_3.useRef({})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
		local v_u_13 = {}
		if v_u_7 ~= nil then
			local v14 = v_u_7
			if typeof(v14) == "table" then
				for v15, v16 in pairs(v_u_7) do
					if typeof(v16) ~= "table" or v16.type == nil then
						continue
					end
					local v17
					if typeof(v16) == "table" and (v16.props and v16.props.presenceId) then
						local v18 = string.format
						local v19 = v16.props.presenceId
						v17 = v18("%s:%s", v15, (tostring(v19)))
					else
						v17 = v15
					end
					v_u_13[v17] = {
						["type"] = v_u_5.Entering,
						["component"] = v16,
						["dictionaryKey"] = v15
					}
				end
			end
		end
		for v20, v21 in pairs(v_u_10) do
			local v22 = false
			if v_u_7 ~= nil then
				local v23 = v_u_7
				if typeof(v23) == "table" then
					for v28, v25 in pairs(v_u_7) do
						if typeof(v25) ~= "table" or v25.type == nil then
							continue
						end
						if typeof(v25) == "table" and (v25.props and v25.props.presenceId) then
							local v26 = string.format
							local v27 = v25.props.presenceId
							local v28 = v26("%s:%s", v28, (tostring(v27)))
						end
						if v28 ~= v20 then
							continue
						end
						v22 = true
					end
				end
			end
			if v22 or not v21.isPresent then
				continue
			end
			v_u_13[v20] = {
				["type"] = v_u_5.Exiting,
				["component"] = v21.component,
				["dictionaryKey"] = v21.dictionaryKey
			}
		end
		if next(v_u_13) ~= nil then
			v_u_11(function(p29)
				-- upvalues: (copy) v_u_13, (ref) v_u_5, (ref) v_u_12
				local v30 = table.clone(p29)
				for v31, v32 in pairs(v_u_13) do
					if v32.type == v_u_5.Entering then
						v30[v31] = {
							["isPresent"] = true,
							["component"] = nil,
							["safeToRemove"] = false,
							["dictionaryKey"] = nil,
							["component"] = v32.component,
							["dictionaryKey"] = v32.dictionaryKey
						}
					else
						if v32.type ~= v_u_5.Exiting or not (v30[v31] and v30[v31].isPresent) then
							continue
						end
						v30[v31] = {
							["isPresent"] = false,
							["component"] = nil,
							["safeToRemove"] = false,
							["dictionaryKey"] = nil,
							["component"] = v32.component,
							["dictionaryKey"] = v32.dictionaryKey
						}
						v_u_12.current[v31] = true
					end
				end
				return v30
			end)
		end
	end, { v_u_7 })
	local v_u_36 = v_u_3.useCallback(function(p_u_33)
		-- upvalues: (copy) v_u_12, (copy) v_u_11
		if v_u_12.current[p_u_33] then
			v_u_12.current[p_u_33] = nil
			v_u_11(function(p34)
				-- upvalues: (copy) p_u_33
				local v35 = table.clone(p34)
				if v35[p_u_33] then
					v35[p_u_33] = {
						["isPresent"] = false,
						["component"] = nil,
						["safeToRemove"] = true,
						["dictionaryKey"] = nil,
						["component"] = v35[p_u_33].component,
						["dictionaryKey"] = v35[p_u_33].dictionaryKey
					}
				end
				return v35
			end)
		end
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_9
		local v_u_37 = {}
		local v38 = false
		for v39, v40 in pairs(v_u_10) do
			if not v40.safeToRemove then
				continue
			end
			v_u_37[v39] = true
			v38 = true
		end
		if v38 then
			v_u_11(function(p41)
				-- upvalues: (copy) v_u_37, (ref) v_u_9
				local v42 = {}
				for v43, v44 in pairs(p41) do
					if v_u_37[v43] then
						if not v_u_9 then
							continue
						end
						v_u_9(v43)
					else
						v42[v43] = v44
					end
				end
				return v42
			end)
		end
	end, { v_u_10 })
	local v45 = {}
	for v_u_46, v47 in pairs(v_u_10) do
		if v47.safeToRemove then
			continue
		end
		local v48 = v_u_3.createElement
		local v49 = v_u_4
		local v50 = {
			["key"] = v_u_46,
			["presenceId"] = v_u_46,
			["isPresent"] = v47.isPresent,
			["onExitComplete"] = function() -- name: onExitComplete
				-- upvalues: (copy) v_u_36, (copy) v_u_46
				v_u_36(v_u_46)
			end,
			["childData"] = v8,
			["children"] = v47.component
		}
		local v51 = v47.component
		table.insert(v45, v48(v49, v50, v51))
	end
	return v_u_3.createElement(v_u_3.Fragment, {}, v45)
end