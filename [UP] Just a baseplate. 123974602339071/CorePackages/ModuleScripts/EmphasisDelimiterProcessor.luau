-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.EmphasisDelimiterProcessor
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.delimiter.DelimiterProcessor)
require(v1.parser.delimiter.DelimiterRun)
local v_u_2 = require(v1.node.Nodes)
local v_u_3 = require(v1.node.SourceSpans)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v7 = (p6 == nil or p6.minLength == nil) and 1 or p6.minLength
	if v7 ~= 1 and v7 ~= 2 then
		error((("EmphasisLikeDelimiterProcessor minLength must be 1 or 2, got %*"):format(v7)))
	end
	local v8 = {
		["_delimiterChar"] = nil,
		["_minLength"] = nil,
		["_createEmphasis"] = nil,
		["_createStrongEmphasis"] = nil,
		["_rejectsByMultipleOf3Rule"] = true,
		["_delimiterChar"] = p5,
		["_minLength"] = v7
	}
	local v9
	if p6 == nil or p6.createEmphasis == nil then
		v9 = v_u_2.Emphasis
	else
		v9 = p6.createEmphasis
	end
	v8._createEmphasis = v9
	local v10
	if p6 == nil or p6.createStrongEmphasis == nil then
		v10 = v_u_2.StrongEmphasis
	else
		v10 = p6.createStrongEmphasis
	end
	v8._createStrongEmphasis = v10
	local v11 = v_u_4
	return setmetatable(v8, v11)
end
function v_u_4.getOpeningCharacter(p12) -- name: getOpeningCharacter
	return p12._delimiterChar
end
function v_u_4.getClosingCharacter(p13) -- name: getClosingCharacter
	return p13._delimiterChar
end
function v_u_4.getMinLength(p14) -- name: getMinLength
	return p14._minLength
end
function v_u_4.process(p15, p16, p17) -- name: process
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if (p16:canClose() or p17:canOpen()) and (p17:originalLength() % 3 ~= 0 and (p16:originalLength() + p17:originalLength()) % 3 == 0) then
		return 0
	end
	local v18, v19
	if p16:length() >= 2 and p17:length() >= 2 then
		local v20 = p15._createStrongEmphasis
		local v21 = p15._delimiterChar
		local v22 = p15._delimiterChar
		v18 = v20((string.char(v21, v22)))
		v19 = 2
	else
		local v23 = p15._createEmphasis
		local v24 = p15._delimiterChar
		v18 = v23((string.char(v24)))
		v19 = 1
	end
	local v25 = v_u_3.empty()
	v25:addAllFrom((p16:getOpeners(v19)))
	local v26 = p16:getOpener()
	for v27 in v_u_2.between(v26, p17:getCloser()) do
		v18:appendChild(v27)
		v25:addAll(v27:getSourceSpans())
	end
	v25:addAllFrom((p17:getClosers(v19)))
	v18:setSourceSpans(v25:getSourceSpans())
	v26:insertAfter(v18)
	return v19
end
return v_u_4