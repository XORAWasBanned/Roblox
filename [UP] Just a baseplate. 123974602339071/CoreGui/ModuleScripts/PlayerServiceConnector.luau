-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.PlayerServiceConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RobloxReplicatedStorage")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Actions.AddPlayer)
local v_u_8 = require(v6.Actions.RemovePlayer)
local v_u_9 = require(v6.Thunks.MakePlayerInfoRequests)
local v_u_10 = require(script.Parent.EventConnection)
local v_u_11 = require(v1.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local v_u_13 = game:DefineFastFlag("DeferPlayerInfoRequests", false)
local v_u_14 = require(v1.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local v15 = v_u_4.PureComponent:extend("PlayerServiceConnector")
function v15.didMount(p_u_16) -- name: didMount
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_3, (copy) v_u_13
	local v17 = v_u_2:GetPlayers()
	for _, v18 in ipairs(v17) do
		p_u_16.props.addPlayer(v18)
		p_u_16.props.makePlayerInfoRequests(v18)
	end
	if v_u_11 then
		spawn(function()
			-- upvalues: (ref) v_u_3, (copy) p_u_16, (ref) v_u_2, (ref) v_u_13
			p_u_16.sendPlayerProfileSettingsConnection = v_u_3:WaitForChild("SendPlayerProfileSettings", (1 / 0)).OnClientEvent:Connect(function(p19)
				-- upvalues: (ref) v_u_2, (ref) v_u_13, (ref) p_u_16
				local v_u_20 = v_u_2:GetPlayerByUserId((tonumber(p19)))
				if v_u_20 then
					if v_u_13 then
						task.defer(function()
							-- upvalues: (ref) p_u_16, (copy) v_u_20
							p_u_16.props.makePlayerInfoRequests(v_u_20)
						end)
						return
					end
					p_u_16.props.makePlayerInfoRequests(v_u_20)
				end
			end)
		end)
	end
end
function v15.render(p_u_21) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_2
	local v22 = v_u_4.createFragment
	local v25 = {
		["PlayerAddedConnection"] = v_u_4.createElement(v_u_10, {
			["event"] = v_u_2.PlayerAdded,
			["callback"] = function(p23) -- name: callback
				-- upvalues: (copy) p_u_21
				p_u_21.props.addPlayer(p23)
				p_u_21.props.makePlayerInfoRequests(p23)
			end
		}),
		["PlayerRemovingConnection"] = v_u_4.createElement(v_u_10, {
			["event"] = v_u_2.PlayerRemoving,
			["callback"] = function(p24) -- name: callback
				-- upvalues: (copy) p_u_21
				p_u_21.props.removePlayer(p24)
			end
		})
	}
	return v22(v25)
end
function v15.willUnmount(p26) -- name: willUnmount
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v27 = v_u_2:GetPlayers()
	for _, v28 in ipairs(v27) do
		p26.props.removePlayer(v28)
	end
	if v_u_11 and p26.sendPlayerProfileSettingsConnection then
		p26.sendPlayerProfileSettingsConnection:Disconnect()
	end
end
return v5.connect(nil, function(p_u_29) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_12, (copy) v_u_14, (copy) v_u_8
	return {
		["addPlayer"] = function(p30) -- name: addPlayer
			-- upvalues: (copy) p_u_29, (ref) v_u_7
			return p_u_29(v_u_7(p30))
		end,
		["makePlayerInfoRequests"] = function(p31) -- name: makePlayerInfoRequests
			-- upvalues: (copy) p_u_29, (ref) v_u_9
			return p_u_29(v_u_9(p31))
		end,
		["removePlayer"] = function(p32) -- name: removePlayer
			-- upvalues: (ref) v_u_12, (ref) v_u_14, (copy) p_u_29, (ref) v_u_8
			if v_u_12 then
				v_u_14.removePlayer(p32.UserId)
			end
			return p_u_29(v_u_8(p32))
		end
	}
end)(v15)