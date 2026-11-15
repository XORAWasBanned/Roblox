-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.LogData
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Rodux)
local v_u_3 = require(script.Parent.Parent.Immutable)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v28 = {
		["ClientLogAppendMessage"] = function(p6, p7) -- name: ClientLogAppendMessage
			-- upvalues: (ref) v_u_3
			return v_u_3.JoinDictionaries(p6, {
				["clientData"] = v_u_3.Append(p6.clientData, p7.newMessage)
			})
		end,
		["ServerLogAppendMessage"] = function(p8, p9) -- name: ServerLogAppendMessage
			-- upvalues: (ref) v_u_3
			return v_u_3.JoinDictionaries(p8, {
				["serverData"] = v_u_3.Append(p8.serverData, p9.newMessage)
			})
		end,
		["ClientLogAppendFilteredMessage"] = function(p10, p11) -- name: ClientLogAppendFilteredMessage
			-- upvalues: (ref) v_u_3
			local v12 = {
				["clientData"] = v_u_3.Append(p10.clientData, p11.newMessage),
				["clientDataFiltered"] = v_u_3.Append(p10.clientDataFiltered, p11.newMessage)
			}
			return v_u_3.JoinDictionaries(p10, v12)
		end,
		["ServerLogAppendFilteredMessage"] = function(p13, p14) -- name: ServerLogAppendFilteredMessage
			-- upvalues: (ref) v_u_3
			local v15 = {
				["serverData"] = v_u_3.Append(p13.serverData, p14.newMessage),
				["serverDataFiltered"] = v_u_3.Append(p13.serverDataFiltered, p14.newMessage)
			}
			return v_u_3.JoinDictionaries(p13, v15)
		end,
		["ClientLogSetData"] = function(p16, p17) -- name: ClientLogSetData
			-- upvalues: (ref) v_u_3
			local v18 = {
				["clientData"] = p17.newData,
				["clientDataFiltered"] = p17.newDataFiltered
			}
			return v_u_3.JoinDictionaries(p16, v18)
		end,
		["ServerLogSetData"] = function(p19, p20) -- name: ServerLogSetData
			-- upvalues: (ref) v_u_3
			local v21 = {
				["serverData"] = p20.newData,
				["serverDataFiltered"] = p20.newDataFiltered
			}
			return v_u_3.JoinDictionaries(p19, v21)
		end,
		["ClientLogUpdateSearchFilter"] = function(p22, p23) -- name: ClientLogUpdateSearchFilter
			-- upvalues: (ref) v_u_3
			local v24 = {
				["clientSearchTerm"] = p23.searchTerm,
				["clientTypeFilters"] = v_u_3.JoinDictionaries(p22.clientTypeFilters, p23.filterTypes)
			}
			return v_u_3.JoinDictionaries(p22, v24)
		end,
		["ServerLogUpdateSearchFilter"] = function(p25, p26) -- name: ServerLogUpdateSearchFilter
			-- upvalues: (ref) v_u_3
			local v27 = {
				["serverSearchTerm"] = p26.searchTerm,
				["serverTypeFilters"] = v_u_3.JoinDictionaries(p25.serverTypeFilters, p26.filterTypes)
			}
			return v_u_3.JoinDictionaries(p25, v27)
		end
	}
	return v_u_2.createReducer({
		["clientSearchTerm"] = "",
		["clientTypeFilters"] = nil,
		["serverSearchTerm"] = "",
		["serverTypeFilters"] = nil,
		["clientTypeFilters"] = {},
		["serverTypeFilters"] = {}
	}, v28)(p4, p5)
end