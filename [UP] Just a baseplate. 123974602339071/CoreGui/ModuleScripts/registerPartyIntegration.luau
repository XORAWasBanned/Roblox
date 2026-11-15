-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.registerPartyIntegration
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(script.Parent.PartyIcon)
local v_u_4 = require(v1.Service)
local v_u_5 = require(v1.Integrations.ChromeIntegrationUtils)
local v_u_6 = require(v1.Flags.GetFStringConnectTooltipLocalStorageKey)
local v_u_7 = require(v1.ChromeShared.Service.LocalStore)
local v8 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
local v_u_9 = require(v2.Workspace.Packages.Chrome).FocusUtils
local v10 = require(v2.Workspace.Packages.Chrome)
local v_u_11 = require(v2.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_12 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_13 = require(v2.Packages.React)
local v_u_14 = require(v2.Workspace.Packages.Responsive)
local v_u_15 = require(v2.Workspace.Packages.AppCommonLib).Symbol
local v_u_16 = require(v2.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local v_u_17 = require(v2.Workspace.Packages.SharedFlags).FFlagAppChatDistinctUnibarEntryPoint
local v_u_18 = v10.Enums.SideSheetPlacement
local v_u_19 = v8.new(v_u_11.default.visibilitySignal.Event, function()
	-- upvalues: (copy) v_u_11
	return v_u_11:getVisible()
end)
return function(p_u_20, p21)
	-- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_11, (copy) v_u_5, (copy) v_u_14, (copy) v_u_9, (copy) v_u_17, (copy) v_u_16, (copy) v_u_7, (copy) v_u_6, (copy) v_u_19, (copy) v_u_13, (copy) v_u_3, (copy) v_u_15, (copy) v_u_12
	local v22 = v_u_4
	local v24 = {
		["id"] = nil,
		["sideSheetPlacement"] = nil,
		["label"] = "Feature.Squads.Label.Party",
		["activated"] = nil,
		["isActivated"] = nil,
		["components"] = nil,
		["initialAvailability"] = nil,
		["id"] = p_u_20,
		["sideSheetPlacement"] = v_u_18.None,
		["activated"] = function() -- name: activated
			-- upvalues: (ref) v_u_11, (ref) v_u_5, (ref) v_u_14, (ref) v_u_9, (ref) v_u_17, (ref) v_u_16, (ref) v_u_7, (ref) v_u_6
			if v_u_11:getVisible() then
				v_u_11.default:setVisible(false)
			else
				v_u_5.dismissRobloxMenuAndRun(function()
					-- upvalues: (ref) v_u_14, (ref) v_u_9, (ref) v_u_17, (ref) v_u_11, (ref) v_u_16
					if v_u_14.GetInputModeStore(false).getLastInputType(false) == v_u_14.Input.Directional then
						v_u_9.FocusOffChrome()
					end
					if v_u_17 then
						v_u_11.default:setVisible(true, v_u_16.ChromeUnibar)
					else
						v_u_11.default:setVisible(true)
					end
				end)
			end
			v_u_7.storeForLocalPlayer(v_u_6(), true)
		end,
		["isActivated"] = v_u_19,
		["components"] = {
			["Icon"] = function(p23) -- name: Icon
				-- upvalues: (ref) v_u_13, (ref) v_u_3, (copy) p_u_20
				return v_u_13.createElement(v_u_3, {
					["integrationId"] = p_u_20,
					["isIconVisible"] = p23.visible
				})
			end
		},
		["initialAvailability"] = p21
	}
	local v25 = v22:register(v24)
	local v_u_26 = v_u_15.named("InExperienceRobloxParty")
	v_u_11.default.visibilitySignal.Event:Connect(function(p27)
		-- upvalues: (ref) v_u_12, (copy) v_u_26
		if p27 then
			v_u_12.push(v_u_26, Enum.OverrideMouseIconBehavior.ForceShow)
		else
			v_u_12.pop(v_u_26)
		end
	end)
	return v25
end