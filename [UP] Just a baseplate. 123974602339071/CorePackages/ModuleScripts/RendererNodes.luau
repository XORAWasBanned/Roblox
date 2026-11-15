-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.RendererNodes
local v1 = script:FindFirstAncestor("Markdown")
local v2 = require(v1.Parsers.DefaultParserOptions)
local v_u_3 = require(v1.Enums.NodeType)
require(v1.Types)
local v_u_4 = v2.nodeConfiguration
local v_u_5 = table.freeze({
	[v_u_3.InlineSpan] = true,
	[v_u_3.InlineLeaf] = true
})
local v_u_6 = table.freeze({
	[v_u_3.Root] = true,
	[v_u_3.Block] = true
})
local v_u_23 = {
	["create"] = function(p7) -- name: create
		-- upvalues: (copy) v_u_4
		local v8 = v_u_4[p7]
		if v8 == nil then
			error((("%* isn\'t a renderer node"):format(p7)))
		end
		return {
			["name"] = nil,
			["type"] = nil,
			["children"] = nil,
			["offset"] = 0,
			["name"] = p7,
			["type"] = v8.type,
			["children"] = {}
		}
	end,
	["offsetAt"] = function(p9, p10, p11) -- name: offsetAt
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		return (v_u_5[p10.type] or p9.type == v_u_3.Root and p11 == 1) and 0 or 1
	end,
	["append"] = function(p12, p13, p14) -- name: append
		-- upvalues: (copy) v_u_23
		local v15 = v_u_23.create(p13)
		v15.attributes = p14
		local v16 = p12.children
		local v17 = #v16 + 1
		v16[v17] = v15
		v15.index = v17
		v15.offset = v_u_23.offsetAt(p12, v15, v17)
		return v15
	end,
	["appendText"] = function(p18, p19) -- name: appendText
		-- upvalues: (copy) v_u_23
		local v20 = v_u_23.append(p18, "TEXT")
		v20.text = p19
		return v20
	end,
	["isInline"] = function(p21) -- name: isInline
		-- upvalues: (copy) v_u_5
		return v_u_5[p21.type] == true
	end,
	["holdsBlocks"] = function(p22) -- name: holdsBlocks
		-- upvalues: (copy) v_u_6
		return v_u_6[p22.type] == true
	end
}
return v_u_23