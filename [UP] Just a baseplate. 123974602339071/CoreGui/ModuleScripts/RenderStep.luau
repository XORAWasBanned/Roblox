-- Path: CoreGui.RobloxGui.Modules.Shell.Components.RenderStep
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.Roact).Component:extend("RenderStep")
function v3.render(_) -- name: render
	return nil
end
function v3.didMount(p4) -- name: didMount
	-- upvalues: (copy) v_u_1
	v_u_1:BindToRenderStep(p4.props.name, p4.props.priority, p4.props.callback)
end
function v3.didUpdate(p5, p6) -- name: didUpdate
	-- upvalues: (copy) v_u_1
	if p5.props.callback ~= p6.callback or p5.props.name ~= p6.name then
		v_u_1:UnbindFromRenderStep(p6.name)
		v_u_1:BindToRenderStep(p5.props.name, p5.props.priority, p5.props.callback)
	end
end
function v3.willUnmount(p7) -- name: willUnmount
	-- upvalues: (copy) v_u_1
	v_u_1:UnbindFromRenderStep(p7.props.name)
end
return v3