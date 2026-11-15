-- Path: CorePackages.Packages._Index.Dash.Dash.cycles
local v1 = script.Parent
require(v1.Types)
local v_u_2 = require(v1.includes)
local v_u_3 = require(v1.keys)
local v_u_4 = table.sort
local function v_u_5() -- name: getDefaultCycles
	return {
		["visited"] = nil,
		["refs"] = nil,
		["nextRef"] = 1,
		["omit"] = nil,
		["visited"] = {},
		["refs"] = {},
		["omit"] = {}
	}
end
local function v_u_15(p6, p7, p8) -- name: cycles
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_15
	if p7 == -1 then
		return p8
	end
	if typeof(p6) ~= "table" then
		return nil
	end
	local v9 = p8 or v_u_5()
	if v9.visited[p6] then
		if not v9.refs[p6] then
			v9.refs[p6] = v9.nextRef
			v9.nextRef = v9.nextRef + 1
		end
		return nil
	end
	v9.visited[p6] = true
	local v10 = v_u_3(p6)
	v_u_4(v10, function(p11, p12)
		if typeof(p11) == "number" and typeof(p12) == "number" then
			return p11 < p12
		else
			return tostring(p11) < tostring(p12)
		end
	end)
	for _, v13 in ipairs(v10) do
		local v14 = p6[v13]
		if v_u_2(v9.omit, v13) then
			continue
		end
		if p7 then
			v_u_15(v13, p7 - 1, v9)
			v_u_15(v14, p7 - 1, v9)
		else
			v_u_15(v13, nil, v9)
			v_u_15(v14, nil, v9)
		end
	end
	return v9
end
return v_u_15