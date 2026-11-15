-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.TextElement
local v1 = script:FindFirstAncestor("Components").Parent.Parent
local v2 = script:FindFirstAncestor("InlineLayoutElements")
local v_u_3 = require(v1.Dash)
local v4 = require(v1.Foundation)
local v_u_5 = require(v2.BaseTextElement)
local v_u_6 = v4.Text
local v7 = {}
function mapProps(p8) -- name: mapProps
	-- upvalues: (copy) v_u_3
	return v_u_3.join(v_u_3.omit(p8, { "id", "EngineTags" }), {
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	})
end
function v7.new(p9) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	return v_u_5.new(v_u_6, p9, mapProps)
end
return v7