-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.LoadingFriendsPage
local v1 = game:GetService("CorePackages")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = require(v1.Workspace.Packages.AppBlox).LoadingBar
local v_u_3 = require(v1.Packages.Roact)
local v4 = v_u_3.PureComponent:extend("LoadingFriendsPage")
function v4.render(p5) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = p5.props.LayoutOrder
	local v7 = p5.props.ZIndex
	local v8 = 0
	local v9 = v_u_3.createElement
	local v10 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["LayoutOrder"] = v6,
		["ZIndex"] = v7
	}
	local v11 = {
		["listLayout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v12 = v_u_3.createElement
	local v13 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, 70, 0, 16)
	}
	v8 = v8 + 1
	v13.LayoutOrder = v8
	v13.ZIndex = v7
	local v14 = {
		["loadingBar"] = v_u_3.createElement(v_u_2, {
			["ZIndex"] = v7
		})
	}
	v11.loadingIndicator = v12("Frame", v13, v14)
	return v9("Frame", v10, v11)
end
return v4