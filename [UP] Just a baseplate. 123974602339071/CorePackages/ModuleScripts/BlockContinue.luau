-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.block.BlockContinue
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.none() -- name: none
	return nil
end
function v_u_1.atIndex(p2) -- name: atIndex
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	return setmetatable({
		["_newIndex"] = nil,
		["_newColumn"] = -1,
		["_finalize"] = false,
		["_newIndex"] = p2
	}, v3)
end
function v_u_1.atColumn(p4) -- name: atColumn
	-- upvalues: (copy) v_u_1
	local v5 = v_u_1
	return setmetatable({
		["_newIndex"] = -1,
		["_newColumn"] = nil,
		["_finalize"] = false,
		["_newColumn"] = p4
	}, v5)
end
function v_u_1.finished() -- name: finished
	-- upvalues: (copy) v_u_1
	local v6 = v_u_1
	return setmetatable({
		["_newIndex"] = -1,
		["_newColumn"] = -1,
		["_finalize"] = true
	}, v6)
end
function v_u_1.getNewIndex(p7) -- name: getNewIndex
	return p7._newIndex
end
function v_u_1.getNewColumn(p8) -- name: getNewColumn
	return p8._newColumn
end
function v_u_1.isFinalize(p9) -- name: isFinalize
	return p9._finalize
end
return v_u_1