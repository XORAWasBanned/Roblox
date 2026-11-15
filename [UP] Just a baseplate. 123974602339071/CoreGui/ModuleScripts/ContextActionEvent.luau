-- Path: CoreGui.RobloxGui.Modules.Shell.Components.ContextActionEvent
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.Roact).Component:extend("ContextActionEvent")
function v3.render(_) -- name: render
	return nil
end
function v3.didMount(p4) -- name: didMount
	-- upvalues: (copy) v_u_1
	if p4.props.actionPriority then
		local v5 = v_u_1
		local v6 = p4.props.name
		local v7 = p4.props.callback
		local v8 = 2000 + p4.props.actionPriority
		local v9 = p4.props.binds
		v5:BindCoreActionAtPriority(v6, v7, false, v8, unpack(v9))
	else
		local v10 = v_u_1
		local v11 = p4.props.name
		local v12 = p4.props.callback
		local v13 = p4.props.binds
		v10:BindCoreAction(v11, v12, false, unpack(v13))
	end
end
function v3.didUpdate(p14, p15) -- name: didUpdate
	-- upvalues: (copy) v_u_1
	if p14.props.callback ~= p15.callback or p14.props.name ~= p15.name then
		v_u_1:UnbindCoreAction(p15.name)
		if p14.props.actionPriority then
			local v16 = v_u_1
			local v17 = p14.props.name
			local v18 = p14.props.callback
			local v19 = 2000 + p14.props.actionPriority
			local v20 = p14.props.binds
			v16:BindCoreActionAtPriority(v17, v18, false, v19, unpack(v20))
			return
		end
		local v21 = v_u_1
		local v22 = p14.props.name
		local v23 = p14.props.callback
		local v24 = p14.props.binds
		v21:BindCoreAction(v22, v23, false, unpack(v24))
	end
end
function v3.willUnmount(p25) -- name: willUnmount
	-- upvalues: (copy) v_u_1
	v_u_1:UnbindCoreAction(p25.props.name)
end
return v3