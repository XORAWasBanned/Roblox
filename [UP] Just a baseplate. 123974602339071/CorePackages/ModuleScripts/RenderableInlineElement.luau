-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement
local v1 = script:FindFirstAncestor("Components").Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Dash)
local v5 = require(v1.Utils.InlineElementType)
local v_u_6 = v_u_4.join
local v_u_7 = {}
v_u_7.__index = v_u_7
v_u_7.__type = v5
function v_u_7.new(p8, p9, p10) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	local v11 = v_u_7
	local v12 = setmetatable({}, v11)
	v12.props = p9
	v12.mapProps = p10 or v_u_4.identity
	v12.Element = p8
	return v12
end
function v_u_7.getWidth(p13) -- name: getWidth
	return p13.props.Size.Width.Offset
end
function v_u_7.split(p14) -- name: split
	-- upvalues: (copy) v_u_7, (copy) v_u_6
	return v_u_7.new(p14.Element, v_u_6(p14.props))
end
function v_u_7.render(p15, p16, p17) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.createElement(p15.Element, p15.mapProps(v_u_4.assign(p15.props, {
		["id"] = p16,
		["key"] = tostring(p17),
		["LayoutOrder"] = p17
	})))
end
return v_u_7