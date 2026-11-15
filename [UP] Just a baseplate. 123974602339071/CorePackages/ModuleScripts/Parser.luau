-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.Parser
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.block.BlockParserFactory)
local v_u_2 = require(v1.internal.Definitions)
require(v1.parser.delimiter.DelimiterProcessor)
local v_u_3 = require(v1.internal.DocumentParser)
require(v1.Extension)
local v_u_4 = require(v1.parser.IncludeSourceSpans)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.InlineParser)
require(v1.parser.InlineParserContext)
local v_u_5 = require(v1.internal.InlineParserContextImpl)
require(v1.parser.InlineParserFactory)
local v_u_6 = require(v1.internal.InlineParserImpl)
require(v1.parser.beta.LinkProcessor)
require(v1.node.Node)
require(v1.parser.PostProcessor)
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new(p8) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2
	local v9 = {
		["_blockParserFactories"] = v_u_3.calculateBlockParserFactories(p8._blockParserFactories, p8._enabledBlockTypes),
		["_inlineParserFactory"] = p8:getInlineParserFactory(),
		["_postProcessors"] = p8._postProcessors,
		["_inlineContentParserFactories"] = p8._inlineContentParserFactories,
		["_delimiterProcessors"] = p8._delimiterProcessors,
		["_linkProcessors"] = p8._linkProcessors,
		["_linkMarkers"] = p8._linkMarkers,
		["_includeSourceSpans"] = p8._includeSourceSpans,
		["_maxOpenBlockParsers"] = p8._maxOpenBlockParsers,
		["_maxInlineNesting"] = p8._maxInlineNesting,
		["_enabledInlineTypes"] = p8._enabledInlineTypes,
		["_linkReferenceDefinitions"] = p8._linkReferenceDefinitions
	}
	local v10 = v_u_7
	local v11 = setmetatable(v9, v10)
	local v12 = v_u_5.new(v11._inlineContentParserFactories, v11._delimiterProcessors, v11._linkProcessors, v11._linkMarkers, v11._maxInlineNesting, v_u_2.new(), v11._enabledInlineTypes)
	v11._inlineParserFactory:create(v12)
	return v11
end
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_7.builder() -- name: builder
	-- upvalues: (copy) v_u_13
	return v_u_13.new()
end
function v_u_7.parse(p14, p15) -- name: parse
	return p14:postProcess((p14:createDocumentParser():parse(p15)))
end
function v_u_7.parseReader(p16, p17) -- name: parseReader
	return p16:postProcess((p16:createDocumentParser():parseReader(p17)))
end
function v_u_7.createDocumentParser(p18) -- name: createDocumentParser
	-- upvalues: (copy) v_u_3
	return v_u_3.new(p18._blockParserFactories, p18._inlineParserFactory, p18._inlineContentParserFactories, p18._delimiterProcessors, p18._linkProcessors, p18._linkMarkers, p18._includeSourceSpans, p18._maxOpenBlockParsers, p18._maxInlineNesting, p18._enabledInlineTypes, p18._linkReferenceDefinitions)
end
function v_u_7.postProcess(p19, p20) -- name: postProcess
	for _, v21 in ipairs(p19._postProcessors) do
		p20 = v21:process(p20)
	end
	return p20
end
function v_u_13.new() -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_13
	local v22 = {
		["_blockParserFactories"] = nil,
		["_inlineContentParserFactories"] = nil,
		["_delimiterProcessors"] = nil,
		["_linkProcessors"] = nil,
		["_postProcessors"] = nil,
		["_linkMarkers"] = nil,
		["_enabledBlockTypes"] = nil,
		["_enabledInlineTypes"] = nil,
		["_linkReferenceDefinitions"] = true,
		["_inlineParserFactory"] = nil,
		["_includeSourceSpans"] = nil,
		["_maxOpenBlockParsers"] = 100,
		["_maxInlineNesting"] = 100,
		["_blockParserFactories"] = {},
		["_inlineContentParserFactories"] = {},
		["_delimiterProcessors"] = {},
		["_linkProcessors"] = {},
		["_postProcessors"] = {},
		["_linkMarkers"] = {},
		["_enabledBlockTypes"] = v_u_3.getDefaultBlockParserTypes(),
		["_includeSourceSpans"] = v_u_4.NONE
	}
	local v23 = v_u_13
	return setmetatable(v22, v23)
