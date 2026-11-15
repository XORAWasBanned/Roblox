-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.example.page.page
local v_u_1 = require(script.Parent.pageLogger)
local v_u_2 = require(script.Parent.component)
return {
	["init"] = function(p3) -- name: init
		-- upvalues: (copy) v_u_1
		v_u_1:setParent(p3)
	end,
	["doSomething"] = function() -- name: doSomething
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		v_u_1:info("calling {root} {foo}")
		return v_u_2()
	end
}