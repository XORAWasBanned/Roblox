-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.Delimiter
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.Text)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4, p5, p6, p7) -- name: new
	-- upvalues: (copy) v_u_2
	local v8 = {
		["characters"] = nil,
		["delimiterChar"] = nil,
		["_canOpen"] = nil,
		["_canClose"] = nil,
		["previous"] = nil,
		["next"] = nil,
		["_originalLength"] = nil,
		["characters"] = p3,
		["delimiterChar"] = p4,
		["_canOpen"] = p5,
		["_canClose"] = p6,
		["previous"] = p7,
		["_originalLength"] = #p3
	}
	local v9 = v_u_2
	return setmetatable(v8, v9)
end
function v_u_2.canOpen(p10) -- name: canOpen
	return p10._canOpen
end
function v_u_2.canClose(p11) -- name: canClose
	return p11._canClose
end
function v_u_2.length(p12) -- name: length
	return #p12.characters
end
function v_u_2.originalLength(p13) -- name: originalLength
	return p13._originalLength
end
function v_u_2.getOpener(p14) -- name: getOpener
	return p14.characters[#p14.characters]
end
function v_u_2.getCloser(p15) -- name: getCloser
	return p15.characters[1]
end
function v_u_2.getOpeners(p16, p17) -- name: getOpeners
	if p17 < 1 or p17 > p16:length() then
		error((("length must be between 1 and %*, was %*"):format(p16:length(), p17)))
	end
	return table.move(p16.characters, #p16.characters - p17 + 1, #p16.characters, 1, {})
end
function v_u_2.getClosers(p18, p19) -- name: getClosers
	if p19 < 1 or p19 > p18:length() then
		error((("length must be between 1 and %*, was %*"):format(p18:length(), p19)))
	end
	return table.move(p18.characters, 1, p19, 1, {})
end
return v_u_2