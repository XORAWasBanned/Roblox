-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.util.LineReader
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.text.Characters)
local v_u_3 = string.byte
local v_u_4 = string.sub
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6) -- name: new
	-- upvalues: (copy) v_u_5
	local v7 = {
		["_input"] = nil,
		["_position"] = 0,
		["_limit"] = nil,
		["_lineTerminator"] = nil,
		["_input"] = p6,
		["_limit"] = #p6
	}
	local v8 = v_u_5
	return setmetatable(v7, v8)
end
local v_u_9 = nil
function v_u_5.readLine(p10) -- name: readLine
	-- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v11 = p10._input
	if v11 == nil then
		error("LineReader is closed")
	end
	local v12 = p10._position
	if p10._limit <= v12 then
		return v_u_9(p10, nil, nil)
	else
		local v13 = v_u_2.findLineBreak(v11, v12)
		if v13 == -1 then
			p10._position = p10._limit
			return v_u_9(p10, v_u_4(v11, v12 + 1, p10._limit), nil)
		elseif v_u_3(v11, v13 + 1) == 10 then
			p10._position = v13 + 1
			return v_u_9(p10, v_u_4(v11, v12 + 1, v13), "\n")
		elseif v_u_3(v11, v13 + 1 + 1) == 10 then
			p10._position = v13 + 2
			return v_u_9(p10, v_u_4(v11, v12 + 1, v13), "\r\n")
		else
			p10._position = v13 + 1
			return v_u_9(p10, v_u_4(v11, v12 + 1, v13), "\r")
		end
	end
end
function v_u_5.getLineTerminator(p14) -- name: getLineTerminator
	return p14._lineTerminator
end
function v_u_5.close(p15) -- name: close
	if p15._input ~= nil then
		p15._input = nil
	end
end
v_u_9 = function(p16, p17, p18) -- name: line
	p16._lineTerminator = p18
	return p17
end
return v_u_5