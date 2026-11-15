-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Test.MockInlineElements
local v1 = script:FindFirstAncestor("InlineLayout")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Utils.InlineElementType)
local v_u_5 = {}
v_u_5.__index = v_u_5
v_u_5.__type = v4
function v_u_5.new(p6, p7) -- name: new
	-- upvalues: (copy) v_u_5
	local v8 = v_u_5
	local v9 = setmetatable({}, v8)
	v9.width = p6
	v9.canForceSplit = p7
	return v9
end
function v_u_5.getWidth(p10) -- name: getWidth
	return p10.width
end
function v_u_5.split(p11, _, _) -- name: split
	-- upvalues: (copy) v_u_5
	return v_u_5.new(p11.width, p11.canForceSplit)
end
function v_u_5.render(p12, p13, p14) -- name: render
	-- upvalues: (copy) v_u_3
	return v_u_3.createElement("TextLabel", {
		["key"] = tostring(p14),
		["LayoutOrder"] = p14,
		["Size"] = UDim2.fromOffset(p12.width, 20),
		["Text"] = ("%*"):format(p13)
	})
end
local v_u_15 = {}
v_u_15.__index = v_u_15
v_u_15.__type = v4
function v_u_15.new(p16, p17) -- name: new
	-- upvalues: (copy) v_u_15
	local v18 = v_u_15
	local v19 = setmetatable({}, v18)
	v19.width = p16
	v19.canForceSplit = p17
	return v19
end
function v_u_15.getWidth(p20) -- name: getWidth
	return p20.width
end
function v_u_15.split(p21, p22, p23) -- name: split
	-- upvalues: (copy) v_u_15
	local v24 = p21.width / 2
	local v25 = math.floor(v24)
	local v26 = p21.width - v25
	if p23 and p22 < v25 then
		v26 = p21.width - p22
	else
		p22 = v25
	end
	return v_u_15.new(p22, p21.canForceSplit), v_u_15.new(v26, p21.canForceSplit)
end
function v_u_15.render(p27, p28, p29) -- name: render
	-- upvalues: (copy) v_u_3
	return v_u_3.createElement("TextLabel", {
		["key"] = tostring(p29),
		["LayoutOrder"] = p29,
		["Size"] = UDim2.fromOffset(p27.width, 20),
		["Text"] = ("%*"):format(p28)
	})
end
return {
	["MockInlineElement"] = v_u_5,
	["SplittableMockInlineElement"] = v_u_15
}