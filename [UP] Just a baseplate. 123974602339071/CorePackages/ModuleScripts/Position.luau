-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.beta.Position
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3) -- name: new
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1
	return setmetatable({
		["lineIndex"] = p2,
		["index"] = p3
	}, v4)
end
function v_u_1.equals(p5, p6) -- name: equals
	if p5 == p6 then
		return true
	end
	if p6 == nil then
		return false
	end
	local v7
	if p5.lineIndex == p6.lineIndex then
		v7 = p5.index == p6.index
	else
		v7 = false
	end
	return v7
end
function v_u_1.compareTo(p8, p9) -- name: compareTo
	local v10 = p8.lineIndex
	local v11 = p9.lineIndex
	local v12 = v10 < v11 and -1 or (v10 == v11 and 0 or 1)
	if v12 ~= 0 then
		return v12
	end
	local v13 = p8.index
	local v14 = p9.index
	return v13 < v14 and -1 or (v13 == v14 and 0 or 1)
end
return v_u_1