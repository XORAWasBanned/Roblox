-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.block.AbstractBlockParser
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.block.BlockParser)
require(v1.node.DefinitionMap)
require(v1.parser.InlineParser)
require(v1.node.Node)
require(v1.parser.SourceLine)
require(v1.node.SourceSpan)
local v2 = {}
local v_u_3 = table.freeze({})
function v2.isContainer(_) -- name: isContainer
	return false
end
function v2.canHaveLazyContinuationLines(_) -- name: canHaveLazyContinuationLines
	return false
end
function v2.canContain(_, _) -- name: canContain
	return false
end
function v2.addLine(_, _) -- name: addLine end
function v2.addSourceSpan(p4, p5) -- name: addSourceSpan
	p4:getBlock():addSourceSpan(p5)
end
function v2.getDefinitions(_) -- name: getDefinitions
	-- upvalues: (copy) v_u_3
	return v_u_3
end
function v2.closeBlock(_) -- name: closeBlock end
function v2.parseInlines(_, _) -- name: parseInlines end
return v2