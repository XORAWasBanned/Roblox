-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage.AddFriendsNow
local v_u_1 = game:GetService("TextService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v2.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v8 = v4.UIBlox
local v_u_9 = v8.App.Button.Button
local v_u_10 = v8.App.Button.Enum.ButtonType
local v_u_11 = require(v2.Workspace.Packages.Style).GetTextSize
local v_u_12 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v13 = script.Parent.Parent.Parent
local v_u_14 = require(v13.Localization.withLocalization)
local v_u_15 = require(v13.Resources.Assets)
local v_u_16 = require(v13.Components.ThemedTextLabel)
local v_u_17 = require(v13.Components.Connection.FocusHandler)
local v_u_18 = require(v13.Components.Connection.RootedConnection)
local v_u_19 = require(v13.Actions.SetCurrentPage)
local v_u_20 = v8.Core.ImageSet.ImageSetLabel
local v21 = require(v2.Packages.Foundation)
local v_u_22 = v21.Utility.Flags.FoundationFontFaceMigration
local v_u_23 = v21.Image
local v_u_24 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v25 = v_u_5.PureComponent:extend("AddFriendsNow")
v25.validateProps = v7.strictInterface({
	["switchToPlayers"] = v7.callback,
	["canCaptureFocus"] = v7.boolean
})
function v25.init(p26) -- name: init
	-- upvalues: (copy) v_u_5
	p26.buttonRef = v_u_5.createRef()
end
function v25.render(p_u_27) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_22, (copy) v_u_14, (copy) v_u_11, (copy) v_u_1, (copy) v_u_5, (copy) v_u_24, (copy) v_u_23, (copy) v_u_15, (copy) v_u_20, (copy) v_u_16, (copy) v_u_18, (copy) v_u_17, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10
	local v_u_28 = p_u_27.props
	return v_u_12(function(p29)
		-- upvalues: (ref) v_u_22
		local v30 = {}
		local v31
		if v_u_22 then
			v31 = p29
		else
			v31 = nil
		end
		v30.Tokens = v31
		v30.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p29.Typography.BodyLarge.Font,
				["RelativeSize"] = p29.Typography.BodyLarge.FontSize
			}
		}
		return v30
	end, function(p_u_32)
		-- upvalues: (ref) v_u_14, (ref) v_u_22, (ref) v_u_11, (ref) v_u_1, (ref) v_u_5, (ref) v_u_24, (ref) v_u_23, (ref) v_u_15, (ref) v_u_20, (ref) v_u_16, (ref) v_u_18, (ref) v_u_17, (copy) v_u_28, (ref) v_u_3, (copy) p_u_27, (ref) v_u_9, (ref) v_u_10
		return v_u_14({
			["noFriendsText"] = "CoreScripts.InGameMenu.InviteFriends.NoFriends",
			["makeFriendsNow"] = "CoreScripts.InGameMenu.InviteFriends.MakeFriendsNow"
		})(function(p_u_33)
			-- upvalues: (copy) p_u_32, (ref) v_u_22, (ref) v_u_11, (ref) v_u_1, (ref) v_u_5, (ref) v_u_24, (ref) v_u_23, (ref) v_u_15, (ref) v_u_20, (ref) v_u_16, (ref) v_u_18, (ref) v_u_17, (ref) v_u_28, (ref) v_u_3, (ref) p_u_27, (ref) v_u_9, (ref) v_u_10
			local v34 = p_u_32.Font.Body.Font
			local v35 = p_u_32.Font.Body.RelativeSize * p_u_32.Font.BaseSize
			local v36
			if v_u_22 then
				v36 = v_u_11(p_u_33.noFriendsText, v35, p_u_32.Tokens.Typography.BodyLarge.Font, Vector2.new(304, (1 / 0)), {
					["addTemporaryPadding"] = false
				}).Y
			else
				v36 = v_u_1:GetTextSize(p_u_33.noFriendsText, v35, v34, Vector2.new(304, (1 / 0))).Y
			end
			local v37 = v_u_5.createElement
			local v38 = "Frame"
			local v39 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = UDim2.new(0, 304, 1, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0)
			}
			local v40 = {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				})
			}
			local v41
			if v_u_24 then
				local v42 = v_u_5.createElement
				local v43 = v_u_23
				local v44 = {
					["Image"] = nil,
					["imageRect"] = nil,
					["Size"] = nil,
					["imageStyle"] = nil,
					["LayoutOrder"] = 1,
					["Image"] = v_u_15.Images.AddFriend.Image,
					["imageRect"] = {
						["offset"] = v_u_15.Images.AddFriend.ImageRectOffset,
						["size"] = v_u_15.Images.AddFriend.ImageRectSize
					},
					["Size"] = UDim2.new(0, 64, 0, 64),
					["imageStyle"] = {
						["Color3"] = nil,
						["Transparency"] = 0.5,
						["Color3"] = Color3.new(1, 1, 1)
					}
				}
				v41 = v42(v43, v44)
			else
				v41 = v_u_5.createElement(v_u_20, {
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["Size"] = nil,
					["ImageTransparency"] = 0.5,
					["LayoutOrder"] = 1,
					["Image"] = v_u_15.Images.AddFriend,
					["Size"] = UDim2.new(0, 64, 0, 64)
				})
			end
			v40.Icon = v41
			local v45 = v_u_5.createElement
			local v46 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, v36 + 20)
			}
			local v47 = {
				["Text"] = v_u_5.createElement(v_u_16, {
					["fontKey"] = "Body",
					["themeKey"] = "TextEmphasis",
					["Text"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["TextXAlignment"] = nil,
					["TextWrapped"] = true,
					["Text"] = p_u_33.noFriendsText,
					["Position"] = UDim2.new(0, 0, 0, 4),
					["Size"] = UDim2.new(1, 0, 1, -20),
					["TextXAlignment"] = Enum.TextXAlignment.Center
				})
			}
			v40.TextContainer = v45("Frame", v46, v47)
			local v54 = {
				["render"] = function(p48) -- name: render
					-- upvalues: (ref) v_u_5, (ref) v_u_17, (ref) v_u_28, (ref) v_u_3, (ref) p_u_27, (ref) v_u_9, (ref) v_u_10, (copy) p_u_33
					local v49 = v_u_5.createElement
					local v50 = v_u_17
					local v51 = {
						["isFocused"] = v_u_28.canCaptureFocus and p48,
						["didFocus"] = function() -- name: didFocus
							-- upvalues: (ref) v_u_3, (ref) p_u_27
							v_u_3.SelectedCoreObject = p_u_27.buttonRef:getValue()
						end
					}
					local v52 = {}
					local v53
					if p48 then
						v53 = v_u_5.createElement(v_u_9, {
							["buttonType"] = nil,
							["layoutOrder"] = 3,
							["size"] = nil,
							["text"] = nil,
							["onActivated"] = nil,
							["buttonRef"] = nil,
							["buttonType"] = v_u_10.Secondary,
							["size"] = UDim2.new(1, 0, 0, 48),
							["text"] = p_u_33.makeFriendsNow,
							["onActivated"] = v_u_28.switchToPlayers,
							["buttonRef"] = p_u_27.buttonRef
						}) or nil
					else
						v53 = nil
					end
					v52.MakeFriendsButton = v53
					return v49(v50, v51, v52)
				end
			}
			v40.RootedConnection = v_u_5.createElement(v_u_18, v54)
			return v37(v38, v39, v40)
		end)
	end)
end
return v6.UNSTABLE_connect2(nil, function(p_u_55)
	-- upvalues: (copy) v_u_19
	return {
		["switchToPlayers"] = function() -- name: switchToPlayers
			-- upvalues: (copy) p_u_55, (ref) v_u_19
			p_u_55(v_u_19("Players"))
		end
	}
end)(v25)