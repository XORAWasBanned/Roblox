-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.instanceOf
local v_u_1 = require(script.Parent.Parent.luaUtils.isNillish).isNillish
local function v_u_7(p2, p3) -- name: instanceOf
	-- upvalues: (copy) v_u_1
	if v_u_1(p2) then
		return false
	end
	if typeof(p2) ~= "table" or typeof(p3) ~= "table" then
		return false
	end
	if p3.new ~= nil and p2.new == p3.new then
		return true
	end
	local v4 = getmetatable(p2)
	while typeof(v4) == "table" do
		if v4.__index == p3 then
			return true
		end
		local v5 = v4.__index
		local v6 = getmetatable(v5)
		if v4 == v6 then
			return false
		end
		v4 = v6
	end
	return false
end
return function(p8, p9)
	-- upvalues: (copy) v_u_7
	return v_u_7(p8, p9)
end