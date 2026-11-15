-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.port.ApiOptions
local v_u_1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v_u_1.internal.DocumentParser)
require(v_u_1.Extension)
require(v_u_1.parser.IncludeSourceSpans)
local v_u_3 = require(v_u_1.parser.Parser)
local v_u_10 = {
	["inCanonicalOrder"] = function(p4) -- name: inCanonicalOrder
		-- upvalues: (copy) v_u_2
		local v5 = {}
		for _, v6 in ipairs(p4) do
			v5[v6] = true
		end
		local v7 = {}
		for _, v8 in ipairs(v_u_2.getDefaultBlockParserTypes()) do
			if not v5[v8] then
				continue
			end
			table.insert(v7, v8)
			v5[v8] = nil
		end
		for _, v9 in ipairs(p4) do
			if not v5[v9] then
				continue
			end
			table.insert(v7, v9)
			v5[v9] = nil
		end
		return v7
	end
}
local function v_u_13(p11) -- name: buildParser
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v12 = v_u_3.builder()
	if p11.extensions ~= nil then
		v12:extensions(p11.extensions)
	end
	if p11.enabledBlockTypes ~= nil then
		v12:enabledBlockTypes(v_u_10.inCanonicalOrder(p11.enabledBlockTypes))
	end
	if p11.enabledInlineTypes ~= nil then
		v12:enabledInlineTypes(p11.enabledInlineTypes)
	end
	if p11.linkReferenceDefinitions ~= nil then
		v12:linkReferenceDefinitions(p11.linkReferenceDefinitions)
	end
	if p11.includeSourceSpans ~= nil then
		v12:includeSourceSpans(p11.includeSourceSpans)
	end
	if p11.maxOpenBlockParsers ~= nil then
		v12:maxOpenBlockParsers(p11.maxOpenBlockParsers)
	end
	if p11.maxInlineNesting ~= nil then
		v12:maxInlineNesting(p11.maxInlineNesting)
	end
	return v12:build()
end
local function v_u_16(p14) -- name: buildHtmlRenderer
	-- upvalues: (copy) v_u_1
	local v15 = require(v_u_1.renderer.html.HtmlRenderer).builder()
	if p14.extensions ~= nil then
		v15:extensions(p14.extensions)
	end
	if p14.softbreak ~= nil then
		v15:softbreak(p14.softbreak)
	end
	if p14.escapeHtml ~= nil then
		v15:escapeHtml(p14.escapeHtml)
	end
	if p14.sanitizeUrls ~= nil then
		v15:sanitizeUrls(p14.sanitizeUrls)
	end
	if p14.percentEncodeUrls ~= nil then
		v15:percentEncodeUrls(p14.percentEncodeUrls)
	end
	return v15:build()
end
local v17 = table.freeze({
	["__mode"] = "k"
})
local v_u_18 = table.freeze({})
local v_u_19 = setmetatable({}, v17)
local v_u_20 = setmetatable({}, v17)
function v_u_10.getParser(p21) -- name: getParser
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_13
	if p21 == nil then
		p21 = v_u_18
	end
	local v22 = v_u_19[p21]
	if v22 == nil then
		v22 = v_u_13(p21)
		v_u_19[p21] = v22
	end
	return v22
end
function v_u_10.getHtmlRenderer(p23) -- name: getHtmlRenderer
	-- upvalues: (copy) v_u_18, (copy) v_u_20, (copy) v_u_16
	if p23 == nil then
		p23 = v_u_18
	end
	local v24 = v_u_20[p23]
	if v24 == nil then
		v24 = v_u_16(p23)
		v_u_20[p23] = v24
	end
	return v24
end
return v_u_10