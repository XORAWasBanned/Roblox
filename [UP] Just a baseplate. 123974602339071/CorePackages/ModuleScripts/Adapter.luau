-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(script.AdapterTypes)
require(v2.CommonMark)
local v_u_3 = require(script.DefaultRules)
local v_u_4 = require(script.Engine)
local v_u_5 = require(script.Registry)
local v6 = require(script.Rules)
require(v1.Types)
return {
	["Rules"] = v6,
	["build"] = function(p7) -- name: build
		-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
		local v_u_8 = v_u_5.build(v_u_3.register, p7 or {})
		local v11 = {
			["toRendererAst"] = function(p9, p10) -- name: toRendererAst
				-- upvalues: (ref) v_u_4, (copy) v_u_8
				return v_u_4.adapt(v_u_8, p9, p10)
			end
		}
		return table.freeze(v11)
	end
}