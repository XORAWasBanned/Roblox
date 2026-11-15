-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.PartyMic
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v4 = require(v2.Workspace.Packages.CrossExperienceVoice)
local v5 = require(v2.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local v6 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v7 = require(v1.Service)
local v8 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_9 = require(v1.Integrations.Party.PartyMicIcon)
local v10 = require(v1.Integrations.Party.Constants)
local v11 = require(v2.Workspace.Packages.AppCommonLib).Signal
local v12 = v8.MappedSignal
local v_u_13 = v4.CrossExperienceVoiceManager.default
local v_u_14 = nil
local v_u_15 = false
local v_u_16 = v11.new()
local v_u_17 = v11.new()
v_u_16:connect(function(p18)
	-- upvalues: (ref) v_u_14
	v_u_14 = p18
end)
v_u_17:connect(function(p19)
	-- upvalues: (ref) v_u_15
	v_u_15 = p19
end)
local v21 = v12.new(v_u_16, function()
	-- upvalues: (ref) v_u_15, (ref) v_u_14
	local v20 = v_u_15
	if v20 then
		v20 = v_u_14 == false
	end
	return v20
end)
local v22 = require(v1.Flags.FFlagChangeToggleMicText)
local v23
if v5() then
	v23 = v7:register({
		["id"] = v10.TOGGLE_MIC_INTEGRATION_ID,
		["label"] = v22 and "CoreScripts.TopBar.Mic" or "CoreScripts.TopBar.ToggleMic",
		["sideSheetPlacement"] = v6.Unibar,
		["isActivated"] = v21,
		["activated"] = function() -- name: activated
			-- upvalues: (copy) v_u_3, (ref) v_u_15, (ref) v_u_14, (copy) v_u_13
			local v24 = v_u_3 and (v_u_3.LocalPlayer and v_u_3.LocalPlayer.UserId) or -1
			if v24 ~= -1 and (v_u_15 and v_u_14 ~= nil) then
				if v_u_14 then
					v_u_13:unmuteVoiceParticipant(v24)
					return
				end
				v_u_13:muteVoiceParticipant(v24)
			end
		end,
		["components"] = {
			["Icon"] = function() -- name: Icon
				-- upvalues: (copy) v_u_9, (copy) v_u_16, (copy) v_u_17
				return v_u_9({
					["isLocalPlayerMutedSignal"] = v_u_16,
					["isVoiceConnectedSignal"] = v_u_17
				})
			end
		},
		["initialAvailability"] = v7.AvailabilitySignal.Unavailable
	})
else
	v23 = nil
end
return v23