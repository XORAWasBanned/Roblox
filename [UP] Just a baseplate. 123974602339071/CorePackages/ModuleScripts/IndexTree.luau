-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.IndexTree
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local function v_u_6(p2, p3) -- name: assignIndex
	-- upvalues: (copy) v_u_6
	p2.index = p3
	if p2.children then
		for v4, v5 in p2.children do
			v_u_6(v5, v4)
		end
	end
end
return function(p7) -- name: indexTree
	-- upvalues: (copy) v_u_6
	p7.index = 1
	if p7.children then
		for v8, v9 in p7.children do
			v_u_6(v9, v8)
		end
	end
	return p7
end