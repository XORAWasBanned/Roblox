-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.DocumentBlockParser
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
function v_u_5.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v6 = {
		["_document"] = v_u_4.Document()
	}
	local v7 = v_u_5
	return setmetatable(v6, v7)
end
function v_u_5.isContainer(_) -- name: isContainer
	return true
end
function v_u_5.canContain(_, _) -- name: canContain
	return true
end
function v_u_5.getBlock(p8) -- name: getBlock
	return p8._document
end
function v_u_5.tryContinue(_, p9) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	return v_u_3.atIndex(p9:getIndex())
end
return v_u_5