-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.ExternalEventConnection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Roact
local v3 = v_u_2.Component:extend("ExternalEventConnection")
function v3.init(p4) -- name: init
	p4.connection = nil
end
function v3.render(p5) -- name: render
	-- upvalues: (copy) v_u_2
	return v_u_2.oneChild(p5.props[v_u_2.Children])
end
function v3.didMount(p6) -- name: didMount
	p6.connection = p6.props.event:Connect(p6.props.callback)
end
function v3.didUpdate(p7, p8) -- name: didUpdate
	if p7.props.event ~= p8.event or p7.props.callback ~= p8.callback then
		p7.connection:Disconnect()
		p7.connection = p7.props.event:Connect(p7.props.callback)
	end
end
function v3.willUnmount(p9) -- name: willUnmount
	if p9.connection then
		p9.connection:Disconnect()
		p9.connection = nil
	end
end
return v3