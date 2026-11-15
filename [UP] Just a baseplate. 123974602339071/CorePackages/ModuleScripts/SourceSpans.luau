-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.SourceSpans
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.SourceSpan)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new() -- name: new
	-- upvalues: (copy) v_u_3
	local v4 = v_u_3
	return setmetatable({
		["_sourceSpans"] = nil
	}, v4)
end
function v_u_3.empty() -- name: empty
	-- upvalues: (copy) v_u_3
	return v_u_3.new()
end
function v_u_3.getSourceSpans(p5) -- name: getSourceSpans
	return p5._sourceSpans == nil and {} or p5._sourceSpans
end
function v_u_3.addAllFrom(p6, p7) -- name: addAllFrom
	for _, v8 in ipairs(p7) do
		p6:addAll(v8:getSourceSpans())
	end
end
function v_u_3.addAll(p9, p10) -- name: addAll
	-- upvalues: (copy) v_u_2
	if #p10 == 0 then
		return
	else
		if p9._sourceSpans == nil then
			p9._sourceSpans = {}
		end
		local v11 = p9._sourceSpans
		if #v11 == 0 then
			table.move(p10, 1, #p10, 1, v11)
			return
		else
			local v12 = #v11 - 1
			local v13 = v11[v12 + 1]
			local v14 = p10[1]
			if v13:getInputIndex() + v13:getLength() == v14:getInputIndex() then
				v11[v12 + 1] = v_u_2.of(v13:getLineIndex(), v13:getColumnIndex(), v13:getInputIndex(), v13:getLength() + v14:getLength())
				table.move(p10, 2, #p10, #v11 + 1, v11)
			else
				table.move(p10, 1, #p10, #v11 + 1, v11)
			end
		end
	end
end
return v_u_3