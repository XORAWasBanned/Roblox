-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SideNavigation.HomeButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v5 = v2.UIBlox
local v_u_6 = v5.Core.ImageSet.ImageSetButton
local v7 = v5.App.ImageSet.Images
local v8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v_u_9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v_u_9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v5.App.SelectionImage.CursorKind
end
local v_u_12 = v8.Image
local v_u_13 = v_u_9 and "icons/menu/home_on" or v7["icons/menu/home_on"]
local v_u_14 = v_u_9 and "icons/menu/home_off" or v7["icons/menu/home_off"]
local v15 = v_u_4.PureComponent:extend("HomeButton")
v15.validateProps = v3.strictInterface({
	["on"] = v3.optional(v3.boolean),
	["anchorPoint"] = v3.optional(v3.Vector2),
	["position"] = v3.optional(v3.UDim2),
	["layoutOrder"] = v3.optional(v3.integer),
	["onActivated"] = v3.callback
})
v15.defaultProps = {
	["on"] = false
}
function v15.renderWithSelectionCursor(p16, p17) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_4, (copy) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_6
	local v18 = p16.props.on and v_u_13 or v_u_14
	local v19 = v_u_4.createElement
	local v20 = "Frame"
	local v21 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["AnchorPoint"] = p16.props.anchorPoint,
		["Position"] = p16.props.position,
		["Size"] = UDim2.fromOffset(64, 64),
		["LayoutOrder"] = p16.props.layoutOrder
	}
	local v22 = {}
	local v23
	if v_u_9 then
		v23 = v_u_4.createElement(v_u_12, {
			["Image"] = nil,
			["tag"] = "position-center-center anchor-center-center size-800",
			["backgroundStyle"] = nil,
			["selection"] = nil,
			["onActivated"] = nil,
			["Image"] = v18,
			["backgroundStyle"] = {
				["Transparency"] = 1
			},
			["selection"] = {
				["SelectionImageObject"] = p17(v_u_11.RoundedRect)
			},
			["onActivated"] = p16.props.onActivated
		})
	else
		v23 = v_u_4.createElement(v_u_6, {
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["BackgroundTransparency"] = 1,
			["Image"] = v18,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Size"] = UDim2.fromOffset(32, 32),
			["SelectionImageObject"] = p17(v_u_11.RoundedRect),
			[v_u_4.Event.Activated] = p16.props.onActivated
		})
	end
	v22.HomeButton = v23
	return v19(v20, v21, v22)
end
function v15.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_10
	return v_u_10(function(p25)
		-- upvalues: (copy) p_u_24
		return p_u_24:renderWithSelectionCursor(p25)
	end)
end
return v15