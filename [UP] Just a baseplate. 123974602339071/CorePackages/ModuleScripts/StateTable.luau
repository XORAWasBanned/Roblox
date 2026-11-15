-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Control.StateTable.StateTable
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.ControlState)
require(v1.Enums.ControlStateEvent)
local v_u_2 = require(v1.Utility.Logger)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5, p6) -- name: new
	-- upvalues: (copy) v_u_3
	local v7 = #p4 > 0
	assert(v7, "name must not be an empty string")
	local v8 = p6[p5] ~= nil
	assert(v8, "initialState must be present in transitionTable")
	local v_u_9 = {}
	local v10 = v_u_3
	setmetatable(v_u_9, v10)
	v_u_9.name = p4
	v_u_9.currentState = p5
	v_u_9.transitionTable = {}
	v_u_9.events = {}
	for v11, v12 in p6 do
		local v13 = {}
		for v_u_14, v15 in v12 do
			local v16 = v15.nextState
			if v16 ~= nil then
				local v17 = p6[v16] ~= nil
				assert(v17, "nextState does not exist in transitionTable")
			end
			v13[v_u_14] = v15
			if v_u_9.events[v_u_14] ~= nil then
				continue
			end
			v_u_9.events[v_u_14] = function()
				-- upvalues: (copy) v_u_9, (copy) v_u_14
				return v_u_9:handleEvent(v_u_14)
			end
		end
		v_u_9.transitionTable[v11] = v13
	end
	local v18 = v_u_9.events
	setmetatable(v18, {
		["__index"] = function(_, p19) -- name: __index
			-- upvalues: (copy) v_u_9
			error(string.format("\'%s\' is not a valid event in StateTable \'%s\'", tostring(p19), v_u_9.name), 2)
		end
	})
	return v_u_9
end
function v_u_3.handleEvent(p20, p21) -- name: handleEvent
	-- upvalues: (copy) v_u_2
	local v22 = p20.currentState
	local v23 = p20.transitionTable[v22][p21]
	if v23 == nil then
		v_u_2:debug("No transition found for event " .. p21 .. " in state " .. v22)
	else
		local v24 = v23.nextState
		p20.currentState = v24
		if p20.stateChangeHandler ~= nil then
			p20.stateChangeHandler(v24)
		end
	end
end
function v_u_3.onStateChange(p25, p26) -- name: onStateChange
	p25.stateChangeHandler = p26
end
return v_u_3