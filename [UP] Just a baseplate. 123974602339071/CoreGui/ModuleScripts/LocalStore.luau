-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.LocalStore
local v1 = script:FindFirstAncestor("ChromeShared")
local v_u_2 = game:GetService("AppStorageService")
local v_u_3 = game:GetService("HttpService")
local v4 = game:GetService("Players")
local v_u_5 = require(v1.Unibar.Constants)
local v_u_6 = game:GetEngineFeature("InGameMenuStateStorageKey")
local v7 = v4.LocalPlayer
local v_u_8 = nil
local v_u_9 = false
while not v7 do
	v4:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v7 = v4.LocalPlayer
end
local v10 = not v7 and 0 or v7.UserId
local v_u_11 = "player_" .. tostring(v10)
local function v_u_12() -- name: initStore
	-- upvalues: (ref) v_u_8, (copy) v_u_11
	if v_u_8.LocalPlayer == nil then
		v_u_8.LocalPlayer = {}
	end
	if v_u_8.LocalPlayer[v_u_11] == nil then
		v_u_8.LocalPlayer[v_u_11] = {}
	end
	if v_u_8.AnyPlayer == nil then
		v_u_8.AnyPlayer = {}
	end
end
local function v_u_14(p13) -- name: localPlayerSelector
	-- upvalues: (copy) v_u_11
	if p13 and (p13.LocalPlayer and p13.LocalPlayer[v_u_11]) then
		return p13.LocalPlayer[v_u_11]
	else
		return p13
	end
end
local function v_u_16(p15) -- name: anyPlayerSelector
	if p15 and p15.AnyPlayer then
		return p15.AnyPlayer
	else
		return p15
	end
end
local function v_u_23() -- name: loadStore
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (ref) v_u_9, (copy) v_u_3, (ref) v_u_8, (copy) v_u_12
	if v_u_6 then
		local function v17()
			-- upvalues: (ref) v_u_2
			return v_u_2:GetItem("InGameMenuState")
		end
		local v18, v_u_19 = pcall(v17)
		if v18 then
			v_u_9 = true
			if #v_u_19 > 0 then
				local function v20()
					-- upvalues: (ref) v_u_3, (copy) v_u_19
					return v_u_3:JSONDecode(v_u_19)
				end
				local v21, v22 = pcall(v20)
				if v21 then
					v_u_8 = v22
				else
					v_u_8 = {}
				end
			else
				v_u_8 = {}
			end
			v_u_12()
		end
	end
end
local function v_u_30() -- name: saveStore
	-- upvalues: (copy) v_u_6, (ref) v_u_9, (copy) v_u_3, (ref) v_u_8, (copy) v_u_2
	if v_u_6 then
		if v_u_9 then
			local function v24()
				-- upvalues: (ref) v_u_3, (ref) v_u_8
				return v_u_3:JSONEncode(v_u_8)
			end
			local v25, v_u_26 = pcall(v24)
			if v25 then
				local function v27()
					-- upvalues: (ref) v_u_2, (copy) v_u_26
					v_u_2:SetItem("InGameMenuState", v_u_26)
					v_u_2:Flush()
				end
				local v28, v29 = pcall(v27)
				if not v28 then
					print(v29)
					error("Failed to write JSON to AppStorageService", 0)
					return
				end
			else
				error("Failed to encode JSON", 0)
			end
		end
	end
end
local function v_u_35(p31) -- name: deepCopy
	-- upvalues: (copy) v_u_35
	if type(p31) ~= "table" then
		return p31
	end
	local v32 = {}
	for v33, v34 in pairs(p31) do
		v32[v33] = v_u_35(v34)
	end
	return v32
