-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.SocialConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Actions.SetPlayerFriendStatus)
local v_u_7 = require(script.Parent.EventConnection)
local v8 = v_u_3.PureComponent:extend("SocialConnector")
function v8.didMount(p9) -- name: didMount
	p9.mounted = true
end
function v8.render(p_u_10) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_2
	local v11 = v_u_3.createFragment
	local v14 = {
		["FriendStatusChangedConnection"] = v_u_3.createElement(v_u_7, {
			["event"] = v_u_2.LocalPlayer.FriendStatusChanged,
			["callback"] = function(p12, p13) -- name: callback
				-- upvalues: (copy) p_u_10
				p_u_10.props.setPlayerFriendStatus(p12, p13)
			end
		})
	}
	return v11(v14)
end
function v8.willUnmount(p15) -- name: willUnmount
	p15.mounted = false
end
return v4.connect(nil, function(p_u_16) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_6
	return {
		["setPlayerFriendStatus"] = function(p17, p18) -- name: setPlayerFriendStatus
			-- upvalues: (copy) p_u_16, (ref) v_u_6
			return p_u_16(v_u_6(p17, p18))
		end
	}
end)(v8)