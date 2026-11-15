-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.DropDownPlayerHeader
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.t)
local v5 = require(v1.Packages.UIBlox)
local v6 = require(v1.Packages.Foundation)
local v_u_7 = v6.Utility.normalizeFontFace
local v_u_8 = v6.Utility.Flags.FoundationFontFaceMigration
local v_u_9 = require(v1.Workspace.Packages.UserLib)
local v10 = require(v1.Workspace.Packages.PlayerList)
local v_u_11 = v10.Common.useLayoutValues
local v_u_12 = v5.Style.withStyle
local v_u_13 = v6.Hooks.useTokens
local v_u_14 = v6.View
local v_u_15 = v6.Image
local v_u_16 = v6.Text
local v17 = script.Parent.Parent.Connection
local v_u_18 = require(v17.LayoutValues).WithLayoutValues
local v_u_19 = require(v1.Workspace.Packages.UserProfiles)
local v_u_20 = v_u_19.Hooks.useVerifiedBadge
local v_u_21 = v5.Core.Text.EmojiTextLabel
local v_u_22 = v5.App.Emoji.Enum.Emoji
local v_u_23 = v10.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_24 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local v_u_25 = v10.Flags.FFlagPlayerListDropDownShowPlatformName
local _, v_u_26 = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local v_u_27 = v_u_3.PureComponent:extend("DropDownPlayerHeader")
v_u_27.validateProps = v4.strictInterface({
	["player"] = v4.instanceIsA("Player"),
	["transparency"] = v4.any,
	["contentVisible"] = v4.boolean,
	["layoutValues"] = v4.optional(v4.table),
	["tokens"] = v4.optional(v4.table),
	["showVerifiedBadge"] = v4.optional(v4.boolean),
	["platformName"] = v4.optional(v4.string),
	["platformProfileId"] = v4.optional(v4.string),
	["canShowPlatformProfile"] = v4.optional(v4.boolean)
})
function v_u_27.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_12, (copy) v_u_24, (copy) v_u_9, (copy) v_u_25, (copy) v_u_3, (copy) v_u_21, (copy) v_u_8, (copy) v_u_2, (copy) v_u_22, (copy) v_u_23, (copy) v_u_7, (copy) v_u_14, (copy) v_u_26, (copy) v_u_15, (copy) v_u_16
	return v_u_18(function(p_u_29)
		-- upvalues: (ref) v_u_12, (copy) p_u_28, (ref) v_u_24, (ref) v_u_9, (ref) v_u_25, (ref) v_u_3, (ref) v_u_21, (ref) v_u_8, (ref) v_u_2, (ref) v_u_22, (ref) v_u_23, (ref) v_u_7, (ref) v_u_14, (ref) v_u_26, (ref) v_u_15, (ref) v_u_16
		return v_u_12(function(p30)
			-- upvalues: (ref) p_u_29, (ref) p_u_28, (ref) v_u_24, (ref) v_u_9, (ref) v_u_25, (ref) v_u_3, (ref) v_u_21, (ref) v_u_8, (ref) v_u_2, (ref) v_u_22, (ref) v_u_23, (ref) v_u_7, (ref) v_u_14, (ref) v_u_26, (ref) v_u_15, (ref) v_u_16
			p_u_29 = p_u_28.props.layoutValues
			local v31 = p_u_28.props.tokens
			local v32 = v31.Size.Size_3000
			local v33 = v31.Size.Size_500
			local v34 = p_u_28.props.player
			local v35
			if v_u_24 then
				v35 = p_u_28.props.showVerifiedBadge
			else
				v35 = v_u_9.Utils.isPlayerVerified(v34)
			end
			local v36 = v_u_25 and p_u_28.props.platformName
			if v36 then
				v36 = p_u_28.props.platformName ~= ""
			end
			local v37
			if v_u_25 then
				v37 = p_u_28.props.canShowPlatformProfile
			else
				v37 = nil
			end
			local v38 = v_u_3.createElement
			local v39 = "TextButton"
			local v40 = {
				["BackgroundTransparency"] = 1,
				["Text"] = "",
				["Size"] = nil,
				["LayoutOrder"] = 0,
				["Selectable"] = false,
				["Size"] = UDim2.new(1, 0, 0, p_u_29.DropDownHeaderSizeY)
			}
			local v41 = {}
			local v42 = v_u_3.createElement
			local v43 = "ImageLabel"
			local v44 = {
				["BackgroundTransparency"] = 1,
				["Image"] = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png",
				["ImageTransparency"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["ImageTransparency"] = p_u_28.props.transparency,
				["Size"] = UDim2.new(1, 0, 0, p_u_29.DropDownHeaderBackgroundSize),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1)
			}
			local v45 = {}
			local v46 = v_u_3.createElement
			local v47 = "Frame"
			local v48 = {
				["Visible"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Visible"] = p_u_28.props.contentVisible,
				["Size"] = UDim2.new(1, -v32, 1, 0),
				["Position"] = UDim2.new(0, v31.Size.Size_2700, 0, 0)
			}
			local v49 = {
				["Layout"] = v_u_3.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Vertical,
					["Padding"] = UDim.new(0, 0),
					["VerticalAlignment"] = Enum.VerticalAlignment.Center
				})
			}
			local v50, v51, v52, v53, v54, v55, v56, v57, v58
			if v35 then
				local v59 = v_u_3.createElement
				local v60 = v_u_21
				local v61 = {
					["fontStyle"] = nil,
					["colorStyle"] = nil,
					["fluidSizing"] = false,
					["emoji"] = nil,
					["maxSize"] = nil,
					["TextSize"] = nil,
					["AutomaticSize"] = nil,
					["LayoutOrder"] = 1,
					["Text"] = nil,
					["TextXAlignment"] = nil,
					["TextTruncate"] = nil,
					["BackgroundTransparency"] = 1,
					["TextScaled"] = nil
				}
				local v62
				if v_u_8 then
					v62 = v_u_2.Dictionary.join(p30.Font.Header2, {
						["Font"] = p30.Tokens.Typography.TitleLarge.Font
					})
				else
					v62 = p30.Font.Header2
				end
				v61.fontStyle = v62
				v61.colorStyle = p30.Theme.TextEmphasis
				v61.emoji = v_u_22.Verified
				v61.maxSize = Vector2.new(p_u_29.PlayerDropDownSizeXMobile - v32, v33)
				local v63
				if v_u_23 then
					v63 = p_u_29.DropDownHeaderDisplayNameTextSize
				else
					v63 = p30.Font.BaseSize * p30.Font.Header2.RelativeSize
				end
				v61.TextSize = v63
				local v64
				if v_u_23 then
					v64 = Enum.AutomaticSize.X
				else
					v64 = nil
				end
				v61.AutomaticSize = v64
				v61.Text = v34.DisplayName
				v61.TextXAlignment = Enum.TextXAlignment.Left
				v61.TextTruncate = Enum.TextTruncate.AtEnd
				v61.TextScaled = not v_u_23 and true or nil
				v50 = v59(v60, v61)
				if not v50 then
					v51 = v_u_3.createElement
					v52 = "TextLabel"
					v53 = {
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
						["TextScaled"] = nil,
						["Size"] = UDim2.new(1, 0, 0, v33),
						["Text"] = v34.DisplayName
					}
					if v_u_8 then
						v54 = nil
					else
						v54 = p30.Font.Header2.Font
					end
					v53.Font = v54
					if v_u_8 then
						v55 = v_u_7(p30.Tokens.Typography.TitleLarge.Font)
					else
						v55 = nil
					end
					v53.FontFace = v55
					if v_u_23 then
						v56 = p_u_29.DropDownHeaderDisplayNameTextSize
					else
						v56 = p30.Font.BaseSize * p30.Font.Header2.RelativeSize
					end
					v53.TextSize = v56
					v53.TextColor3 = p30.Theme.TextEmphasis.Color
					v53.TextTransparency = p30.Theme.TextEmphasis.Transparency
					v53.TextXAlignment = Enum.TextXAlignment.Left
					v53.TextTruncate = Enum.TextTruncate.AtEnd
					v53.TextScaled = not v_u_23 and true or nil
					v57 = {}
					if v_u_23 then
						v58 = nil
					else
						v58 = v_u_3.createElement("UITextSizeConstraint", {
							["MaxTextSize"] = p30.Font.BaseSize * p30.Font.Header2.RelativeSize,
							["MinTextSize"] = p30.Font.BaseSize * p30.Font.Footer.RelativeSize
						})
					end
					v57.SizeConstraint = v58
					v50 = v51(v52, v53, v57)
				end
			else
				v51 = v_u_3.createElement
				v52 = "TextLabel"
				v53 = {
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
					["TextScaled"] = nil,
					["Size"] = UDim2.new(1, 0, 0, v33),
					["Text"] = v34.DisplayName
				}
				if v_u_8 then
					v54 = nil
				else
					v54 = p30.Font.Header2.Font
				end
				v53.Font = v54
				if v_u_8 then
					v55 = v_u_7(p30.Tokens.Typography.TitleLarge.Font)
				else
					v55 = nil
				end
				v53.FontFace = v55
				if v_u_23 then
					v56 = p_u_29.DropDownHeaderDisplayNameTextSize
				else
					v56 = p30.Font.BaseSize * p30.Font.Header2.RelativeSize
				end
				v53.TextSize = v56
				v53.TextColor3 = p30.Theme.TextEmphasis.Color
				v53.TextTransparency = p30.Theme.TextEmphasis.Transparency
				v53.TextXAlignment = Enum.TextXAlignment.Left
				v53.TextTruncate = Enum.TextTruncate.AtEnd
				v53.TextScaled = not v_u_23 and true or nil
				v57 = {}
				if v_u_23 then
					v58 = nil
				else
					v58 = v_u_3.createElement("UITextSizeConstraint", {
						["MaxTextSize"] = p30.Font.BaseSize * p30.Font.Header2.RelativeSize,
						["MinTextSize"] = p30.Font.BaseSize * p30.Font.Footer.RelativeSize
					})
				end
				v57.SizeConstraint = v58
				v50 = v51(v52, v53, v57)
			end
			v49.DisplayName = v50
			local v65 = v_u_3.createElement
			local v66 = "TextLabel"
			local v67 = {
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
				["TextScaled"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v33),
				["Text"] = "@" .. v34.Name
			}
			local v68
			if v_u_8 then
				v68 = nil
			else
				v68 = p30.Font.CaptionHeader.Font
			end
			v67.Font = v68
			local v69
			if v_u_8 then
				v69 = v_u_7(p30.Tokens.Typography.CaptionLarge.Font)
			else
				v69 = nil
			end
			v67.FontFace = v69
			local v70
			if v_u_23 then
				v70 = p_u_29.DropDownHeaderPlayerNameTextSize
			else
				v70 = p30.Font.BaseSize * p30.Font.CaptionHeader.RelativeSize
			end
			v67.TextSize = v70
			v67.TextColor3 = p30.Theme.TextMuted.Color
			v67.TextTransparency = p30.Theme.TextMuted.Transparency
			v67.TextXAlignment = Enum.TextXAlignment.Left
			v67.TextTruncate = Enum.TextTruncate.AtEnd
			v67.TextScaled = not v_u_23 and true or nil
			local v71 = {}
			local v72
			if v_u_23 then
				v72 = nil
			else
				v72 = v_u_3.createElement("UITextSizeConstraint", {
					["MaxTextSize"] = p30.Font.BaseSize * p30.Font.CaptionHeader.RelativeSize,
					["MinTextSize"] = p30.Font.BaseSize * p30.Font.Footer.RelativeSize
				})
			end
			v71.SizeConstraint = v72
			v49.PlayerName = v65(v66, v67, v71)
			local v73 = v_u_25
			if v73 then
				if v36 then
					local v74 = v_u_3.createElement
					local v75 = v_u_14
					local v77 = {
						["LayoutOrder"] = 3,
						["tag"] = "row align-y-center gap-xsmall radius-small",
						["Size"] = nil,
						["onActivated"] = nil,
						["Size"] = UDim2.new(1, 0, 0, v33),
						["onActivated"] = v37 and function()
							-- upvalues: (ref) p_u_28, (ref) v_u_26
							local v76 = p_u_28.props.platformProfileId
							if v_u_26 and (v76 and v76 ~= "") then
								v_u_26:ShowProfile(v76)
							end
						end or nil
					}
					local v78 = {}
					local v79 = v_u_3.createElement
					local v80 = v_u_15
					local v81 = {
						["LayoutOrder"] = 1,
						["Image"] = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
						["tag"] = "size-400",
						["imageStyle"] = nil,
						["imageStyle"] = {
							["Color3"] = p30.Theme.TextMuted.Color,
							["Transparency"] = v37 and 0 or 0.4
						}
					}
					v78.PlatformIcon = v79(v80, v81)
					local v82 = v_u_3.createElement
					local v83 = v_u_16
					local v84 = {
						["LayoutOrder"] = 2,
						["tag"] = "auto-y fill text-align-x-left text-truncate-end",
						["Text"] = nil,
						["fontStyle"] = nil,
						["textStyle"] = nil,
						["Text"] = p_u_28.props.platformName,
						["fontStyle"] = {
							["Font"] = p30.Font.CaptionHeader.Font,
							["FontSize"] = p_u_29.DropDownHeaderPlayerNameTextSize
						}
					}
					local v85 = {
						["Color3"] = p30.Theme.TextMuted.Color
					}
					local v86
					if v37 then
						v86 = p30.Theme.TextMuted.Transparency
					else
						local v87 = p30.Theme.TextMuted.Transparency + 0.3
						v86 = math.clamp(v87, 0, 1)
					end
					v85.Transparency = v86
					v84.textStyle = v85
					v78.PlatformNameButton = v82(v83, v84)
					v36 = v74(v75, v77, v78)
				end
			else
				v36 = v73
			end
			v49.PlatformName = v36
			v45.TextContainerFrame = v46(v47, v48, v49)
			v41.Background = v42(v43, v44, v45)
			v41.AvatarImage = v_u_3.createElement("ImageLabel", {
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["ImageTransparency"] = nil,
				["Image"] = nil,
				["ZIndex"] = 2,
				["Position"] = UDim2.new(0, v31.Size.Size_1400, 0, 0),
				["Size"] = UDim2.new(0, p_u_29.DropDownHeaderSizeY, 0, p_u_29.DropDownHeaderSizeY),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["ImageTransparency"] = p_u_28.props.transparency,
				["Image"] = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(v34.UserId)
			})
			local v88 = not p_u_28.props.lastButton
			if v88 then
				v88 = v_u_3.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Visible"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["ZIndex"] = 3,
					["Size"] = UDim2.new(1, 0, 0, 1),
					["Position"] = UDim2.new(0, 0, 1, 0),
					["AnchorPoint"] = Vector2.new(0, 1),
					["Visible"] = p_u_28.props.contentVisible,
					["BackgroundTransparency"] = p30.Theme.Divider.Transparency,
					["BackgroundColor3"] = p30.Theme.Divider.Color
				})
			end
			v41.Divider = v88
			return v38(v39, v40, v41)
		end)
	end)
