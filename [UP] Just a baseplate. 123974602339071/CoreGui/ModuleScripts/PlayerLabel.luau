-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PlayerLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v_u_5 = v2.Cryo
local v6 = v2.t
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Flags.FFlagLuaMenuPerfImprovements)
local v_u_10 = require(v8.Resources.Assets)
local v_u_11 = require(v8.Components.ThemedTextLabel)
local v_u_12 = v4.Core.ImageSet.ImageSetLabel
local v13 = require(v1.Packages.Foundation)
local v_u_14 = v13.Image
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_16
if v_u_15 then
	v_u_16 = v13.UNSTABLE.withCursorMigration
else
	v_u_16 = v4.App.SelectionImage.withSelectionCursorProvider
end
local v_u_17
if v_u_15 then
	v_u_17 = v13.Enums.CursorType
else
	v_u_17 = v4.App.SelectionImage.CursorKind
end
local v_u_18 = v4.Utility.OpenTypeSupport
local v_u_19 = {
	["AnchorPoint"] = Vector2.new(0, 0.5),
	["Position"] = UDim2.new(0, 24, 0.5, 0),
	["Size"] = UDim2.new(0, 44, 0, 44)
}
local v20 = require(v1.Workspace.Packages.RoactUtils).validatePropsWithForwardRef
local v_u_21 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local v_u_22 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local v_u_23 = v_u_3.PureComponent:extend("PlayerLabel")
v_u_23.validateProps = v6.strictInterface(v20({
	["userId"] = v6.number,
	["username"] = v6.string,
	["isOnline"] = v6.boolean,
	["isSelected"] = v6.boolean,
	["LayoutOrder"] = v6.integer,
	["Visible"] = v6.optional(v6.boolean),
	["onActivated"] = v6.optional(v6.callback),
	[v_u_3.Children] = v6.optional(v6.table),
	[v_u_3.Change.AbsolutePosition] = v6.optional(v6.callback),
	[v_u_3.Ref] = v6.optional(v6.union(v6.callback, v6.table))
}))
v_u_23.defaultProps = {
	["Visible"] = true
}
if v_u_9 then
	function v_u_23.init(p_u_24) -- name: init
		function p_u_24.onActivated()
			-- upvalues: (copy) p_u_24
			p_u_24.props.onActivated(p_u_24.props.userId)
		end
	end
end
function v_u_23.renderButtons(p25) -- name: renderButtons
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v26 = p25.props[v_u_3.Children] or {}
	return v_u_5.Dictionary.join(v26, {
		["List"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, 12)
		})
	})
