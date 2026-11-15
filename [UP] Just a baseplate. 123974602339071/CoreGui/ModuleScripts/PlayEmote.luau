-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Thunks.PlayEmote
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("Players")
local v4 = game:GetService("RbxAnalyticsService")
local v_u_5 = v3.LocalPlayer
local v6 = script.Parent.Parent
local v7 = v6.Actions
local v8 = require(v6.Analytics)
local v_u_9 = require(v6.Constants)
local v10 = require(v2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v_u_11 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_12 = require(v1.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer)
local v_u_13 = require(v7.HideMenu)
local v_u_14 = require(v7.HideError)
local v_u_15 = require(v7.ShowError)
local v_u_16 = v8.new():withEventStream(v10.new(v4))
local function v_u_22(p_u_17, p18, p19, p20) -- name: handlePlayFailure
	-- upvalues: (copy) v_u_16, (copy) v_u_9, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13
	if p18 then
		v_u_16:onEmoteFailed(p19, p20, p18)
		local v21 = p_u_17:getState().locale
		p_u_17:dispatch(v_u_15((v_u_11:FormatByKeyForLocale(v_u_9.LocalizationKeys.ErrorMessages[p18], v21))))
		delay(v_u_9.ErrorDisplayTimeSeconds, function()
			-- upvalues: (copy) p_u_17, (ref) v_u_14
			p_u_17:dispatch(v_u_14())
		end)
	end
	p_u_17:dispatch(v_u_13())
end
return function(_, p_u_23, p_u_24, _, _) -- name: PlayEmote
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_22, (copy) v_u_13, (copy) v_u_16, (copy) v_u_9
	return function(p_u_25)
		-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_22, (copy) p_u_23, (copy) p_u_24, (ref) v_u_13, (ref) v_u_16, (ref) v_u_9
		local v26 = v_u_5
		if v_u_12(v26, function(p27)
			-- upvalues: (ref) v_u_22, (copy) p_u_25, (ref) p_u_23, (ref) p_u_24
			v_u_22(p_u_25, p27, p_u_23, p_u_24)
		end) then
			return
		else
			p_u_25:dispatch(v_u_13())
			local v_u_28 = v26.Character:FindFirstChildOfClass("Humanoid")
			local function v29()
				-- upvalues: (copy) v_u_28, (ref) p_u_24
				return v_u_28:PlayEmoteAndGetAnimTrackById(p_u_24)
			end
			local v30, v31, _ = pcall(v29)
			if v30 and v31 then
				v_u_16:onEmotePlayed(p_u_23, p_u_24)
			else
				v_u_22(p_u_25, v_u_9.ErrorTypes.TemporarilyUnavailable, p_u_23, p_u_24)
			end
		end
	end
end