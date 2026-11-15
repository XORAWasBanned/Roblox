-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMark
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Adapter)
local v_u_3 = require(v2.CommonMark)
require(v1.Types)
local v_u_4 = require(v1.Adapter.createParser)()
local v_u_11 = {
	["parseOptions"] = v_u_4.parseOptions,
	["parse"] = function(p5) -- name: parse
		-- upvalues: (copy) v_u_4
		return v_u_4.parseDocument(p5)
	end,
	["toRendererAst"] = function(p6, p7) -- name: toRendererAst
		-- upvalues: (copy) v_u_4
		return v_u_4.toRendererAst(p6, p7)
	end,
	["safeParse"] = function(p8) -- name: safeParse
		-- upvalues: (copy) v_u_11
		local v9 = v_u_11.parse
		return pcall(v9, p8)
	end,
	["renderHtml"] = function(p10) -- name: renderHtml
		-- upvalues: (copy) v_u_3
		return v_u_3.renderHtml(p10)
	end
}
return v_u_11