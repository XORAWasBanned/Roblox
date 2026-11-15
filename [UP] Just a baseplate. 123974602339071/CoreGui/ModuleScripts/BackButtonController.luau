-- Path: CoreGui.RobloxGui.Modules.Settings.BackButtonController
local v_u_1 = game:GetService("AdService")
local v_u_2 = game:GetService("TeleportService")
local v3 = game:GetService("CorePackages")
local v4 = game:GetService("CoreGui")
local v5 = game:GetService("HttpRbxApiService")
local v_u_6 = require(v3.Packages.Promise)
local v_u_7 = require(v3.Packages.Roact)
local v8 = v4:WaitForChild("RobloxGui")
local v_u_9 = require(v8.Modules.Common.httpRequest)(v5)
local v_u_10 = game:GetEngineFeature("TeleportHistoryButtons")
local v_u_11 = require(v3.Workspace.Packages.RobloxTranslator)
local v_u_12 = require(v3.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v_u_13 = false
local v14, v15 = v_u_1:GetAdTeleportInfo()
local v16
if v14 > 0 and (v15 == 0 or v15 == game.GameId) then
	v16 = v14
	if v_u_10 then
		v_u_13 = true
	end
else
	v16 = 0
end
local v_u_17
if v_u_10 and v16 == 0 then
	local v18
	v_u_17, v18 = v_u_2:GetThirdPartyTeleportInfo(false)
	if v_u_17 <= 0 then
		v_u_17 = v16
	end
	v_u_13 = false
else
	v_u_17 = v16
end
local v_u_19 = nil
local v_u_23 = v_u_6.defer(function(p20)
	-- upvalues: (ref) v_u_17, (copy) v_u_12, (copy) v_u_9, (ref) v_u_19, (copy) v_u_10
	if v_u_17 > 0 then
		v_u_12(v_u_9, v_u_17):andThen(function(p21)
			-- upvalues: (ref) v_u_19, (ref) v_u_10
			v_u_19 = p21.Name
			if v_u_10 then
				local v22 = p21.Name
				if #v22 > 30 then
					v22 = string.sub(v22, 1, 27) .. "..."
				end
				v_u_19 = v22
			end
		end):await()
		p20()
	else
		p20()
	end
end)
local v_u_28 = {
	["getTooltipText"] = function()
		-- upvalues: (ref) v_u_19, (copy) v_u_11
		if v_u_19 == nil then
			return v_u_11:FormatByKey("InGame.CommonUI.Label.ReturnFallback")
		else
			return v_u_11:FormatByKey("InGame.CommonUI.Label.ReturnTo", {
				["placeName"] = v_u_19
			})
		end
	end,
	["getTooltipTextTimeout"] = function()
		-- upvalues: (ref) v_u_19, (copy) v_u_6, (copy) v_u_23, (copy) v_u_28
		if v_u_19 == nil then
			v_u_6.any({ v_u_23, v_u_6.delay(1) }):await()
		end
		return v_u_28.getTooltipText()
	end,
	["getMenuText"] = function()
		-- upvalues: (copy) v_u_7, (copy) v_u_28, (ref) v_u_19, (copy) v_u_23
		local v24, v_u_25 = v_u_7.createBinding(v_u_28.getTooltipText())
		if v_u_19 == nil then
			local function v26()
				-- upvalues: (ref) v_u_23, (copy) v_u_25, (ref) v_u_28
				v_u_23:andThen(function()
					-- upvalues: (ref) v_u_25, (ref) v_u_28
					v_u_25(v_u_28.getTooltipText())
				end)
			end
			pcall(v26)
		end
		return v24
	end,
	["initiateBackButtonTeleport"] = function(p27)
		-- upvalues: (copy) v_u_10, (ref) v_u_13, (copy) v_u_1, (copy) v_u_2
		if v_u_10 then
			if v_u_13 then
				v_u_1:ReturnToPublisherExperience(p27)
			else
				v_u_2:TeleportTrustedBackForth(false)
			end
		end
		v_u_1:ReturnToPublisherExperience(p27)
	end,
	["hasReturnUniverse"] = function()
		-- upvalues: (ref) v_u_17
		return v_u_17 > 0
	end
}
return v_u_28