end
return function(p89)
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_24, (copy) v_u_20, (copy) v_u_25, (copy) v_u_19, (copy) v_u_26, (copy) v_u_3, (copy) v_u_27, (copy) v_u_2
	local v90 = v_u_11()
	local v91 = v_u_13()
	local v92
	if v_u_24 then
		v92 = v_u_20(p89.player)
	else
		v92 = nil
	end
	local v93 = nil
	local v94 = nil
	local v95
	if v_u_25 then
		local v96 = p89.player.UserId
		local v97 = tostring(v96)
		local v98 = v_u_19.Hooks.useUserProfilesFetch({
			["userIds"] = { v97 },
			["query"] = v_u_19.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		if v98.data then
			v93 = v_u_19.Selectors.getPlatformNameFromId(v98.data, v97)
			v94 = v_u_19.Selectors.getPlatformProfileIdFromId(v98.data, v97)
		end
		v95 = game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and (v_u_26 and v_u_26:IsProfileEnabled())
		if v95 then
			if v94 then
				v95 = v94 ~= ""
			else
				v95 = v94
			end
		end
	else
		v95 = nil
	end
	local v99 = v_u_3.createElement
	local v100 = v_u_27
	local v101 = v_u_2.Dictionary.join
	local v102 = {
		["layoutValues"] = v90,
		["tokens"] = v91
	}
	if not v_u_24 then
		v92 = nil
	end
	v102.showVerifiedBadge = v92
	if not v_u_25 then
		v93 = nil
	end
	v102.platformName = v93
	if not v_u_25 then
		v94 = nil
	end
	v102.platformProfileId = v94
	if not v_u_25 then
		v95 = nil
	end
	v102.canShowPlatformProfile = v95
	return v99(v100, v101(p89, v102))
end