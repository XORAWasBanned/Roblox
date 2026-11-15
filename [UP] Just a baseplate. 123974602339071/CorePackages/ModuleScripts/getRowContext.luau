-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.MarkdownTable.getRowContext
local v1 = script:FindFirstAncestor("Markdown")
local v_u_2 = require(v1.Utils.mergeContexts)
require(v1.Types)
return function(p3, p4) -- name: getRowContext
	-- upvalues: (copy) v_u_2
	if p3.name == "TABLE_HEADER" then
		return v_u_2(p4, {
			["textStyles"] = {
				["bold"] = true
			}
		})
	else
		return p4
	end
end