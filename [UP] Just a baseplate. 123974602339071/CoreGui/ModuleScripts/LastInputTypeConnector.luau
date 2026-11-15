-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.LastInputTypeConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("VRService")
local v_u_3 = game:GetService("UserInputService")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Actions.SetInputType)
local v_u_9 = require(v7.Utility.ExternalEventConnection)
local v_u_10 = require(v7.Resources.Constants).InputTypeMap
local v11 = v_u_5.PureComponent:extend("LastInputTypeConnector")
function v11.updateInputType(p12, p13) -- name: updateInputType
	-- upvalues: (copy) v_u_2, (copy) v_u_10
	if v_u_2.VREnabled then
		p13 = v_u_10[Enum.UserInputType.MouseMovement]
	end
	if p13 then
		p12.props.setInputType(p13)
	end
end
function v11.init(p14) -- name: init
	-- upvalues: (copy) v_u_10, (copy) v_u_3
	p14:updateInputType(v_u_10[v_u_3:GetLastInputType()])
end
function v11.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_3, (copy) v_u_10
	return v_u_5.createElement(v_u_9, {
		["event"] = v_u_3.LastInputTypeChanged,
		["callback"] = function(p16) -- name: callback
			-- upvalues: (ref) v_u_10, (copy) p_u_15
			p_u_15:updateInputType(v_u_10[p16])
		end
	})
end
return v6.UNSTABLE_connect2(nil, function(p_u_17)
	-- upvalues: (copy) v_u_8
	return {
		["setInputType"] = function(p18) -- name: setInputType
			-- upvalues: (copy) p_u_17, (ref) v_u_8
			return p_u_17(v_u_8(p18))
		end
	}
end)(v11)