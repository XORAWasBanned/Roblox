-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Logger
local v1 = script:FindFirstAncestor("Foundation").Parent
local v2 = require(v1.Lumberyak)
local v_u_3 = v2.Logger
local v6 = {
	["maxLevel"] = v_u_3.Levels.Info,
	["log"] = function(_, p4, p5) -- name: log
		-- upvalues: (copy) v_u_3
		if p5.level == v_u_3.Levels.Error or p5.level == v_u_3.Levels.Warning then
			warn(p4)
		else
			print(p4)
		end
	end
}
local v7 = v2.Logger.new(nil, "Foundation")
v7:setContext({
	["prefix"] = "[{loggerName} - {level}] - "
})
v7:addSink(v6)
local v11 = {
	["foundationSink"] = v6,
	["setLogLevel"] = function(p8, p9) -- name: setLogLevel
		p8.foundationSink.maxLevel = p9
		p8:addSink(p8.foundationSink)
	end,
	["enableTraceLog"] = function(p10) -- name: enableTraceLog
		-- upvalues: (copy) v_u_3
		p10:setLogLevel(v_u_3.Levels.Trace)
	end
}
setmetatable(v11, {
	["__index"] = v7
})
return v11