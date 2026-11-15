-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotHighlighter
local v_u_1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.UIBlox)
local v_u_4 = require(v2.Packages.React)
local v_u_5 = v3.Core.ImageSet.ImageSetButton
local v_u_6 = v3.App.ImageSet.Images
return function(p_u_7) -- name: ScreenshotHighlighter
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v8 = v_u_1.AbsoluteSize
	local v_u_9 = (v8.Y > v8.X and v8.X or v8.Y) / 5
	local v_u_10, v_u_11 = v_u_4.useState(false)
	local function v_u_17(p12, p13)
		-- upvalues: (copy) p_u_7, (copy) v_u_9
		local v14 = (Vector2.new(p13.X, p13.Y) - p12.AbsolutePosition) / p12.AbsoluteSize
		local v15 = p_u_7.annotationPoints
		table.insert(v15, v14)
		local v16
		if p12.AbsoluteSize.X > p12.AbsoluteSize.Y then
			v16 = p12.AbsoluteSize.X
		else
			v16 = p12.AbsoluteSize.Y
		end
		p_u_7.setAnnotationCircleRadius(v_u_9 * 0.5 / v16)
		p_u_7.setAnnotationAreaDimensions(p12.AbsoluteSize.X, p12.AbsoluteSize.Y)
		p_u_7.handleAnnotationPoints(p_u_7.annotationPoints)
	end
	local v18 = {}
	local function v21(p19, p20)
		-- upvalues: (copy) p_u_7, (copy) v_u_11, (copy) v_u_17
		if p20.UserInputState == Enum.UserInputState.Begin and (p20.UserInputType == Enum.UserInputType.Touch or p20.UserInputType == Enum.UserInputType.MouseButton1) and #p_u_7.annotationPoints < 25 then
			v_u_11(true)
			v_u_17(p19, p20.Position)
		end
	end
	local function v22(_, _) end
	local function v23(_, _)
		-- upvalues: (copy) v_u_10, (copy) v_u_11
		if v_u_10 then
			v_u_11(false)
		end
	end
	for v24, v25 in ipairs(p_u_7.annotationPoints) do
		v18["point" .. v24] = v_u_4.createElement("Frame", {
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = UDim2.fromScale(v25.X, v25.Y),
			["Size"] = UDim2.fromOffset(v_u_9, v_u_9)
		}, {
			["Border"] = v_u_4.createElement(v_u_5, {
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = 0,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromOffset(v_u_9, v_u_9),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Image"] = v_u_6["component_assets/circle_49_stroke_1"],
				["ImageColor3"] = Color3.fromHex("#3CF3E9")
			}),
			["Background"] = v_u_4.createElement(v_u_5, {
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = 0.6,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromOffset(v_u_9, v_u_9),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Image"] = v_u_6["component_assets/circle_49"],
				["ImageColor3"] = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return v_u_4.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1),
		[v_u_4.Event.InputBegan] = v21,
		[v_u_4.Event.InputChanged] = v22,
		[v_u_4.Event.InputEnded] = v23,
		["ZIndex"] = 3
	}, v18)
end