end
return {
	["isEnabled"] = function() -- name: isEnabled
		-- upvalues: (copy) v_u_6
		return v_u_6
	end,
	["storeForLocalPlayer"] = function(p36, p37) -- name: storeForLocalPlayer
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35, (copy) v_u_30
		local v38 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		if v_u_9 then
			local v39, v40
			if v38 then
				v39 = v_u_8
				if v39 and (v39.LocalPlayer and v39.LocalPlayer[v_u_11]) then
					v39 = v39.LocalPlayer[v_u_11]
				end
				if v39 then
					v40 = v39[p36]
					v39[p36] = v_u_35(p37)
					if v40 ~= v39[p36] then
						v_u_30()
					end
				else
					v39 = v_u_8
					v40 = v39[p36]
					v39[p36] = v_u_35(p37)
					if v40 ~= v39[p36] then
						v_u_30()
					end
				end
			else
				v39 = v_u_8
				v40 = v39[p36]
				v39[p36] = v_u_35(p37)
				if v40 ~= v39[p36] then
					v_u_30()
				end
			end
		end
	end,
	["loadForLocalPlayer"] = function(p41) -- name: loadForLocalPlayer
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35
		local v42 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		if not v_u_9 then
			return nil
		end
		local v43
		if v42 then
			v43 = v_u_8
			if v43 and (v43.LocalPlayer and v43.LocalPlayer[v_u_11]) then
				v43 = v43.LocalPlayer[v_u_11]
			end
			if v43 then
				if v43 then
					return v_u_35(v43[p41])
				end
			else
				v43 = v_u_8
				if v43 then
					return v_u_35(v43[p41])
				end
			end
		else
			v43 = v_u_8
			if v43 then
				return v_u_35(v43[p41])
			end
		end
		return nil
	end,
	["storeForAnyPlayer"] = function(p44, p45) -- name: storeForAnyPlayer
		-- upvalues: (copy) v_u_16, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_35, (copy) v_u_30
		local v46 = v_u_16
		if not v_u_9 then
			v_u_23()
		end
		if v_u_9 then
			local v47, v48
			if v46 then
				v47 = v_u_8
				if v47 and v47.AnyPlayer then
					v47 = v47.AnyPlayer
				end
				if v47 then
					v48 = v47[p44]
					v47[p44] = v_u_35(p45)
					if v48 ~= v47[p44] then
						v_u_30()
					end
				else
					v47 = v_u_8
					v48 = v47[p44]
					v47[p44] = v_u_35(p45)
					if v48 ~= v47[p44] then
						v_u_30()
					end
				end
			else
				v47 = v_u_8
				v48 = v47[p44]
				v47[p44] = v_u_35(p45)
				if v48 ~= v47[p44] then
					v_u_30()
				end
			end
		end
	end,
	["loadForAnyPlayer"] = function(p49) -- name: loadForAnyPlayer
		-- upvalues: (copy) v_u_16, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_35
		local v50 = v_u_16
		if not v_u_9 then
			v_u_23()
		end
		if not v_u_9 then
			return nil
		end
		local v51
		if v50 then
			v51 = v_u_8
			if v51 and v51.AnyPlayer then
				v51 = v51.AnyPlayer
			end
			if v51 then
				if v51 then
					return v_u_35(v51[p49])
				end
			else
				v51 = v_u_8
				if v51 then
					return v_u_35(v51[p49])
				end
			end
		else
			v51 = v_u_8
			if v51 then
				return v_u_35(v51[p49])
			end
		end
		return nil
	end,
	["clearCache"] = function() -- name: clearCache
		-- upvalues: (ref) v_u_9, (ref) v_u_8
		v_u_9 = false
		v_u_8 = nil
	end,
	["getValue"] = function(p52) -- name: getValue
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35
		local v53 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		if not v_u_9 then
			return nil
		end
		local v54
		if v53 then
			v54 = v_u_8
			if v54 and (v54.LocalPlayer and v54.LocalPlayer[v_u_11]) then
				v54 = v54.LocalPlayer[v_u_11]
			end
			if v54 then
				if v54 then
					return v_u_35(v54[p52])
				end
			else
				v54 = v_u_8
				if v54 then
					return v_u_35(v54[p52])
				end
			end
		else
			v54 = v_u_8
			if v54 then
				return v_u_35(v54[p52])
			end
		end
		return nil
	end,
	["getUniversesExposedTo"] = function(p55) -- name: getUniversesExposedTo
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35
		local v56 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		local v57
		if not v_u_9 then
			v57 = nil
			return v57 or {}
		end
		if not v56 then
			v58 = v_u_8
			if v58 then
				v57 = v_u_35(v58[p55])
			else
				v57 = nil
			end
			return v57 or {}
		end
		local v58 = v_u_8
		if v58 and (v58.LocalPlayer and v58.LocalPlayer[v_u_11]) then
			v58 = v58.LocalPlayer[v_u_11]
		end
		if v58 then
			if v58 then
				v57 = v_u_35(v58[p55])
			else
				v57 = nil
			end
			return v57 or {}
		end
		v58 = v_u_8
		if v58 then
			v57 = v_u_35(v58[p55])
		else
			v57 = nil
		end
		return v57 or {}
	end,
	["getNumUniversesExposedTo"] = function(p59) -- name: getNumUniversesExposedTo
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35
		local v60 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		local v61
		if not v_u_9 then
			v61 = nil
			return #(v61 or {})
		end
		if not v60 then
			v62 = v_u_8
			if v62 then
				v61 = v_u_35(v62[p59])
			else
				v61 = nil
			end
			return #(v61 or {})
		end
		local v62 = v_u_8
		if v62 and (v62.LocalPlayer and v62.LocalPlayer[v_u_11]) then
			v62 = v62.LocalPlayer[v_u_11]
		end
		if v62 then
			if v62 then
				v61 = v_u_35(v62[p59])
			else
				v61 = nil
			end
			return #(v61 or {})
		end
		v62 = v_u_8
		if v62 then
			v61 = v_u_35(v62[p59])
		else
			v61 = nil
		end
		return #(v61 or {})
	end,
	["addUniverseToExposureList"] = function(p63, p64) -- name: addUniverseToExposureList
		-- upvalues: (copy) v_u_14, (ref) v_u_9, (copy) v_u_23, (ref) v_u_8, (copy) v_u_11, (copy) v_u_35, (copy) v_u_5, (copy) v_u_30
		local v65 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		local v66, v67
		if v_u_9 then
			local v68
			if v65 then
				v68 = v_u_8
				if v68 and (v68.LocalPlayer and v68.LocalPlayer[v_u_11]) then
					v68 = v68.LocalPlayer[v_u_11]
				end
				if v68 then
					if v68 then
						v66 = v_u_35(v68[p63])
					else
						v66 = nil
					end
					v67 = v66 or {}
					if table.find(v67, p64) or #v67 >= v_u_5.MAX_NUM_UNIVERSES_SHOWN then
						return
					end
				else
					v68 = v_u_8
					if v68 then
						v66 = v_u_35(v68[p63])
					else
						v66 = nil
					end
					v67 = v66 or {}
					if table.find(v67, p64) or #v67 >= v_u_5.MAX_NUM_UNIVERSES_SHOWN then
						return
					end
				end
			else
				v68 = v_u_8
				if v68 then
					v66 = v_u_35(v68[p63])
				else
					v66 = nil
				end
				v67 = v66 or {}
				if table.find(v67, p64) or #v67 >= v_u_5.MAX_NUM_UNIVERSES_SHOWN then
					return
				end
			end
		else
			v66 = nil
			v67 = v66 or {}
			if table.find(v67, p64) or #v67 >= v_u_5.MAX_NUM_UNIVERSES_SHOWN then
				return
			end
		end
		table.insert(v67, p64)
		local v69 = v_u_14
		if not v_u_9 then
			v_u_23()
		end
		if v_u_9 then
			local v70, v71
			if v69 then
				v70 = v_u_8
				if v70 and (v70.LocalPlayer and v70.LocalPlayer[v_u_11]) then
					v70 = v70.LocalPlayer[v_u_11]
				end
				if v70 then
					v71 = v70[p63]
					v70[p63] = v_u_35(v67)
					if v71 ~= v70[p63] then
						v_u_30()
					end
				else
					v70 = v_u_8
					v71 = v70[p63]
					v70[p63] = v_u_35(v67)
					if v71 ~= v70[p63] then
						v_u_30()
					end
				end
			else
				v70 = v_u_8
				v71 = v70[p63]
				v70[p63] = v_u_35(v67)
				if v71 ~= v70[p63] then
					v_u_30()
				end
			end
		end
	end
}