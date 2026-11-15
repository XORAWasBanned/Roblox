-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.example.app.PrintSink
local v_u_1 = require(script.Parent.Parent.Parent.Logger)
local v_u_7 = {
	["new"] = function(p2) -- name: new
		-- upvalues: (copy) v_u_7
		local v3 = {
			["maxLevel"] = p2
		}
		local v4 = v_u_7
		setmetatable(v3, v4)
		return v3
	end,
	["log"] = function(_, p5, p6) -- name: log
		-- upvalues: (copy) v_u_1
		if p6.level == v_u_1.Levels.Error then
			error(p5, 5)
			return
		elseif p6.level == v_u_1.Levels.Warning then
			warn(p5)
		else
			print(p5)
		end
	end
}
return v_u_7