-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.WikiMarkdownParser
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(script.BuildTree)
local v_u_5 = require(script.PostProcessTree)
local v_u_6 = require(script.Tokenize)
require(v1.Types)
local v_u_7 = require(script.Parent.UnindentTags)
local v_u_8 = require(script.Parent.IndexTree)
local v_u_9 = require(script.Parent.DefaultParserOptions)
local v_u_20 = {
	["safeParse"] = function(p_u_10, p_u_11) -- name: safeParse
		-- upvalues: (copy) v_u_20
		local function v12()
			-- upvalues: (ref) v_u_20, (copy) p_u_10, (copy) p_u_11
			return v_u_20.parse(p_u_10, p_u_11)
		end
		local v14, v15 = xpcall(v12, function(p13)
			return ("%*\n%*"):format(p13, (debug.traceback()))
		end)
		return v14, v15
	end,
	["parse"] = function(p16, p17) -- name: parse
		-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_8
		local v18 = v_u_3.joinDeep(v_u_9, p17 or {})
		local v19 = v_u_4(v_u_6((v_u_7(p16))), v18)
		v19.children = v_u_5(v19, v18)
		return v_u_8(v19)
	end
}
return v_u_20