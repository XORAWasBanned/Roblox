-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.example.page.pageLogger
local v1 = require(script.Parent.Parent.Parent.Logger).new()
v1:setContext({
	["foo"] = "foo"
})
return v1