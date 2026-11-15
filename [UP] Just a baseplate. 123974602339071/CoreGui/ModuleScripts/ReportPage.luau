-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Components.PageNavigationWatcher)
local v_u_8 = require(v6.Components.Page)
local v_u_9 = require(script.ReportList)
local function v_u_12() -- name: getReportablePlayers
	-- upvalues: (copy) v_u_1
	local v10 = {}
	for _, v11 in ipairs(v_u_1:GetPlayers()) do
		if v11 == v_u_1.LocalPlayer then
			continue
		end
		table.insert(v10, v11)
	end
	return v10
end
local v13 = v_u_4.PureComponent:extend("ReportPage")
v13.validateProps = v5.strictInterface({
	["pageTitle"] = v5.string
})
function v13.init(p14) -- name: init
	-- upvalues: (copy) v_u_12
	p14:setState({
		["players"] = v_u_12()
	})
end
function v13.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12
	local v16 = v_u_4.createElement
	local v17 = v_u_8
	local v18 = {
		["pageTitle"] = p_u_15.props.pageTitle
	}
	local v19 = {
		["PlayerList"] = v_u_4.createElement(v_u_9, {
			["players"] = p_u_15.state.players
		})
	}
	local v20 = {
		["desiredPage"] = "Report",
		["onNavigateTo"] = nil,
		["onNavigateTo"] = function() -- name: onNavigateTo
			-- upvalues: (copy) p_u_15, (ref) v_u_12
			p_u_15:setState({
				["players"] = v_u_12()
			})
		end
	}
	v19.Watcher = v_u_4.createElement(v_u_7, v20)
	return v16(v17, v18, v19)
end
return v13