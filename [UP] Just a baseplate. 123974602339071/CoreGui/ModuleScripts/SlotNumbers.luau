-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.SlotNumbers
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Constants)
local v6 = v_u_2.PureComponent:extend("SlotNumbers")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v8 = v_u_5.Layouts[p7.props.layout]
	local v9 = {}
	for v10 = 1, v_u_5.EmotesPerPage do
		local v11 = 360 / v_u_5.EmotesPerPage * (v10 - 1) + v_u_5.SegmentsStartRotation
		local v12 = v_u_5.InnerCircleSizeRatio / 2
		local v13 = v_u_5.SlotNumberSize
		local v14 = v13 / 2
		local v15 = math.rad(v11)
		local v16 = math.cos(v15)
		local v17 = v12 * v16
		local v18 = v14 * v16
		local v19 = 0.5 + v17 + v18
		local v20 = math.rad(v11)
		local v21 = math.sin(v20)
		local v22 = v12 * v21
		local v23 = v14 * v21
		local v24 = 0.5 + v22 + v23
		local v25 = v_u_2.createElement
		local v26 = {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["TextScaled"] = true,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["ZIndex"] = 2,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(v19, 0, v24, 0),
			["Size"] = UDim2.new(v13, 0, v13, 0),
			["TextSize"] = v8.SlotNumberTextSize,
			["TextColor3"] = v_u_5.Colors.White,
			["Text"] = v10,
			["Font"] = v8.SlotNumberFont
		}
		local v27 = {
			["TextSizeConstraint"] = v_u_2.createElement("UITextSizeConstraint", {
				["MaxTextSize"] = v8.SlotNumberTextSize
			})
		}
		v9[v10] = v25("TextLabel", v26, v27)
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, v9)
end
return v3.connect(function(p28) -- name: mapStateToProps
	return {
		["layout"] = p28.layout
	}
end, nil)(v6)