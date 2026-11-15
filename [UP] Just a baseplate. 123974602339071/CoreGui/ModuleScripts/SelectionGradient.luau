-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.SelectionGradient
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Constants)
local v6 = v_u_2.PureComponent:extend("SelectionGradient")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v8 = v_u_5.Layouts[p7.props.layout]
	local v9 = p7.props.emotesWheel.focusedSegmentIndex
	local v10 = 360 / v_u_5.EmotesPerPage * (v9 - 1) + v_u_5.SegmentsStartRotation
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
		["SelectedGradient"] = v_u_2.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ImageTransparency"] = nil,
			["Image"] = nil,
			["ZIndex"] = 2,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0.5, 0, 1, 0),
			["ImageTransparency"] = v_u_5.GradientTransparency,
			["Image"] = v8.SelectedGradient
		}, {
			["AsspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = v8.SelectedGradientImageSize.X / v8.SelectedGradientImageSize.Y
			}),
			["SizeConstraint"] = v_u_2.createElement("UISizeConstraint", {
				["MaxSize"] = v8.SelectedGradientImageSize
			})
		})
	})
end
return v3.connect(function(p11) -- name: mapStateToProps
	return {
		["emotesWheel"] = p11.emotesWheel,
		["layout"] = p11.layout
	}
end, nil)(v6)