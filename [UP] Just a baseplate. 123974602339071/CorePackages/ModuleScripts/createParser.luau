-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.createParser
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(script.Parent)
local v_u_4 = require(v2.CommonMark)
require(v1.Types)
return function(p5) -- name: createParser
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v6 = (p5 == nil or p5.extensions == nil) and {} or p5.extensions
	local v_u_7 = (p5 == nil or p5.parserOptions == nil) and {} or table.clone(p5.parserOptions)
	local v8
	if v_u_7.extensions == nil then
		v8 = v6
	else
		v8 = table.clone(v_u_7.extensions)
		table.move(v6, 1, #v6, #v8 + 1, v8)
		table.freeze(v8)
	end
	v_u_7.extensions = v8
	table.freeze(v_u_7)
	local v_u_9 = v_u_3.build(v8)
	local v_u_19 = {
		["parseOptions"] = v_u_7,
		["parseDocument"] = function(p10) -- name: parseDocument
			-- upvalues: (ref) v_u_4, (copy) v_u_7
			return v_u_4.parse(p10, v_u_7)
		end,
		["toRendererAst"] = function(p11, p12) -- name: toRendererAst
			-- upvalues: (copy) v_u_9
			return v_u_9.toRendererAst(p11, p12)
		end,
		["parse"] = function(p13, p14) -- name: parse
			-- upvalues: (copy) v_u_19
			return v_u_19.toRendererAst(v_u_19.parseDocument(p13), p14)
		end,
		["safeParse"] = function(p15, p16) -- name: safeParse
			-- upvalues: (copy) v_u_19
			if p16 == nil then
				local v17 = v_u_19.parse
				return pcall(v17, p15)
			else
				local v18 = v_u_19.parse
				return pcall(v18, p15, p16)
			end
		end
	}
	return v_u_19
end