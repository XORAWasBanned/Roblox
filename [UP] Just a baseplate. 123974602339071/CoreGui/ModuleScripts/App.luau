-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.App
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(script.Parent.BubbleChatBillboards)
local v6 = v_u_2.Component:extend("App")
v6.validateProps = v3.strictInterface({
	["store"] = v3.table
})
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	return v_u_2.createElement(v_u_4.StoreProvider, {
		["store"] = p7.props.store
	}, {
		["BubbleChatBillboards"] = v_u_2.createElement(v_u_5)
	})
end
return v6