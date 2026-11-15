-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.ChatLocalization
local v_u_1 = game:GetService("LocalizationService")
local v_u_2 = game:GetService("Chat")
local v_u_3 = {
	["System"] = "InGame.Chat.Label.SystemMessagePrefix",
	["Team"] = "InGame.Chat.Label.TeamMessagePrefix"
}
local v_u_4 = {
	["From(%s.+)"] = {
		["English"] = "From",
		["LocalizationKey"] = "InGame.Chat.Label.From"
	},
	["To(%s.+)"] = {
		["English"] = "To",
		["LocalizationKey"] = "InGame.Chat.Label.To"
	}
}
return {
	["_hasFetchedLocalization"] = false,
	["_getTranslator"] = function(p_u_5) -- name: _getTranslator
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		if not (p_u_5._translator or p_u_5._hasFetchedLocalization) then
			p_u_5._hasFetchedLocalization = true
			local v6 = v_u_2:WaitForChild("ChatLocalization", 4)
			if v6 then
				p_u_5._translator = v6:GetTranslator(v_u_1.RobloxLocaleId)
				v_u_1:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
					-- upvalues: (copy) p_u_5
					p_u_5._hasFetchedLocalization = false
					p_u_5._translator = nil
				end)
			else
				warn("Missing ChatLocalization. Chat interface will not be localized.")
			end
		end
		return p_u_5._translator
	end,
	["Get"] = function(p_u_7, p_u_8, p9, p_u_10) -- name: Get
		local v_u_11 = p9
		local function v13()
			-- upvalues: (copy) p_u_7, (ref) v_u_11, (copy) p_u_8, (copy) p_u_10
			local v12 = p_u_7:_getTranslator()
			if v12 then
				v_u_11 = v12:FormatByKey(p_u_8, p_u_10)
			else
				warn("Missing Translator. Used default for", p_u_8)
			end
		end
		pcall(v13)
		return v_u_11
	end,
	["LocalizeFormattedMessage"] = function(p14, p15) -- name: LocalizeFormattedMessage
		local v16, v17 = string.find(p15, "{RBX_LOCALIZATION_KEY}")
		if not v16 then
			return p15
		end
		local v18, v19 = string.find(p15, "{RBX_LOCALIZATION_DEFAULT}")
		if not v18 then
			return p15
		end
		local v20, v21 = string.find(p15, "{RBX_LOCALIZATION_PARAMS}")
		local v22 = v17 + 1
		local v23 = v18 - 1
		local v24 = string.sub(p15, v22, v23)
		if not v20 then
			local v25 = v19 + 1
			return p14:Get(v24, (string.sub(p15, v25)))
		end
		local v26 = v19 + 1
		local v27 = v20 - 1
		local v28 = string.sub(p15, v26, v27)
		local v29 = v21 + 1
		local v30 = string.sub(p15, v29)
		local v31 = {}
		for v32, v33 in string.gmatch(v30, "([^%s]+)=([^%s]+)") do
			v31[v32] = v33
		end
		return p14:Get(v24, v28, v31)
	end,
	["FormatMessageToSend"] = function(_, p34, p35, p36, p37) -- name: FormatMessageToSend
		if p36 and p37 then
			return "{RBX_LOCALIZATION_KEY}" .. p34 .. "{RBX_LOCALIZATION_DEFAULT}" .. p35 .. "{RBX_LOCALIZATION_PARAMS}" .. p36 .. "=" .. p37
		else
			return "{RBX_LOCALIZATION_KEY}" .. p34 .. "{RBX_LOCALIZATION_DEFAULT}" .. p35
		end
	end,
	["tryLocalize"] = function(p38, p39) -- name: tryLocalize
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		if v_u_3[p39] then
			return p38:Get(v_u_3[p39], p39)
		end
		for v40, v41 in pairs(v_u_3) do
			if not string.find(p39, v40) then
				continue
			end
			local v42 = p38:Get(v41, v40)
			return string.gsub(p39, v40, v42, 1)
		end
		for v43, v44 in pairs(v_u_4) do
			local v45 = string.find(p39, v43)
			local v46 = string.match(p39, v43)
			if not (v45 and v46) then
				continue
			end
			local v47 = p38:Get(v44.LocalizationKey, v44.English)
			return (v45 <= 1 and "" or p39:sub(1, v45 - 1)) .. v47 .. v46
		end
		return p39
	end
}