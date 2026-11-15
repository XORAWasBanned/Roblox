-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ZonePortal
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.t
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
local v11 = script.Parent.Parent
local v12 = require(v11.Resources.Constants)
local v13 = require(v11.Enums.Direction)
local v_u_14 = require(v11.Actions.SetCurrentZone)
local v15 = v12.Zone.PortalSize
local v_u_16 = {
	[v13.Up] = {
		["size"] = UDim2.new(1, 0, 0, v15),
		["position"] = UDim2.new(0, 0, 0, 0)
	},
	[v13.Down] = {
		["size"] = UDim2.new(1, 0, 0, v15),
		["position"] = UDim2.new(0, 0, 1, -v15)
	},
	[v13.Left] = {
		["size"] = UDim2.new(0, v15, 1, 0),
		["position"] = UDim2.new(0, 0, 0, 0)
	},
	[v13.Right] = {
		["size"] = UDim2.new(0, v15, 1, 0),
		["position"] = UDim2.new(1, -v15, 0, 0)
	}
}
local v17 = v_u_3.PureComponent:extend("ZonePortal")
v17.validateProps = v5.strictInterface({
	["targetZone"] = v5.number,
	["direction"] = v13.isEnumValue,
	["setCurrentZone"] = v5.optional(v5.callback)
})
function v17.render(p_u_18) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_9, (copy) v_u_3, (copy) v_u_10
	local v_u_19 = v_u_16[p_u_18.props.direction]
	return v_u_9(function(p20)
		-- upvalues: (ref) v_u_3, (copy) v_u_19, (ref) v_u_10, (copy) p_u_18
		return v_u_3.createElement("Frame", {
			["Size"] = v_u_19.size,
			["Position"] = v_u_19.position,
			["BackgroundTransparency"] = 1,
			["Selectable"] = true,
			["ZIndex"] = 2147483647,
			["SelectionImageObject"] = p20(v_u_10.Invisible),
			[v_u_3.Event.SelectionGained] = function()
				-- upvalues: (ref) p_u_18
				p_u_18.props.setCurrentZone(p_u_18.props.targetZone)
			end
		})
	end)
end
return v4.UNSTABLE_connect2(nil, function(p_u_21)
	-- upvalues: (copy) v_u_14
	return {
		["setCurrentZone"] = function(p22) -- name: setCurrentZone
			-- upvalues: (copy) p_u_21, (ref) v_u_14
			return p_u_21(v_u_14(p22))
		end
	}
end)(v17)