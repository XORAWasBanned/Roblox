-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PlayerLabelV2
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v_u_5 = v2.Cryo
local v6 = v2.t
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v_u_9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v4.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v_u_9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v4.App.SelectionImage.CursorKind
end
local v_u_12 = v4.Utility.OpenTypeSupport
local v13 = script.Parent.Parent
local v_u_14 = require(v13.Flags.FFlagLuaMenuPerfImprovements)
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local v_u_16 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local v_u_17 = require(v13.Components.ThemedTextLabel)
local v_u_18 = v4.Core.ImageSet.ImageSetLabel
local v_u_19 = v8.Image
local v_u_20 = {
	["AnchorPoint"] = Vector2.new(0, 1),
	["Position"] = UDim2.new(0, 24, 1, 1),
	["Size"] = UDim2.new(0, 56, 0, 56)
}
local v21 = require(v1.Workspace.Packages.RoactUtils).validatePropsWithForwardRef
local v_u_22 = v_u_3.PureComponent:extend("PlayerLabelV2")
v_u_22.validateProps = v6.strictInterface(v21({
	["userId"] = v6.number,
	["username"] = v6.string,
	["displayName"] = v6.string,
	["isOnline"] = v6.boolean,
	["isSelected"] = v6.boolean,
	["LayoutOrder"] = v6.integer,
	["Visible"] = v6.optional(v6.boolean),
	["onActivated"] = v6.optional(v6.callback),
	[v_u_3.Children] = v6.optional(v6.table),
	[v_u_3.Change.AbsolutePosition] = v6.optional(v6.callback),
	[v_u_3.Ref] = v6.optional(v6.union(v6.callback, v6.table))
}))
v_u_22.defaultProps = {
	["Visible"] = true
}
if v_u_14 then
	function v_u_22.init(p_u_23) -- name: init
		function p_u_23.onActivated()
			-- upvalues: (copy) p_u_23
			p_u_23.props.onActivated(p_u_23.props.userId)
		end
	end
end
function v_u_22.renderButtons(p24) -- name: renderButtons
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v25 = p24.props[v_u_3.Children] or {}
	return v_u_5.Dictionary.join(v25, {
		["List"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, 12)
		})
	})
end
function v_u_22.renderWithSelectionCursor(p_u_26, p_u_27) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_3, (copy) v_u_11, (copy) v_u_9, (copy) v_u_19, (copy) v_u_5, (copy) v_u_20, (copy) v_u_18, (copy) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_12
	local v_u_28 = p_u_26.props
	local v_u_29 = v_u_28.displayName ~= "" and v_u_28.displayName or v_u_28.username
	return v_u_7(function(p30)
		local v31 = {}
		local v32 = {
			["BackgroundContrast"] = {
				["Color"] = p30.Color.Surface.Surface_100.Color3,
				["Transparency"] = p30.Color.Surface.Surface_100.Transparency
			},
			["BackgroundOnHover"] = {
				["Color"] = p30.Color.State.Hover.Color3,
				["Transparency"] = p30.Color.State.Hover.Transparency
			}
		}
		v31.Theme = v32
		return v31
	end, function(p33)
		-- upvalues: (copy) p_u_26, (ref) v_u_14, (ref) v_u_3, (copy) v_u_28, (copy) p_u_27, (ref) v_u_11, (ref) v_u_9, (ref) v_u_19, (ref) v_u_5, (ref) v_u_20, (ref) v_u_18, (ref) v_u_17, (copy) v_u_29, (ref) v_u_15, (ref) v_u_16, (ref) v_u_12
		local v34 = p33.Theme.BackgroundContrast
		if p_u_26.props.isSelected then
			v34 = p33.Theme.BackgroundOnHover
		end
		local v35 = p_u_26.props.onActivated
		if v_u_14 then
			v35 = p_u_26.props.onActivated and p_u_26.onActivated or nil
		end
		local v36 = p_u_26.props.forwardRef
		local v37 = v_u_3.createElement
		local v38 = "TextButton"
		local v39 = {
			["BackgroundTransparency"] = v34.Transparency,
			["BackgroundColor3"] = v34.Color,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = v_u_28.LayoutOrder,
			["Size"] = UDim2.new(1, 0, 0, 71),
			["Visible"] = v_u_28.Visible,
			["Text"] = "",
			["AutoButtonColor"] = false,
			[v_u_3.Event.Activated] = v35,
			[v_u_3.Change.AbsolutePosition] = p_u_26.props[v_u_3.Change.AbsolutePosition],
			[v_u_3.Ref] = v36,
			["SelectionImageObject"] = p_u_27(v_u_11.Square)
		}
		local v40 = {}
		local v41
		if v_u_9 then
			local v42 = v_u_3.createElement
			local v43 = v_u_19
			local v44 = v_u_5.Dictionary.join
			local v45 = v_u_20
			local v46 = {
				["Image"] = nil,
				["imageStyle"] = nil,
				["ZIndex"] = 2,
				["Image"] = v_u_28.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v_u_28.userId .. "&w=60&h=60" or "",
				["imageStyle"] = {
					["Color3"] = nil,
					["Transparency"] = 0,
					["Color3"] = v_u_28.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115)
				}
			}
			v41 = v42(v43, v44(v45, v46))
		else
			v41 = v_u_3.createElement(v_u_18, v_u_5.Dictionary.join(v_u_20, {
				["ImageColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ZIndex"] = 2,
				["ImageColor3"] = v_u_28.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
				["Image"] = v_u_28.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v_u_28.userId .. "&w=60&h=60" or ""
			}))
		end
		v40.PlayerIcon = v41
		v40.DisplayNameLabel = v_u_3.createElement(v_u_17, {
			["fontKey"] = "Header2",
			["themeKey"] = "TextEmphasis",
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["Position"] = UDim2.new(0, 104, 0, 14),
			["AnchorPoint"] = Vector2.new(0, 0),
			["Size"] = UDim2.new(0, 219, 0, 22),
			["Text"] = v_u_29,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		})
		local v47 = v_u_3.createElement
		local v48 = v_u_17
		local v49 = {
			["fontKey"] = "Header2",
			["themeKey"] = "TextDefault",
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["OpenTypeFeatures"] = nil,
			["Position"] = UDim2.new(0, 104, 0, 36),
			["Size"] = UDim2.new(0, 219, 0, 22),
			["Text"] = "@" .. v_u_28.username,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		}
		local v50
		if v_u_15() and v_u_16() then
			v50 = v_u_12:getUserNameStylisticAlternative()
		else
			v50 = nil
		end
		v49.OpenTypeFeatures = v50
		v40.UsernameLabel = v47(v48, v49)
		v40.ButtonContainer = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -24, 0, 0),
			["Size"] = UDim2.new(0, 0, 1, 0)
		}, p_u_26:renderButtons())
		return v37(v38, v39, v40)
	end)
end
function v_u_22.render(p_u_51) -- name: render
	-- upvalues: (copy) v_u_10
	return v_u_10(function(p52)
		-- upvalues: (copy) p_u_51
		return p_u_51:renderWithSelectionCursor(p52)
	end)
end
return v_u_3.forwardRef(function(p53, p54)
	-- upvalues: (copy) v_u_3, (copy) v_u_22, (copy) v_u_5
	return v_u_3.createElement(v_u_22, v_u_5.Dictionary.join(p53, {
		["forwardRef"] = p54
	}))
end)