-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.SourceLine
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.SourceSpan)
local v_u_3 = string.sub
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.of(p5, p6) -- name: of
	-- upvalues: (copy) v_u_4
	local v7 = v_u_4
	return setmetatable({
		["_content"] = p5,
		["_sourceSpan"] = p6
	}, v7)
end
function v_u_4.getContent(p8) -- name: getContent
	return p8._content
end
function v_u_4.getSourceSpan(p9) -- name: getSourceSpan
	return p9._sourceSpan
end
function v_u_4.substring(p10, p11, p12) -- name: substring
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v13 = p10._content
	if p11 < 0 or (p12 < p11 or #v13 < p12) then
		error((("begin %*, end %*, length %*"):format(p11, p12, #v13)))
	end
	local v14 = v_u_3(v13, p11 + 1, p12)
	local v15 = nil
	local v16 = p10._sourceSpan
	if v16 ~= nil then
		local v17 = p12 - p11
		if v17 ~= 0 then
			local v18 = v16:getColumnIndex() + p11
			local v19 = v16:getInputIndex() + p11
			v15 = v_u_2.of(v16:getLineIndex(), v18, v19, v17)
		end
	end
	return v_u_4.of(v14, v15)
end
return v_u_4