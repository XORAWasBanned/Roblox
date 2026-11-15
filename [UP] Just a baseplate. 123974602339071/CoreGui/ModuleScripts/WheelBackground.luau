-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.WheelBackground
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = v4.App.Style.Colors
local v_u_6 = v4.Style.withStyle
local v7 = script.Parent
local v8 = v7.Parent
local v_u_9 = require(v8.Constants)
local v_u_10 = require(v7.SelectionGradient)
local v_u_11 = require(v7.SelectionEffect)
local v_u_12 = require(v7.WheelText)
local v13 = v_u_2.PureComponent:extend("WheelBackground")
function v13.renderContent(p14, p15) -- name: renderContent
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	local v16 = v_u_9.Layouts[p14.props.layout]
	local v17 = v_u_2.createElement
	local v18 = "Folder"
	local v19 = {}
	local v20 = {}
	local v21
	if p15 then
		v21 = v_u_2.createElement("Frame", {
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = v_u_5.Flint:Lerp(Color3.new(0, 0, 0), p15),
			["BackgroundTransparency"] = v_u_9.WheelBackgroundTransparency * p15
		}, { v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0.5, 0)
			}) })
	else
		v21 = v_u_2.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ZIndex"] = 1,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Image"] = v16.CircleBackground
		})
	end
	v20.BackgroundCircleOverlay = v21
	v20.BackgroundGradient = v_u_2.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["SelectionGradient"] = v_u_2.createElement(v_u_10)
	})
	v20.BackgroundImage = v_u_2.createElement("ImageLabel", {
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ZIndex"] = 3,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Image"] = v16.SegmentedCircle
	})
	v20.Selection = v_u_2.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 4,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["SelectionEffect"] = v_u_2.createElement(v_u_11)
	})
	v20.BackgroundText = v_u_2.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 5,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["MiddleText"] = v_u_2.createElement(v_u_12)
	})
	return v17(v18, v19, v20)
end
function v13.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_6
	return v_u_6(function(p23)
		-- upvalues: (copy) p_u_22
		return p_u_22:renderContent(p23.Settings.PreferredTransparency)
	end)
end
return v3.connect(function(p24) -- name: mapStateToProps
	return {
		["layout"] = p24.layout
	}
end, nil)(v13)