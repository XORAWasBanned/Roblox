-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.BlockContent
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1
	return setmetatable({
		["_sb"] = nil,
		["_lineCount"] = 0,
		["_sb"] = {}
	}, v2)
end
function v_u_1.newString(p3) -- name: newString
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1
	return setmetatable({
		["_sb"] = nil,
		["_lineCount"] = 0,
		["_sb"] = { p3 }
	}, v4)
end
function v_u_1.add(p5, p6) -- name: add
	if p5._lineCount ~= 0 then
		local v7 = p5._sb
		table.insert(v7, "\n")
	end
	local v8 = p5._sb
	table.insert(v8, p6)
	p5._lineCount = p5._lineCount + 1
end
function v_u_1.getString(p9) -- name: getString
	return table.concat(p9._sb)
end
return v_u_1