end
function v_u_23.renderWithSelectionCursor(p_u_27, p_u_28) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_3, (copy) v_u_17, (copy) v_u_15, (copy) v_u_14, (copy) v_u_5, (copy) v_u_19, (copy) v_u_10, (copy) v_u_12, (copy) v_u_11, (copy) v_u_21, (copy) v_u_22, (copy) v_u_18
	local v_u_29 = p_u_27.props
	return v_u_7(function(p30)
		local v31 = {}
		local v32 = {
			["BackgroundContrast"] = {
				["Color"] = p30.Color.Surface.Surface_100.Color3,
				["Transparency"] = p30.Color.Surface.Surface_100.Transparency
			},
			["UIDefault"] = {
				["Color"] = p30.Color.Shift.Shift_200.Color3,
				["Transparency"] = p30.Color.Shift.Shift_200.Transparency
			},
			["OnlineStatus"] = {
				["Color"] = p30.Color.System.Success.Color3,
				["Transparency"] = p30.Color.System.Success.Transparency
			}
		}
		v31.Theme = v32
		return v31
	end, function(p33)
		-- upvalues: (copy) p_u_27, (ref) v_u_9, (ref) v_u_3, (copy) v_u_29, (copy) p_u_28, (ref) v_u_17, (ref) v_u_15, (ref) v_u_14, (ref) v_u_5, (ref) v_u_19, (ref) v_u_10, (ref) v_u_12, (ref) v_u_11, (ref) v_u_21, (ref) v_u_22, (ref) v_u_18
		local v34 = p33.Theme.BackgroundContrast
		local v35 = p_u_27.props.isSelected and {
			["Color"] = nil,
			["Transparency"] = 0,
			["Color"] = Color3.fromRGB(48, 50, 52)
		} or v34
		local v36 = p_u_27.props.onActivated
		if v_u_9 then
			v36 = p_u_27.props.onActivated and p_u_27.onActivated or nil
		end
		local v37 = p_u_27.props.forwardRef
		local v38 = v_u_3.createElement
		local v39 = "TextButton"
		local v40 = {
			["BackgroundTransparency"] = v35.Transparency,
			["BackgroundColor3"] = v35.Color,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = v_u_29.LayoutOrder,
			["Size"] = UDim2.new(1, 0, 0, 70),
			["Visible"] = v_u_29.Visible,
			["Text"] = "",
			["AutoButtonColor"] = false,
			[v_u_3.Event.Activated] = v36,
			[v_u_3.Change.AbsolutePosition] = p_u_27.props[v_u_3.Change.AbsolutePosition],
			[v_u_3.Ref] = v37,
			["SelectionImageObject"] = p_u_28(v_u_17.Square)
		}
		local v41 = {}
		local v42
		if v_u_15 then
			v42 = v_u_3.createElement(v_u_14, v_u_5.Dictionary.join(v_u_19, {
				["Image"] = nil,
				["imageStyle"] = nil,
				["ZIndex"] = 3,
				["Image"] = v_u_10.Images.CircleCutout,
				["imageStyle"] = {
					["Color3"] = nil,
					["Transparency"] = 0,
					["Color3"] = v35.Color
				}
			}))
		else
			v42 = v_u_3.createElement(v_u_12, v_u_5.Dictionary.join(v_u_19, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ZIndex"] = 3,
				["Image"] = v_u_10.Images.CircleCutout,
				["ImageColor3"] = v35.Color
			}))
		end
		v41.PlayerCutout = v42
		local v43
		if v_u_15 then
			v43 = v_u_3.createElement(v_u_14, v_u_5.Dictionary.join(v_u_19, {
				["Image"] = nil,
				["ZIndex"] = 2,
				["Image"] = v_u_29.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v_u_29.userId .. "&w=48&h=48" or ""
			}))
		else
			v43 = v_u_3.createElement(v_u_12, v_u_5.Dictionary.join(v_u_19, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ZIndex"] = 2,
				["Image"] = v_u_29.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v_u_29.userId .. "&w=48&h=48" or ""
			}))
		end
		v41.PlayerIcon = v43
		v41.PlayerBackground = v_u_3.createElement("Frame", v_u_5.Dictionary.join(v_u_19, {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = p33.Theme.UIDefault.Color
		}))
		local v44
		if v_u_15 then
			local v45 = v_u_3.createElement
			local v46 = v_u_14
			local v47 = {
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Image"] = v_u_10.Images.Circle,
				["imageStyle"] = {
					["Color3"] = nil,
					["Transparency"] = 0,
					["Color3"] = v_u_29.isOnline and p33.Theme.OnlineStatus.Color or p33.Theme.UIDefault.Color
				},
				["Position"] = UDim2.new(0, 80, 0.5, 0),
				["Size"] = UDim2.new(0, 16, 0, 16)
			}
			v44 = v45(v46, v47)
		else
			v44 = v_u_3.createElement(v_u_12, {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Image"] = v_u_10.Images.Circle,
				["ImageColor3"] = v_u_29.isOnline and p33.Theme.OnlineStatus.Color or p33.Theme.UIDefault.Color,
				["Position"] = UDim2.new(0, 80, 0.5, 0),
				["Size"] = UDim2.new(0, 16, 0, 16)
			})
		end
		v41.OnlineIndicator = v44
		local v48 = v_u_3.createElement
		local v49 = v_u_11
		local v50 = {
			["fontKey"] = "Header2",
			["themeKey"] = "TextEmphasis",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["OpenTypeFeatures"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 100, 0.5, 0),
			["Size"] = UDim2.new(0, 219, 0, 22),
			["Text"] = v_u_29.username,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		}
		local v51
		if v_u_21() and v_u_22() then
			v51 = v_u_18:getUserNameStylisticAlternative()
		else
			v51 = nil
		end
		v50.OpenTypeFeatures = v51
		v41.UsernameLabel = v48(v49, v50)
		v41.ButtonContainer = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -24, 0, 0),
			["Size"] = UDim2.new(0, 0, 1, 0)
		}, p_u_27:renderButtons())
		return v38(v39, v40, v41)
	end)
end
function v_u_23.render(p_u_52) -- name: render
	-- upvalues: (copy) v_u_16
	return v_u_16(function(p53)
		-- upvalues: (copy) p_u_52
		return p_u_52:renderWithSelectionCursor(p53)
	end)
end
return v_u_3.forwardRef(function(p54, p55)
	-- upvalues: (copy) v_u_3, (copy) v_u_23, (copy) v_u_5
	return v_u_3.createElement(v_u_23, v_u_5.Dictionary.join(p54, {
		["forwardRef"] = p55
	}))
end)