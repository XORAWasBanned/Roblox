-- Path: CoreGui.RobloxGui.Modules.Feedback.Network.PostFeedback
local v1 = script.Parent.Parent.Parent
local v2 = script.Parent.Parent
local v3 = v1.InGameMenu
local v_u_4 = require(v3.Network.Url)
local v_u_5 = require(v2.Resources.Constants)
local v_u_6 = game:GetService("HttpService")
local v_u_7 = game:GetService("Players")
local v8 = game:GetService("CorePackages")
local v_u_9 = require(v8.Packages.InGameMenuDependencies).Promise
local v10 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_11 = require(v10.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
return function(p12, p13, p14, p15, p16, p17, p18)
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9
	local v19
	if v_u_11() then
		local v20 = v_u_5.ServiceSourceType.InGameTranslations
		if p15 == "" or p15 == nil then
			p15 = "UID_" .. game.GameId
			v20 = v_u_5.ServiceSourceType.InGameTranslationsNoEntryId
		end
		if p12 == v_u_5.ContentType.Image then
			v20 = v_u_5.ServiceSourceType.InGameUniverseAndImageAsset
		end
		v19 = {
			["LocalizationFeedback"] = {
				["FeedbackTarget"] = {
					["ServiceSource"] = {
						["Type"] = v20,
						["ExternalId"] = p15
					},
					["Source"] = {
						["ContentType"] = p12,
						["Value"] = p13
					},
					["Translation"] = (p12 ~= v_u_5.ContentType.Image or p14 ~= nil and p14 ~= "") and {
						["ContentType"] = p12,
						["Value"] = p14
					} or nil
				},
				["Locale"] = not v_u_7.LocalPlayer.LocaleId and "" or v_u_7.LocalPlayer.LocaleId:gsub("-", "_"),
				["ReasonType"] = p18,
				["Suggestion"] = {
					["ContentType"] = v_u_5.ContentType.Text,
					["Value"] = p16
				},
				["Comments"] = p17
			}
		}
	else
		local v21
		if p15 == "" or p15 == nil then
			p15 = "UID_" .. game.GameId
			v21 = 2
		else
			v21 = 1
		end
		v19 = {
			["LocalizationFeedback"] = {
				["FeedbackTarget"] = {
					["ServiceSource"] = {
						["Type"] = v21,
						["ExternalId"] = p15
					},
					["Source"] = {
						["ContentType"] = 1,
						["Value"] = nil,
						["Value"] = p13
					},
					["Translation"] = {
						["ContentType"] = 1,
						["Value"] = nil,
						["Value"] = p14
					}
				},
				["Locale"] = not v_u_7.LocalPlayer.LocaleId and "" or v_u_7.LocalPlayer.LocaleId:gsub("-", "_"),
				["ReasonType"] = p18,
				["Suggestion"] = {
					["ContentType"] = 1,
					["Value"] = nil,
					["Value"] = p16
				},
				["Comments"] = p17
			}
		}
	end
	local v_u_22 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%sfeedback-api/v1/feedback/create-localization", v_u_4.APIS_URL),
		["Body"] = v_u_6:JSONEncode(v19),
		["Headers"] = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json"
		}
	}
	return v_u_9.new(function(p_u_23, p_u_24)
		-- upvalues: (copy) v_u_22, (ref) v_u_6
		spawn(function()
			-- upvalues: (ref) v_u_22, (copy) p_u_23, (copy) p_u_24, (ref) v_u_6
			local v_u_25 = p_u_23
			local v_u_26 = p_u_24
			v_u_6:RequestInternal(v_u_22):Start(function(p27, p28)
				-- upvalues: (copy) v_u_25, (copy) v_u_26
				if p27 then
					v_u_25()
				else
					local v29 = v_u_26
					local v30 = p28.StatusMessage
					v29((tostring(v30)))
				end
			end)
		end)
	end)
end