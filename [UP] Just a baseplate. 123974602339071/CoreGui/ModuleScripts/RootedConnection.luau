-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.RootedConnection
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v_u_3.PureComponent:extend("RootedConnection")
v5.validateProps = v4.strictInterface({
	["render"] = v4.callback
})
function v5.init(p_u_6) -- name: init
	-- upvalues: (copy) v_u_3
	p_u_6.state = {
		["isRooted"] = false
	}
	p_u_6.rootRef = v_u_3.createRef()
	function p_u_6.onAncestryChanged(p7)
		-- upvalues: (copy) p_u_6
		if p7:IsDescendantOf(game) then
			p_u_6:setState({
				["isRooted"] = true
			})
		end
	end
end
function v5.render(p8) -- name: render
	-- upvalues: (copy) v_u_3
	local v9 = v_u_3.createFragment
	local v10 = {
		["Content"] = p8.props.render(p8.state.isRooted),
		["Folder"] = v_u_3.createElement("Folder", {
			[v_u_3.Event.AncestryChanged] = p8.onAncestryChanged,
			[v_u_3.Ref] = p8.rootRef
		})
	}
	return v9(v10)
end
function v5.didMount(p11) -- name: didMount
	if p11.rootRef:getValue():IsDescendantOf(game) then
		p11:setState({
			["isRooted"] = true
		})
	end
end
return v5