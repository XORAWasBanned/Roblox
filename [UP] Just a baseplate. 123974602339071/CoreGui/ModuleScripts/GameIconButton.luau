-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SideNavigation.GameIconButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v_u_5 = v2.Cryo
local v6 = v2.UIBlox
local v7 = require(v1.Packages.Foundation)
local v8 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_9
if v8 then
	v_u_9 = v7.UNSTABLE.withCursorMigration
else
	v_u_9 = v6.App.SelectionImage.withSelectionCursorProvider
end
local v_u_10
if v8 then
	v_u_10 = v7.Enums.CursorType
else
	v_u_10 = v6.App.SelectionImage.CursorKind
end
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.Components.GameIcon)
local v_u_13 = UDim.new(0, 8)
local v_u_14 = v_u_4.PureComponent:extend("GameIconButton")
v_u_14.validateProps = v3.strictInterface({
	["anchorPoint"] = v3.optional(v3.Vector2),
	["position"] = v3.optional(v3.UDim2),
	["layoutOrder"] = v3.optional(v3.integer),
	["onActivated"] = v3.callback,
	["onSelectionGained"] = v3.optional(v3.callback),
	["onSelectionLost"] = v3.optional(v3.callback),
	["forwardRef"] = v3.optional(v3.table)
})
function v_u_14.renderWithSelectionCursor(p15, p16) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13
	local v17 = v_u_4.createElement
	local v18 = {
		["Text"] = "",
		["AnchorPoint"] = p15.props.anchorPoint,
		["BackgroundTransparency"] = 1,
		["Position"] = p15.props.position,
		["Size"] = UDim2.fromOffset(32, 32),
		["LayoutOrder"] = p15.props.layoutOrder,
		["SelectionImageObject"] = p16(v_u_10.RoundedRect),
		[v_u_4.Event.Activated] = p15.props.onActivated,
		[v_u_4.Event.SelectionGained] = p15.props.onSelectionGained,
		[v_u_4.Event.SelectionLost] = p15.props.onSelectionLost,
		[v_u_4.Ref] = p15.props.forwardRef
	}
	local v19 = {
		["GameIconButton"] = v_u_4.createElement(v_u_12, {
			["gameId"] = nil,
			["iconSize"] = 32,
			["cornerRadius"] = nil,
			["gameId"] = game.GameId,
			["cornerRadius"] = v_u_13
		})
	}
	return v17("TextButton", v18, v19)
end
function v_u_14.render(p_u_20) -- name: render
	-- upvalues: (copy) v_u_9
	return v_u_9(function(p21)
		-- upvalues: (copy) p_u_20
		return p_u_20:renderWithSelectionCursor(p21)
	end)
end
return v_u_4.forwardRef(function(p22, p23)
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_5
	return v_u_4.createElement(v_u_14, v_u_5.Dictionary.join(p22, {
		["forwardRef"] = p23
	}))
end)