-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.benchmark.benchmark
local v_u_1 = require(game.LoadedCode.Packages.Lumberyak.Logger)
local function v6(p2, p3) -- name: timeit
	local v4 = p2()
	local v5 = tick()
	for _ = 1, 2000000 do
		p3(v4)
	end
	return (tick() - v5) / 2000000
end
local function v8(p7) -- name: callSimple
	p7:info("foo")
end
local function v10(p9) -- name: callInterp
	p9:info("foo {}", 2)
end
local function v11() -- name: empty
	return {
		["info"] = function() -- name: info end
	}
end
local v12 = v6(v11, v8)
local v13 = v6(v11, v10)
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Simple", v12, v12 / v12))
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Interpolation", v13, v13 / v12))
for v43, v44 in pairs({
	["Log level off"] = function() -- name: off
		-- upvalues: (copy) v_u_1
		local v_u_14 = 0
		local v16 = {
			["maxLevel"] = v_u_1.Levels.Error,
			["log"] = function(_, _, p15) -- name: log
				-- upvalues: (ref) v_u_14
				v_u_14 = v_u_14 + p15.number
			end
		}
		local v17 = v_u_1.new()
		v17:setContext({
			["number"] = 1
		})
		v17:addSink(v16)
		return v17
	end,
	["Simple logger"] = function() -- name: simple
		-- upvalues: (copy) v_u_1
		local v_u_18 = 0
		local v20 = {
			["maxLevel"] = v_u_1.Levels.Info,
			["log"] = function(_, _, p19) -- name: log
				-- upvalues: (ref) v_u_18
				v_u_18 = v_u_18 + p19.number
			end
		}
		local v21 = v_u_1.new()
		v21:setContext({
			["number"] = 1
		})
		v21:addSink(v20)
		return v21
	end,
	["Short chain"] = function() -- name: short
		-- upvalues: (copy) v_u_1
		local v_u_22 = 0
		local v24 = {
			["maxLevel"] = v_u_1.Levels.Info,
			["log"] = function(_, _, p23) -- name: log
				-- upvalues: (ref) v_u_22
				v_u_22 = v_u_22 + p23.number
			end
		}
		local v25 = v_u_1.new()
		local v26 = v25:new()
		v25:setContext({
			["number"] = 1
		})
		v25:addSink(v24)
		return v26
	end,
	["Long chain"] = function() -- name: long
		-- upvalues: (copy) v_u_1
		local v_u_27 = 0
		local v29 = {
			["maxLevel"] = v_u_1.Levels.Info,
			["log"] = function(_, _, p28) -- name: log
				-- upvalues: (ref) v_u_27
				v_u_27 = v_u_27 + p28.number
			end
		}
		local v30 = v_u_1.new()
		v30:setContext({
			["number"] = 1
		})
		v30:addSink(v29)
		return v30:new():new():new():new()
	end,
	["Many sinks"] = function() -- name: many
		-- upvalues: (copy) v_u_1
		local v_u_31 = 0
		local v33 = {
			["maxLevel"] = v_u_1.Levels.Error,
			["log"] = function(_, _, p32) -- name: log
				-- upvalues: (ref) v_u_31
				v_u_31 = v_u_31 + p32.number
			end
		}
		local v35 = {
			["maxLevel"] = v_u_1.Levels.Warning,
			["log"] = function(_, _, p34) -- name: log
				-- upvalues: (ref) v_u_31
				v_u_31 = v_u_31 + p34.number
			end
		}
		local v37 = {
			["maxLevel"] = v_u_1.Levels.Info,
			["log"] = function(_, _, p36) -- name: log
				-- upvalues: (ref) v_u_31
				v_u_31 = v_u_31 + p36.number
			end
		}
		local v39 = {
			["maxLevel"] = v_u_1.Levels.Debug,
			["log"] = function(_, _, p38) -- name: log
				-- upvalues: (ref) v_u_31
				v_u_31 = v_u_31 + p38.number
			end
		}
		local v41 = {
			["maxLevel"] = v_u_1.Levels.Trace,
			["log"] = function(_, _, p40) -- name: log
				-- upvalues: (ref) v_u_31
				v_u_31 = v_u_31 + p40.number
			end
		}
		local v42 = v_u_1.new()
		v42:setContext({
			["number"] = 1
		})
		v42:addSink(v33)
		v42:addSink(v35)
		v42:addSink(v37)
		v42:addSink(v39)
		v42:addSink(v41)
		return v42
	end
}) do
	local v45 = v6(v44, v8)
	print(string.format("%-40s %0.3e [%0.4fx]", v43 .. " - Simple", v45, v45 / v12))
	local v46 = v6(v44, v10)
	print(string.format("%-40s %0.3e [%0.4fx]", v43 .. " - Interpolation", v46, v46 / v12))
end