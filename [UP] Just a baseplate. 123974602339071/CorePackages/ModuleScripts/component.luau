-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.example.page.component
local v_u_1 = require(script.Parent.pageLogger):new()
v_u_1:setContext({
	["bar"] = "bar"
})
return function()
	-- upvalues: (copy) v_u_1
	v_u_1:info("calling {root} {foo} {bar}")
	return "done"
end