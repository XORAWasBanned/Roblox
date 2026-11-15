-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.deepContains
local v_u_1 = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local v_u_2 = require(script.Parent.null)
local function v_u_9(p3, p4) -- name: deepContains
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_9
	if typeof(p3) ~= typeof(p4) then
		return false, ("{1}: value of type \'%s\'\n{2}: value of type \'%s\'"):format(typeof(p3), (typeof(p4)))
	end
	if v_u_1.isNaN(p3) and v_u_1.isNaN(p4) then
		return true
	end
	if p3 == p4 then
		return true
	end
	if p3 == v_u_2 or (p4 == v_u_2 or typeof(p3) ~= "table") then
		return false, string.format("{1} (%s) ~= {2} (%s)", tostring(p3), (tostring(p4)))
	end
	for v5, v6 in pairs(p4) do
		local v7, v8 = v_u_9(p3[v5], v6)
		if v7 then
			continue
		end
		return false, v8:gsub("{1}", ("{1}[%s]"):format((tostring(v5)))):gsub("{2}", ("{2}[%s]"):format((tostring(v5))))
	end
	return true
end
return v_u_9