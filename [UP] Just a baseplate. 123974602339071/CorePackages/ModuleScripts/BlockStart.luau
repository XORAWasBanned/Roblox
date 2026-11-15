-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.block.BlockStart
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.block.BlockParser)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.none() -- name: none
	return nil
end
function v_u_2.of(...) -- name: of
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2
	return setmetatable({
		["_blockParsers"] = nil,
		["_newIndex"] = -1,
		["_newColumn"] = -1,
		["_replaceActiveBlockParser"] = false,
		["_replaceParagraphLines"] = 0,
		["_blockParsers"] = { ... }
	}, v3)
end
function v_u_2.getBlockParsers(p4) -- name: getBlockParsers
	return p4._blockParsers
end
function v_u_2.getNewIndex(p5) -- name: getNewIndex
	return p5._newIndex
end
function v_u_2.getNewColumn(p6) -- name: getNewColumn
	return p6._newColumn
end
function v_u_2.isReplaceActiveBlockParser(p7) -- name: isReplaceActiveBlockParser
	return p7._replaceActiveBlockParser
end
function v_u_2.getReplaceParagraphLines(p8) -- name: getReplaceParagraphLines
	return p8._replaceParagraphLines
end
function v_u_2.atIndex(p9, p10) -- name: atIndex
	p9._newIndex = p10
	return p9
end
function v_u_2.atColumn(p11, p12) -- name: atColumn
	p11._newColumn = p12
	return p11
end
function v_u_2.replaceActiveBlockParser(p13) -- name: replaceActiveBlockParser
	p13._replaceActiveBlockParser = true
	return p13
end
function v_u_2.replaceParagraphLines(p14, p15) -- name: replaceParagraphLines
	if p15 < 1 then
		error("Lines must be >= 1")
	end
	p14._replaceParagraphLines = p15
	return p14
end
return v_u_2