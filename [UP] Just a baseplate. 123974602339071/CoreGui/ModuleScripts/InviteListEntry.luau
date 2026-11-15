-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.InviteListEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.ReactRoblox)
local v5 = game:GetService("CoreGui").RobloxGui.Modules
local v6 = v5.Settings.Pages.ShareGame
local v_u_7 = require(v1.Packages.UIBlox).Utility.OpenTypeSupport
local v_u_8 = require(v1.Workspace.Packages.CoreScriptsCommon).Constants
local v_u_9 = require(v5.Settings.Theme)
local v_u_10 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_11 = require(v1.Workspace.Packages.GameInvite).GameInviteEvents
local v12 = require(v6.Constants)
local v_u_13 = require(v6.PresenceUtil)
local v_u_14 = require(v6.Components.SingleUserThumbnail)
local v_u_15 = require(v6.Components.InviteButton)
local v_u_16 = v12.InviteStatus
local v_u_17 = require(v6.ThrottleFunctionCall)
local v_u_18 = require(v5.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local v_u_19 = require(v5.Flags.GetFFlagEnableNewInviteSendEndpoint)
local v_u_20 = require(v5.Flags.GetFFlagThrottleInviteSendEndpoint)
local v_u_21 = require(v5.Flags.GetFIntThrottleInviteSendEndpointDelay)
local v_u_22 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local v_u_23 = Rect.new(10, 10, 10, 10)
return function(p_u_24)
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_2, (copy) v_u_19, (copy) v_u_11, (copy) v_u_18, (copy) v_u_20, (copy) v_u_17, (copy) v_u_21, (copy) v_u_23, (copy) v_u_9, (copy) v_u_4, (copy) v_u_14, (copy) v_u_13, (copy) v_u_8, (copy) v_u_10, (copy) v_u_22, (copy) v_u_7, (copy) v_u_15
	local v_u_25 = p_u_24.user
	local v36 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_24, (ref) v_u_16, (copy) v_u_25, (ref) v_u_2, (ref) v_u_19, (ref) v_u_11, (ref) v_u_18
		local v26 = p_u_24.inviteUser
		local v27 = p_u_24.inviteStatus
		local v_u_28 = p_u_24.analytics
		if v27 and v27 ~= v_u_16.Failed then
			return
		else
			local function v31(p29)
				-- upvalues: (ref) v_u_25, (ref) v_u_2, (copy) v_u_28
				if p29 then
					local v30 = { v_u_25.id }
					if v_u_2.LocalPlayer and p29 then
						v_u_28:onActivatedInviteSent(v_u_2.LocalPlayer.UserId, p29.conversationId, v30)
					end
				end
			end
			if v_u_19() then
				local v32
				if p_u_24.launchData == nil then
					v32 = false
				else
					v32 = p_u_24.launchData ~= ""
				end
				local v33 = p_u_24.trigger
				local v34 = v_u_11.SendInvite
				local v35 = {
					["recipient"] = v_u_25.id
				}
				if not v_u_18() then
					v32 = nil
				end
				v35.isLaunchDataProvided = v32
				v_u_28:sendEvent(v33, v34, v35)
				v26(v_u_25.id, v_u_28, p_u_24.trigger, p_u_24.inviteMessageId, p_u_24.launchData):andThen(v31, function() end)
			else
				v26(v_u_25.id):andThen(v31, function() end)
			end
		end
	end, {
		p_u_24.inviteUser,
		p_u_24.inviteStatus,
		p_u_24.analytics,
		v_u_25
	})
	if v_u_20() then
		v36 = v_u_3.useCallback(v_u_17(v_u_21(), v36), { v36 })
	end
	if p_u_24.visible then
		local v37 = v_u_3.createElement
		local v38 = "ImageButton"
		local v39 = {
			["Size"] = UDim2.new(1, 0, 0, 60),
			["ScaleType"] = Enum.ScaleType.Stretch,
			["SliceCenter"] = v_u_23,
			["BackgroundColor3"] = v_u_9.color("PlayerRowFrame"),
			["BackgroundTransparency"] = v_u_9.transparency("PlayerRowFrame", 1),
			["ImageTransparency"] = 0.85,
			["LayoutOrder"] = p_u_24.layoutOrder
		}
		local v40 = v_u_4.Event.Activated
		local v41
		if p_u_24.isFullRowActivatable then
			v41 = v36
		else
			v41 = nil
		end
		v39[v40] = v41
		local v42 = {
			["UICorner"] = v_u_3.createElement("UICorner", {
				["CornerRadius"] = v_u_9.MenuContainerCornerRadius
			}),
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingRight"] = UDim.new(0, 16),
				["PaddingLeft"] = UDim.new(0, 8)
			}),
			["Thumbnail"] = v_u_3.createElement(v_u_14, {
				["user"] = v_u_25,
				["size"] = UDim2.new(0, 44, 0, 44),
				["position"] = UDim2.new(0, 0, 0.5, 0),
				["anchorPoint"] = Vector2.new(0, 0.5)
			})
		}
		local v43 = v_u_3.createElement
		local v44 = "Frame"
		local v45 = {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["Position"] = UDim2.new(0, 44, 0, 0),
			["Size"] = UDim2.new(1, -118, 1, 0)
		}
		local v46 = {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 8)
			}),
			["ListLayout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 4)
			}),
			["DisplayNameWrapper"] = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, 0, 0, 16)
			}, {
				["PresenceIconLayout"] = v_u_3.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["Padding"] = UDim.new(0, 4)
				}),
				["Icon"] = v_u_13.GetIcon(v_u_25.presence),
				["DisplayName"] = v_u_3.createElement("TextLabel", {
					["Size"] = nil,
					["Text"] = nil,
					["TextSize"] = 16,
					["TextColor3"] = nil,
					["Font"] = nil,
					["BackgroundTransparency"] = 1,
					["TextXAlignment"] = nil,
					["LayoutOrder"] = 2,
					["Size"] = UDim2.new(0, 0, 0, 16),
					["Text"] = v_u_25.displayName,
					["TextColor3"] = v_u_8.COLORS.WHITE,
					["Font"] = v_u_10.default:getMedium(),
					["TextXAlignment"] = Enum.TextXAlignment.Left
				})
			})
		}
		local v47 = v_u_3.createElement
		local v48 = "TextLabel"
		local v49 = {
			["Size"] = nil,
			["Text"] = nil,
			["TextSize"] = 16,
			["TextColor3"] = nil,
			["Font"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["OpenTypeFeatures"] = nil,
			["Size"] = UDim2.new(0, 0, 0, 16),
			["Text"] = "@" .. v_u_25.name,
			["TextColor3"] = v_u_8.COLORS.PUMICE,
			["Font"] = v_u_10.default:getDefault(),
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}
		local v50
		if v_u_22() then
			v50 = v_u_7:getUserNameStylisticAlternative()
		else
			v50 = nil
		end
		v49.OpenTypeFeatures = v50
		v46.Username = v47(v48, v49)
		v42.UserInfo = v43(v44, v45, v46)
		v42.InviteButton = v_u_3.createElement(v_u_15, {
			["size"] = UDim2.new(0, 66, 0, 36),
			["position"] = UDim2.new(1, 0, 0.5, 0),
			["anchorPoint"] = Vector2.new(1, 0.5),
			["onInvite"] = v36,
			["inviteStatus"] = p_u_24.inviteStatus
		})
		return v37(v38, v39, v42)
	end
end