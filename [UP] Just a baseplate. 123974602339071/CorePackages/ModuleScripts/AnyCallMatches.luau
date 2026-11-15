-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.AnyCallMatches
local v_u_1 = require(script.Parent.getCalls)
local v_u_2 = require(script.Parent.cmpLiteralArgs)
local v_u_3 = require(script.Parent.cmpPredicateArgs)
local v_u_4 = require(script.Parent.fmtArgs)
local v_u_19 = {
	["args"] = function(p5, p6) -- name: args
		-- upvalues: (copy) v_u_1, (copy) v_u_4
		local v7 = v_u_1(p5)
		local v8 = #v7
		if v8 == 0 then
			return false, "mock was not called"
		end
		local v9 = nil
		for v10 = 1, v8 do
			local v11
			v11, v9 = p6(v7[v10].args)
			if not v11 then
				continue
			end
			return true
		end
		local v12 = v9 or v_u_4(v7[v8].args) .. " did not match"
		if v8 > 1 then
			v12 = v12 .. " (+" .. v8 - 1 .. " other calls)"
		end
		return false, v12
	end,
	["literals"] = function(p13, ...) -- name: literals
		-- upvalues: (copy) v_u_19, (copy) v_u_2
		local v_u_14 = table.pack(...)
		return v_u_19.args(p13, function(p15)
			-- upvalues: (ref) v_u_2, (copy) v_u_14
			return v_u_2(v_u_14, p15)
		end)
	end,
	["predicates"] = function(p16, ...) -- name: predicates
		-- upvalues: (copy) v_u_19, (copy) v_u_3
		local v_u_17 = table.pack(...)
		return v_u_19.args(p16, function(p18)
			-- upvalues: (ref) v_u_3, (copy) v_u_17
			return v_u_3(v_u_17, p18)
		end)
	end
}
return v_u_19