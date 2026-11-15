-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.renderer.NodeRendererMap
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.Node)
require(v1.renderer.NodeRenderer)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2
	return setmetatable({
		["_nodeRenderers"] = {},
		["_renderers"] = {}
	}, v3)
end
function v_u_2.add(p4, p5) -- name: add
	local v6 = p4._nodeRenderers
	table.insert(v6, p5)
	for _, v7 in ipairs(p5:getNodeTypes()) do
		if p4._renderers[v7] ~= nil then
			continue
		end
		p4._renderers[v7] = p5
	end
end
function v_u_2.render(p8, p9) -- name: render
	local v10 = p8._renderers[p9.kind]
	if v10 ~= nil then
		v10:render(p9)
	end
end
function v_u_2.beforeRoot(p11, p12) -- name: beforeRoot
	for _, v13 in ipairs(p11._nodeRenderers) do
		local v14 = v13.beforeRoot
		if v14 == nil then
			continue
		end
		v14(v13, p12)
	end
end
function v_u_2.afterRoot(p15, p16) -- name: afterRoot
	for _, v17 in ipairs(p15._nodeRenderers) do
		local v18 = v17.afterRoot
		if v18 == nil then
			continue
		end
		v18(v17, p16)
	end
end
return v_u_2