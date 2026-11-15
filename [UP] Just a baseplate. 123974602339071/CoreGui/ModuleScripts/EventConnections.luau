-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.EventConnections
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.PlayerServiceConnector)
local v_u_4 = require(script.Parent.CoreGuiConnector)
local v_u_5 = require(script.Parent.SocialConnector)
local v_u_6 = require(script.Parent.GuiServiceConnector)
local v_u_7 = require(script.Parent.UserInputServiceConnector)
local v_u_8 = require(script.Parent.ScreenSizeConnector)
local v9 = v_u_2.PureComponent:extend("EventConnections")
function v9.render(_) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	return v_u_2.createFragment({
		["PlayerServiceConnector"] = v_u_2.createElement(v_u_3),
		["CoreGuiConnector"] = v_u_2.createElement(v_u_4),
		["SocialConnector"] = v_u_2.createElement(v_u_5),
		["GuiServiceConnector"] = v_u_2.createElement(v_u_6),
		["UserInputServiceConnector"] = v_u_2.createElement(v_u_7),
		["ScreenSizeConnector"] = v_u_2.createElement(v_u_8)
	})
end
return v9