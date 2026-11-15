-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.mergeContexts
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Types)
return function(p4, p5) -- name: mergeContexts
	-- upvalues: (copy) v_u_3
	return v_u_3.joinDeep(p4, p5)
end