-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage.SearchBox
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v2.UIBlox
local v_u_6 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v7 = require(v1.Packages.Foundation)
local v_u_8 = v7.Utility.normalizeFontFace
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10 = v7.Utility.Flags.FoundationFontFaceMigration
local v_u_11
if v_u_9 then
	v_u_11 = v7.UNSTABLE.withCursorMigration
else
	v_u_11 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_12
if v_u_9 then
	v_u_12 = v7.Enums.CursorType
else
	v_u_12 = v5.App.SelectionImage.CursorKind
end
local v13 = script.Parent.Parent.Parent
local v_u_14 = require(v13.Resources.Assets)
local v_u_15 = require(v13.Localization.withLocalization)
local v_u_16 = require(v13.Components.ThemedTextLabel)
local v_u_17 = v5.Core.ImageSet.ImageSetLabel
local v_u_18 = v7.Image
local v19 = v_u_3.PureComponent:extend("SearchBox")
v19.validateProps = v4.strictInterface({
	["Size"] = v4.UDim2,
	["Position"] = v4.UDim2,
	["AnchorPoint"] = v4.Vector2,
	["searchUpdated"] = v4.callback,
	["searchCleared"] = v4.callback,
	["itemRef"] = v4.optional(v4.table)
})
function v19.init(p20) -- name: init
	p20.state = {
		["searchText"] = ""
	}
