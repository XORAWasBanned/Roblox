-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.InlineParserContextImpl
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.internal.Definitions)
require(v1.parser.delimiter.DelimiterProcessor)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.InlineParserContext)
require(v1.parser.beta.LinkProcessor)
require(v1.node.LinkReferenceDefinition)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4, p5, p6, p7, p8, p9) -- name: new
	-- upvalues: (copy) v_u_2
	local v10 = v_u_2
	return setmetatable({
		["_inlineContentParserFactories"] = p3,
		["_delimiterProcessors"] = p4,
		["_linkProcessors"] = p5,
		["_linkMarkers"] = p6,
		["_maxInlineNesting"] = p7,
		["_definitions"] = p8,
		["_enabledInlineTypes"] = p9
	}, v10)
end
function v_u_2.getCustomInlineContentParserFactories(p11) -- name: getCustomInlineContentParserFactories
	return p11._inlineContentParserFactories
end
function v_u_2.getCustomDelimiterProcessors(p12) -- name: getCustomDelimiterProcessors
	return p12._delimiterProcessors
end
function v_u_2.getCustomLinkProcessors(p13) -- name: getCustomLinkProcessors
	return p13._linkProcessors
end
function v_u_2.getCustomLinkMarkers(p14) -- name: getCustomLinkMarkers
	return p14._linkMarkers
end
function v_u_2.getMaxInlineNesting(p15) -- name: getMaxInlineNesting
	return p15._maxInlineNesting
end
function v_u_2.getEnabledInlineTypes(p16) -- name: getEnabledInlineTypes
	return p16._enabledInlineTypes
end
function v_u_2.getLinkReferenceDefinition(p17, p18) -- name: getLinkReferenceDefinition
	return p17._definitions:getDefinition("LinkReferenceDefinition", p18)
end
function v_u_2.getDefinition(p19, p20, p21) -- name: getDefinition
	return p19._definitions:getDefinition(p20, p21)
end
return v_u_2