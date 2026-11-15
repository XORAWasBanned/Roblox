-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.EventConnection
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Roact).Component:extend("EventConnection")
function v2.init(p3) -- name: init
	p3.connection = nil
end
function v2.didMount(p4) -- name: didMount
	p4.connection = p4.props.event:Connect(p4.props.callback)
end
function v2.render(_) -- name: render
	return nil
end
function v2.didUpdate(p5, p6) -- name: didUpdate
	if p5.props.event ~= p6.event or p5.props.callback ~= p6.callback then
		p5.connection:Disconnect()
		p5.connection = p5.props.event:Connect(p5.props.callback)
	end
end
function v2.willUnmount(p7) -- name: willUnmount
	if p7.connection then
		p7.connection:Disconnect()
		p7.connection = nil
	end
end
return v2