end
function v19.renderWithSelectionCursor(p_u_21, p_u_22) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_15, (copy) v_u_6, (copy) v_u_10, (copy) v_u_3, (copy) v_u_12, (copy) v_u_9, (copy) v_u_18, (copy) v_u_14, (copy) v_u_17, (copy) v_u_8, (copy) v_u_16
	return v_u_15({
		["searchPlaceholder"] = "CoreScripts.InGameMenu.InviteFriends.Search"
	})(function(p_u_23)
		-- upvalues: (ref) v_u_6, (ref) v_u_10, (copy) p_u_21, (ref) v_u_3, (copy) p_u_22, (ref) v_u_12, (ref) v_u_9, (ref) v_u_18, (ref) v_u_14, (ref) v_u_17, (ref) v_u_8, (ref) v_u_16
		return v_u_6(function(p24)
			-- upvalues: (ref) v_u_10
			local v25 = {}
			local v26
			if v_u_10 then
				v26 = p24
			else
				v26 = nil
			end
			v25.Tokens = v26
			v25.Theme = {
				["TextEmphasis"] = {
					["Color"] = p24.Color.Content.Emphasis.Color3,
					["Transparency"] = p24.Color.Content.Emphasis.Transparency
				},
				["IconEmphasis"] = {
					["Color"] = p24.Color.Content.Emphasis.Color3,
					["Transparency"] = p24.Color.Content.Emphasis.Transparency
				},
				["BackgroundUIContrast"] = {
					["Color"] = p24.Color.OverMedia.OverMedia_0.Color3,
					["Transparency"] = p24.Color.OverMedia.OverMedia_0.Transparency
				},
				["Divider"] = {
					["Color"] = p24.Color.Stroke.Emphasis.Color3,
					["Transparency"] = p24.Color.Stroke.Emphasis.Transparency
				}
			}
			v25.Font = {
				["BaseSize"] = 1,
				["Body"] = nil,
				["Body"] = {
					["Font"] = p24.Typography.BodyLarge.Font,
					["RelativeSize"] = p24.Typography.BodyLarge.FontSize
				}
			}
			return v25
		end, function(p27)
			-- upvalues: (ref) p_u_21, (ref) v_u_3, (ref) p_u_22, (ref) v_u_12, (ref) v_u_9, (ref) v_u_18, (ref) v_u_14, (ref) v_u_17, (ref) v_u_10, (ref) v_u_8, (ref) v_u_16, (copy) p_u_23
			local v28 = p27.Theme.TextEmphasis
			local v29 = p27.Font.Body
			local v30 = p_u_21.state.searchText ~= ""
			local v31 = 49
			if v30 then
				v31 = v31 + 46
			end
			local v32 = v_u_3.createElement
			local v33 = "TextButton"
			local v34 = {
				["Size"] = UDim2.fromOffset(32, 32),
				["Position"] = UDim2.new(1, -7, 0.5, 0),
				["AnchorPoint"] = Vector2.new(1, 0.5),
				["BackgroundTransparency"] = 1,
				["Visible"] = v30,
				["SelectionImageObject"] = p_u_22(v_u_12.SmallPill),
				["Selectable"] = true,
				[v_u_3.Event.Activated] = function()
					-- upvalues: (ref) p_u_21
					p_u_21:setState({
						["searchText"] = ""
					})
					p_u_21.props.searchCleared()
				end
			}
			local v35 = {
				["UIPadding"] = v_u_3.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 7),
					["PaddingRight"] = UDim.new(0, 7),
					["PaddingTop"] = UDim.new(0, 7),
					["PaddingBottom"] = UDim.new(0, 7)
				})
			}
			local v36
			if v_u_9 then
				v36 = v_u_3.createElement(v_u_18, {
					["Size"] = UDim2.fromScale(1, 1),
					["Image"] = v_u_14.Images.ClearIcon.Image,
					["imageRect"] = {
						["offset"] = v_u_14.Images.ClearIcon.ImageRectOffset,
						["size"] = v_u_14.Images.ClearIcon.ImageRectSize
					},
					["imageStyle"] = {
						["Color3"] = nil,
						["Transparency"] = 0,
						["Color3"] = p27.Theme.IconEmphasis.Color
					}
				})
			else
				v36 = v_u_3.createElement(v_u_17, {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["Selectable"] = false,
					["Size"] = UDim2.fromScale(1, 1),
					["Image"] = v_u_14.Images.ClearIcon,
					["ImageColor3"] = p27.Theme.IconEmphasis.Color
				})
			end
			v35.ClearImage = v36
			local v37 = v32(v33, v34, v35)
			local v38 = v_u_3.createElement
			local v39 = v_u_17
			local v40 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["Size"] = p_u_21.props.Size,
				["Position"] = p_u_21.props.Position,
				["AnchorPoint"] = p_u_21.props.AnchorPoint,
				["Image"] = v_u_14.Images.RoundedRect.Image,
				["ImageColor3"] = p27.Theme.BackgroundUIContrast.Color,
				["ImageTransparency"] = p27.Theme.BackgroundUIContrast.Transparency,
				["ScaleType"] = v_u_14.Images.RoundedRect.ScaleType,
				["SliceCenter"] = v_u_14.Images.RoundedRect.SliceCenter
			}
			local v41 = {
				["Border"] = v_u_3.createElement(v_u_17, {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["SliceCenter"] = nil,
					["ScaleType"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Image"] = v_u_14.Images.RoundedRectBorder.Image,
					["SliceCenter"] = v_u_14.Images.RoundedRectBorder.SliceCenter,
					["ScaleType"] = v_u_14.Images.RoundedRectBorder.ScaleType,
					["ImageColor3"] = p27.Theme.Divider.Color,
					["ImageTransparency"] = p27.Theme.Divider.Transparency
				})
			}
			local v42
			if v_u_9 then
				v42 = v_u_3.createElement(v_u_18, {
					["Size"] = UDim2.new(0, 16, 0, 16),
					["Position"] = UDim2.new(0, 22, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Image"] = v_u_14.Images.SearchIcon.Image,
					["imageRect"] = {
						["offset"] = v_u_14.Images.SearchIcon.ImageRectOffset,
						["size"] = v_u_14.Images.SearchIcon.ImageRectSize
					},
					["imageStyle"] = {
						["Color3"] = nil,
						["Transparency"] = 0,
						["Color3"] = p27.Theme.IconEmphasis.Color
					}
				})
			else
				v42 = v_u_3.createElement(v_u_17, {
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["Size"] = UDim2.new(0, 16, 0, 16),
					["Position"] = UDim2.new(0, 22, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Image"] = v_u_14.Images.SearchIcon,
					["ImageColor3"] = p27.Theme.IconEmphasis.Color
				})
			end
			v41.SearchIcon = v42
			local v43 = v_u_3.createElement
			local v44 = "TextBox"
			local v45 = {
				["Size"] = UDim2.new(1, -v31, 1, 0),
				["Position"] = UDim2.new(0, 44, 0, 0),
				["PlaceholderText"] = "",
				["Text"] = p_u_21.state.searchText,
				["ClearTextOnFocus"] = false,
				["BackgroundTransparency"] = 1,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["TextColor3"] = v28.Color,
				["TextTransparency"] = v28.Transparency
			}
			local v46
			if v_u_10 then
				v46 = nil
			else
				v46 = v29.Font
			end
			v45.Font = v46
			local v47
			if v_u_10 then
				v47 = v_u_8(p27.Tokens.Typography.BodyLarge.Font)
			else
				v47 = nil
			end
			v45.FontFace = v47
			v45.TextSize = v29.RelativeSize * p27.Font.BaseSize
			v45.TextWrapped = false
			v45.SelectionImageObject = p_u_22(v_u_12.InputFields)
			v45[v_u_3.Change.Text] = function(p48)
				-- upvalues: (ref) p_u_21
				if p_u_21.state.searchText ~= p48.Text then
					p_u_21:setState({
						["searchText"] = p48.Text
					})
					p_u_21.props.searchUpdated(p48.Text)
				end
			end
			v45[v_u_3.Ref] = p_u_21.props.itemRef
			v41.TextBox = v43(v44, v45)
			v41.PlaceholderText = v_u_3.createElement(v_u_16, {
				["themeKey"] = "TextEmphasis",
				["fontKey"] = "Body",
				["Text"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["TextTransparency"] = 0.5,
				["TextXAlignment"] = nil,
				["ZIndex"] = 2,
				["Visible"] = nil,
				["Text"] = p_u_23.searchPlaceholder,
				["Size"] = UDim2.new(1, -44, 1, 0),
				["Position"] = UDim2.new(0, 44, 0, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Visible"] = p_u_21.state.searchText == ""
			})
			v41.ClearButton = v37
			return v38(v39, v40, v41)
		end)
	end)
end
function v19.render(p_u_49) -- name: render
	-- upvalues: (copy) v_u_11
	return v_u_11(function(p50)
		-- upvalues: (copy) p_u_49
		return p_u_49:renderWithSelectionCursor(p50)
	end)
end
return v19