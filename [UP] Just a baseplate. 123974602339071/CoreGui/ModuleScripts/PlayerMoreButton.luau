-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PlayerMoreButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v5 = v2.t
local v_u_6 = v4.Core.Style.withStyle
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Flags.FFlagLuaMenuPerfImprovements)
local v_u_9 = require(v7.Resources.Assets)
local v_u_10 = v4.Core.ImageSet.ImageSetButton
local v11 = v_u_3.PureComponent:extend("MoreButton")
v11.validateProps = v5.strictInterface({
	["onActivated"] = v5.callback,
	["LayoutOrder"] = v5.integer,
	["userId"] = v_u_8 and v5.number or nil
})
function v11.init(p_u_12) -- name: init
	-- upvalues: (copy) v_u_8
	if v_u_8 then
		function p_u_12.onActivated()
			-- upvalues: (copy) p_u_12
			p_u_12.props.onActivated(p_u_12.props.userId)
		end
	end
end
function v11.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_3, (copy) v_u_10, (copy) v_u_9
	return v_u_6(function(p14)
		-- upvalues: (copy) p_u_13, (ref) v_u_8, (ref) v_u_3, (ref) v_u_10, (ref) v_u_9
		local v15 = p_u_13.props.onActivated
		if v_u_8 then
			v15 = p_u_13.props.onActivated and p_u_13.onActivated or nil
		end
		return v_u_3.createElement(v_u_10, {
			["Size"] = UDim2.new(0, 36, 0, 36),
			["BackgroundTransparency"] = 1,
			["Image"] = v_u_9.Images.MoreActions,
			["ImageColor3"] = p14.Theme.IconEmphasis.Color,
			["LayoutOrder"] = p_u_13.props.LayoutOrder,
			[v_u_3.Event.Activated] = v15
		})
	end)
end
return v11