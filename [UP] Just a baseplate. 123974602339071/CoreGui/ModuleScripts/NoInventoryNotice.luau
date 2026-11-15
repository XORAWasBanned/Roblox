-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.NoInventoryNotice
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Style).AppFonts
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v3.Colors)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v8 = v_u_4.PureComponent:extend("NoInventoryNotice")
function v8.render(p9) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_7
	local v10 = p9.props.locale
	local v11 = p9.props.assets
	local v12 = p9.props.isLoaded
	local v13 = v_u_4.createElement
	local v14 = "Frame"
	local v15 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	if next(v11) ~= nil then
		v12 = false
	end
	v15.Visible = v12
	local v16 = {
		["UIListLayout"] = v_u_4.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 15),
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["NotWearingImage"] = v_u_4.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["Image"] = "rbxasset://textures/ui/InspectMenu/ico_isnt-wearing.png",
			["ImageColor3"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Size"] = UDim2.new(0.25, 0, 0.25, 0),
			["ImageColor3"] = v_u_6.White
		}, {
			["UIAspectRatioConstraint"] = v_u_4.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = 1
			})
		}),
		["NotWearingText"] = v_u_4.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["Font"] = nil,
			["Text"] = nil,
			["TextScaled"] = true,
			["TextColor3"] = nil,
			["TextSize"] = 20,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["TextWrapped"] = true,
			["Size"] = UDim2.new(0.8, 0, 0.3, 0),
			["Font"] = v_u_2.default:getDefault(),
			["Text"] = v_u_7:FormatByKeyForLocale("InGame.InspectMenu.Description.NoInventoryNotice", v10),
			["TextColor3"] = v_u_6.White,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Top
		}, {
			["UITextSizeConstraint"] = v_u_4.createElement("UITextSizeConstraint", {
				["MaxTextSize"] = 20
			})
		})
	}
	return v13(v14, v15, v16)
end
return v5.UNSTABLE_connect2(function(p17, _)
	return {
		["assets"] = p17.assets,
		["locale"] = p17.locale,
		["isLoaded"] = p17.isLoaded
	}
end)(v8)