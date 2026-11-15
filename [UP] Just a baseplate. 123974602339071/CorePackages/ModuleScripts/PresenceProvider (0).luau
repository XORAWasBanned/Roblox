-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.AnimatePresence.PresenceProvider
local v1 = script:FindFirstAncestor("Motion")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.AnimatePresence.PresenceContext)
local v_u_5 = require(v1.AnimatePresence.utils).useIdFallback
return function(p_u_6) -- name: PresenceProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	if p_u_6 == nil then
		error("PresenceProvider: props cannot be nil")
	end
	local v_u_7 = p_u_6.children
	local v8 = p_u_6.isPresent
	local v9 = v8 == nil and true or v8
	local v10 = p_u_6.passThroughData
	local v_u_11 = nil
	local function v12()
		-- upvalues: (ref) v_u_11, (ref) v_u_5
		v_u_11 = v_u_5()
	end
	local v13, v14 = pcall(v12)
	local v15
	if v13 then
		v15 = v_u_11
	else
		warn("PresenceProvider: Error generating ID:", v14)
		v_u_11 = "presence-" .. v_u_5()
		v15 = v_u_11
	end
	local v_u_16 = nil
	local function v17()
		-- upvalues: (ref) v_u_16, (ref) v_u_3
		v_u_16 = v_u_3.useRef({})
	end
	local v18, v19 = pcall(v17)
	if not v18 then
		warn("PresenceProvider: Error creating childrenPresence ref:", v19)
		v_u_16 = {
			["current"] = {}
		}
	end
	local v_u_24 = {
		["id"] = v15,
		["isPresent"] = v9,
		["register"] = function(p_u_20) -- name: register
			-- upvalues: (ref) v_u_16
			v_u_16.current[p_u_20] = false
			return function()
				-- upvalues: (ref) v_u_16, (copy) p_u_20
				v_u_16.current[p_u_20] = nil
			end
		end,
		["onExitComplete"] = function(p21) -- name: onExitComplete
			-- upvalues: (ref) v_u_16, (copy) p_u_6
			if v_u_16.current then
				v_u_16.current[p21] = true
			end
			local v22 = true
			for _, v23 in pairs(v_u_16.current) do
				if v23 then
					continue
				end
				v22 = false
			end
			if v22 and p_u_6.onExitComplete then
				p_u_6.onExitComplete()
			end
		end,
		["passThroughData"] = v10
	}
	local v_u_25 = nil
	local function v27()
		-- upvalues: (ref) v_u_25, (ref) v_u_3, (ref) v_u_4, (copy) v_u_24, (copy) v_u_7
		local v26 = {
			["value"] = v_u_24
		}
		v_u_25 = v_u_3.createElement(v_u_4.Provider, v26, v_u_7)
	end
	local v28, v29 = pcall(v27)
	if not v28 then
		warn("PresenceProvider: Error creating PresenceContext.Provider:", v29)
	end
	return v_u_25 or v_u_3.createElement(v_u_3.Fragment, {}, v_u_7)
end