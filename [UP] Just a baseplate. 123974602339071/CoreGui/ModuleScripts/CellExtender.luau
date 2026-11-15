-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.CellExtender
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.React)
local v4 = require(v1.Packages.t)
local v5 = script.Parent.Parent.Parent
local v6 = require(v5.createShallowEqualAndTables)
local v7 = require(v5.Flags.FFlagPlayerListReduceRerenders)
local v8 = v_u_2.PureComponent:extend("CellExtender")
local v9 = v4.strictInterface
local v10 = {
	["layoutOrder"] = v4.integer,
	["size"] = v4.UDim2,
	["backgroundStyle"] = v4.strictInterface({
		["Color"] = v4.Color3,
		["Transparency"] = v4.number
	}),
	["overlayStyle"] = v4.strictInterface({
		["Color"] = v4.Color3,
		["Transparency"] = v4.number
	}),
	["doubleOverlay"] = v4.boolean
}
v8.validateProps = v9(v10)
function v8.render(p11) -- name: render
	-- upvalues: (copy) v_u_2
	local v12 = v_u_2.createElement
	local v13 = {
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = p11.props.layoutOrder,
		["Size"] = p11.props.size,
		["BackgroundTransparency"] = p11.props.backgroundStyle.Transparency,
		["BackgroundColor3"] = p11.props.backgroundStyle.Color
	}
	local v14 = {
		["DoubleOverLay"] = v_u_2.createElement("Frame", {
			["ZIndex"] = 1,
			["Visible"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Visible"] = p11.props.doubleOverlay,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = p11.props.overlayStyle.Transparency,
			["BackgroundColor3"] = p11.props.overlayStyle.Color
		}),
		["OverlayFrame"] = v_u_2.createElement("Frame", {
			["ZIndex"] = 2,
			["Size"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = p11.props.overlayStyle.Transparency,
			["BackgroundColor3"] = p11.props.overlayStyle.Color
		})
	}
	return v12("Frame", v13, v14)
end
if v7 then
	return v3.memo(v8, v6({ "backgroundStyle" }))
else
	return v8
end