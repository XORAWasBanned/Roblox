-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.deepEqual
local v_u_1 = require(script.Parent.Parent.Parent.LuauPolyfill).Number
local v_u_2 = require(script.Parent.null)
local function v_u_14(p3, p4) -- name: deepEqual
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_14
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
	local v5 = {}
	for v6, v7 in pairs(p3) do
		v5[v6] = true
		local v8, v9 = v_u_14(v7, p4[v6])
		if v8 then
			continue
		end
		return false, v9:gsub("{1}", ("{1}[%s]"):format((tostring(v6)))):gsub("{2}", ("{2}[%s]"):format((tostring(v6))))
	end
	for v10, v11 in pairs(p4) do
		if v5[v10] then
			continue
		end
		local v12, v13 = v_u_14(p3[v10], v11)
		if v12 then
			continue
		end
		return false, v13:gsub("{1}", ("{1}[%s]"):format((tostring(v10)))):gsub("{2}", ("{2}[%s]"):format((tostring(v10))))
	end
	return true
end
return v_u_14