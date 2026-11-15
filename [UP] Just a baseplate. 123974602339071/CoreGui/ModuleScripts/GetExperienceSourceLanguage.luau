-- Path: CoreGui.RobloxGui.Modules.Feedback.Network.GetExperienceSourceLanguage
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.Workspace.Packages.CoreScriptsCommon).Url
local v_u_5 = require(v1.Packages.Promise)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Network.resolveSourceLanguageName)
local function v_u_18(p_u_8) -- name: requestJson
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	return v_u_5.new(function(p_u_9, p_u_10)
		-- upvalues: (ref) v_u_2, (copy) p_u_8
		v_u_2:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = p_u_8
		}):Start(function(p11, p_u_12)
			-- upvalues: (copy) p_u_10, (ref) v_u_2, (copy) p_u_9
			if p11 then
				if p_u_12.StatusCode < 200 or p_u_12.StatusCode >= 400 then
					local v13 = p_u_10
					local v14 = p_u_12.StatusCode
					v13("Status code: " .. tostring(v14))
					return
				else
					local function v15()
						-- upvalues: (ref) v_u_2, (copy) p_u_12
						return v_u_2:JSONDecode(p_u_12.Body)
					end
					local v16, v17 = pcall(v15)
					if v16 then
						p_u_9(v17)
					else
						p_u_10("Failed to decode response body")
					end
				end
			else
				p_u_10("Connection error")
				return
			end
		end)
	end)
end
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_18, (copy) v_u_7
	local v19 = v_u_3.LocalPlayer.LocaleId
	local v20 = not v19 and "" or v19:gsub("-", "_")
	local v_u_21 = string.format("%sv1/locales?displayValueLocale=%s", v_u_4.LOCALE_URL, v20)
	local v22 = string.format("%sv1/source-language/games/%d", v_u_4.GAME_INTERNATIONALIZATION_URL, game.GameId)
	return v_u_5.all({ v_u_5.new(function(p_u_23, p_u_24)
			-- upvalues: (ref) v_u_2, (copy) v_u_21
			v_u_2:RequestInternal({
				["Url"] = nil,
				["Method"] = "GET",
				["Url"] = v_u_21
			}):Start(function(p25, p_u_26)
				-- upvalues: (copy) p_u_24, (ref) v_u_2, (copy) p_u_23
				if p25 then
					if p_u_26.StatusCode < 200 or p_u_26.StatusCode >= 400 then
						local v27 = p_u_24
						local v28 = p_u_26.StatusCode
						v27("Status code: " .. tostring(v28))
						return
					else
						local function v29()
							-- upvalues: (ref) v_u_2, (copy) p_u_26
							return v_u_2:JSONDecode(p_u_26.Body)
						end
						local v30, v31 = pcall(v29)
						if v30 then
							p_u_23(v31)
						else
							p_u_24("Failed to decode response body")
						end
					end
				else
					p_u_24("Connection error")
					return
				end
			end)
		end), v_u_18(v22) }):andThen(function(p32)
		-- upvalues: (ref) v_u_7, (ref) v_u_5
		local v33 = p32[1]
		local v34 = p32[2]
		local v35 = v_u_7(v33.data, v34.languageCode)
		if v35 == nil then
			return v_u_5.reject("Could not resolve source language name")
		else
			return v35
		end
	end)
end