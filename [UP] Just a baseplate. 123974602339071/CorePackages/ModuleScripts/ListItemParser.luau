-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.ListItemParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.node.Node)
local v_u_4 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_5 = setmetatable({}, {
	["__index"] = v2
})
v_u_5.__index = v_u_5
function v_u_5.new(p6, p7) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_4.ListItem()
	v8.markerIndent = p6
	v8.contentIndent = p7
	local v9 = v_u_5
	return setmetatable({
		["_block"] = nil,
		["_contentIndent"] = nil,
		["_hadBlankLine"] = false,
		["_block"] = v8,
		["_contentIndent"] = p7
	}, v9)
end
function v_u_5.isContainer(_) -- name: isContainer
	return true
end
function v_u_5.canContain(p10, _) -- name: canContain
	if p10._hadBlankLine then
		local v11 = p10._block:getParent()
		if v11 ~= nil and (v11.kind == "BulletList" or v11.kind == "OrderedList") then
			v11.tight = false
		end
	end
	return true
end
function v_u_5.getBlock(p12) -- name: getBlock
	return p12._block
end
function v_u_5.tryContinue(p13, p14) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	if p14:isBlank() then
		if p13._block:getFirstChild() == nil then
			return v_u_3.none()
		end
		local v15 = p14:getActiveBlockParser():getBlock()
		p13._hadBlankLine = v15.kind == "Paragraph" and true or v15.kind == "ListItem"
		return v_u_3.atIndex(p14:getNextNonSpaceIndex())
	elseif p14:getIndent() >= p13._contentIndent then
		return v_u_3.atColumn(p14:getColumn() + p13._contentIndent)
	else
		return v_u_3.none()
	end
end
return v_u_5