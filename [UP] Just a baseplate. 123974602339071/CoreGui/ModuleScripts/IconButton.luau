-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.IconButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Packages.Foundation)
local v_u_6 = v_u_5.Enums.IconSize
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v9 = script.Parent.Parent.Connection
local v_u_10 = require(v9.LayoutValues).WithLayoutValues
local v_u_11 = v4.Core.ImageSet.ImageSetLabel
local v12 = v_u_2.PureComponent:extend("IconButton")
v12.validateProps = v3.strictInterface({
	["size"] = v3.UDim2,
	["position"] = v3.UDim2,
	["backgroundColor"] = v3.Color3,
	["icon"] = v3.union(v3.string, v3.table),
	["showBackground"] = v3.boolean,
	["onActivated"] = v3.optional(v3.callback)
})
function v12.init(p13) -- name: init
	p13.state = {
		["isHovered"] = false,
		["isPressed"] = false
	}
end
function v12.render(p_u_14) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11
	return v_u_10(function(p_u_15)
		-- upvalues: (ref) v_u_7, (copy) p_u_14, (ref) v_u_8, (ref) v_u_2, (ref) v_u_5, (ref) v_u_6, (ref) v_u_11
		return v_u_7(function(p16)
			local v17 = {}
			local v18 = {
				["BackgroundOnHover"] = {
					["Color"] = p16.Color.State.Hover.Color3,
					["Transparency"] = p16.Color.State.Hover.Transparency
				},
				["BackgroundOnPress"] = {
					["Color"] = p16.Color.State.Press.Color3,
					["Transparency"] = p16.Color.State.Press.Transparency
				},
				["IconEmphasis"] = {
					["Color"] = p16.Color.Content.Emphasis.Color3,
					["Transparency"] = p16.Color.Content.Emphasis.Transparency
				}
			}
			v17.Theme = v18
			return v17
		end, function(p19)
			-- upvalues: (ref) p_u_14, (ref) v_u_8, (ref) v_u_2, (copy) p_u_15, (ref) v_u_5, (ref) v_u_6, (ref) v_u_11
			local v20 = {
				["Transparency"] = 1,
				["Color"] = nil,
				["Color"] = Color3.new(1, 1, 1)
			}
			if p_u_14.props.onActivated then
				if p_u_14.state.isPressed then
					v20 = p19.Theme.BackgroundOnPress
				elseif p_u_14.state.isHovered then
					v20 = p19.Theme.BackgroundOnHover
				end
			end
			local v21
			if v_u_8 then
				local v22 = p_u_14.props.icon
				if typeof(v22) == "string" then
					v21 = v_u_2.createElement("Frame", {
						["Position"] = nil,
						["Size"] = nil,
						["AnchorPoint"] = nil,
						["BackgroundTransparency"] = 1,
						["ZIndex"] = 2,
						["Position"] = UDim2.new(0.5, 0, 0.5, 0),
						["Size"] = UDim2.new(0, p_u_15.DropDownIconSize, 0, p_u_15.DropDownIconSize),
						["AnchorPoint"] = Vector2.new(0.5, 0.5)
					}, {
						["Icon"] = v_u_2.createElement(v_u_5.Icon, {
							["name"] = v22,
							["size"] = v_u_6.Medium,
							["style"] = {
								["Color3"] = p19.Theme.IconEmphasis.Color,
								["Transparency"] = p19.Theme.IconEmphasis.Transparency
							},
							["AnchorPoint"] = Vector2.new(0.5, 0.5),
							["Position"] = UDim2.new(0.5, 0, 0.5, 0)
						})
					})
				else
					v21 = v_u_2.createElement(v_u_5.Image, {
						["Image"] = nil,
						["imageRect"] = nil,
						["Size"] = nil,
						["imageStyle"] = nil,
						["AnchorPoint"] = nil,
						["Position"] = nil,
						["BackgroundTransparency"] = 1,
						["ZIndex"] = 2,
						["Image"] = v22.Image,
						["imageRect"] = {
							["offset"] = v22.ImageRectOffset,
							["size"] = v22.ImageRectSize
						},
						["Size"] = UDim2.new(0, p_u_15.DropDownIconSize, 0, p_u_15.DropDownIconSize),
						["imageStyle"] = {
							["Color3"] = p19.Theme.IconEmphasis.Color,
							["Transparency"] = p19.Theme.IconEmphasis.Transparency
						},
						["AnchorPoint"] = Vector2.new(0.5, 0.5),
						["Position"] = UDim2.new(0.5, 0, 0.5, 0)
					})
				end
			else
				v21 = v_u_2.createElement(v_u_11, {
					["Position"] = nil,
					["Size"] = nil,
					["Image"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["ZIndex"] = 2,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["Size"] = UDim2.new(0, p_u_15.DropDownIconSize, 0, p_u_15.DropDownIconSize),
					["Image"] = p_u_14.props.icon,
					["AnchorPoint"] = Vector2.new(0.5, 0.5)
				})
			end
			return v_u_2.createElement("TextButton", {
				["Text"] = "",
				["BorderSizePixel"] = 0,
				["BackgroundTransparency"] = p_u_14.props.showBackground and p_u_15.IconButtonBackgroundTransparency or 1,
				["BackgroundColor3"] = p_u_14.props.backgroundColor,
				["Position"] = p_u_14.props.position,
				["Size"] = p_u_14.props.size,
				[v_u_2.Event.Activated] = p_u_14.props.onActivated,
				[v_u_2.Event.MouseButton1Down] = function()
					-- upvalues: (ref) p_u_14
					p_u_14:setState({
						["isPressed"] = true
					})
				end,
				[v_u_2.Event.MouseButton1Up] = function()
					-- upvalues: (ref) p_u_14
					p_u_14:setState({
						["isPressed"] = false
					})
				end,
				[v_u_2.Event.MouseEnter] = function()
					-- upvalues: (ref) p_u_14
					p_u_14:setState({
						["isHovered"] = true
					})
				end,
				[v_u_2.Event.MouseLeave] = function()
					-- upvalues: (ref) p_u_14
					p_u_14:setState({
						["isHovered"] = false,
						["isPressed"] = false
					})
				end
			}, {
				["HoverBackground"] = v_u_2.createElement("Frame", {
					["ZIndex"] = 1,
					["Size"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["BackgroundTransparency"] = v20.Transparency,
					["BackgroundColor3"] = v20.Color
				}),
				["ImageButton"] = v21
			})
		end)
	end)
end
return v12