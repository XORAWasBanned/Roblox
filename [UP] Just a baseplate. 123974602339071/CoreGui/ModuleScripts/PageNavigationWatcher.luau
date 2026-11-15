-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PageNavigationWatcher
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.t
local v6 = v_u_3.PureComponent:extend("PageNavigationWatcher")
v6.validateProps = v5.strictInterface({
	["desiredPage"] = v5.string,
	["onNavigateTo"] = v5.optional(v5.callback),
	["onNavigateAway"] = v5.optional(v5.callback),
	["currentPage"] = v5.string,
	["menuOpen"] = v5.boolean
})
function v6.init(p7, p8) -- name: init
	p7:setState({
		["lastPage"] = p8.currentPage,
		["lastMenuOpen"] = p8.menuOpen
	})
end
function v6.render(p9) -- name: render
	-- upvalues: (copy) v_u_3
	return v_u_3.createFragment(p9.props[v_u_3.Children])
end
function v6.didUpdate(p10) -- name: didUpdate
	local v11 = p10.state.lastPage
	local v12 = p10.state.lastMenuOpen
	local v13 = p10.props.currentPage
	local v14 = p10.props.menuOpen
	if v11 ~= v13 or v12 ~= v14 then
		p10:setState({
			["lastPage"] = v13,
			["lastMenuOpen"] = v14
		})
		if v13 == p10.props.desiredPage and (v14 and p10.props.onNavigateTo ~= nil) then
			p10.props.onNavigateTo()
			return
		end
		if v11 == p10.props.desiredPage and (v12 and p10.props.onNavigateAway ~= nil) then
			p10.props.onNavigateAway()
			return
		end
		if v12 and (not v14 and p10.props.onNavigateAway ~= nil) then
			p10.props.onNavigateAway()
		end
	end
end
return v4.UNSTABLE_connect2(function(p15)
	return {
		["currentPage"] = p15.menuPage,
		["menuOpen"] = p15.isMenuOpen
	}
end)(v6)