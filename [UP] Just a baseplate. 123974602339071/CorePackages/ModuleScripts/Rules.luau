-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.Rules
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(script.Parent.AdapterTypes)
local v_u_3 = require(script.Parent.Children)
require(v2.CommonMark)
require(script.Parent.Engine)
local v_u_4 = require(script.Parent.ListMarkers)
require(v1.Types)
local function v_u_26(p5, p6, p_u_7) -- name: appendListItems
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v8 = p5.list
	local v_u_9 = p5.out
	local v10 = not v8.tight
	if v10 and p5.splitParent == nil then
		p_u_7:gap("LooseList", v8)
	end
	local v_u_11
	if v10 then
		v_u_11 = p5.splitParent
	else
		v_u_11 = nil
	end
	local v_u_12 = v_u_4.bulletPrefix(v8)
	local v_u_13 = v_u_4.startNumber(v8)
	local v_u_14 = nil
	local function v17() -- name: appendItem
		-- upvalues: (copy) v_u_11, (ref) v_u_14, (ref) v_u_9, (copy) p_u_7, (ref) v_u_13, (copy) v_u_12, (ref) v_u_4
		if v_u_11 ~= nil and v_u_14 ~= nil then
			v_u_9 = p_u_7:append(v_u_11, "LIST")
		end
		local v15
		if v_u_13 == nil then
			v15 = v_u_12
		else
			v15 = v_u_4.orderedPrefix(v_u_13)
		end
		if v_u_13 ~= nil then
			v_u_13 = v_u_13 + 1
		end
		local v16 = p_u_7:append(v_u_9, "LIST_ITEM", {
			["prefix"] = v15
		})
		v_u_14 = v16
		return v16
	end
	local v18 = v_u_14
	for _, v19 in p_u_7:_units(v8, true) do
		local v20 = v19.block
		if v20 == nil or v20.kind ~= "ListItem" then
			p_u_7:_flattenUnits({ v19 }, v18 or v17())
		else
			local v21 = v17()
			local v22 = p_u_7:_units(v20, false)
			local v23 = nil
			for _, v24 in v22 do
				if not v_u_3.isList(v24) then
					continue
				end
				v23 = v24.block
			end
			p_u_7:_flattenUnits(v22, v21, {
				["except"] = nil,
				["gap"] = "ListItemBlocks",
				["except"] = v23
			}, v20)
			if v23 == nil then
				break
			end
			local v25 = {
				["list"] = v23,
				["out"] = p_u_7:append(v_u_9, "LIST")
			}
			table.insert(p6, v25)
		end
	end
end
return {
	["list"] = function(p27) -- name: list
		-- upvalues: (copy) v_u_26
		local v_u_28 = p27 == nil and true or p27.splitLooseTopLevel ~= false
		return function(p29, p30)
			-- upvalues: (copy) v_u_28, (ref) v_u_26
			local v31 = {}
			local v32 = {
				["list"] = p29,
				["out"] = p30:block("LIST")
			}
			local v33
			if v_u_28 and p30.depth == 0 then
				v33 = p30.parent
			else
				v33 = nil
			end
			v32.splitParent = v33
			__set_list(v31, 1, {v32})
			while #v31 > 0 do
				v_u_26(table.remove(v31), v31, p30)
			end
		end
	end,
	["quote"] = function(p34) -- name: quote
		local v35 = p34 == nil and "flatten" or (p34.nested or "flatten")
		if v35 ~= "flatten" and v35 ~= "drop" then
			error((("Rules.quote\'s nested must be \"flatten\" or \"drop\", not %*"):format(v35)))
		end
		local v_u_36
		if v35 == "drop" then
			v_u_36 = table.freeze({
				["BlockQuote"] = true
			})
		else
			v_u_36 = nil
		end
		return function(p37, p38)
			-- upvalues: (copy) v_u_36
			local v39 = {
				["gap"] = "QuoteBlocks",
				["drop"] = nil,
				["drop"] = v_u_36
			}
			p38:flatten(p37, p38:block("QUOTE"), v39)
		end
	end,
	["codeBlock"] = function() -- name: codeBlock
		return function(p40, p41)
			local v42
			if p40.kind == "FencedCodeBlock" then
				v42 = p40.info
			else
				v42 = nil
			end
			local v43
			if v42 == nil or v42 == "" then
				v43 = nil
			else
				local v44 = string.find(v42, " ", 1, true)
				v43 = {}
				if v44 then
					local v45 = v44 - 1
					v42 = string.sub(v42, 1, v45)
				end
				v43.language = v42
			end
			local v46 = p41:block("CODE_BLOCK", v43)
			local v47 = p40.literal or ""
			if string.sub(v47, -1) == "\n" then
				v47 = string.sub(v47, 1, -2)
			end
			v46.text = v47
		end
	end,
	["divider"] = function() -- name: divider
		return function(_, p48)
			p48:block("DIVIDER")
		end
	end,
	["htmlBlock"] = function() -- name: htmlBlock
		return function(p49, p50)
			local v51 = p50:block("PARAGRAPH")
			local v52 = p49.literal
			if v52 ~= nil and v52 ~= "" then
				p50:append(v51, "TEXT").text = v52
			end
		end
	end,
	["code"] = function() -- name: code
		return function(p53, p54)
			local v55 = p54:append(p54.parent, "STYLED_TEXT", {
				["style"] = "INLINE_CODE"
			})
			local v56 = p53.literal
			if v56 ~= nil and v56 ~= "" then
				p54:append(v55, "TEXT").text = v56
			end
		end
	end,
	["hardLineBreak"] = function() -- name: hardLineBreak
		return function(_, p57)
			p57:append(p57.parent, "BREAK")
		end
	end,
	["link"] = function() -- name: link
		return function(p58, p59)
			local v60 = p59.parent
			local v61 = p58.destination
			local v62 = p58.title
			p59:adaptInlinesOf(p58, (p59:append(v60, "LINK", (v61 ~= nil or v62 ~= nil) and {
				["url"] = v61,
				["title"] = v62
			} or nil)))
		end
	end,
	["image"] = function() -- name: image
		return function(p63, p64)
			local v65 = p64.parent
			local v66 = p63.destination
			local v67 = p63.title
			p64:append(v65, "IMAGE", (v66 ~= nil or v67 ~= nil) and {
				["url"] = v66,
				["title"] = v67
			} or nil).text = p64:plainText(p63)
		end
	end
}