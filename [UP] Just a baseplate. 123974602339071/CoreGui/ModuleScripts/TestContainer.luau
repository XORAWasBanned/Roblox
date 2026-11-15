-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Test.TestContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Packages.Rodux)
local v_u_4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent
local v6 = v5.Parent
local v_u_7 = require(v5.Reducers.InspectAndBuyReducer)
local v_u_8 = require(v5.Constants)
local v_u_9 = require(v5.CompactView)
local v_u_10 = require(v5.WideView)
local v_u_11 = require(v6.Common.renderWithCoreScriptsStyleProvider)
local v_u_12 = require(v5.Components.InspectAndBuyContext)
local v13 = v_u_2.Component:extend("TestContainer")
function v13.init(p14) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	p14.store = p14.props.overrideStore or v_u_3.Store.new(v_u_7, {}, { v_u_3.thunkMiddleware })
	p14.views = {}
	p14.views[v_u_8.View.Compact] = v_u_9
	p14.views[v_u_8.View.Wide] = v_u_10
end
function v13.render(p15) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_4, (copy) v_u_11
	local v16 = 0
	for _, _ in p15.props[v_u_2.Children] do
		v16 = v16 + 1
	end
	local v17 = v16 > 0
	assert(v17, "TestContainer: no children provided, nothing will be tested")
	return v_u_2.createElement(v_u_12.Provider, {
		["value"] = p15.views
	}, { v_u_2.createElement(v_u_4.StoreProvider, {
			["store"] = p15.store
		}, {
			["ThemeProvider"] = v_u_11({
				["InspectMenu"] = v_u_2.createElement("ScreenGui", {}, p15.props[v_u_2.Children])
			})
		}) })
end
return v13