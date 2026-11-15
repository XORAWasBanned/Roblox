-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Connect.ConnectIcon
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
local v_u_4 = require(v2.Packages.Foundation)
local v_u_5 = require(v2.Packages.React)
local v_u_6 = require(v1.ChromeShared.Unibar.Constants)
local v7 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_8 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_9 = v7.MappedSignal
local v_u_10 = v_u_4.Hooks.useTokens
local v_u_11 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_12 = require(v1.ChromeShared.Unibar.SubMenuContext)
local v_u_13 = require(v2.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v14 = require(v2.Workspace.Packages.AppChat.getAppChatNavbarItemConfig)
local v_u_15 = require(v1.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_16 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableChatIconUnibarDropdownFixEnabled
local v_u_17 = v14()
local v_u_18 = {
	["integrationId"] = "",
	["shouldShowCustomBadge"] = true,
	["isSquadIndicatorEnabled"] = false
}
return function(p19) -- name: ConnectIcon
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_10, (copy) v_u_15, (copy) v_u_11, (copy) v_u_6, (copy) v_u_5, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (copy) v_u_16, (copy) v_u_4, (copy) v_u_17
	local v_u_20 = v_u_3.Dictionary.union(v_u_18, p19)
	local v_u_21 = v_u_10()
	local v22
	if v_u_15 then
		v22 = v_u_11.use().ICON_SIZE
	else
		v22 = v_u_6.ICON_SIZE
	end
	local v23, v_u_24 = v_u_5.useState(v_u_13.default.unreadCount)
	if v_u_20.shouldShowCustomBadge then
		v_u_5.useEffect(function()
			-- upvalues: (ref) v_u_13, (copy) v_u_24
			local v_u_26 = v_u_13.default.unreadCountSignal.Event:Connect(function(p25)
				-- upvalues: (ref) v_u_24
				v_u_24(p25)
			end)
			return function()
				-- upvalues: (copy) v_u_26
				v_u_26:Disconnect()
			end
		end, { v_u_24 })
	else
		v23 = 0
	end
	local v27 = nil
	local v28, v_u_29
	if v_u_20.isSquadIndicatorEnabled then
		v28, v_u_29 = v_u_5.useState(v_u_13.default.currentSquadId)
	else
		v_u_29 = nil
		v28 = nil
	end
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_20, (ref) v_u_13, (ref) v_u_29
		if not v_u_20.isSquadIndicatorEnabled then
			return function() end
		end
		local v_u_31 = v_u_13.default.currentSquadIdSignal.Event:Connect(function(p30)
			-- upvalues: (ref) v_u_29
			v_u_29(p30)
		end)
		return function()
			-- upvalues: (copy) v_u_31
			v_u_31:Disconnect()
		end
	end, { v_u_20.isSquadIndicatorEnabled, v_u_29 })
	if v_u_20.isSquadIndicatorEnabled then
		if v28 == "" then
			if v23 > 0 then
				v27 = v_u_21.Color.System.Contrast
			end
		else
			v27 = v_u_21.Color.System.Success
		end
	end
	local v32
	if v_u_20.isSquadIndicatorEnabled then
		v32 = v27
	else
		v32 = v23 > 0
	end
	local v33 = v_u_8((v_u_9.new(v_u_13.default.visibilitySignal.Event, function(_)
		-- upvalues: (ref) v_u_13
		return v_u_13:getVisible()
	end)))
	local v34 = v_u_5.useContext(v_u_12)
	local v35
	if v_u_16 then
		local v_u_36 = v_u_21.Color.Content.Default.Transparency
		if v34 then
			v35 = v34:map(function(p37)
				-- upvalues: (copy) v_u_21, (copy) v_u_36
				return {
					["Color3"] = v_u_21.Color.Content.Default.Color3,
					["Transparency"] = v_u_36 + (1 - v_u_36) * (1 - p37)
				}
			end)
		else
			v35 = v_u_21.Color.Content.Default
		end
	else
		v35 = nil
	end
	local v38 = v_u_5.createElement
	local v39 = v_u_4.View
	local v40 = {
		["Size"] = UDim2.new(0, v22, 0, v22)
	}
	local v41 = {}
	local v42 = v_u_5.createElement
	local v43 = v_u_4.Icon
	local v44 = {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["name"] = v_u_17.icon
	}
	local v45
	if v33 then
		v45 = v_u_4.Enums.IconVariant.Filled
	else
		v45 = v_u_4.Enums.IconVariant.Regular
	end
	v44.variant = v45
	if not v_u_16 then
		v35 = nil
	end
	v44.style = v35
	v41.Icon = v42(v43, v44)
	local v46
	if v32 then
		local v47 = v_u_5.createElement
		local v48 = v_u_4.View
		local v49 = {
			["Position"] = nil,
			["backgroundStyle"] = nil,
			["stroke"] = nil,
			["tag"] = nil,
			["ZIndex"] = 2,
			["Position"] = UDim2.new(1, -v_u_21.Stroke.Thicker, 0, v_u_21.Stroke.Thicker)
		}
		local v50
		if v_u_20.isSquadIndicatorEnabled then
			v50 = {
				["Color3"] = v27.Color3
			}
			local v_u_51 = v27.Transparency
			if v34 then
				v_u_51 = v34:map(function(p52)
					-- upvalues: (copy) v_u_51
					return v_u_51 + (1 - v_u_51) * (1 - p52)
				end)
			end
			v50.Transparency = v_u_51
		else
			v50 = {
				["Color3"] = v_u_21.Color.System.Contrast.Color3
			}
			local v_u_53 = v_u_21.Color.System.Contrast.Transparency
			if v34 then
				v_u_53 = v34:map(function(p54)
					-- upvalues: (copy) v_u_53
					return v_u_53 + (1 - v_u_53) * (1 - p54)
				end)
			end
			v50.Transparency = v_u_53
		end
		v49.backgroundStyle = v50
		local v55 = {
			["Color"] = v_u_21.Color.Surface.Surface_0.Color3
		}
		local v_u_56 = v_u_21.Color.Surface.Surface_0.Transparency
		if v34 then
			v_u_56 = v34:map(function(p57)
				-- upvalues: (copy) v_u_56
				return v_u_56 + (1 - v_u_56) * (1 - p57)
			end)
		end
		v55.Transparency = v_u_56
		v55.Thickness = v_u_21.Stroke.Thicker
		v49.stroke = v55
		v49.tag = {
			["anchor-top-right radius-circle size-200"] = true,
			["stroke-thicker"] = not v_u_16
		}
		v46 = v47(v48, v49)
	else
		v46 = nil
	end
	v41.Badge = v46
	return v38(v39, v40, v41)
end