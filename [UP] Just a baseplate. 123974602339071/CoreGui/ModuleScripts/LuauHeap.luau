-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.LuauHeap
local v_u_1 = require(script.Parent.Parent.Immutable)
local v2 = script.Parent.Parent.Actions
local v_u_3 = require(v2.SetLuauHeapState)
local v_u_4 = require(v2.SetLuauHeapProfileTarget)
local v_u_5 = require(v2.SetLuauHeapActiveSnapshot)
local v_u_6 = require(v2.SetLuauHeapCompareSnapshot)
require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)
local v_u_7 = {
	["isClientView"] = true,
	["client"] = nil,
	["server"] = nil,
	["client"] = {
		["snapshots"] = nil,
		["active"] = 0,
		["compare"] = 0,
		["snapshots"] = {}
	},
	["server"] = {
		["snapshots"] = nil,
		["active"] = 0,
		["compare"] = 0,
		["snapshots"] = {}
	}
}
return function(p8, p9)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_1, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v10 = p8 or v_u_7
	if p9.type == v_u_3.name then
		local v11
		if p9.isClientState then
			v11 = {
				["client"] = p9.sessionState
			}
		else
			v11 = {
				["server"] = p9.sessionState
			}
		end
		return v_u_1.JoinDictionaries(v10, v11)
	elseif p9.type == v_u_4.name then
		return v_u_1.JoinDictionaries(v10, {
			["isClientView"] = p9.isClientView
		})
	elseif p9.type == v_u_5.name then
		if v10.isClientView then
			local v12 = table.clone(v10.client)
			v12.active = p9.active
			return v_u_1.JoinDictionaries(v10, {
				["client"] = v12
			})
		else
			local v13 = table.clone(v10.server)
			v13.active = p9.active
			return v_u_1.JoinDictionaries(v10, {
				["server"] = v13
			})
		end
	elseif p9.type == v_u_6.name then
		if v10.isClientView then
			local v14 = table.clone(v10.client)
			v14.compare = p9.compare
			return v_u_1.JoinDictionaries(v10, {
				["client"] = v14
			})
		else
			local v15 = table.clone(v10.server)
			v15.compare = p9.compare
			return v_u_1.JoinDictionaries(v10, {
				["server"] = v15
			})
		end
	else
		return v10
	end
end