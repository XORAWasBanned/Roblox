-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.ext.gfm.strikethrough.internal.StrikethroughDelimiterProcessor
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.delimiter.DelimiterProcessor)
require(v1.parser.delimiter.DelimiterRun)
local v_u_2 = require(v1.node.Nodes)
local v_u_3 = require(v1.node.SourceSpans)
local v_u_4 = require(v1.ext.gfm.strikethrough.Strikethrough)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6) -- name: new
	-- upvalues: (copy) v_u_5
	local v7 = {
		["_requireTwoTildes"] = p6 == true
	}
	local v8 = v_u_5
	return setmetatable(v7, v8)
end
function v_u_5.getOpeningCharacter(_) -- name: getOpeningCharacter
	return 126
end
function v_u_5.getClosingCharacter(_) -- name: getClosingCharacter
	return 126
end
function v_u_5.getMinLength(p9) -- name: getMinLength
	return p9._requireTwoTildes and 2 or 1
end
function v_u_5.process(_, p10, p11) -- name: process
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	if p10:length() ~= p11:length() or p10:length() > 2 then
		return 0
	end
	local v12 = p10:getOpener()
	local v13 = v12.literal
	if p10:length() ~= 1 then
		v13 = v13 .. v13
	end
	local v14 = v_u_4(v13)
	local v15 = v_u_3.new()
	v15:addAllFrom((p10:getOpeners(p10:length())))
	for v16 in v_u_2.between(v12, p11:getCloser()) do
		v14:appendChild(v16)
		v15:addAll(v16:getSourceSpans())
	end
	v15:addAllFrom((p11:getClosers(p11:length())))
	v14:setSourceSpans(v15:getSourceSpans())
	v12:insertAfter(v14)
	return p10:length()
end
return v_u_5