-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils.Object
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
return v2.Object.assign({}, v2.Object, {
	["getPrototypeOf"] = function(p3) -- name: getPrototypeOf
		local v4 = getmetatable(p3)
		if v4 == false or not v4 then
			v4 = nil
		end
		return v4
	end,
	["create"] = function(p5, p6) -- name: create
		local v7 = p6 == nil and {} or p6
		return setmetatable(v7, p5)
	end
})