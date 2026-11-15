-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.StaggeredDelimiterProcessor
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.delimiter.DelimiterProcessor)
require(v1.parser.delimiter.DelimiterRun)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3) -- name: new
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2
	return setmetatable({
		["_delim"] = nil,
		["_minLength"] = 0,
		["_processors"] = nil,
		["_rejectsByMultipleOf3Rule"] = false,
		["_delim"] = p3,
		["_processors"] = {}
	}, v4)
end
function v_u_2.getOpeningCharacter(p5) -- name: getOpeningCharacter
	return p5._delim
end
function v_u_2.getClosingCharacter(p6) -- name: getClosingCharacter
	return p6._delim
end
function v_u_2.getMinLength(p7) -- name: getMinLength
	return p7._minLength
end
function v_u_2.add(p8, p9) -- name: add
	local v10 = p9:getMinLength()
	local v11 = false
	for v12, v13 in ipairs(p8._processors) do
		local v14 = v13:getMinLength()
		if v14 < v10 then
			local v15 = p8._processors
			table.insert(v15, v12, p9)
			v11 = true
			break
		end
		if v10 ~= v14 then
			continue
		end
		local v16 = p8._delim
		local v17 = string.char(v16)
		error(("Cannot add two delimiter processors for char \'%*\' and minimum length %*; "):format(v17, v10) .. ("conflicting processors: %*, %*"):format(tostring(v13), (tostring(p9))))
	end
	if not v11 then
		local v18 = p8._processors
		table.insert(v18, p9)
		p8._minLength = v10
	end
	local v19 = true
	for _, v20 in ipairs(p8._processors) do
		if v20._rejectsByMultipleOf3Rule == true then
			continue
		end
		v19 = false
	end
	p8._rejectsByMultipleOf3Rule = v19
end
function v_u_2.findProcessor(p21, p22) -- name: findProcessor
	for _, v23 in ipairs(p21._processors) do
		if v23:getMinLength() > p22 then
			continue
		end
		return v23
	end
	return p21._processors[1]
end
function v_u_2.process(p24, p25, p26) -- name: process
	return p24:findProcessor(p25:length()):process(p25, p26)
end
return v_u_2