end
function v_u_13.build(p24) -- name: build
	-- upvalues: (copy) v_u_7
	return v_u_7.new(p24)
end
function v_u_13.extensions(p25, p26) -- name: extensions
	for _, v27 in ipairs(p26) do
		local v28 = v27.extendParser
		if v28 == nil then
			continue
		end
		v28(p25)
	end
	return p25
end
function v_u_13.enabledBlockTypes(p29, p30) -- name: enabledBlockTypes
	-- upvalues: (copy) v_u_3
	v_u_3.checkEnabledBlockTypes(p30)
	p29._enabledBlockTypes = p30
	return p29
end
function v_u_13.enabledInlineTypes(p31, p32) -- name: enabledInlineTypes
	-- upvalues: (copy) v_u_6
	if p32 ~= nil then
		v_u_6.checkEnabledInlineTypes(p32)
	end
	p31._enabledInlineTypes = p32
	return p31
end
function v_u_13.linkReferenceDefinitions(p33, p34) -- name: linkReferenceDefinitions
	p33._linkReferenceDefinitions = p34
	return p33
end
function v_u_13.includeSourceSpans(p35, p36) -- name: includeSourceSpans
	p35._includeSourceSpans = p36
	return p35
end
function v_u_13.maxOpenBlockParsers(p37, p38) -- name: maxOpenBlockParsers
	if p38 < 0 then
		error("maxOpenBlockParsers must be >= 0")
	end
	p37._maxOpenBlockParsers = p38
	return p37
end
function v_u_13.maxInlineNesting(p39, p40) -- name: maxInlineNesting
	if p40 < 0 then
		error("maxInlineNesting must be >= 0")
	end
	p39._maxInlineNesting = p40
	return p39
end
function v_u_13.customBlockParserFactory(p41, p42) -- name: customBlockParserFactory
	local v43 = p41._blockParserFactories
	table.insert(v43, p42)
	return p41
end
function v_u_13.customInlineContentParserFactory(p44, p45) -- name: customInlineContentParserFactory
	local v46 = p44._inlineContentParserFactories
	table.insert(v46, p45)
	return p44
end
function v_u_13.customDelimiterProcessor(p47, p48) -- name: customDelimiterProcessor
	local v49 = p47._delimiterProcessors
	table.insert(v49, p48)
	return p47
end
function v_u_13.linkProcessor(p50, p51) -- name: linkProcessor
	local v52 = p50._linkProcessors
	table.insert(v52, p51)
	return p50
end
function v_u_13.linkMarker(p53, p54) -- name: linkMarker
	p53._linkMarkers[p54] = true
	return p53
end
function v_u_13.postProcessor(p55, p56) -- name: postProcessor
	local v57 = p55._postProcessors
	table.insert(v57, p56)
	return p55
end
function v_u_13.inlineParserFactory(p58, p59) -- name: inlineParserFactory
	p58._inlineParserFactory = p59
	return p58
end
local v_u_61 = {
	["create"] = function(_, p60) -- name: create
		-- upvalues: (copy) v_u_6
		return v_u_6.new(p60)
	end
}
function v_u_13.getInlineParserFactory(p62) -- name: getInlineParserFactory
	-- upvalues: (copy) v_u_61
	local v63 = p62._inlineParserFactory
	if v63 == nil then
		return v_u_61
	else
		return v63
	end
end
v_u_7.Builder = v_u_13
return v_u_7