-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.InlineParserImpl
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.inline.AutolinkInlineParser)
local v_u_3 = require(v1.internal.inline.BackslashInlineParser)
local v_u_4 = require(v1.internal.inline.BackticksInlineParser)
local v_u_5 = require(v1.internal.Bracket)
local v_u_6 = require(v1.text.Characters)
local v_u_7 = require(v1.internal.inline.CoreLinkProcessor)
local v_u_8 = require(v1.internal.Delimiter)
require(v1.parser.delimiter.DelimiterProcessor)
local v_u_9 = require(v1.internal.inline.EmphasisDelimiterProcessor)
local v_u_10 = require(v1.internal.inline.EntityInlineParser)
local v_u_11 = require(v1.internal.util.Escaping)
local v_u_12 = require(v1.internal.inline.HtmlInlineParser)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.InlineParserContext)
local v_u_13 = require(v1.internal.port.Integer)
require(v1.parser.beta.LinkInfo)
require(v1.parser.beta.LinkProcessor)
local v_u_14 = require(v1.parser.beta.LinkResult)
local v_u_15 = require(v1.internal.util.LinkScanner)
require(v1.node.Node)
local v_u_16 = require(v1.node.Nodes)
require(v1.parser.beta.Position)
local v_u_17 = require(v1.parser.beta.Scanner)
require(v1.parser.SourceLines)
local v_u_18 = require(v1.node.SourceSpans)
local v_u_19 = require(v1.internal.StaggeredDelimiterProcessor)
local _ = string.byte
local v_u_20 = string.gsub
local v_u_21 = string.sub
local v_u_22 = v_u_17.END
local v_u_23 = {}
v_u_23.__index = v_u_23
local v_u_24 = table.freeze({
	"Code",
	"HtmlInline",
	"Autolink",
	"Entity",
	"BackslashEscape",
	"Emphasis",
	"Link",
	"Image",
	"HardLineBreak"
})
local v_u_25 = {}
for _, v26 in ipairs(v_u_24) do
	v_u_25[v26] = true
end
table.freeze(v_u_25)
function v_u_23.getDefaultInlineTypes() -- name: getDefaultInlineTypes
	-- upvalues: (copy) v_u_24
	return v_u_24
end
function v_u_23.checkEnabledInlineTypes(p27) -- name: checkEnabledInlineTypes
	-- upvalues: (copy) v_u_25, (copy) v_u_24
	for _, v28 in ipairs(p27) do
		if v_u_25[v28] then
			continue
		end
		local v29 = table.concat(v_u_24, ", ")
		error((("Can\'t enable inline type %*, possible options are: [%*]"):format(v28, v29)))
	end
end
local function v_u_35(p30) -- name: calculateEnabledInlineTypes
	-- upvalues: (copy) v_u_25, (copy) v_u_23
	local v31 = p30.getEnabledInlineTypes
	local v32
	if v31 == nil then
		v32 = nil
	else
		v32 = v31(p30)
	end
	if v32 == nil then
		return v_u_25
	end
	v_u_23.checkEnabledInlineTypes(v32)
	local v33 = {}
	for _, v34 in ipairs(v32) do
		v33[v34] = true
	end
	return v33
end
local function v_u_46(p36, p37) -- name: addDelimiterProcessors
	-- upvalues: (copy) v_u_19
	for _, v38 in ipairs(p36) do
		local v39 = v38:getOpeningCharacter()
		local v40 = v38:getClosingCharacter()
		if v39 == v40 then
			local v41 = p37[v39]
			if v41 == nil or v41:getOpeningCharacter() ~= v41:getClosingCharacter() then
				local v42 = p37[v39]
				p37[v39] = v38
				if v42 == nil then
					continue
				end
				error((("Delimiter processor conflict with delimiter char \'%*\'"):format((string.char(v39)))))
			else
				local v43
				if getmetatable(v41) == v_u_19 then
					v43 = v41
				else
					v43 = v_u_19.new(v39)
					v43:add(v41)
				end
				v43:add(v38)
				p37[v39] = v43
			end
		else
			local v44 = p37[v39]
			p37[v39] = v38
			if v44 ~= nil then
				error((("Delimiter processor conflict with delimiter char \'%*\'"):format((string.char(v39)))))
			end
			local v45 = p37[v40]
			p37[v40] = v38
			if v45 == nil then
				continue
			end
			error((("Delimiter processor conflict with delimiter char \'%*\'"):format((string.char(v40)))))
		end
	end
