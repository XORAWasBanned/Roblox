-- Path: CoreGui.RobloxGui.Modules.Chrome.ConfigureChrome
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
if not require(v2.Workspace.Packages.Chrome).Enabled() then
	return nil
end
local v_u_3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.Party.Constants)
local v_u_5 = require(v1.Integrations.Connect.isConnectUnibarEnabled)
local v_u_6 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v7 = require(v1.ChromeShared.Shortcuts.ConfigureShortcuts)
local v_u_8 = require(v1.ChromeShared.Unibar.buildMenuOrder)
local v9 = require(v2.Workspace.Packages.SharedFlags)
local v_u_10 = v9.GetFFlagDebugEnableUnibarDummyIntegrations
local v11 = v9.FFlagEnableConsoleExpControls
local v_u_12 = v9.FFlagAppNavMyStatsTab
local v_u_13 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local function v18() -- name: configureUnibar
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_13, (copy) v_u_3
	local v14 = v_u_8()
	local v15 = { "nine_dot", "chat", "toggle_mic_mute" }
	table.insert(v15, 3, "join_voice")
	if v_u_10() then
		table.insert(v15, "dummy_window")
		table.insert(v15, "dummy_window_2")
	end
	if v_u_5() then
		table.insert(v15, "party_entrypoint")
	end
	local v16 = table.find(v15, "toggle_mic_mute")
	if v16 then
		local v17 = v_u_4.TOGGLE_MIC_INTEGRATION_ID
		table.insert(v15, v16, v17)
	end
	if v_u_12 then
		table.insert(v15, "assistant_build")
	end
	if v_u_6 and v_u_13() then
		v_u_3:configureMenu({
			{ "vr_toggle_button", "vr_safety_bubble" },
			v15
		})
	else
		v_u_3:configureMenu({ v15 })
	end
	v_u_3:configureSubMenu("nine_dot", v14)
end
require(v1.Integrations)
if v11 then
	v7()
end
v18()
return nil