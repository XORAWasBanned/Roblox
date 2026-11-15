-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.setupJest
local v1 = script:FindFirstAncestor("MarkdownCore").Parent
local v2 = require(v1.Dev.JestGlobals)
local v3 = v2.beforeAll
local v_u_4 = v2.expect
local v_u_5 = v2.jest
local function v_u_18(_, p6, p_u_7) -- name: toWarnWith
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v_u_8 = false
	local v_u_9 = ""
	local v14 = v_u_5.spyOn(v_u_5.globalEnv, "warn").mockImplementation(function(p_u_10)
		-- upvalues: (ref) v_u_4, (copy) p_u_7, (ref) v_u_8, (ref) v_u_9
		print("WARN", p_u_10)
		local function v11()
			-- upvalues: (ref) v_u_4, (copy) p_u_10, (ref) p_u_7
			v_u_4(p_u_10).toEqual(p_u_7)
		end
		local v12, v13 = pcall(v11)
		if v12 then
			v_u_8 = true
			v_u_9 = v13
		end
	end)
	local v15, v16 = pcall(p6)
	if not v15 then
		v14:mockRestore()
		error(v16)
	end
	local v17 = v_u_8 and function()
		-- upvalues: (copy) p_u_7, (ref) v_u_9
		return ("Expected never to warn with string containing \"%*\" but got \"%*\""):format(p_u_7, v_u_9)
	end or function()
		-- upvalues: (copy) p_u_7
		return ("Expected to warn with string containing \"%*\" but did not find a match"):format(p_u_7)
	end
	v14:mockRestore()
	return {
		["message"] = v17,
		["pass"] = v_u_8
	}
end
local function v_u_26(_, p19) -- name: toWarn
	-- upvalues: (copy) v_u_5
	local v_u_20 = 0
	local v22 = v_u_5.spyOn(v_u_5.globalEnv, "warn").mockImplementation(function(p21)
		-- upvalues: (ref) v_u_20
		print("WARN", p21)
		v_u_20 = v_u_20 + 1
	end)
	local v23, v24 = pcall(p19)
	if not v23 then
		v22:mockRestore()
		error(v24)
	end
	local v25 = v_u_20 > 0 and function()
		-- upvalues: (ref) v_u_20
		return ("Expected never to warn but got %* warnings"):format(v_u_20)
	end or function()
		return "Expected to warn but never did"
	end
	v22:mockRestore()
	return {
		["message"] = v25,
		["pass"] = v_u_20 > 0
	}
end
v3(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_26
	local v27 = {
		["toWarnWith"] = v_u_18,
		["toWarn"] = v_u_26
	}
	v_u_4.extend(v27)
end)