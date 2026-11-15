-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.FriendStatusConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Actions.SetFriendStatus)
local v_u_8 = require(v6.Utility.ExternalEventConnection)
local v9 = v_u_4.PureComponent:extend("FriendStatusConnector")
function v9.init(p10) -- name: init
	-- upvalues: (copy) v_u_2
	p10.state = {
		["localPlayer"] = v_u_2.LocalPlayer
	}
end
function v9.render(p_u_11) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_2
	local v14 = {
		["PlayerAdded"] = v_u_4.createElement(v_u_8, {
			["event"] = v_u_2.PlayerAdded,
			["callback"] = function(p12) -- name: callback
				-- upvalues: (ref) v_u_2, (copy) p_u_11
				if p12 == v_u_2.LocalPlayer then
					p_u_11:setState({
						["localPlayer"] = p12
					})
				else
					p_u_11.props.setFriendStatus(p12.UserId, Enum.FriendStatus.Unknown)
				end
			end
		}),
		["PlayerRemoving"] = v_u_4.createElement(v_u_8, {
			["event"] = v_u_2.PlayerRemoving,
			["callback"] = function(p13) -- name: callback
				-- upvalues: (copy) p_u_11
				p_u_11.props.setFriendStatus(p13.UserId, nil)
			end
		})
	}
	if p_u_11.state.localPlayer then
		v14.FriendStatusChanged = v_u_4.createElement(v_u_8, {
			["event"] = v_u_2.LocalPlayer.FriendStatusChanged,
			["callback"] = function(p15, p16) -- name: callback
				-- upvalues: (copy) p_u_11
				p_u_11.props.setFriendStatus(p15.UserId, p16)
			end
		})
	end
	return v_u_4.createFragment(v14)
end
return v5.UNSTABLE_connect2(nil, function(p_u_17)
	-- upvalues: (copy) v_u_7
	return {
		["setFriendStatus"] = function(p18, p19) -- name: setFriendStatus
			-- upvalues: (copy) p_u_17, (ref) v_u_7
			return p_u_17(v_u_7(p18, p19))
		end
	}
end)(v9)