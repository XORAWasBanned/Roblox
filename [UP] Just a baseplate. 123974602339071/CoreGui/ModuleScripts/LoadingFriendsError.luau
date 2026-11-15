-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage.LoadingFriendsError
local v_u_1 = game:GetService("TextService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v2.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.t
local v7 = v4.UIBlox
local v_u_8 = v7.App.Button.Button
local v_u_9 = v7.App.Button.Enum.ButtonType
local v_u_10 = require(v2.Workspace.Packages.Style).GetTextSize
local v_u_11 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v12 = script.Parent.Parent.Parent
local v_u_13 = require(v12.Localization.withLocalization)
local v_u_14 = require(v12.Resources.Assets)
local v_u_15 = require(v12.Components.ThemedTextLabel)
local v_u_16 = require(v12.Components.Connection.FocusHandler)
local v_u_17 = require(v12.Components.Connection.RootedConnection)
local v_u_18 = v7.Core.ImageSet.ImageSetLabel
local v19 = require(v2.Packages.Foundation)
local v_u_20 = v19.Utility.Flags.FoundationFontFaceMigration
local v_u_21 = v19.Image
local v_u_22 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v23 = v_u_5.PureComponent:extend("LoadingFriendsError")
v23.validateProps = v6.strictInterface({
	["onRetry"] = v6.callback,
	["canCaptureFocus"] = v6.boolean
})
function v23.init(p24) -- name: init
	-- upvalues: (copy) v_u_5
	p24.buttonRef = v_u_5.createRef()
end
function v23.render(p_u_25) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_20, (copy) v_u_13, (copy) v_u_10, (copy) v_u_1, (copy) v_u_5, (copy) v_u_22, (copy) v_u_21, (copy) v_u_14, (copy) v_u_18, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9
	local v_u_26 = p_u_25.props
	return v_u_11(function(p27)
		-- upvalues: (ref) v_u_20
		local v28 = {}
		local v29
		if v_u_20 then
			v29 = p27
		else
			v29 = nil
		end
		v28.Tokens = v29
		v28.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p27.Typography.BodyLarge.Font,
				["RelativeSize"] = p27.Typography.BodyLarge.FontSize
			}
		}
		return v28
	end, function(p_u_30)
		-- upvalues: (ref) v_u_13, (ref) v_u_20, (ref) v_u_10, (ref) v_u_1, (ref) v_u_5, (ref) v_u_22, (ref) v_u_21, (ref) v_u_14, (ref) v_u_18, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (copy) v_u_26, (ref) v_u_3, (copy) p_u_25, (ref) v_u_8, (ref) v_u_9
		return v_u_13({
			["errorOccured"] = "CoreScripts.InGameMenu.InviteFriends.ErrorOccured"
		})(function(p31)
			-- upvalues: (copy) p_u_30, (ref) v_u_20, (ref) v_u_10, (ref) v_u_1, (ref) v_u_5, (ref) v_u_22, (ref) v_u_21, (ref) v_u_14, (ref) v_u_18, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (ref) v_u_26, (ref) v_u_3, (ref) p_u_25, (ref) v_u_8, (ref) v_u_9
			local v32 = p_u_30.Font.Body.Font
			local v33 = p_u_30.Font.Body.RelativeSize * p_u_30.Font.BaseSize
			local v34
			if v_u_20 then
				v34 = v_u_10(p31.errorOccured, v33, p_u_30.Tokens.Typography.BodyLarge.Font, Vector2.new(304, (1 / 0)), {
					["addTemporaryPadding"] = false
				}).Y
			else
				v34 = v_u_1:GetTextSize(p31.errorOccured, v33, v32, Vector2.new(304, (1 / 0))).Y
			end
			local v35 = v_u_5.createElement
			local v36 = "Frame"
			local v37 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = UDim2.new(0, 304, 1, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0)
			}
			local v38 = {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				})
			}
			local v39
			if v_u_22 then
				local v40 = v_u_5.createElement
				local v41 = v_u_21
				local v42 = {
					["Image"] = nil,
					["imageRect"] = nil,
					["Size"] = nil,
					["imageStyle"] = nil,
					["LayoutOrder"] = 1,
					["Image"] = v_u_14.Images.Friends.Image,
					["imageRect"] = {
						["offset"] = v_u_14.Images.Friends.ImageRectOffset,
						["size"] = v_u_14.Images.Friends.ImageRectSize
					},
					["Size"] = UDim2.new(0, 64, 0, 64),
					["imageStyle"] = {
						["Color3"] = nil,
						["Transparency"] = 0.5,
						["Color3"] = Color3.new(1, 1, 1)
					}
				}
				v39 = v40(v41, v42)
			else
				v39 = v_u_5.createElement(v_u_18, {
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["Size"] = nil,
					["ImageTransparency"] = 0.5,
					["LayoutOrder"] = 1,
					["Image"] = v_u_14.Images.Friends,
					["Size"] = UDim2.new(0, 64, 0, 64)
				})
			end
			v38.Icon = v39
			local v43 = v_u_5.createElement
			local v44 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, v34 + 36)
			}
			local v45 = {
				["Text"] = v_u_5.createElement(v_u_15, {
					["fontKey"] = "Body",
					["themeKey"] = "TextEmphasis",
					["Text"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["TextXAlignment"] = nil,
					["TextWrapped"] = true,
					["Text"] = p31.errorOccured,
					["Position"] = UDim2.new(0, 0, 0, 10),
					["Size"] = UDim2.new(1, 0, 1, -36),
					["TextXAlignment"] = Enum.TextXAlignment.Center
				})
			}
			v38.TextContainer = v43("Frame", v44, v45)
			local v52 = {
				["render"] = function(p46) -- name: render
					-- upvalues: (ref) v_u_5, (ref) v_u_16, (ref) v_u_26, (ref) v_u_3, (ref) p_u_25, (ref) v_u_8, (ref) v_u_9, (ref) v_u_14
					local v47 = v_u_5.createElement
					local v48 = v_u_16
					local v49 = {
						["isFocused"] = v_u_26.canCaptureFocus and p46,
						["didFocus"] = function() -- name: didFocus
							-- upvalues: (ref) v_u_3, (ref) p_u_25
							v_u_3.SelectedCoreObject = p_u_25.buttonRef:getValue()
						end
					}
					local v50 = {}
					local v51
					if p46 then
						v51 = v_u_5.createElement(v_u_8, {
							["buttonType"] = nil,
							["layoutOrder"] = 3,
							["size"] = nil,
							["icon"] = nil,
							["onActivated"] = nil,
							["buttonRef"] = nil,
							["buttonType"] = v_u_9.Secondary,
							["size"] = UDim2.new(1, 0, 0, 48),
							["icon"] = v_u_14.Images.RetryIcon,
							["onActivated"] = v_u_26.onRetry,
							["buttonRef"] = p_u_25.buttonRef
						}) or nil
					else
						v51 = nil
					end
					v50.RetryButton = v51
					return v47(v48, v49, v50)
				end
			}
			v38.RootedConnection = v_u_5.createElement(v_u_17, v52)
			return v35(v36, v37, v38)
		end)
	end)
end
return v23