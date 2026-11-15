-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.RendererParser
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Adapter)
local v_u_2 = require(script.Parent)
require(v1.Types)
local v_u_9 = {
	["parse"] = function(p3, p4) -- name: parse
		-- upvalues: (copy) v_u_2
		return v_u_2.toRendererAst(v_u_2.parse(p3), p4)
	end,
	["safeParse"] = function(p5, p6) -- name: safeParse
		-- upvalues: (copy) v_u_9
		if p6 == nil then
			local v7 = v_u_9.parse
			return pcall(v7, p5)
		else
			local v8 = v_u_9.parse
			return pcall(v8, p5, p6)
		end
	end
}
return v_u_9