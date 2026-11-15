-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.FencedCodeBlock
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
local function v_u_4(p3) -- name: getOpeningFenceLength
	return p3._openingFenceLength
end
local function v_u_8(p5, p6) -- name: setOpeningFenceLength
	if p6 ~= nil and p6 < 3 then
		error("openingFenceLength needs to be >= 3")
	end
	local v7 = p5._closingFenceLength
	if p6 ~= nil and (v7 ~= nil and v7 < p6) then
		error("fence lengths required to be: closingFenceLength >= openingFenceLength")
	end
	p5._openingFenceLength = p6
end
local function v_u_10(p9) -- name: getClosingFenceLength
	return p9._closingFenceLength
end
local function v_u_14(p11, p12) -- name: setClosingFenceLength
	if p12 ~= nil and p12 < 3 then
		error("closingFenceLength needs to be >= 3")
	end
	local v13 = p11._openingFenceLength
	if v13 ~= nil and (p12 ~= nil and p12 < v13) then
		error("fence lengths required to be: closingFenceLength >= openingFenceLength")
	end
	p11._closingFenceLength = p12
end
return function() -- name: FencedCodeBlock
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_14
	local v15 = v_u_2.new("FencedCodeBlock", true)
	v15.fenceCharacter = nil
	v15._openingFenceLength = nil
	v15._closingFenceLength = nil
	v15.fenceIndent = 0
	v15.info = nil
	v15.literal = nil
	v15.getOpeningFenceLength = v_u_4
	v15.setOpeningFenceLength = v_u_8
	v15.getClosingFenceLength = v_u_10
	v15.setClosingFenceLength = v_u_14
	return v15
end