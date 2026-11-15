-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PlayerCell
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("UserInputService")
local v3 = require(v1.Packages.React)
local v_u_4 = require(v1.Workspace.Packages.VerifiedBadges)
local v5 = require(v1.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.UIBlox
local v_u_8 = v5.Cryo
local v9 = v5.t
local v_u_10 = v7.App.Table.Cell
local v_u_11 = v7.Core.ImageSet.ImageSetLabel
local v12 = require(v1.Packages.Foundation)
local v_u_13 = v12.Image
local v_u_14 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_15 = v7.App.Loading.LoadableImage
local v16 = v7.App.Loading.Enum.LoadingStrategy
local v_u_17 = v7.App.ImageSet.Images
local v_u_18 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_19
if v_u_14 then
	v_u_19 = v12.UNSTABLE.withCursorMigration
else
	v_u_19 = v7.App.SelectionImage.withSelectionCursorProvider
end
local v20 = script.Parent.Parent
local v_u_21 = require(v20.Resources.Assets)
local v_u_22 = require(v20.Components.ThemedTextLabel)
local v_u_23 = UDim.new(0, 24)
local v24 = v_u_6.PureComponent:extend("PlayerCell")
v24.validateProps = v9.strictInterface({
	["userId"] = v9.number,
	["username"] = v9.string,
	["displayName"] = v9.optional(v9.string),
	["hasVerifiedBadge"] = v9.optional(v9.boolean),
	["isOnline"] = v9.optional(v9.boolean),
	["isSelected"] = v9.optional(v9.boolean),
	["LayoutOrder"] = v9.union(v9.integer, v9.table),
	["Visible"] = v9.optional(v9.boolean),
	["loadingStrategy"] = v9.optional(v16.isEnumValue),
	["onActivated"] = v9.optional(v9.callback),
	["memoKey"] = v9.optional(v9.number),
	[v_u_6.Children] = v9.optional(v9.table),
	[v_u_6.Change.AbsolutePosition] = v9.optional(v9.callback),
	["forwardRef"] = v9.optional(v9.union(v9.callback, v9.table)),
	["UserInputService"] = v9.optional(v9.union(v9.Instance, v9.table))
})
v24.defaultProps = {
	["Visible"] = true,
	["UserInputService"] = nil,
	["UserInputService"] = v2
}
function v24.init(p_u_25) -- name: init
	function p_u_25.onActivated()
		-- upvalues: (copy) p_u_25
		if p_u_25.props.onActivated and p_u_25.props.userId then
			p_u_25.props.onActivated(p_u_25.props.userId)
		end
	end
end
function v24.renderButtons(p26) -- name: renderButtons
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	local v27 = p26.props[v_u_6.Children] or {}
	return v_u_8.Dictionary.join(v27, {
		["List"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, 5)
		})
	})
