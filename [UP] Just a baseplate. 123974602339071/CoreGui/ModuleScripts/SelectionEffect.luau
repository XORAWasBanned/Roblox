-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.SelectionEffect
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Constants)
local v6 = v_u_2.PureComponent:extend("SelectionEffect")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v8 = v_u_5.Layouts[p7.props.layout]
	local v9 = p7.props.emotesWheel.focusedSegmentIndex
	local v10 = 360 / v_u_5.EmotesPerPage * (v9 - 1) + v_u_5.SegmentsStartRotation
	local v11 = v_u_5.InnerCircleSizeRatio / 2
	local v12 = 360 / v_u_5.EmotesPerPage
	local v13 = v_u_5.InnerCircleSizeRatio
	local v14 = v12 / 2
	local v15 = math.rad(v14)
	local v16 = v13 * math.sin(v15)
	return v_u_2.createElement("Frame", {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Rotation"] = nil,
		["Visible"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Rotation"] = v10,
		["Visible"] = v9 ~= 0
	}, {
		["SelectedLine"] = v_u_2.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ZIndex"] = 4,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(0.5 + v11, -v8.SelectedLinePadding, 0.5, 0),
			["Size"] = UDim2.new(1, 0, v16, -v8.SelectedLinePadding),
			["Image"] = v8.SelectedLine
		}, {
			["AsspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = v8.SelectedLineImageSize.X / v8.SelectedLineImageSize.Y
			})
		})
	})
end
return v3.connect(function(p17) -- name: mapStateToProps
	return {
		["emotesWheel"] = p17.emotesWheel,
		["layout"] = p17.layout
	}
end, nil)(v6)