end
local function v_u_50(p47, p48) -- name: calculateDelimiterProcessors
	-- upvalues: (copy) v_u_46, (copy) v_u_9
	local v49 = {}
	if p48.Emphasis then
		v_u_46({ v_u_9.new(42), v_u_9.new(95) }, v49)
	end
	v_u_46(p47, v49)
	return v49
end
local function v_u_59(p51, p52, p53, p54) -- name: calculateSpecialCharacters
	local v55 = table.clone(p51)
	for v56 in pairs(p52) do
		v55[v56] = true
	end
	for _, v57 in ipairs(p53) do
		for v58 in pairs(v57:getTriggerCharacters()) do
			v55[v58] = true
		end
	end
	if p54 then
		v55[91] = true
		v55[93] = true
	end
	v55[33] = true
	v55[10] = true
	return v55
end
function v_u_23.new(p60) -- name: new
	-- upvalues: (copy) v_u_23, (copy) v_u_35, (copy) v_u_50, (copy) v_u_13, (copy) v_u_59
	local v61 = v_u_23
	local v62 = setmetatable({
		["_nestingDepths"] = {},
		["_delimiterIndexes"] = {},
		["_disallowWalked"] = {}
	}, v61)
	v62._context = p60
	local v63 = v_u_35(p60)
	v62._enabledInlineTypes = v63
	local v64 = p60:getCustomLinkProcessors()
	local v65 = p60:getCustomLinkMarkers()
	v62._bracketsEnabled = (v63.Link == true or (v63.Image == true or #v64 > 0)) and true or next(v65) ~= nil
	v62._inlineContentParserFactories = v62:calculateInlineContentParserFactories(p60:getCustomInlineContentParserFactories())
	v62._delimiterProcessors = v_u_50(p60:getCustomDelimiterProcessors(), v63)
	v62._linkProcessors = v62:calculateLinkProcessors(v64)
	local v66 = {}
	for v67 in pairs(v65) do
		v66[v67] = true
	end
	if v63.Image then
		v66[33] = true
	end
	v62._linkMarkers = v66
	v62._maxInlineNesting = p60:getMaxInlineNesting()
	v62._limitInlineNesting = v62._maxInlineNesting ~= v_u_13.MAX_VALUE
	v62._specialCharacters = v_u_59(v62._linkMarkers, v62._delimiterProcessors, v62._inlineContentParserFactories, v62._bracketsEnabled)
	return v62
end
function v_u_23.calculateInlineContentParserFactories(p68, p69) -- name: calculateInlineContentParserFactories
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (copy) v_u_2, (copy) v_u_12
	local v70 = table.clone(p69)
	local v71 = p68._enabledInlineTypes
	if v71.BackslashEscape then
		local v72 = v_u_3.Factory.new
		local v73 = v71.HardLineBreak == true
		table.insert(v70, v72(v73))
	end
	if v71.Code then
		local v74 = v_u_4.Factory.new
		table.insert(v70, v74())
	end
	if v71.Entity then
		local v75 = v_u_10.Factory.new
		table.insert(v70, v75())
	end
	if v71.Autolink then
		local v76 = v_u_2.Factory.new
		table.insert(v70, v76())
	end
	if v71.HtmlInline then
		local v77 = v_u_12.Factory.new
		table.insert(v70, v77())
	end
	return v70
end
function v_u_23.calculateLinkProcessors(p78, p79) -- name: calculateLinkProcessors
	-- upvalues: (copy) v_u_7
	local v80 = table.clone(p79)
	local v81 = p78._enabledInlineTypes
	if v81.Link or v81.Image then
		local v82 = v_u_7.new
		local v83 = v81.Link == true
		local v84 = v81.Image == true
		table.insert(v80, v82(v83, v84))
	end
	return v80
end
function v_u_23.createInlineContentParsers(p85) -- name: createInlineContentParsers
	local v86 = {}
	for _, v87 in ipairs(p85._inlineContentParserFactories) do
		local v88 = v87:create()
		for v89 in pairs(v87:getTriggerCharacters()) do
			local v90 = v86[v89]
			if v90 == nil then
				v90 = {}
				v86[v89] = v90
			end
			table.insert(v90, v88)
		end
	end
	return v86
end
function v_u_23.scanner(p91) -- name: scanner
	return p91._scanner
end
function v_u_23.parse(p92, p93, p94) -- name: parse
	p92:reset(p93)
	while true do
		local v95 = p92:parseInline()
		if v95 == nil then
			break
		end
		for _, v96 in ipairs(v95) do
			p94:appendChild(v96)
		end
	end
	p92:processDelimiters(nil)
	p92:mergeChildTextNodes(p94)
end
function v_u_23.reset(p97, p98) -- name: reset
	-- upvalues: (copy) v_u_17
	p97._scanner = v_u_17.of(p98)
	p97._includeSourceSpans = #p98:getSourceSpans() > 0
	p97._trailingSpaces = 0
	p97._lastDelimiter = nil
	p97._lastBracket = nil
	table.clear(p97._disallowWalked)
	table.clear(p97._nestingDepths)
	table.clear(p97._delimiterIndexes)
	p97._delimiterCount = 0
	p97._inlineParsers = p97:createInlineContentParsers()
end
function v_u_23.text(_, p99) -- name: text
	-- upvalues: (copy) v_u_16
	local v100 = v_u_16.Text(p99:getContent())
	v100:setSourceSpans(p99:getSourceSpans())
	return v100
end
function v_u_23.parseInline(p101) -- name: parseInline
	-- upvalues: (copy) v_u_22
	local v102 = p101._scanner
	local v103 = v102:peek()
	if v103 == 91 and p101._bracketsEnabled then
		return { p101:parseOpenBracket() }
	end
	if v103 == 93 and p101._bracketsEnabled then
		return { p101:parseCloseBracket() }
	end
	if v103 == 10 then
		return { p101:parseLineBreak() }
	end
	if v103 == v_u_22 then
		return nil
	end
	if p101._linkMarkers[v103] then
		local v104 = v102:position()
		local v105 = p101:parseLinkMarker()
		if v105 ~= nil then
			return v105
		end
		v102:setPosition(v104)
	end
	if not p101._specialCharacters[v103] then
		return { p101:parseText() }
	end
	local v106 = p101._inlineParsers[v103]
	if v106 ~= nil then
		local v107 = v102:position()
		for _, v108 in ipairs(v106) do
			local v109 = v108:tryParse(p101)
			if v109 ~= nil then
				local v110 = v109:getNode()
				v102:setPosition(v109:getPosition())
				if p101._includeSourceSpans and #v110:getSourceSpans() == 0 then
					v110:setSourceSpans(v102:getSource(v107, v102:position()):getSourceSpans())
				end
				return { v110 }
			end
			v102:setPosition(v107)
		end
	end
	local v111 = p101._delimiterProcessors[v103]
	if v111 ~= nil then
		local v112 = p101:parseDelimiters(v111, v103)
		if v112 ~= nil then
			return v112
		end
	end
	return { p101:parseText() }
end
function v_u_23.parseDelimiters(p113, p114, p115) -- name: parseDelimiters
	-- upvalues: (copy) v_u_8
	local v116 = p113:scanDelimiters(p114, p115)
	if v116 == nil then
		return nil
	end
	local v117 = v116.characters
	local v118 = v_u_8.new(v117, p115, v116.canOpen, v116.canClose, p113._lastDelimiter)
	p113._lastDelimiter = v118
	p113._delimiterCount = p113._delimiterCount + 1
	p113._delimiterIndexes[v118] = p113._delimiterCount
	if v118.previous ~= nil then
		v118.previous.next = v118
	end
	return v117
end
function v_u_23.parseOpenBracket(p119) -- name: parseOpenBracket
	-- upvalues: (copy) v_u_5
	local v120 = p119._scanner
	local v121 = v120:position()
	v120:next()
	local v122 = v120:position()
	local v123 = p119:text(v120:getSource(v121, v122))
	p119:addBracket(v_u_5.link(v123, v121, v122, p119._lastBracket, p119._lastDelimiter))
	return v123
end
function v_u_23.parseLinkMarker(p124) -- name: parseLinkMarker
	-- upvalues: (copy) v_u_5
	local v125 = p124._scanner
	local v126 = v125:position()
	v125:next()
	local v127 = v125:position()
	if not v125:nextChar(91) then
		return nil
	end
	local v128 = v125:position()
	local v129 = p124:text(v125:getSource(v126, v127))
	local v130 = p124:text(v125:getSource(v127, v128))
	p124:addBracket(v_u_5.withMarker(v129, v126, v130, v127, v128, p124._lastBracket, p124._lastDelimiter))
	return { v129, v130 }
end
function v_u_23.parseCloseBracket(p131) -- name: parseCloseBracket
	local v132 = p131._scanner
	local v133 = v132:position()
	v132:next()
	local v134 = v132:position()
	local v135 = p131._lastBracket
	if v135 == nil then
		return p131:text(v132:getSource(v133, v134))
	end
	if not v135.allowed then
		p131:removeLastBracket()
		return p131:text(v132:getSource(v133, v134))
	end
	local v136 = p131:parseLinkOrImage(v135, v133)
	if v136 ~= nil then
		return v136
	end
	v132:setPosition(v134)
	p131:removeLastBracket()
	return p131:text(v132:getSource(v133, v134))
end
function v_u_23.parseLinkOrImage(p137, p138, p139) -- name: parseLinkOrImage
	-- upvalues: (copy) v_u_14
	local v140 = p137._scanner
	local v141 = p137:parseLinkInfo(p138, p139)
	if v141 == nil then
		return nil
	end
	local v142 = v140:position()
	for _, v143 in ipairs(p137._linkProcessors) do
		local v144 = v143:process(v141, v140, p137._context)
		if v144 ~= nil then
			local v145 = v144:getNode()
			local v146 = v144:getPosition()
			local v147 = v144:isIncludeMarker()
			local v148 = v144:getType()
			if v148 == v_u_14.Type.WRAP then
				v140:setPosition(v146)
				return p137:wrapBracket(p138, v145, v147)
			end
			if v148 ~= v_u_14.Type.REPLACE then
				continue
			end
			v140:setPosition(v146)
			return p137:replaceBracket(p138, v145, v147)
		end
		v140:setPosition(v142)
	end
	return nil
end
local v_u_149 = {}
v_u_149.__index = v_u_149
function v_u_149.new(p150, p151) -- name: new
	-- upvalues: (copy) v_u_149
	local v152 = v_u_149
	return setmetatable({
		["destination"] = p150,
		["title"] = p151
	}, v152)
end
local v_u_153 = {}
v_u_153.__index = v_u_153
function v_u_153.new(p154, p155, p156, p157, p158, p159, p160, p161, p162) -- name: new
	-- upvalues: (copy) v_u_153
	local v163 = v_u_153
	return setmetatable({
		["_marker"] = nil,
		["_openingBracket"] = nil,
		["_text"] = nil,
		["_scanner"] = nil,
		["_textStart"] = nil,
		["_textEnd"] = nil,
		["_label"] = nil,
		["_destination"] = nil,
		["_title"] = nil,
		["_afterTextBracket"] = nil,
		["_marker"] = p154,
		["_openingBracket"] = p155,
		["_scanner"] = p156,
		["_textStart"] = p157,
		["_textEnd"] = p158,
		["_label"] = p159,
		["_destination"] = p160,
		["_title"] = p161,
		["_afterTextBracket"] = p162
	}, v163)
end
function v_u_153.marker(p164) -- name: marker
	return p164._marker
end
function v_u_153.openingBracket(p165) -- name: openingBracket
	return p165._openingBracket
end
function v_u_153.text(p166) -- name: text
	local v167 = p166._text
	if v167 ~= nil then
		return v167
	end
	local v168 = p166._scanner:getSource(p166._textStart, p166._textEnd):getContent()
	p166._text = v168
	return v168
end
function v_u_153.label(p169) -- name: label
	return p169._label
end
function v_u_153.destination(p170) -- name: destination
	return p170._destination
end
function v_u_153.title(p171) -- name: title
	return p171._title
end
function v_u_153.afterTextBracket(p172) -- name: afterTextBracket
	return p172._afterTextBracket
end
local function v_u_178(p173) -- name: parseLinkDestination
	-- upvalues: (copy) v_u_15, (copy) v_u_21, (copy) v_u_11
	local v174 = p173:peek()
	local v175 = p173:position()
	if not v_u_15.scanLinkDestination(p173) then
		return nil
	end
	local v176
	if v174 == 60 then
		local v177 = p173:getSource(v175, p173:position()):getContent()
		v176 = v_u_21(v177, 2, #v177 - 1)
	else
		v176 = p173:getSource(v175, p173:position()):getContent()
	end
	return v_u_11.unescapeString(v176)
end
local function v_u_183(p179) -- name: parseLinkTitle
	-- upvalues: (copy) v_u_15, (copy) v_u_21, (copy) v_u_11
	local v180 = p179:position()
	if not v_u_15.scanLinkTitle(p179) then
		return nil
	end
	local v181 = p179:getSource(v180, p179:position()):getContent()
	local v182 = v_u_21(v181, 2, #v181 - 1)
	return v_u_11.unescapeString(v182)
end
local function v_u_187(p184) -- name: parseInlineDestinationTitle
	-- upvalues: (copy) v_u_178, (copy) v_u_183, (copy) v_u_149
	if p184:nextChar(40) then
		p184:whitespace()
		local v185 = v_u_178(p184)
		if v185 == nil then
			return nil
		else
			local v186
			if p184:whitespace() >= 1 then
				v186 = v_u_183(p184)
				p184:whitespace()
			else
				v186 = nil
			end
			if p184:nextChar(41) then
				return v_u_149.new(v185, v186)
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v_u_23.parseLinkInfo(p188, p189, p190) -- name: parseLinkInfo
	-- upvalues: (copy) v_u_187, (copy) v_u_153, (copy) v_u_23
	local v191 = p188._scanner
	local v192 = v191:position()
	local v193 = v_u_187(v191)
	if v193 == nil then
		v191:setPosition(v192)
		local v194 = v_u_23.parseLinkLabel(v191)
		if v194 == nil then
			v191:setPosition(v192)
		end
		local v195 = v194 == nil and true or v194 == ""
		if p189.bracketAfter and (v195 and p189.markerNode == nil) then
			return nil
		else
			return v_u_153.new(p189.markerNode, p189.bracketNode, v191, p189.contentPosition, p190, v194, nil, nil, v192)
		end
	else
		return v_u_153.new(p189.markerNode, p189.bracketNode, v191, p189.contentPosition, p190, nil, v193.destination, v193.title, v192)
	end
end
function v_u_23.wrapBracket(p196, p197, p198, p199) -- name: wrapBracket
	local v200 = p196._scanner
	if p196._limitInlineNesting and p197.contentNestingDepth >= p196._maxInlineNesting then
		return nil
	end
	local v201 = p197.bracketNode:getNext()
	while v201 ~= nil do
		local v202 = v201:getNext()
		p198:appendChild(v201)
		v201 = v202
	end
	if p196._includeSourceSpans then
		local v203
		if p199 and p197.markerPosition ~= nil then
			v203 = p197.markerPosition
		else
			v203 = p197.bracketPosition
		end
		p198:setSourceSpans(v200:getSource(v203, v200:position()):getSourceSpans())
	end
	p196:processDelimiters(p197.previousDelimiter)
	p196:mergeChildTextNodes(p198)
	if p199 and p197.markerNode ~= nil then
		p197.markerNode:unlink()
	end
	p197.bracketNode:unlink()
	p196:removeLastBracket()
	p196:recordNestingDepth(p198, p197.contentNestingDepth + 1)
	if p197.markerNode == nil then
		p196:disallowPreviousLinks()
	end
	return p198
end
function v_u_23.replaceBracket(p204, p205, p206, p207) -- name: replaceBracket
	local v208 = p204._scanner
	while p204._lastDelimiter ~= nil and p204._lastDelimiter ~= p205.previousDelimiter do
		p204:removeDelimiterKeepNode(p204._lastDelimiter)
	end
	if p204._includeSourceSpans then
		local v209
		if p207 and p205.markerPosition ~= nil then
			v209 = p205.markerPosition
		else
			v209 = p205.bracketPosition
		end
		p206:setSourceSpans(v208:getSource(v209, v208:position()):getSourceSpans())
	end
	p204:removeLastBracket()
	local v210
	if p207 and p205.markerNode ~= nil then
		v210 = p205.markerNode
	else
		v210 = p205.bracketNode
	end
	while v210 ~= nil do
		local v211 = v210:getNext()
		v210:unlink()
		v210 = v211
	end
	p204:recordNestingDepth(p206, p204:nestingDepthOfSiblings(p206:getFirstChild(), nil) + 1)
	if p205.markerNode == nil or not p207 then
		p204:disallowPreviousLinks()
	end
	return p206
end
function v_u_23.addBracket(p212, p213) -- name: addBracket
	if p212._lastBracket ~= nil then
		p212._lastBracket.bracketAfter = true
	end
	p212._lastBracket = p213
end
function v_u_23.removeLastBracket(p214) -- name: removeLastBracket
	local v215 = p214._lastBracket
	p214._lastBracket = v215.previous
	if p214._lastBracket ~= nil and v215.contentNestingDepth > p214._lastBracket.contentNestingDepth then
		p214._lastBracket.contentNestingDepth = v215.contentNestingDepth
	end
end
function v_u_23.disallowPreviousLinks(p216) -- name: disallowPreviousLinks
	local v217 = p216._lastBracket
	while v217 ~= nil and not p216._disallowWalked[v217] do
		p216._disallowWalked[v217] = true
		if v217.markerNode == nil then
			v217.allowed = false
		end
		v217 = v217.previous
	end
end
function v_u_23.parseLinkLabel(p218) -- name: parseLinkLabel
	-- upvalues: (copy) v_u_15, (copy) v_u_20
	if p218:nextChar(91) then
		local v219 = p218:position()
		if v_u_15.scanLinkLabelContent(p218) then
			local v220 = p218:position()
			if p218:nextChar(93) then
				local v221 = p218:getSource(v219, v220):getContent()
				local _, v222 = v_u_20(v221, "[^\128-\191]", "")
				if v222 > 999 then
					return nil
				else
					return v221
				end
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_23.parseLineBreak(p223) -- name: parseLineBreak
	-- upvalues: (copy) v_u_16
	p223._scanner:next()
	local v224
	if p223._trailingSpaces >= 2 then
		v224 = p223._enabledInlineTypes.HardLineBreak == true
	else
		v224 = false
	end
	p223._trailingSpaces = 0
	if v224 then
		return v_u_16.HardLineBreak()
	else
		return v_u_16.SoftLineBreak()
	end
end
function v_u_23.parseText(p225) -- name: parseText
	-- upvalues: (copy) v_u_22, (copy) v_u_6, (copy) v_u_21, (copy) v_u_16
	local v226 = p225._scanner
	local v227 = p225._specialCharacters
	local v228 = v226:position()
	v226:next()
	while true do
		local v229 = v226:peek()
		if v229 == v_u_22 or v227[v229] then
			break
		end
		v226:next()
	end
	local v230 = v226:getSource(v228, v226:position())
	local v231 = v230:getContent()
	if v229 == 10 then
		local v232 = v_u_6.skipBackwards(32, v231, #v231 - 1, 0) + 1
		p225._trailingSpaces = #v231 - v232
		v231 = v_u_21(v231, 1, v232)
	elseif v229 == v_u_22 then
		v231 = v_u_21(v231, 1, v_u_6.skipSpaceTabBackwards(v231, #v231 - 1, 0) + 1)
	end
	local v233 = v_u_16.Text(v231)
	v233:setSourceSpans(v230:getSourceSpans())
	return v233
end
local v_u_236 = {
	["new"] = function(p234, p235) -- name: new
		return p234 * 6 + p235
	end
}
local v_u_237 = {}
v_u_237.__index = v_u_237
function v_u_237.new(p238, p239, p240) -- name: new
	-- upvalues: (copy) v_u_237
	local v241 = v_u_237
	return setmetatable({
		["characters"] = p238,
		["canOpen"] = p239,
		["canClose"] = p240
	}, v241)
end
function v_u_23.scanDelimiters(p242, p243, p244) -- name: scanDelimiters
	-- upvalues: (copy) v_u_22, (copy) v_u_6, (copy) v_u_237
	local v245 = p242._scanner
	local v246 = v245:peekPreviousCodePoint()
	local v247 = v245:position()
	if v245:matchMultiple(p244) < p243:getMinLength() then
		v245:setPosition(v247)
		return nil
	end
	v245:setPosition(v247)
	local v248 = {}
	while v245:nextChar(p244) do
		table.insert(v248, p242:text(v245:getSource(v247, v245:position())))
		v247 = v245:position()
	end
	local v249 = v245:peekCodePoint()
	local v250 = v246 == v_u_22 and true or v_u_6.isPunctuationCodePoint(v246)
	local v251 = v246 == v_u_22 and true or v_u_6.isWhitespaceCodePoint(v246)
	local v252 = v249 == v_u_22 and true or v_u_6.isPunctuationCodePoint(v249)
	local v253 = v249 == v_u_22 and true or v_u_6.isWhitespaceCodePoint(v249)
	local v254 = not v253
	if v254 then
		v254 = not v252 or (v251 or v250)
	end
	local v255 = not v251
	if v255 then
		v255 = not v250 or (v253 or v252)
	end
	if p244 == 95 then
		local v256
		if v254 then
			v256 = not v255 or v250
		else
			v256 = v254
		end
		if v255 then
			v255 = not v254 or v252
		end
		v254 = v256
	else
		if v254 then
			v254 = p244 == p243:getOpeningCharacter()
		end
		if v255 then
			v255 = p244 == p243:getClosingCharacter()
		end
	end
	return v_u_237.new(v248, v254, v255)
end
function v_u_23.processDelimiters(p257, p258) -- name: processDelimiters
	-- upvalues: (copy) v_u_236
	local v259 = p257._lastDelimiter
	local v260 = {}
	while v259 ~= nil and v259.previous ~= p258 do
		v259 = v259.previous
	end
	while true do
		while true do
			if v259 == nil then
				while p257._lastDelimiter ~= nil and p257._lastDelimiter ~= p258 do
					p257:removeDelimiterKeepNode(p257._lastDelimiter)
				end
				return
			end
			local v261 = p257._delimiterProcessors[v259.delimiterChar]
			if not v259:canClose() or v261 == nil then
				break
			end
			local v262 = v_u_236.new(v259.delimiterChar, v259:originalLength() % 3 + (v259:canOpen() and 3 or 0))
			local v263 = v260[v262]
			local v264
			if v263 == nil or v261._rejectsByMultipleOf3Rule ~= true then
				v264 = nil
			else
				v264 = p257._delimiterIndexes[v263]
			end
			local v265 = v261:getOpeningCharacter()
			local v266 = v259.previous
			local v267 = v259:getCloser()
			local v268 = false
			local v269 = 0
			local v270 = nil
			local v271 = 0
			local v272 = 0
			while v266 ~= nil and (v266 ~= p258 and (v266 ~= v263 and (v264 == nil or v264 < p257._delimiterIndexes[v266]))) do
				if p257._limitInlineNesting then
					local v273 = v266:getOpener():getNext()
					v272 = math.max(v272, p257:nestingDepthOfSiblings(v273, v267))
					v267 = v266:getOpener()
					if p257._maxInlineNesting <= v272 then
						break
					end
				end
				if v266:canOpen() and v266.delimiterChar == v265 then
					v269 = v261:process(v266, v259)
					if v269 > 0 then
						v271 = v272 + 1
						v270 = v266:getOpener():getNext()
						v268 = true
						break
					end
				end
				v266 = v266.previous
			end
			if v268 then
				for _ = 0, v269 - 1 do
					table.remove(v266.characters):unlink()
				end
				for _ = 0, v269 - 1 do
					table.remove(v259.characters, 1):unlink()
				end
				p257:removeDelimitersBetween(v266, v259)
				if v270 ~= nil then
					p257:recordNestingDepth(v270, v271)
				end
				if v266:length() == 0 then
					p257:removeDelimiterAndNodes(v266)
				end
				if v259:length() ~= 0 then
					break
				end
				local v274 = v259.next
				p257:removeDelimiterAndNodes(v259)
				v259 = v274
			else
				v260[v262] = v259.previous
				if not v259:canOpen() then
					p257:removeDelimiterKeepNode(v259)
				end
				v259 = v259.next
			end
		end
		v259 = v259.next
	end
end
function v_u_23.recordNestingDepth(p275, p276, p277) -- name: recordNestingDepth
	if p275._limitInlineNesting then
		p275._nestingDepths[p276] = p277
		if p275._lastBracket ~= nil and p275._lastBracket.contentNestingDepth < p277 then
			p275._lastBracket.contentNestingDepth = p277
		end
	end
end
function v_u_23.nestingDepthOfSiblings(p278, p279, p280) -- name: nestingDepthOfSiblings
	local v281 = 0
	while p279 ~= nil and p279 ~= p280 do
		local v282 = p278._nestingDepths[p279]
		if v282 == nil then
			v282 = v281
		elseif v281 >= v282 then
			v282 = v281
		end
		p279 = p279:getNext()
		v281 = v282
	end
	return v281
end
function v_u_23.removeDelimitersBetween(p283, p284, p285) -- name: removeDelimitersBetween
	local v286 = p285.previous
	while v286 ~= nil and v286 ~= p284 do
		local v287 = v286.previous
		p283:removeDelimiterKeepNode(v286)
		v286 = v287
	end
end
function v_u_23.removeDelimiterAndNodes(p288, p289) -- name: removeDelimiterAndNodes
	p288:removeDelimiter(p289)
end
function v_u_23.removeDelimiterKeepNode(p290, p291) -- name: removeDelimiterKeepNode
	p290:removeDelimiter(p291)
end
function v_u_23.removeDelimiter(p292, p293) -- name: removeDelimiter
	if p293.previous ~= nil then
		p293.previous.next = p293.next
	end
	if p293.next == nil then
		p292._lastDelimiter = p293.previous
	else
		p293.next.previous = p293.previous
	end
end
function v_u_23.mergeChildTextNodes(p294, p295) -- name: mergeChildTextNodes
	if p295:getFirstChild() ~= nil then
		local v296 = { p295 }
		while #v296 > 0 do
			p294:mergeTextNodesInclusive(table.remove(v296), v296)
		end
	end
end
function v_u_23.mergeTextNodesInclusive(p297, p298, p299) -- name: mergeTextNodesInclusive
	local v300 = p298:getFirstChild()
	local v301 = p298:getLastChild()
	local v302 = nil
	local v303 = nil
	local v304 = 0
	while v300 ~= nil do
		if v300.kind == "Text" then
			if v302 == nil then
				v302 = v300
			end
			v304 = v304 + #v300.literal
			v303 = v300
		else
			p297:mergeIfNeeded(v302, v303, v304)
			v302 = nil
			v303 = nil
			v304 = 0
			if v300:getFirstChild() ~= nil then
				table.insert(p299, v300)
			end
		end
		if v300 == v301 then
			break
		end
		v300 = v300:getNext()
	end
	p297:mergeIfNeeded(v302, v303, v304)
end
function v_u_23.mergeIfNeeded(p305, p306, p307, _) -- name: mergeIfNeeded
	-- upvalues: (copy) v_u_18
	if p306 ~= nil and (p307 ~= nil and p306 ~= p307) then
		local v308 = { p306.literal }
		local v309 = 1
		local v310
		if p305._includeSourceSpans then
			v310 = v_u_18.new()
			v310:addAll(p306:getSourceSpans())
		else
			v310 = nil
		end
		local v311 = p306:getNext()
		local v312 = p307:getNext()
		while v311 ~= v312 do
			v309 = v309 + 1
			v308[v309] = v311.literal
			if v310 ~= nil then
				v310:addAll(v311:getSourceSpans())
			end
			local v313 = v311:getNext()
			v311:unlink()
			v311 = v313
		end
		p306.literal = table.concat(v308)
		if v310 ~= nil then
			p306:setSourceSpans(v310:getSourceSpans())
		end
	end
end
return v_u_23