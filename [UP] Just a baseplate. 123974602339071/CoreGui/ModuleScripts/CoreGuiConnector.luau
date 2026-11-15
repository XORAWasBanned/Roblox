-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.CoreGuiConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = UserSettings():GetService("UserGameSettings")
local v_u_6 = require(v1.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Actions.SetPerformanceStatsVisible)
local v_u_9 = require(v7.Actions.SetPlayerIsBlocked)
local v_u_10 = require(script.Parent.EventConnection)
local v11 = v_u_3.PureComponent:extend("CoreGuiConnector")
function v11.didMount(p12) -- name: didMount
	-- upvalues: (copy) v_u_5
	p12.props.setPerformanceStatsVisible(v_u_5.PerformanceStatsVisible)
end
function v11.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
	local v14 = v_u_3.createFragment
	local v16 = {
		["PerformanceStatsChangedConnection"] = v_u_3.createElement(v_u_10, {
			["event"] = v_u_5.PerformanceStatsVisibleChanged,
			["callback"] = function(p15) -- name: callback
				-- upvalues: (copy) p_u_13
				p_u_13.props.setPerformanceStatsVisible(p15)
			end
		})
	}
	local v20 = {
		["event"] = v_u_6,
		["callback"] = function(p17, p18) -- name: callback
			-- upvalues: (ref) v_u_2, (copy) p_u_13
			local v19 = v_u_2:GetPlayerByUserId(p17)
			if v19 then
				p_u_13.props.setPlayerIsBlocked(v19, p18)
			end
		end
	}
	v16.BlockedStatusChangedConnection = v_u_3.createElement(v_u_10, v20)
	return v14(v16)
end
return v4.connect(nil, function(p_u_21) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	return {
		["setPerformanceStatsVisible"] = function(p22) -- name: setPerformanceStatsVisible
			-- upvalues: (copy) p_u_21, (ref) v_u_8
			return p_u_21(v_u_8(p22))
		end,
		["setPlayerIsBlocked"] = function(p23, p24) -- name: setPlayerIsBlocked
			-- upvalues: (copy) p_u_21, (ref) v_u_9
			return p_u_21(v_u_9(p23, p24))
		end
	}
end)(v11)