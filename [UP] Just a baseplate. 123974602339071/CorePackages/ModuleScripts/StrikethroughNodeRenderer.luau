-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.ext.gfm.strikethrough.internal.StrikethroughNodeRenderer
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.renderer.NodeRenderer)
local v2 = {}
v2.__index = v2
function v2.getNodeTypes(_) -- name: getNodeTypes
	return { "Strikethrough" }
end
return v2