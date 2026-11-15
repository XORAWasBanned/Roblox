-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.LinkReferenceDefinitionParser
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.util.Escaping)
local v_u_3 = require(v1.internal.util.LinkScanner)
local v_u_4 = require(v1.node.Nodes)
require(v1.parser.beta.Position)
local v_u_5 = require(v1.parser.beta.Scanner)
require(v1.parser.SourceLine)
local v_u_6 = require(v1.parser.SourceLines)
require(v1.node.SourceSpan)
local v_u_7 = string.byte
local v_u_8 = string.gsub
local v_u_9 = string.sub
local v_u_10 = {}
v_u_10.__index = v_u_10
v_u_10.State = table.freeze({
	["START_DEFINITION"] = "START_DEFINITION",
	["LABEL"] = "LABEL",
	["DESTINATION"] = "DESTINATION",
	["START_TITLE"] = "START_TITLE",
	["TITLE"] = "TITLE",
	["PARAGRAPH"] = "PARAGRAPH"
})
local v_u_11 = v_u_10.State
function v_u_10.new(p12) -- name: new
	-- upvalues: (copy) v_u_11, (copy) v_u_10
	local v13 = {
		["_state"] = nil,
		["_paragraphLines"] = nil,
		["_definitions"] = nil,
		["_sourceSpans"] = nil,
		["_label"] = nil,
		["_destination"] = nil,
		["_titleDelimiter"] = 0,
		["_title"] = nil,
		["_referenceValid"] = false
	}
	local v14
	if p12 == false then
		v14 = v_u_11.PARAGRAPH
	else
		v14 = v_u_11.START_DEFINITION
	end
	v13._state = v14
	v13._paragraphLines = {}
	v13._definitions = {}
	v13._sourceSpans = {}
	local v15 = v_u_10
	return setmetatable(v13, v15)
end
function v_u_10.parse(p16, p17) -- name: parse
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_6
	local v18 = p16._paragraphLines
	table.insert(v18, p17)
	if p16._state == v_u_11.PARAGRAPH then
		return
	else
		local v19 = v_u_5.of(v_u_6.of(p17))
		if v19:hasNext() then
			local v20 = nil
			local v21 = p16._state
			if v21 == v_u_11.START_DEFINITION then
				v20 = p16:startDefinition(v19)
			elseif v21 == v_u_11.LABEL then
				v20 = p16:label(v19)
			elseif v21 == v_u_11.DESTINATION then
				v20 = p16:destination(v19)
			elseif v21 == v_u_11.START_TITLE then
				v20 = p16:startTitle(v19)
			elseif v21 == v_u_11.TITLE then
				v20 = p16:title(v19)
			else
				error((("Unknown parsing state: %*"):format(v21)))
			end
			if v20 then
				continue
			end
			p16._state = v_u_11.PARAGRAPH
			p16:finishReference()
		end
	end
end
function v_u_10.addSourceSpan(p22, p23) -- name: addSourceSpan
	local v24 = p22._sourceSpans
	table.insert(v24, p23)
end
function v_u_10.getParagraphLines(p25) -- name: getParagraphLines
	-- upvalues: (copy) v_u_6
	return v_u_6.ofList(p25._paragraphLines)
end
function v_u_10.getParagraphSourceSpans(p26) -- name: getParagraphSourceSpans
	return p26._sourceSpans
end
function v_u_10.getDefinitions(p27) -- name: getDefinitions
	p27:finishReference()
	return p27._definitions
end
function v_u_10.getState(p28) -- name: getState
	return p28._state
end
local function v_u_31(p29, p30) -- name: removeLast
	if #p30 <= p29 then
		table.clear(p30)
	else
		for _ = 0, p29 - 1 do
			table.remove(p30)
		end
	end
