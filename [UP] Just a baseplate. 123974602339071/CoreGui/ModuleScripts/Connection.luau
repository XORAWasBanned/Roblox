-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Connection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.ContextActionsBinder)
local v4 = v_u_2.PureComponent:extend("Connection")
function v4.render(_) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.createFragment({
		["ContextActionsBinder"] = v_u_2.createElement(v_u_3)
	})
end
return v4