-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.RectangleButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_4 = require(v3.Settings.Theme)
local v5 = v_u_2.PureComponent:extend("RectangleButton")
v5.defaultProps = {
	["visible"] = true
}
function v5.init(p6) -- name: init
	p6.state = {
		["isHovering"] = false
	}
end
function v5.render(p_u_7) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v8 = p_u_7.props.size
	local v9 = p_u_7.props.position
	local v10 = p_u_7.props.anchorPoint
	local v11 = p_u_7.props.layoutOrder
	local v12 = p_u_7.props.zIndex
	local v_u_13 = p_u_7.props.onClick
	local v14 = p_u_7.props.visible
	local v15 = p_u_7.props[v_u_2.Children] or {}
	v15.Border = v_u_2.createElement("UIStroke", {
		["Color"] = v_u_4.color("DefaultButtonStroke"),
		["Transparency"] = v_u_4.transparency("DefaultButtonStroke"),
		["Thickness"] = v_u_4.DefaultStokeThickness
	})
	v15.UICorner = v_u_2.createElement("UICorner", {
		["CornerRadius"] = v_u_4.DefaultCornerRadius
	})
	local v16 = v_u_2.createElement
	local v17 = {
		["BackgroundTransparency"] = 1,
		["Image"] = "",
		["Selectable"] = false,
		["Size"] = v8,
		["Position"] = v9,
		["AnchorPoint"] = v10,
		["LayoutOrder"] = v11,
		["ZIndex"] = v12,
		["Visible"] = v14,
		[v_u_2.Event.InputBegan] = function()
			-- upvalues: (copy) p_u_7
			p_u_7:setState({
				["isHovering"] = true
			})
		end,
		[v_u_2.Event.InputEnded] = function()
			-- upvalues: (copy) p_u_7
			p_u_7:setState({
				["isHovering"] = false
			})
		end,
		[v_u_2.Event.Activated] = function()
			-- upvalues: (copy) v_u_13, (copy) p_u_7
			if v_u_13 then
				p_u_7:setState({
					["isHovering"] = false
				})
				v_u_13()
			end
		end
	}
	local v18 = {
		["ButtonBackgroundUIBlox"] = v_u_2.createElement("ImageLabel", {
			["BackgroundColor3"] = v_u_4.color(p_u_7.state.isHovering and "DefaultButtonHover" or "DefaultButton"),
			["BackgroundTransparency"] = v_u_4.transparency(p_u_7.state.isHovering and "DefaultButtonHover" or "DefaultButton"),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ZIndex"] = v12
		}, v15)
	}
	return v16("ImageButton", v17, v18)
end
return v5