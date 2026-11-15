-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.Registry
local v1 = script:FindFirstAncestor("Markdown").Parent
require(script.Parent.AdapterTypes)
require(v1.CommonMark)
local v_u_2 = table.freeze({
	["PARAGRAPH"] = true,
	["HEADING"] = true,
	["QUOTE"] = true
})
local v_u_3 = table.freeze({
	["BOLD"] = true,
	["BOLD_2"] = true,
	["ITALIC"] = true,
	["ITALIC_2"] = true,
	["UNDERLINE"] = true,
	["STRIKE"] = true,
	["INLINE_CODE"] = true
})
local v_u_4 = table.freeze({
	["form"] = "children"
})
local v_u_5 = table.freeze({
	["form"] = "drop"
})
local function v_u_8(p6, p7) -- name: commonRule
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	if p7 == "children" then
		return v_u_4
	end
	if p7 == "drop" then
		return v_u_5
	end
	if type(p7) == "function" then
		return table.freeze({
			["form"] = "handler",
			["handler"] = nil,
			["handler"] = p7
		})
	end
	if type(p7) ~= "table" then
		error((("The rule for %* must be \"children\", \"drop\", a function or a table"):format(p6)))
	end
	return nil
end
local function v_u_13(p9, p10) -- name: inlineRule
	-- upvalues: (copy) v_u_8, (copy) v_u_3
	local v11 = v_u_8(p9, p10)
	if v11 ~= nil then
		return v11
	end
	if p10.style ~= nil then
		if not v_u_3[p10.style] then
			error((("The rule for %* has an unknown style %*"):format(p9, p10.style)))
		end
		return table.freeze({
			["form"] = "style",
			["style"] = nil,
			["style"] = p10.style
		})
	end
	local v12 = p10.text
	if type(v12) == "function" then
		return table.freeze({
			["form"] = "text",
			["text"] = nil,
			["text"] = p10.text
		})
	end
	error((("The inline rule for %* needs a style or a text function"):format(p9)))
end
local function v_u_18(p14, p15) -- name: blockRule
	-- upvalues: (copy) v_u_8, (copy) v_u_2
	local v16 = v_u_8(p14, p15)
	if v16 ~= nil then
		return v16
	end
	if v_u_2[p15.as] then
		if p15.attributes ~= nil then
			local v17 = p15.attributes
			if type(v17) ~= "function" then
				error((("The block rule for %* has attributes that aren\'t a function"):format(p14)))
			end
		end
	else
		error((("The block rule for %* needs `as` a renderer block name that holds its children (PARAGRAPH, HEADING or QUOTE), not %*"):format(p14, p15.as)))
	end
	return table.freeze({
		["form"] = "as",
		["as"] = nil,
		["attributes"] = nil,
		["as"] = p15.as,
		["attributes"] = p15.attributes
	})
end
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_19
	local v20 = {
		["_registry"] = {
			["inline"] = nil,
			["block"] = nil,
			["unknownInline"] = nil,
			["unknownBlock"] = nil,
			["blockInText"] = "flatten",
			["passes"] = nil,
			["inline"] = {},
			["block"] = {},
			["unknownInline"] = v_u_4,
			["unknownBlock"] = v_u_4,
			["passes"] = {
				["mergeText"] = true,
				["dropEmpty"] = true
			}
		}
	}
	local v21 = v_u_19
	return setmetatable(v20, v21)
end
function v_u_19.inline(p22, p23, p24) -- name: inline
	-- upvalues: (copy) v_u_13
	p22._registry.inline[p23] = v_u_13(p23, p24)
end
function v_u_19.block(p25, p26, p27) -- name: block
	-- upvalues: (copy) v_u_18
	p25._registry.block[p26] = v_u_18(p26, p27)
end
function v_u_19.fallback(p28, p29) -- name: fallback
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v30 = p28._registry
	if p29.unknownInline ~= nil then
		local v31 = p29.unknownInline
		local v32
		if v31 == "children" then
			v32 = v_u_4
		elseif v31 == "drop" then
			v32 = v_u_5
		else
			error((("unknownInline must be \"children\" or \"drop\", not %*"):format(v31)))
			v32 = nil
		end
		v30.unknownInline = v32
	end
	if p29.unknownBlock ~= nil then
		local v33 = p29.unknownBlock
		local v34
		if v33 == "children" then
			v34 = v_u_4
		elseif v33 == "drop" then
			v34 = v_u_5
		else
			error((("unknownBlock must be \"children\" or \"drop\", not %*"):format(v33)))
			v34 = nil
		end
		v30.unknownBlock = v34
	end
	local v35 = p29.blockInText
	if v35 ~= nil then
		if v35 ~= "flatten" and v35 ~= "drop" then
			error((("blockInText must be \"flatten\" or \"drop\", not %*"):format(v35)))
		end
		v30.blockInText = v35
	end
end
function v_u_19.pass(p36, p37, p38) -- name: pass
	local v39 = p36._registry.passes
	if p37 == "mergeText" then
		v39.mergeText = p38
		return
	elseif p37 == "dropEmpty" then
		v39.dropEmpty = p38
	else
		error((("Unknown adapter pass %*"):format(p37)))
	end
end
return {
	["build"] = function(p40, p41) -- name: build
		-- upvalues: (copy) v_u_19
		local v42 = v_u_19.new()
		p40(v42)
		for _, v43 in p41 do
			local v44 = v43.extendAdapter
			if v44 == nil then
				continue
			end
			v44(v42)
		end
		local v45 = v42._registry
		table.freeze(v45.inline)
		table.freeze(v45.block)
		table.freeze(v45.passes)
		return table.freeze(v45)
	end
}