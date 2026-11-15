-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.PartyEntrypoint
local v1 = game:GetService("CorePackages")
local v2 = script:FindFirstAncestor("Chrome")
local v_u_3 = require(v1.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v4 = require(v1.Packages.PolicyProvider)
local v_u_5 = require(v1.Workspace.Packages.UniversalAppPolicy)
local v_u_6 = require(script.Parent.registerPartyIntegration)
local v_u_7 = require(v2.Service)
local v8 = require(v2.Integrations.Connect.isConnectUnibarEnabled)
local v_u_9 = require(v2.Integrations.Connect.isConnectDropdownEnabled)
local v_u_10 = require(v1.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local v11 = v4.GetPolicyImplementations.MemStorageService("app-policy")
local v_u_12 = nil
local v_u_13 = nil
local function v_u_20(p14) -- name: updatePartyIntegration
	-- upvalues: (ref) v_u_12, (copy) v_u_6, (copy) v_u_7, (ref) v_u_13, (copy) v_u_3
	if not v_u_12 then
		local v15 = v_u_6
		local v16 = "party_entrypoint"
		local v17
		if p14 then
			v17 = v_u_7.AvailabilitySignal.Pinned
		else
			v17 = v_u_7.AvailabilitySignal.Unavailable
		end
		v_u_12 = v15(v16, v17)
	end
	if p14 then
		if v_u_3.default.currentSquadId ~= "" then
			v_u_12.availability:pinned()
		end
		if not v_u_13 then
			local v_u_19 = v_u_3.default.currentSquadIdSignal.Event:Connect(function(p18)
				-- upvalues: (ref) v_u_12
				if p18 == "" then
					v_u_12.availability:unavailable()
				else
					v_u_12.availability:pinned()
				end
			end)
			v_u_13 = function()
				-- upvalues: (copy) v_u_19
				v_u_19:Disconnect()
			end
		end
	else
		v_u_12.availability:unavailable()
		if v_u_13 then
			v_u_13()
			v_u_13 = nil
			return
		end
	end
end
local function v23() -- name: handlePolicyUpdate
	-- upvalues: (copy) v_u_20, (copy) v_u_10, (copy) v_u_5, (copy) v_u_9
	local v21 = v_u_20
	local v22 = v_u_10() and v_u_5.getAppFeaturePolicies().getCanAccessParty()
	if v22 then
		v22 = v_u_9()
	end
	v21(v22)
end
if v8() then
	local v24 = v_u_10() and v_u_5.getAppFeaturePolicies().getCanAccessParty()
	if v24 then
		v24 = v_u_9()
	end
	v_u_20(v24)
	v11.onPolicyChanged(v23)
end
return v_u_12