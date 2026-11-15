-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.SourceLines
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.SourceLine)
require(v1.node.SourceSpan)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2
	return setmetatable({
		["_lines"] = {}
	}, v3)
end
function v_u_2.empty() -- name: empty
	-- upvalues: (copy) v_u_2
	return v_u_2.new()
end
function v_u_2.of(p4) -- name: of
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2.new()
	v5:addLine(p4)
	return v5
end
function v_u_2.ofList(p6) -- name: ofList
	-- upvalues: (copy) v_u_2
	local v7 = v_u_2.new()
	table.move(p6, 1, #p6, 1, v7._lines)
	return v7
end
function v_u_2.addLine(p8, p9) -- name: addLine
	local v10 = p8._lines
	table.insert(v10, p9)
end
function v_u_2.getLines(p11) -- name: getLines
	return p11._lines
end
function v_u_2.isEmpty(p12) -- name: isEmpty
	return #p12._lines == 0
end
function v_u_2.getContent(p13) -- name: getContent
	local v14 = table.create(#p13._lines)
	for v15, v16 in ipairs(p13._lines) do
		v14[v15] = v16:getContent()
	end
	return table.concat(v14, "\n")
end
function v_u_2.getSourceSpans(p17) -- name: getSourceSpans
	local v18 = {}
	for _, v19 in ipairs(p17._lines) do
		local v20 = v19:getSourceSpan()
		if v20 == nil then
			continue
		end
		table.insert(v18, v20)
	end
	return v18
end
return v_u_2