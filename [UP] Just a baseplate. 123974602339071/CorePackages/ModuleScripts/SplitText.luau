-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Utils.SplitText
local v1 = script:FindFirstAncestor("Utils").Parent
local v_u_2 = require(v1.Enums.TextSplitBy)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5, p6, p7) -- name: new
	-- upvalues: (copy) v_u_3
	local v8 = v_u_3
	local v9 = setmetatable({}, v8)
	v9._text = p4
	v9._initialGuess = v9:_guessInitialBreak(p5, p6, p7)
	v9._index = v9._initialGuess
	v9:setDirection(1)
	return v9
end
function v_u_3._guessInitialBreak(p10, _, p11, p12) -- name: _guessInitialBreak
	local v13 = #p10._text * p12 / p11
	local v14 = math.floor(v13)
	return math.max(v14, 1)
end
function v_u_3.findPossibleBreak(p15) -- name: findPossibleBreak
	local v16 = p15._index
	while p15.direction == 1 and v16 <= #p15._text or p15.direction == -1 and v16 > 0 do
		if p15._text:sub(v16, v16):match("%s") ~= nil then
			p15._index = v16 + p15._step
			return v16 - 1
		end
		v16 = v16 + p15._step
	end
	return v16
end
function v_u_3.setDirection(p17, p18) -- name: setDirection
	p17.direction = p18
	if p18 ~= 1 then
		p17._index = p17._initialGuess
	end
	p17._step = p18 == 1 and 1 or -1
end
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new(p20, p21, p22, p23) -- name: new
	-- upvalues: (copy) v_u_19
	local v24 = v_u_19
	local v25 = setmetatable({}, v24)
	v25._text = p20
	v25._initialGuess = v25:_guessInitialBreak(p21, p22, p23)
	v25._codepointIndex = v25._initialGuess
	v25._step = 0
	return v25
end
function v_u_19._guessInitialBreak(_, p26, p27, p28) -- name: _guessInitialBreak
	local v29 = p26 * p28 / p27
	local v30 = math.floor(v29)
	return math.max(v30, 1)
end
function v_u_19.findPossibleBreak(p31) -- name: findPossibleBreak
	p31._codepointIndex = p31._codepointIndex + p31._step
	local v32 = p31._text
	local v33 = p31._codepointIndex
	local v34 = utf8.offset(v32, v33 + 1)
	return v34 == nil and #v32 or v34 - 1
end
function v_u_19.setDirection(p35, p36) -- name: setDirection
	p35.direction = p36
	p35._step = p36 == 1 and 1 or -1
end
local function v_u_50(p37, p38, p39, p40, p41, p42) -- name: splitWith
	local v43 = p37.new(p39, p40, p41, p42)
	local v44 = v43:findPossibleBreak()
	local v45 = p39:sub(1, v44)
	local v46 = p42 < p38(v45) and -1 or 1
	v43:setDirection(v46)
	local v47 = v44
	local v48 = 0
	while v48 < p40 do
		v44 = v43:findPossibleBreak()
		v45 = p39:sub(1, v44)
		local v49 = p42 < p38(v45) and -1 or 1
		if v46 ~= v49 then
			if v46 == 1 then
				return p39:sub(1, v47), v47
			end
			break
		end
		v48 = v48 + 1
		v46 = v49
		v47 = v44
	end
	return v45, v44
end
return function(p51, p52, p53, p54) -- name: split
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_19, (copy) v_u_50
	local v55 = utf8.len(p53)
	if v55 == nil then
		warn("Failed to get string length, it is probably malformed or non utf8")
		return p53
	else
		local v56 = p52(p53)
		if v56 <= p54 then
			return p53
		else
			local v57
			if p51 == v_u_2.Word then
				v57 = v_u_3
			else
				v57 = v_u_19
			end
			local v58, v59 = v_u_50(v57, p52, p53, v55, v56, p54)
			if v59 == 0 or v59 == #p53 then
				return p53
			else
				return v58, p53:sub(v59 + 1)
			end
		end
	end
end