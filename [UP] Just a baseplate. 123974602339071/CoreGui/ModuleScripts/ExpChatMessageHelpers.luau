-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.ExpChatMessageHelpers
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("TextChatService")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Workspace.Packages.SharedFlags)
local v_u_5 = v4.FFlagEnableGlobalChatAbuseReporting
local v_u_6 = v4.FFlagAbuseReportAttributedRBXSystemMessages
local v_u_44 = {
	["CHANNEL_GENERAL"] = "RBXGeneral",
	["CHANNEL_GLOBAL"] = "RBXGlobal",
	["areChannelTabsEnabled"] = function() -- name: areChannelTabsEnabled
		-- upvalues: (copy) v_u_2
		local v7 = v_u_2:FindFirstChildOfClass("ChannelTabsConfiguration")
		local v8
		if v7 == nil then
			v8 = false
		else
			v8 = v7.Enabled
		end
		return v8
	end,
	["localizeString"] = function(p9, p10) -- name: localizeString
		if p9 then
			local v11 = p9.TranslateGameText
			local v12 = game
			local v13, v14 = pcall(v11, p9, v12, p10)
			if v13 and type(v14) == "string" then
				return v14
			else
				return p10
			end
		else
			return p10
		end
	end,
	["isSystemMessage"] = function(p15) -- name: isSystemMessage
		-- upvalues: (copy) v_u_6
		return not v_u_6 and (p15.textChannel and p15.textChannel.Name == "RBXSystem") and true or ((not p15.userId or p15.userId == "0") and true or false)
	end,
	["formatChannelLabel"] = function(p16, p17) -- name: formatChannelLabel
		-- upvalues: (copy) v_u_1, (copy) v_u_5
		if string.find(p16, "RBXGeneral") then
			return "General"
		end
		if string.find(p16, "^RBXTeam") then
			return "Team"
		end
		if not string.find(p16, "^RBXWhisper") then
			return v_u_5 and p16 == "RBXGlobal" and "Global" or p16
		end
		if p17 and v_u_1.LocalPlayer then
			for _, v18 in ipairs(p17:GetChildren()) do
				if not v18:IsA("TextSource") then
					continue
				end
				local v19 = v_u_1:GetPlayerByUserId(v18.UserId)
				if not v19 or v19 == v_u_1.LocalPlayer then
					continue
				end
				return v19.DisplayName
			end
		end
		return "Whisper"
	end,
	["formatMessageLabel"] = function(p20) -- name: formatMessageLabel
		local v21 = p20.prefixText or ""
		local v22 = p20.text or ""
		if #v21 > 0 then
			return v21 .. " " .. v22
		else
			return v22
		end
	end,
	["getMessageUsername"] = function(p23) -- name: getMessageUsername
		-- upvalues: (copy) v_u_1
		local v24 = p23.userId
		local v25 = tonumber(v24)
		local v26 = v25 and v25 ~= 0 and v_u_1:GetPlayerByUserId(v25)
		if v26 then
			return v26.Name
		end
		local v27 = p23.textChatMessageInstance
		if v27 then
			local v28 = v27.TextSource
			if v28 and (v28.Username and #v28.Username > 0) then
				return v28.Username
			end
		end
		return nil
	end,
	["collectItems"] = function(p29, p30) -- name: collectItems
		-- upvalues: (copy) v_u_44
		local v31 = {}
		for _, v32 in ipairs(p30) do
			local v33 = p29[v32]
			if not v33 or v_u_44.isSystemMessage(v33) then
				continue
			end
			local v34 = {
				["id"] = v33.messageId,
				["label"] = v_u_44.formatMessageLabel(v33)
			}
			local v35 = {
				["textChannel"] = v33.textChannel
			}
			local v36 = v33.userId
			v35.userId = tostring(v36)
			v35.presetId = v33.presetId
			v35.presetChatVersion = v33.presetChatVersion
			v35.username = v_u_44.getMessageUsername(v33)
			v34.meta = v35
			table.insert(v31, v34)
		end
		return v31
	end,
	["annotateWhisperItems"] = function(p37, p38, p39) -- name: annotateWhisperItems
		for _, v40 in ipairs(p37) do
			local v41 = p38[v40.id]
			if not (v41 and v41.textChannel) then
				continue
			end
			local v42 = v41.textChannel.Name
			if typeof(v42) ~= "string" then
				continue
			end
			local v43 = v41.textChannel.Name
			if string.sub(v43, 1, 10) ~= "RBXWhisper" then
				continue
			end
			v40.label = string.format("[%s] %s", p39, v40.label)
		end
	end
}
return v_u_44