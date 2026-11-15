-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayoutSetter
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Resources.Controls)
local v_u_8 = require(v6.Actions.SetControlLayout)
local v9 = v4.PureComponent:extend("ControlLayoutSetter")
function v9.init(p10) -- name: init
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	local v11 = v_u_7.inputToControlTypeMap[v_u_2:GetLastInputType()]
	if v11 then
		p10.props.dispatchSetControlLayout(v11)
	end
end
function v9.render(_) -- name: render
	return nil
end
function v9.didMount(p_u_12) -- name: didMount
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	p_u_12.inputChangedConnection = v_u_2.LastInputTypeChanged:Connect(function(p13)
		-- upvalues: (ref) v_u_7, (copy) p_u_12
		local v14 = v_u_7.inputToControlTypeMap[p13]
		if v14 then
			p_u_12.props.dispatchSetControlLayout(v14)
		end
	end)
end
function v9.willUnmount(p15) -- name: willUnmount
	if p15.inputChangedConnection then
		p15.inputChangedConnection:Disconnect()
	end
end
return v5.UNSTABLE_connect2(nil, function(p_u_16)
	-- upvalues: (copy) v_u_8
	return {
		["dispatchSetControlLayout"] = function(p17) -- name: dispatchSetControlLayout
			-- upvalues: (copy) p_u_16, (ref) v_u_8
			p_u_16(v_u_8(p17))
		end
	}
end)(v9)