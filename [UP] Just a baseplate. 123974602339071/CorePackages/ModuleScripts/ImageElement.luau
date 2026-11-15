-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.ImageElement
local v1 = script:FindFirstAncestor("Components").Parent.Parent
local v2 = script:FindFirstAncestor("InlineLayoutElements")
local v3 = require(v1.Foundation)
local v_u_4 = require(v1.Dash)
local v_u_5 = require(v2.RenderableInlineElement)
local v_u_6 = v3.Image
local v7 = {}
local function v_u_9(p8) -- name: mapProps
	-- upvalues: (copy) v_u_4
	return v_u_4.omit(p8, { "id" })
end
function v7.new(p10) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_9
	return v_u_5.new(v_u_6, p10, v_u_9)
end
return v7