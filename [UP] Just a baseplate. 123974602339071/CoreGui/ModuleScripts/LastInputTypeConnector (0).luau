-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.LastInputTypeConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Parent.Common.EventConnection)
local v_u_7 = require(v5.Actions.SetInputType)
local v8 = require(v5.Constants).InputType
local v9 = v_u_3.PureComponent:extend("LastInputTypeConnector")
local v_u_10 = {
	[Enum.UserInputType.MouseButton2] = v8.MouseAndKeyBoard,
	[Enum.UserInputType.MouseButton3] = v8.MouseAndKeyBoard,
	[Enum.UserInputType.MouseWheel] = v8.MouseAndKeyBoard,
	[Enum.UserInputType.MouseMovement] = v8.MouseAndKeyBoard,
	[Enum.UserInputType.Keyboard] = v8.MouseAndKeyBoard,
	[Enum.UserInputType.Gamepad1] = v8.Gamepad,
	[Enum.UserInputType.Gamepad2] = v8.Gamepad,
	[Enum.UserInputType.Gamepad3] = v8.Gamepad,
	[Enum.UserInputType.Gamepad4] = v8.Gamepad,
	[Enum.UserInputType.Gamepad5] = v8.Gamepad,
	[Enum.UserInputType.Gamepad6] = v8.Gamepad,
	[Enum.UserInputType.Gamepad7] = v8.Gamepad,
	[Enum.UserInputType.Gamepad8] = v8.Gamepad,
	[Enum.UserInputType.Touch] = v8.Touch
}
function v9.didMount(p11) -- name: didMount
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	local v12 = v_u_10[v_u_2:GetLastInputType()]
	if v12 then
		p11.props.setInputType(v12)
	end
end
function v9.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_2, (copy) v_u_10
	return v_u_3.createElement(v_u_6, {
		["event"] = v_u_2.LastInputTypeChanged,
		["callback"] = function(p14) -- name: callback
			-- upvalues: (ref) v_u_10, (copy) p_u_13
			local v15 = v_u_10[p14]
			if v15 then
				p_u_13.props.setInputType(v15)
			end
		end
	})
end
return v4.UNSTABLE_connect2(nil, function(p_u_16)
	-- upvalues: (copy) v_u_7
	return {
		["setInputType"] = function(p17) -- name: setInputType
			-- upvalues: (copy) p_u_16, (ref) v_u_7
			return p_u_16(v_u_7(p17))
		end
	}
end)(v9)