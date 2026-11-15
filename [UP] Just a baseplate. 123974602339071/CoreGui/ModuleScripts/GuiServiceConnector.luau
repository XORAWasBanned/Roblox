-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.GuiServiceConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Actions.SetInspectMenuEnabled)
local v_u_7 = require(script.Parent.EventConnection)
local v8 = v_u_3.PureComponent:extend("GuiServiceConnector")
function v8.render(p_u_9) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_2
	local v10 = v_u_3.createFragment
	local v12 = {
		["InspectMenuEnabledConnection"] = v_u_3.createElement(v_u_7, {
			["event"] = v_u_2.InspectMenuEnabledChangedSignal,
			["callback"] = function(p11) -- name: callback
				-- upvalues: (copy) p_u_9
				p_u_9.props.setInspectMenuEnabled(p11)
			end
		})
	}
	return v10(v12)
end
return v4.connect(nil, function(p_u_13) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_6
	return {
		["setInspectMenuEnabled"] = function(p14) -- name: setInspectMenuEnabled
			-- upvalues: (copy) p_u_13, (ref) v_u_6
			return p_u_13(v_u_6(p14))
		end
	}
end)(v8)