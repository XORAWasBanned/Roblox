-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Grid.Grid
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.SignalsReact)
local v_u_5 = require(v1.CanvasContext)
local v_u_6 = require(v1.Types)
local v_u_7 = require(v1.Components.GridLine)
local v_u_8 = require(v1.Util.GridUtil)
local v_u_9 = require(v1.Util.StyleUtil)
function Grid(p10) -- name: Grid
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9
	local v11 = v_u_3.useContext(v_u_5)
	v_u_4.useSignalState(v11.viewportRectGetter)
	local v12 = p10.ZIndex or -1
	local v13 = not p10.XAxis and {} or v_u_8.getValues(v_u_6.AXIS_X, p10.XAxis, v11)
	local v14 = not p10.YAxis and {} or v_u_8.getValues(v_u_6.AXIS_Y, p10.YAxis, v11)
	local v15 = not p10.XAxisMinor and {} or v_u_8.getValues(v_u_6.AXIS_X, p10.XAxisMinor, v11, v13)
	local v16 = not p10.YAxisMinor and {} or v_u_8.getValues(v_u_6.AXIS_Y, p10.YAxisMinor, v11, v14)
	local v17 = {}
	for _, v18 in v13 do
		v17[("X%*"):format(v18)] = v_u_3.createElement(v_u_7, {
			["Orientation"] = "Vertical",
			["Position"] = nil,
			["Tag"] = nil,
			["Color3"] = nil,
			["Thickness"] = nil,
			["Transparency"] = nil,
			["Position"] = v18,
			["Tag"] = p10.Tag,
			["Color3"] = v_u_9.GRID_COLOR3,
			["Thickness"] = v_u_9.GRID_THICKNESS,
			["Transparency"] = v_u_9.GRID_TRANSPARENCY
		})
	end
	for _, v19 in v15 do
		v17[("Xm%*"):format(v19)] = v_u_3.createElement(v_u_7, {
			["Orientation"] = "Vertical",
			["Position"] = nil,
			["Tag"] = nil,
			["Color3"] = nil,
			["Thickness"] = nil,
			["Transparency"] = nil,
			["Position"] = v19,
			["Tag"] = p10.Tag,
			["Color3"] = v_u_9.GRID_COLOR3_MINOR,
			["Thickness"] = v_u_9.GRID_THICKNESS_MINOR,
			["Transparency"] = v_u_9.GRID_TRANSPARENCY_MINOR
		})
	end
	for _, v20 in v14 do
		v17[("Y%*"):format(v20)] = v_u_3.createElement(v_u_7, {
			["Orientation"] = "Horizontal",
			["Position"] = nil,
			["Tag"] = nil,
			["Color3"] = nil,
			["Thickness"] = nil,
			["Transparency"] = nil,
			["Position"] = v20,
			["Tag"] = p10.Tag,
			["Color3"] = v_u_9.GRID_COLOR3,
			["Thickness"] = v_u_9.GRID_THICKNESS,
			["Transparency"] = v_u_9.GRID_TRANSPARENCY
		})
	end
	for _, v21 in v16 do
		v17[("Ym%*"):format(v21)] = v_u_3.createElement(v_u_7, {
			["Orientation"] = "Horizontal",
			["Position"] = nil,
			["Tag"] = nil,
			["Color3"] = nil,
			["Thickness"] = nil,
			["Transparency"] = nil,
			["Position"] = v21,
			["Tag"] = p10.Tag,
			["Color3"] = v_u_9.GRID_COLOR3_MINOR,
			["Thickness"] = v_u_9.GRID_THICKNESS_MINOR,
			["Transparency"] = v_u_9.GRID_TRANSPARENCY_MINOR
		})
	end
	return v_u_3.createElement("Frame", {
		["Size"] = nil,
		["ZIndex"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.fromScale(1, 1),
		["ZIndex"] = v12
	}, v17)
end
return Grid