end
function v24.renderWithSelectionCursor(p_u_28, _) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_18, (copy) v_u_6, (copy) v_u_23, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_11, (copy) v_u_17, (copy) v_u_21, (copy) v_u_10, (copy) v_u_4, (copy) v_u_22
	local v_u_29 = p_u_28.props
	local v_u_30 = v_u_29.displayName ~= "" and v_u_29.displayName or v_u_29.username
	return v_u_18(function(p31)
		local v32 = {}
		local v33 = {
			["BackgroundContrast"] = {
				["Color"] = p31.Color.Surface.Surface_100.Color3,
				["Transparency"] = p31.Color.Surface.Surface_100.Transparency
			},
			["BackgroundOnHover"] = {
				["Color"] = p31.Color.State.Hover.Color3,
				["Transparency"] = p31.Color.State.Hover.Transparency
			},
			["OnlineStatus"] = {
				["Color"] = p31.Color.System.Success.Color3,
				["Transparency"] = p31.Color.System.Success.Transparency
			}
		}
		v32.Theme = v33
		return v32
	end, function(p34)
		-- upvalues: (copy) p_u_28, (ref) v_u_6, (ref) v_u_23, (ref) v_u_15, (copy) v_u_29, (ref) v_u_14, (ref) v_u_13, (ref) v_u_11, (ref) v_u_17, (ref) v_u_21, (ref) v_u_10, (ref) v_u_4, (ref) v_u_22, (copy) v_u_30
		local v35 = p34.Theme.BackgroundContrast
		local v36
		if p_u_28.props.isSelected then
			v35 = p34.Theme.BackgroundOnHover
			v36 = 0.23
		else
			v36 = 1.1
		end
		local v37 = v35.Color
		local v38 = {
			["Corner"] = v_u_6.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 3)
			}),
			["Border"] = v_u_6.createElement("UIStroke", {
				["ApplyStrokeMode"] = nil,
				["Color"] = nil,
				["Transparency"] = 0,
				["Thickness"] = 2,
				["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
				["Color"] = Color3.new(v37.R * v36, v37.G * v36, v37.B * v36)
			})
		}
		local v39 = {}
		local v40 = {
			["CornerRadius"] = v_u_23
		}
		v39.BorderRadius = v_u_6.createElement("UICorner", v40)
		v39.PlayerIcon = v_u_6.createElement(v_u_15, {
			["loadingStrategy"] = nil,
			["Size"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ZIndex"] = 2,
			["LayoutOrder"] = 1,
			["useShimmerAnimationWhileLoading"] = true,
			["renderOnFailed"] = nil,
			["cornerRadius"] = nil,
			["loadingStrategy"] = p_u_28.props.loadingStrategy,
			["Size"] = UDim2.fromScale(1, 1),
			["ImageColor3"] = v_u_29.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
			["Image"] = v_u_29.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v_u_29.userId .. "&w=60&h=60" or "",
			["renderOnFailed"] = function() -- name: renderOnFailed
				-- upvalues: (ref) v_u_14, (ref) v_u_6, (ref) v_u_13, (ref) v_u_23, (ref) v_u_11, (ref) v_u_17
				if v_u_14 then
					return v_u_6.createElement(v_u_13, {
						["Size"] = nil,
						["Image"] = "icons/common/user",
						["ZIndex"] = 2,
						["LayoutOrder"] = 1,
						["cornerRadius"] = nil,
						["Size"] = UDim2.fromScale(1, 1),
						["cornerRadius"] = v_u_23
					})
				end
				local v41 = v_u_6.createElement
				local v42 = v_u_11
				local v43 = {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["ZIndex"] = 2,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.fromScale(1, 1),
					["Image"] = v_u_17["icons/common/user"]
				}
				local v44 = {}
				local v45 = {
					["CornerRadius"] = v_u_23
				}
				v44.Corner = v_u_6.createElement("UICorner", v45)
				return v41(v42, v43, v44)
			end,
			["cornerRadius"] = v_u_23
		})
		local v46
		if p_u_28.props.isOnline then
			local v47
			if v_u_14 then
				v47 = v_u_6.createElement(v_u_13, {
					["AnchorPoint"] = nil,
					["Image"] = nil,
					["imageStyle"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["ZIndex"] = 3,
					["AnchorPoint"] = Vector2.new(1, 1),
					["Image"] = v_u_21.Images.Circle,
					["imageStyle"] = {
						["Color3"] = nil,
						["Transparency"] = 0,
						["Color3"] = v_u_29.isOnline and p34.Theme.OnlineStatus.Color or nil
					},
					["Position"] = UDim2.new(1, -3, 1, -3),
					["Size"] = UDim2.new(0, 6, 0, 6)
				}, v38)
			else
				v47 = v_u_6.createElement(v_u_11, {
					["AnchorPoint"] = nil,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["ZIndex"] = 3,
					["AnchorPoint"] = Vector2.new(1, 1),
					["Image"] = v_u_21.Images.Circle,
					["ImageColor3"] = v_u_29.isOnline and p34.Theme.OnlineStatus.Color or nil,
					["Position"] = UDim2.new(1, -3, 1, -3),
					["Size"] = UDim2.new(0, 6, 0, 6)
				}, v38)
			end
			v46 = v47 or nil
		else
			v46 = nil
		end
		v39.OnlineIndicator = v46
		local v48 = v_u_6.createElement
		local v49 = v_u_10
		local v50 = {}
		local v51
		if p_u_28.props.isSelected then
			v51 = v_u_6.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BackgroundColor3"] = v37,
				["BackgroundTransparency"] = v35.Transparency
			}) or nil
		else
			v51 = nil
		end
		v50.background = v51
		v50.onActivated = p_u_28.onActivated
		v50[v_u_6.Change.AbsolutePosition] = p_u_28.props[v_u_6.Change.AbsolutePosition]
		v50[v_u_6.Ref] = p_u_28.props.forwardRef or nil
		v50.layoutOrder = v_u_29.LayoutOrder
		v50.size = UDim2.new(1, 0, 0, 72)
		local v52 = v_u_6.createElement
		local v53 = "Frame"
		local v54 = {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0),
			["Size"] = UDim2.new(1, -20, 0, 72),
			["AutomaticSize"] = Enum.AutomaticSize.XY
		}
		local v55 = {
			["HeadListLayout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			})
		}
		local v56
		if v_u_14 then
			v56 = v_u_6.createElement(v_u_13, {
				["Image"] = "component_assets/userBG_dark",
				["Size"] = nil,
				["Size"] = UDim2.new(0, 48, 0, 48)
			}, v39)
		else
			v56 = v_u_6.createElement(v_u_11, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Size"] = nil,
				["Image"] = v_u_17["component_assets/userBG_dark"],
				["Size"] = UDim2.new(0, 48, 0, 48)
			}, v39)
		end
		v55.AvatarBackground = v56
		local v57 = v_u_6.createElement
		local v58 = "Frame"
		local v59 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, -68, 0, 72),
			["Position"] = UDim2.fromOffset(48, 0),
			["AnchorPoint"] = Vector2.new(0, 0.5)
		}
		local v60 = {
			["NameListLayout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			}),
			["NamePadding"] = v_u_6.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 6)
			})
		}
		local v61 = v_u_6.createElement
		local v62 = v_u_4.EmojiWrapper
		local v63 = {
			["emoji"] = not v_u_29.hasVerifiedBadge and "" or v_u_4.emoji.verified,
			["automaticSize"] = Enum.AutomaticSize.None,
			["size"] = UDim2.new(1, -40, 0, 20)
		}
		local v64 = {}
		local v65 = v_u_6.createElement
		local v66 = v_u_22
		local v67 = {
			["fontKey"] = "CaptionHeader",
			["themeKey"] = "TextEmphasis",
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["LayoutOrder"] = 1,
			["Text"] = v_u_30 or v_u_29.username,
			["Size"] = UDim2.new(1, 0, 0, 20)
		}
		local v68
		if v_u_29.hasVerifiedBadge then
			v68 = Enum.AutomaticSize.XY
		else
			v68 = Enum.AutomaticSize.None
		end
		v67.AutomaticSize = v68
		v67.TextXAlignment = Enum.TextXAlignment.Left
		v67.TextTruncate = Enum.TextTruncate.AtEnd
		v64.DisplayNameLabel = v65(v66, v67)
		v60.DisplayNameLabel = v61(v62, v63, v64)
		v60.UsernameLabel = v_u_6.createElement(v_u_22, {
			["fontKey"] = "Footer",
			["themeKey"] = "TextDefault",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["LayoutOrder"] = 2,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Size"] = UDim2.new(1, 0, 0, 14),
			["Text"] = "@" .. v_u_29.username,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		})
		v55.NameContainer = v57(v58, v59, v60)
		v50.head = v52(v53, v54, v55)
		v50.tail = v_u_6.createElement("Frame", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 0),
			["Size"] = UDim2.new(0, 0, 1, 0)
		}, p_u_28:renderButtons())
		return v48(v49, v50)
	end)
end
function v24.render(p_u_69) -- name: render
	-- upvalues: (copy) v_u_19
	return v_u_19(function(p70)
		-- upvalues: (copy) p_u_69
		return p_u_69:renderWithSelectionCursor(p70)
	end)
end
return v3.memo(v24, function(p71, p72)
	-- upvalues: (copy) v_u_6
	local v73
	if p71.isSelected == p72.isSelected and (p71.isOnline == p72.isOnline and (p71[v_u_6.Change.AbsolutePosition] == p72[v_u_6.Change.AbsolutePosition] and (p71.forwardRef == p72.forwardRef and p71.memoKey == p72.memoKey))) then
		v73 = p71.loadingStrategy == p72.loadingStrategy
	else
		v73 = false
	end
	return v73
end)