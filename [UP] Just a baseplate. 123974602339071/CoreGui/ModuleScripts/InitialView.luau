-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.InitialView
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v2.Components.PlayerNameLabel)
local v_u_6 = require(v2.Components.AvatarHeadShot)
local v_u_7 = require(v2.Components.AssetList)
local v_u_8 = require(v2.Components.InspectAndBuyContext)
local v9 = v_u_3.PureComponent:extend("InitialView")
function v9.render(p10) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	local v_u_11 = p10.props.view
	local v_u_12 = p10.props.detailsInformation
	local v21 = {
		["render"] = function(p13) -- name: render
			-- upvalues: (copy) v_u_11, (ref) v_u_3, (copy) v_u_12, (ref) v_u_6, (ref) v_u_5, (ref) v_u_7
			local v14 = p13[v_u_11]
			local v15 = v_u_3.createElement
			local v16 = {
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["ScrollBarThickness"] = 0,
				["ScrollingDirection"] = nil,
				["Visible"] = nil,
				["Selectable"] = false,
				["Position"] = UDim2.new(0, v14.BorderPaddingSize, 0, 10),
				["Size"] = UDim2.new(1, -(2 * v14.BorderPaddingSize), 1, -36),
				["ScrollingDirection"] = Enum.ScrollingDirection.Y,
				["Visible"] = not v_u_12.viewingDetails
			}
			local v17 = {
				["UIListLayout"] = v_u_3.createElement("UIListLayout", {
					["Padding"] = UDim.new(0, 15),
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				})
			}
			local v18 = v_u_3.createElement
			local v19 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, v14.TopSizeY)
			}
			local v20 = {
				["UIListLayout"] = v_u_3.createElement("UIListLayout", {
					["Padding"] = UDim.new(0, 10),
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Horizontal
				}),
				["AvatarHeadShot"] = v_u_3.createElement(v_u_6),
				["PlayerNameLabel"] = v_u_3.createElement(v_u_5)
			}
			v17.Top = v18("Frame", v19, v20)
			v17.AssetList = v_u_3.createElement(v_u_7)
			return v15("ScrollingFrame", v16, v17)
		end
	}
	return v_u_3.createElement(v_u_8.Consumer, v21)
end
return v4.UNSTABLE_connect2(function(p22, _)
	return {
		["view"] = p22.view,
		["detailsInformation"] = p22.detailsInformation
	}
end)(v9)