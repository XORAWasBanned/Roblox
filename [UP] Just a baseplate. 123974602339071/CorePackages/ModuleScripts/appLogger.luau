-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.example.app.appLogger
local v1 = require(script.Parent.Parent.Parent.Logger).new()
v1:setContext({
	["root"] = "root"
})
return v1