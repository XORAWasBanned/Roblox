-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.ExpChat.ChatIconVisibleSignals
local v1 = game:GetService("CorePackages")
local v2 = v1.Packages
local v_u_3 = require(v2.Signals)
local v4 = require(v1.Workspace.Packages.SharedFlags)
local v_u_5 = v4.GetFFlagExpChatGuacChatDisabledReason
local v_u_6 = v4.FFlagExpChatWindowSyncUnibar
local v_u_7 = v4.FFlagEnableAEGIS2CommsFAEUpsell
local v_u_8 = game:DefineFastFlag("ExpChatOnShowIconChatAvailabilityStatus", false)
local v9
if v_u_8 then
	v9 = require(v1.Workspace.Packages.ExpChat).Stores.GetChatStatusStore
else
	v9 = nil
end
local v_u_10
if v_u_5() then
	v_u_10 = require(v1.Workspace.Packages.UniversalAppPolicy)
else
	v_u_10 = nil
end
local function v28(p_u_11) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (ref) v_u_10, (copy) v_u_7, (copy) v_u_8
	local v_u_12, v13 = v_u_3.createSignal(true)
	local v_u_14, v15 = v_u_3.createSignal(false)
	local v_u_16, v17 = v_u_3.createSignal(false)
	local v_u_18, v19 = v_u_3.createSignal(false)
	local v_u_20, v21
	if v_u_6 then
		v_u_20, v21 = v_u_3.createSignal(false)
	else
		v21 = nil
		v_u_20 = nil
	end
	local v_u_22
	if v_u_5() and v_u_10 then
		v_u_22 = v_u_10.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked"
	else
		v_u_22 = false
	end
	local v_u_23 = v_u_7
	if v_u_23 then
		v_u_23 = v_u_8
	end
	local v_u_25 = v_u_3.createComputed(function(p24)
		-- upvalues: (copy) v_u_12, (copy) v_u_23, (copy) v_u_14, (ref) v_u_6, (copy) v_u_18, (copy) v_u_16, (ref) v_u_20, (copy) p_u_11, (ref) v_u_5, (ref) v_u_22
		if v_u_12(p24) then
			return not v_u_23 and v_u_14(p24) and true or (not v_u_6 and v_u_18(p24) and true or (not v_u_6 and v_u_16(p24) and true or (v_u_6 and v_u_20(p24) and true or (v_u_23 and p_u_11.getChatStatus(p24) ~= "NoOne" and true or (v_u_5() and v_u_22 and true or false)))))
		else
			return false
		end
	end)
	local v26
	if v_u_6 then
		v26 = v_u_3.createComputed(function(p27)
			-- upvalues: (copy) v_u_25, (ref) v_u_20
			return v_u_25(p27) and v_u_20(p27) and true or false
		end)
	else
		v26 = nil
	end
	return {
		["getIsChatIconVisible"] = v_u_25,
		["getIsChatWindowVisible"] = v26,
		["setCoreGuiEnabled"] = v13,
		["setLocalUserChat"] = v15,
		["setChatActiveCalledByDeveloper"] = v17,
		["setVisibleViaChatSelector"] = v19,
		["setGameSettingsChatVisible"] = v21
	}
end
local v29 = {
	["new"] = v28
}
local v30
if v_u_8 then
	v30 = v9(false)
else
	v30 = nil
end
v29.default = v28(v30)
return v29