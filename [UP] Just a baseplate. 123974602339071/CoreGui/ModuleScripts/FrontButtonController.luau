-- Path: CoreGui.RobloxGui.Modules.Settings.FrontButtonController
local v_u_1 = game:GetService("TeleportService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("HttpRbxApiService")
local v_u_5 = require(v2.Packages.Promise)
local v_u_6 = require(v2.Packages.Roact)
local v7 = v3:WaitForChild("RobloxGui")
local v_u_8 = require(v7.Modules.Common.httpRequest)(v4)
local v_u_9 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_10 = require(v2.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v_u_11 = game:GetEngineFeature("TeleportHistoryButtons")
local v12 = 0
local v_u_13
if v_u_11 then
	local v14
	v_u_13, v14 = v_u_1:GetThirdPartyTeleportInfo(true)
else
	v_u_13 = 0
end
if not v_u_11 or v_u_13 <= 0 then
	v_u_13 = v12
end
local v_u_15 = nil
local v_u_19 = v_u_5.defer(function(p16)
	-- upvalues: (ref) v_u_13, (copy) v_u_10, (copy) v_u_8, (ref) v_u_15
	if v_u_13 > 0 then
		v_u_10(v_u_8, v_u_13):andThen(function(p17)
			-- upvalues: (ref) v_u_15
			local v18 = p17.Name
			if #v18 > 30 then
				v18 = string.sub(v18, 1, 27) .. "..."
			end
			v_u_15 = v18
		end):await()
		p16()
	else
		p16()
	end
end)
local v_u_23 = {
	["getTooltipText"] = function()
		-- upvalues: (ref) v_u_15, (copy) v_u_9
		if v_u_15 == nil then
			return v_u_9:FormatByKey("InGame.CommonUI.Label.ReturnFallback")
		else
			return v_u_9:FormatByKey("InGame.CommonUI.Label.ReturnTo", {
				["placeName"] = v_u_15
			})
		end
	end,
	["getTooltipTextTimeout"] = function()
		-- upvalues: (ref) v_u_15, (copy) v_u_5, (copy) v_u_19, (copy) v_u_23
		if v_u_15 == nil then
			v_u_5.any({ v_u_19, v_u_5.delay(1) }):await()
		end
		return v_u_23.getTooltipText()
	end,
	["getMenuText"] = function()
		-- upvalues: (copy) v_u_6, (copy) v_u_23, (ref) v_u_15, (copy) v_u_19
		local v20, v_u_21 = v_u_6.createBinding(v_u_23.getTooltipText())
		if v_u_15 == nil then
			local function v22()
				-- upvalues: (ref) v_u_19, (copy) v_u_21, (ref) v_u_23
				v_u_19:andThen(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_23
					v_u_21(v_u_23.getTooltipText())
				end)
			end
			pcall(v22)
		end
		return v20
	end,
	["initiateFrontButtonTeleport"] = function()
		-- upvalues: (copy) v_u_11, (copy) v_u_1
		if v_u_11 then
			v_u_1:TeleportTrustedBackForth(true)
		end
	end,
	["hasReturnUniverse"] = function()
		-- upvalues: (ref) v_u_13
		return v_u_13 > 0
	end
}
return v_u_23