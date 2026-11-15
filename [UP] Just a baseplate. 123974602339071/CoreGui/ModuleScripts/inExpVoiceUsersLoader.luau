-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.inExpVoiceUsersLoader
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v4 = require(v1.Packages.Foundation)
local v5 = v2.RobloxGui
local v_u_6 = v4.Enums.AccessoryType
local v_u_7 = require(v1.Packages.Promise)
local v_u_8 = require(v5.Modules.VoiceChat.VoiceChatServiceManager).default
return {
	["type"] = "listItem",
	["fetch"] = nil,
	["fetch"] = function(_) -- name: fetch
		-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
		local function v9()
			-- upvalues: (ref) v_u_8
			return v_u_8:getRecentUsersInteractionData()
		end
		local v10, v11 = pcall(v9)
		if not v10 then
			return v_u_7.reject("Failed to fetch voice users")
		end
		if not v11 then
			return v_u_7.resolve({})
		end
		local v12 = v_u_3.LocalPlayer
		local v13 = {}
		for _, v14 in pairs(v11) do
			local v15 = v14.player
			local v16
			if v12 then
				v16 = v15.UserId == v12.UserId
			else
				v16 = false
			end
			if not v15 or v16 then
				continue
			end
			local v17 = {
				["leading"] = {
					["type"] = v_u_6.Avatar,
					["userId"] = v15.UserId
				}
			}
			local v18 = v15.UserId
			v17.id = tostring(v18)
			v17.label = v15.DisplayName
			v17.description = "@" .. v15.Name
			v17.meta = {
				["username"] = v15.Name,
				["displayName"] = v15.DisplayName
			}
			table.insert(v13, v17)
		end
		table.sort(v13, function(p19, p20)
			return p19.label < p20.label
		end)
		return v_u_7.resolve(v13)
	end
}