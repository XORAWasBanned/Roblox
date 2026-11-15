-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Connect.registerConnectIntegration
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
local v5 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_6 = require(script.Parent.ConnectIcon)
local v_u_7 = require(v2.Workspace.Packages.Responsive)
local v_u_8 = require(v2.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_9 = require(v1.Integrations.ChromeIntegrationUtils)
local v_u_10 = require(v1.ChromeShared.Service.LocalStore)
local v11 = v5.MappedSignal
local v_u_12 = require(v1.Flags.GetFStringConnectTooltipLocalStorageKey)
local v_u_13 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_14 = require(v2.Workspace.Packages.AppCommonLib).Symbol
local v_u_15 = require(v2.Workspace.Packages.Chrome).FocusUtils
local v_u_16 = require(v2.Workspace.Packages.UniversalAppPolicy)
local v_u_17 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_18 = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false)
local v19 = require(v2.Workspace.Packages.SharedFlags)
local v_u_20 = v19.GetFFlagIsSquadEnabled
local v_u_21 = v19.FFlagAppChatDistinctUnibarEntryPoint
local v_u_22 = require(v2.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local v_u_23 = v11.new(v_u_8.default.visibilitySignal.Event, function()
	-- upvalues: (copy) v_u_8
	return v_u_8:getVisible()
end)
return function(p_u_24, p25)
	-- upvalues: (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_4, (copy) v_u_17, (copy) v_u_16, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_23, (copy) v_u_3, (copy) v_u_6, (copy) v_u_18, (copy) v_u_14, (copy) v_u_13
	local v_u_26
	if p_u_24 == "connect_unibar" then
		v_u_26 = v_u_20()
	else
		v_u_26 = false
	end
	local v_u_27
	if v_u_21 and p_u_24 == "connect_unibar" then
		v_u_27 = v_u_22.ChromeUnibar
	else
		v_u_27 = nil
	end
	local v28 = v_u_4
	local v29 = {
		["id"] = p_u_24
	}
	local v30
	if p_u_24 == "connect_unibar" then
		v30 = v_u_17.Unibar
	else
		v30 = v_u_17.BelowFold
	end
	v29.sideSheetPlacement = v30
	v29.label = v_u_16.getAppFeaturePolicies().getCanSeeChatTerminology() and "Feature.Chat.Title.FriendsChat" or "Feature.Squads.Label.Party"
	function v29.activated() -- name: activated
		-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_7, (ref) v_u_15, (copy) v_u_27, (ref) v_u_10, (ref) v_u_12
		if v_u_8:getVisible() then
			v_u_8.default:setVisible(false)
		else
			v_u_9.dismissRobloxMenuAndRun(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_15, (ref) v_u_8, (ref) v_u_27
				if v_u_7.GetInputModeStore(false).getLastInputType(false) == v_u_7.Input.Directional then
					v_u_15.FocusOffChrome()
				end
				v_u_8.default:setVisible(true, v_u_27)
			end)
		end
		v_u_10.storeForLocalPlayer(v_u_12(), true)
	end
	v29.isActivated = v_u_23
	v29.components = {
		["Icon"] = function(p31) -- name: Icon
			-- upvalues: (ref) v_u_3, (ref) v_u_6, (copy) p_u_24, (ref) v_u_18, (copy) v_u_26
			return v_u_3.createElement(v_u_6, {
				["integrationId"] = p_u_24,
				["isIconVisible"] = p31.visible,
				["shouldShowCustomBadge"] = not v_u_18,
				["isSquadIndicatorEnabled"] = v_u_26
			})
		end
	}
	v29.initialAvailability = p25
	local v_u_32 = v28:register(v29)
	if v_u_18 then
		if v_u_26 then
			v_u_8.default.currentSquadIdSignal.Event:Connect(function(p33)
				-- upvalues: (ref) v_u_8, (copy) v_u_32
				local v34 = v_u_8.default.unreadCount
				local v35 = p33 ~= ""
				if v34 == 0 or v35 then
					v_u_32.notification:clear()
				else
					v_u_32.notification:fireCount(v34)
				end
			end)
			v_u_8.default.unreadCountSignal.Event:Connect(function(p36)
				-- upvalues: (ref) v_u_8, (copy) v_u_32
				local v37 = v_u_8.default.currentSquadId ~= ""
				if p36 == 0 or v37 then
					v_u_32.notification:clear()
				else
					v_u_32.notification:fireCount(p36)
				end
			end)
			local v38 = v_u_8.default.unreadCount
			local v39 = v_u_8.default.currentSquadId ~= ""
			if v38 == 0 or v39 then
				v_u_32.notification:clear()
			else
				v_u_32.notification:fireCount(v38)
			end
		else
			v_u_8.default.unreadCountSignal.Event:Connect(function(p40)
				-- upvalues: (copy) v_u_32
				if p40 == 0 then
					v_u_32.notification:clear()
				else
					v_u_32.notification:fireCount(p40)
				end
			end)
			local v41 = v_u_8.default.unreadCount
			if v41 == 0 then
				v_u_32.notification:clear()
			else
				v_u_32.notification:fireCount(v41)
			end
		end
	end
	local v_u_42 = v_u_14.named("InExperienceRobloxConnect")
	v_u_8.default.visibilitySignal.Event:Connect(function(p43)
		-- upvalues: (ref) v_u_13, (copy) v_u_42
		if p43 then
			v_u_13.push(v_u_42, Enum.OverrideMouseIconBehavior.ForceShow)
		else
			v_u_13.pop(v_u_42)
		end
	end)
	return v_u_32
end