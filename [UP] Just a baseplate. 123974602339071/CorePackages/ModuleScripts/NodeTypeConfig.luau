-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.NodeTypeConfig
local v1 = script:FindFirstAncestor("Utils").Parent
local v2 = v1.Parent
local v3 = require(v1.Enums.NodeType)
local v_u_4 = require(v2.InlineLayout).Utils.isInlineElement
local v_u_5 = require(v2.Dash)
local v_u_6 = require(v2.ReactIs)
local v7 = {}
local v8 = v3.Root
local v11 = {
	["children"] = {
		[v3.Block] = true,
		[v3.TextBlock] = true
	},
	["validateRenderResult"] = function(p9) -- name: validateRenderResult
		-- upvalues: (copy) v_u_6
		local v10
		if p9 == nil then
			v10 = false
		else
			v10 = v_u_6.isElement(p9)
		end
		return v10
	end
}
v7[v8] = v11
local v12 = v3.Block
local v14 = {
	["children"] = {
		[v3.Block] = true,
		[v3.TextBlock] = true
	},
	["validateRenderResult"] = function(p13) -- name: validateRenderResult
		-- upvalues: (copy) v_u_6, (copy) v_u_5
		return p13 == nil and true or (v_u_6.isElement(p13) or v_u_5.all(p13, v_u_6.isElement))
	end
}
v7[v12] = v14
local v15 = v3.TextBlock
local v17 = {
	["children"] = {
		[v3.InlineSpan] = true,
		[v3.InlineLeaf] = true
	},
	["validateRenderResult"] = function(p16) -- name: validateRenderResult
		-- upvalues: (copy) v_u_6, (copy) v_u_5
		return p16 == nil and true or (v_u_6.isElement(p16) or v_u_5.all(p16, v_u_6.isElement))
	end
}
v7[v15] = v17
local v18 = v3.InlineSpan
local v20 = {
	["children"] = {
		[v3.InlineSpan] = true,
		[v3.InlineLeaf] = true
	},
	["validateRenderResult"] = function(p19) -- name: validateRenderResult
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		return p19 == nil and true or (v_u_4(p19) or v_u_5.all(p19, v_u_4))
	end
}
v7[v18] = v20
v7[v3.InlineLeaf] = {
	["children"] = {},
	["validateRenderResult"] = function(p21) -- name: validateRenderResult
		-- upvalues: (copy) v_u_4
		return p21 == nil and true or v_u_4(p21)
	end
}
return v7