end
function v_u_10.removeLines(p32, p33) -- name: removeLines
	-- upvalues: (copy) v_u_31
	local v34 = p32._sourceSpans
	local v35 = table.freeze
	local v36 = table.move
	local v37 = #v34 - p33
	local v38 = v35(v36(v34, math.max(v37, 0) + 1, #v34, 1, {}))
	v_u_31(p33, p32._paragraphLines)
	v_u_31(p33, v34)
	return v38
end
function v_u_10.startDefinition(p39, p40) -- name: startDefinition
	-- upvalues: (copy) v_u_11
	p39:finishReference()
	p40:whitespace()
	if not p40:nextChar(91) then
		return false
	end
	p39._state = v_u_11.LABEL
	local v41 = {}
	p39._label = v41
	if not p40:hasNext() then
		table.insert(v41, "\n")
	end
	return true
end
function v_u_10.label(p42, p43) -- name: label
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_2, (copy) v_u_11
	local v44 = p43:position()
	if not v_u_3.scanLinkLabelContent(p43) then
		return false
	end
	local v45 = p42._label
	local v46 = p43:getSource(v44, p43:position())
	table.insert(v45, v46:getContent())
	if not p43:hasNext() then
		table.insert(v45, "\n")
		return true
	end
	if not p43:nextChar(93) then
		return false
	end
	if not p43:nextChar(58) then
		return false
	end
	local v47 = table.concat(v45)
	local _, v48 = v_u_8(v47, "[^\128-\191]", "")
	if v48 > 999 then
		return false
	end
	if v_u_2.normalizeLabelContent(v47) == "" then
		return false
	end
	p42._state = v_u_11.DESTINATION
	p43:whitespace()
	return true
end
function v_u_10.destination(p49, p50) -- name: destination
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_11
	p50:whitespace()
	local v51 = p50:position()
	if not v_u_3.scanLinkDestination(p50) then
		return false
	end
	local v52 = p50:getSource(v51, p50:position()):getContent()
	if v_u_7(v52, 1) == 60 then
		v52 = v_u_9(v52, 2, #v52 - 1)
	end
	p49._destination = v52
	local v53 = p50:whitespace()
	if p50:hasNext() then
		if v53 == 0 then
			return false
		end
	else
		p49._referenceValid = true
		table.clear(p49._paragraphLines)
	end
	p49._state = v_u_11.START_TITLE
	return true
end
function v_u_10.startTitle(p54, p55) -- name: startTitle
	-- upvalues: (copy) v_u_11
	p55:whitespace()
	if not p55:hasNext() then
		p54._state = v_u_11.START_DEFINITION
		return true
	end
	p54._titleDelimiter = 0
	local v56 = p55:peek()
	if v56 == 34 or v56 == 39 then
		p54._titleDelimiter = v56
	elseif v56 == 40 then
		p54._titleDelimiter = 41
	end
	if p54._titleDelimiter == 0 then
		p54._state = v_u_11.START_DEFINITION
	else
		p54._state = v_u_11.TITLE
		local v57 = {}
		p54._title = v57
		p55:next()
		if not p55:hasNext() then
			table.insert(v57, "\n")
		end
	end
	return true
end
function v_u_10.title(p58, p59) -- name: title
	-- upvalues: (copy) v_u_3, (copy) v_u_11
	local v60 = p59:position()
	if not v_u_3.scanLinkTitleContent(p59, p58._titleDelimiter) then
		p58._title = nil
		return false
	end
	local v61 = p58._title
	local v62 = p59:getSource(v60, p59:position())
	table.insert(v61, v62:getContent())
	if not p59:hasNext() then
		table.insert(v61, "\n")
		return true
	end
	p59:next()
	p59:whitespace()
	if p59:hasNext() then
		p58._title = nil
		return false
	end
	p58._referenceValid = true
	table.clear(p58._paragraphLines)
	p58._state = v_u_11.START_DEFINITION
	return true
end
function v_u_10.finishReference(p63) -- name: finishReference
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	if p63._referenceValid then
		local v64 = v_u_2.unescapeString(p63._destination)
		local v65
		if p63._title == nil then
			v65 = nil
		else
			v65 = v_u_2.unescapeString(table.concat(p63._title))
		end
		local v66 = v_u_4.LinkReferenceDefinition(table.concat(p63._label), v64, v65)
		v66:setSourceSpans(p63._sourceSpans)
		table.clear(p63._sourceSpans)
		local v67 = p63._definitions
		table.insert(v67, v66)
		p63._label = nil
		p63._referenceValid = false
		p63._destination = nil
		p63._title = nil
	end
end
return v_u_10