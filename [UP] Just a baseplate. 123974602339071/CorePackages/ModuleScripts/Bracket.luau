-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.Bracket
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.internal.Delimiter)
require(v1.parser.beta.Position)
require(v1.node.Text)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.link(p3, p4, p5, p6, p7) -- name: link
	-- upvalues: (copy) v_u_2
	local v8 = v_u_2
	return setmetatable({
		["markerNode"] = nil,
		["markerPosition"] = nil,
		["bracketNode"] = nil,
		["bracketPosition"] = nil,
		["contentPosition"] = nil,
		["previous"] = nil,
		["previousDelimiter"] = nil,
		["allowed"] = true,
		["bracketAfter"] = false,
		["contentNestingDepth"] = 0,
		["bracketNode"] = p3,
		["bracketPosition"] = p4,
		["contentPosition"] = p5,
		["previous"] = p6,
		["previousDelimiter"] = p7
	}, v8)
end
function v_u_2.withMarker(p9, p10, p11, p12, p13, p14, p15) -- name: withMarker
	-- upvalues: (copy) v_u_2
	local v16 = v_u_2
	return setmetatable({
		["markerNode"] = nil,
		["markerPosition"] = nil,
		["bracketNode"] = nil,
		["bracketPosition"] = nil,
		["contentPosition"] = nil,
		["previous"] = nil,
		["previousDelimiter"] = nil,
		["allowed"] = true,
		["bracketAfter"] = false,
		["contentNestingDepth"] = 0,
		["markerNode"] = p9,
		["markerPosition"] = p10,
		["bracketNode"] = p11,
		["bracketPosition"] = p12,
		["contentPosition"] = p13,
		["previous"] = p14,
		["previousDelimiter"] = p15
	}, v16)
end
return v_u_2