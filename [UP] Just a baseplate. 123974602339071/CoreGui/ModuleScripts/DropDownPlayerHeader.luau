-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.DropDownPlayerHeader
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Workspace.Packages.UserLib)
local v_u_6 = require(v1.Packages.Cryo)
local v7 = require(v1.Packages.Foundation)
local v_u_8 = v7.Utility.normalizeFontFace
local v_u_9 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v10 = script.Parent.Parent
local v11 = v10.Connection
local v_u_12 = require(v11.LayoutValues).WithLayoutValues
local v_u_13 = require(v10.Parent.Flags.FFlagPlayerListFixDropDownVerifiedBadgeSize)
local v_u_14 = require(v1.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local v15 = require(v1.Workspace.Packages.SharedFlags)
local v_u_16 = v15.FFlagEnableVerifiedBadgeStore
local v_u_17 = v15.FFlagCoreUiMigrateUIBloxToFoundation
local v_u_18 = v7.Utility.Flags.FoundationFontFaceMigration
local v_u_19 = v4.Core.Text.EmojiTextLabel
local v_u_20 = v4.App.Emoji.Enum.Emoji
local v_u_21 = v_u_2.PureComponent:extend("DropDownPlayerHeader")
v_u_21.validateProps = v3.strictInterface({
	["player"] = v3.instanceIsA("Player"),
	["showVerifiedBadge"] = v3.optional(v3.boolean)
})
function v_u_21.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_18, (copy) v_u_16, (copy) v_u_5, (copy) v_u_6, (copy) v_u_13, (copy) v_u_17, (copy) v_u_2, (copy) v_u_19, (copy) v_u_20, (copy) v_u_8
	return v_u_12(function(p_u_23)
		-- upvalues: (ref) v_u_9, (ref) v_u_18, (copy) p_u_22, (ref) v_u_16, (ref) v_u_5, (ref) v_u_6, (ref) v_u_13, (ref) v_u_17, (ref) v_u_2, (ref) v_u_19, (ref) v_u_20, (ref) v_u_8
		return v_u_9(function(p24)
			-- upvalues: (ref) v_u_18
			local v25 = {}
			local v26
			if v_u_18 then
				v26 = p24
			else
				v26 = nil
			end
			v25.Tokens = v26
			v25.Theme = {
				["Divider"] = {
					["Color"] = p24.Color.Stroke.Emphasis.Color3,
					["Transparency"] = p24.Color.Stroke.Emphasis.Transparency
				},
				["TextEmphasis"] = {
					["Color"] = p24.Color.Content.Emphasis.Color3,
					["Transparency"] = p24.Color.Content.Emphasis.Transparency
				},
				["TextMuted"] = {
					["Color"] = p24.Color.Content.Muted.Color3,
					["Transparency"] = p24.Color.Content.Muted.Transparency
				}
			}
			v25.Font = {
				["BaseSize"] = 1,
				["CaptionHeader"] = nil,
				["Footer"] = nil,
				["Header2"] = nil,
				["CaptionHeader"] = {
					["Font"] = p24.Typography.CaptionLarge.Font,
					["RelativeSize"] = p24.Typography.CaptionLarge.FontSize
				},
				["Footer"] = {
					["Font"] = p24.Typography.CaptionSmall.Font,
					["RelativeSize"] = p24.Typography.CaptionSmall.FontSize
				},
				["Header2"] = {
					["Font"] = p24.Typography.TitleLarge.Font,
					["RelativeSize"] = p24.Typography.TitleLarge.FontSize,
					["FontSize"] = p24.Typography.TitleLarge.FontSize,
					["LineHeight"] = p24.Typography.TitleLarge.LineHeight,
					["LetterSpacing"] = p24.Typography.TitleLarge.LetterSpacing
				}
			}
			return v25
		end, function(p27)
			-- upvalues: (ref) p_u_22, (ref) v_u_16, (ref) v_u_5, (ref) v_u_18, (ref) v_u_6, (ref) v_u_13, (ref) v_u_17, (ref) v_u_2, (copy) p_u_23, (ref) v_u_19, (ref) v_u_20, (ref) v_u_8
			local v28 = p_u_22.props.player
			local v29
			if v_u_16 then
				v29 = p_u_22.props.showVerifiedBadge
			else
				v29 = v_u_5.Utils.isPlayerVerified(v28)
			end
			local v30
			if v_u_18 then
				local v31 = v_u_6.Dictionary.join
				local v32 = p27.Font.Header2
				local v33 = {
					["Font"] = p27.Tokens.Typography.TitleLarge.Font
				}
				local v34
				if v_u_13 and v_u_17 then
					v34 = v_u_6.None
				else
					v34 = nil
				end
				v33.RelativeSize = v34
				v30 = v31(v32, v33)
			elseif v_u_17 and p27.Font.Header2.FontSize then
				v30 = {
					["Font"] = p27.Font.Header2.Font,
					["FontSize"] = p27.Font.Header2.FontSize,
					["LineHeight"] = p27.Font.Header2.LineHeight,
					["LetterSpacing"] = p27.Font.Header2.LetterSpacing
				}
			else
				v30 = p27.Font.Header2
			end
			local v35 = v_u_2.createElement
			local v36 = "TextButton"
			local v37 = {
				["BackgroundTransparency"] = 1,
				["Text"] = "",
				["Size"] = nil,
				["LayoutOrder"] = 0,
				["Selectable"] = false,
				["Size"] = UDim2.new(1, 0, 0, p_u_23.DropDownHeaderSizeY)
			}
			local v38 = {}
			local v39 = v_u_2.createElement
			local v40 = "ImageLabel"
			local v41 = {
				["BackgroundTransparency"] = 1,
				["Image"] = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png",
				["ImageTransparency"] = 0,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = UDim2.new(1, 0, 0, p_u_23.DropDownHeaderBackgroundSize),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1)
			}
			local v42 = {}
			local v43 = v_u_2.createElement
			local v44 = "Frame"
			local v45 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Size"] = UDim2.new(1, -124, 1, 0),
				["Position"] = UDim2.new(0, 107, 0, 0)
			}
			local v46 = {
				["Layout"] = v_u_2.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Vertical,
					["Padding"] = UDim.new(0, 0),
					["VerticalAlignment"] = Enum.VerticalAlignment.Center
				})
			}
			local v47 = v29 and v_u_2.createElement(v_u_19, {
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["fluidSizing"] = false,
				["emoji"] = nil,
				["maxSize"] = nil,
				["LayoutOrder"] = 1,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["TextTruncate"] = nil,
				["BackgroundTransparency"] = 1,
				["TextScaled"] = true,
				["fontStyle"] = v30,
				["colorStyle"] = p27.Theme.TextEmphasis,
				["emoji"] = v_u_20.Verified,
				["maxSize"] = Vector2.new(p_u_23.PlayerDropDownSizeX - 124, 22),
				["Text"] = v28.DisplayName,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextTruncate"] = Enum.TextTruncate.AtEnd
			})
			if not v47 then
				local v48 = v_u_2.createElement
				local v49 = "TextLabel"
				local v50 = {
					["LayoutOrder"] = 1,
					["Size"] = nil,
					["Text"] = nil,
					["Font"] = nil,
					["FontFace"] = nil,
					["TextSize"] = nil,
					["TextColor3"] = nil,
					["TextTransparency"] = nil,
					["TextXAlignment"] = nil,
					["TextTruncate"] = nil,
					["BackgroundTransparency"] = 1,
					["TextScaled"] = true,
					["Size"] = UDim2.new(1, 0, 0, 22),
					["Text"] = v28.DisplayName
				}
				local v51
				if v_u_18 then
					v51 = nil
				else
					v51 = p27.Font.Header2.Font
				end
				v50.Font = v51
				local v52
				if v_u_18 then
					v52 = v_u_8(p27.Tokens.Typography.TitleLarge.Font)
				else
					v52 = nil
				end
				v50.FontFace = v52
				v50.TextSize = p27.Font.BaseSize * p27.Font.Header2.RelativeSize
				v50.TextColor3 = p27.Theme.TextEmphasis.Color
				v50.TextTransparency = p27.Theme.TextEmphasis.Transparency
				v50.TextXAlignment = Enum.TextXAlignment.Left
				v50.TextTruncate = Enum.TextTruncate.AtEnd
				v47 = v48(v49, v50, {
					["SizeConstraint"] = v_u_2.createElement("UITextSizeConstraint", {
						["MaxTextSize"] = p27.Font.BaseSize * p27.Font.Header2.RelativeSize,
						["MinTextSize"] = p27.Font.BaseSize * p27.Font.Footer.RelativeSize
					})
				})
			end
			v46.DisplayName = v47
			local v53 = v_u_2.createElement
			local v54 = "TextLabel"
			local v55 = {
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextXAlignment"] = nil,
				["TextTruncate"] = nil,
				["BackgroundTransparency"] = 1,
				["TextScaled"] = true,
				["Size"] = UDim2.new(1, 0, 0, 22),
				["Text"] = "@" .. v28.Name
			}
			local v56
			if v_u_18 then
				v56 = nil
			else
				v56 = p27.Font.CaptionHeader.Font
			end
			v55.Font = v56
			local v57
			if v_u_18 then
				v57 = v_u_8(p27.Tokens.Typography.CaptionLarge.Font)
			else
				v57 = nil
			end
			v55.FontFace = v57
			v55.TextSize = p27.Font.BaseSize * p27.Font.CaptionHeader.RelativeSize
			v55.TextColor3 = p27.Theme.TextMuted.Color
			v55.TextTransparency = p27.Theme.TextMuted.Transparency
			v55.TextXAlignment = Enum.TextXAlignment.Left
			v55.TextTruncate = Enum.TextTruncate.AtEnd
			v46.PlayerName = v53(v54, v55, {
				["SizeConstraint"] = v_u_2.createElement("UITextSizeConstraint", {
					["MaxTextSize"] = p27.Font.BaseSize * p27.Font.CaptionHeader.RelativeSize,
					["MinTextSize"] = p27.Font.BaseSize * p27.Font.Footer.RelativeSize
				})
			})
			v42.TextContainerFrame = v43(v44, v45, v46)
			v38.Background = v39(v40, v41, v42)
			v38.AvatarImage = v_u_2.createElement("ImageLabel", {
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ZIndex"] = 2,
				["Position"] = UDim2.new(0, 56, 0, 0),
				["Size"] = UDim2.new(0, p_u_23.DropDownHeaderSizeY, 0, p_u_23.DropDownHeaderSizeY),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Image"] = "rbxthumb://type=AvatarHeadShot&id=" .. v28.UserId .. "&w=150&h=150"
			})
			local v58 = not p_u_22.props.lastButton
			if v58 then
				v58 = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["ZIndex"] = 3,
					["Size"] = UDim2.new(1, 0, 0, 1),
					["Position"] = UDim2.new(0, 0, 1, 0),
					["AnchorPoint"] = Vector2.new(0, 1),
					["BackgroundTransparency"] = p27.Theme.Divider.Transparency,
					["BackgroundColor3"] = p27.Theme.Divider.Color
				})
			end
			v38.Divider = v58
			return v35(v36, v37, v38)
		end)
	end)
end
local function v61(p59)
	-- upvalues: (copy) v_u_14, (copy) v_u_2, (copy) v_u_21, (copy) v_u_6
	local v60 = {
		["showVerifiedBadge"] = v_u_14(p59.player)
	}
	return v_u_2.createElement(v_u_21, v_u_6.Dictionary.join(p59, v60))
end
if v_u_16 then
	return v61
else
	return v_u_21
end