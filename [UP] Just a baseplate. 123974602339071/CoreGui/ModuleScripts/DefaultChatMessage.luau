-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.DefaultChatMessage
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_3 = v1 and v2
local v_u_4 = game:GetService("Players")
local v5 = script.Parent.Parent
local v_u_6 = require(v5:WaitForChild("ChatSettings"))
local v7 = require(v5:WaitForChild("ChatConstants"))
local v_u_8 = require(script.Parent:WaitForChild("Util"))
local v_u_9 = utf8.char(57344)
function IsPlayerVerified(p10) -- name: IsPlayerVerified
	-- upvalues: (copy) v_u_4
	local v_u_11 = v_u_4:GetPlayerByUserId(p10)
	if v_u_11 then
		local v12, v13 = pcall(function()
			-- upvalues: (copy) v_u_11
			return v_u_11.HasVerifiedBadge
		end)
		if v12 then
			return v13
		else
			return false
		end
	else
		return false
	end
end
function AppendVerifiedBadge(p14) -- name: AppendVerifiedBadge
	-- upvalues: (copy) v_u_9
	return p14 .. v_u_9
end
function CreateMessageLabel(p_u_15, p16, p_u_17) -- name: CreateMessageLabel
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (ref) v_u_3
	local v18 = p_u_15.FromSpeaker
	local v19
	if v_u_6.PlayerDisplayNamesEnabled and p_u_15.SpeakerDisplayName then
		v19 = p_u_15.SpeakerDisplayName
	else
		v19 = v18
	end
	local v20 = p_u_15.SpeakerUserId
	if IsPlayerVerified(v20) then
		v19 = AppendVerifiedBadge(v19)
	end
	local _ = p_u_15.Message
	local v21 = p_u_15.ExtraData or {}
	local v22 = v21.Font or v_u_6.DefaultFont
	local v23 = v21.TextSize or v_u_6.ChatWindowTextSize
	local v24 = v21.NameColor or v_u_6.DefaultNameColor
	local v25 = v21.ChatColor or v_u_6.DefaultMessageColor
	local v26 = v21.ChannelColor or v25
	local v27 = v21.Tags or {}
	local v28 = string.format("[%s]:", v19)
	v_u_8:GetStringTextBounds(v28, v22, v23)
	local v_u_29 = v_u_8:GetNumberOfSpaces(v28, v22, v23) + 1
	local v_u_30, v_u_31 = v_u_8:CreateBaseMessage("", v22, v23, v25)
	local v_u_32 = v_u_8:AddNameButtonToBaseMessage(v_u_31, v24, v28, v18)
	local v_u_33 = UDim2.new(0, 0, 0, 0)
	local v34
	if p16 == p_u_15.OriginalChannel then
		v34 = nil
	else
		local v35 = string.format("{%s}", p_u_15.OriginalChannel)
		v34 = v_u_8:AddChannelButtonToBaseMessage(v_u_31, v26, v35, p_u_15.OriginalChannel)
		v_u_33 = UDim2.new(0, v34.Size.X.Offset + v_u_8:GetStringTextBounds(" ", v22, v23).X, 0, 0)
		v_u_29 = v_u_29 + v_u_8:GetNumberOfSpaces(v35, v22, v23) + 1
	end
	local v36 = {}
	for _, v37 in pairs(v27) do
		local v38 = v37.TagColor or Color3.fromRGB(255, 0, 255)
		local v39 = v37.TagText or "???"
		local v40 = string.format("[%s] ", v39)
		local v41 = v_u_8:AddTagLabelToBaseMessage(v_u_31, v38, v40)
		v41.Position = v_u_33
		v_u_29 = v_u_29 + v_u_8:GetNumberOfSpaces(v40, v22, v23)
		v_u_33 = v_u_33 + UDim2.new(0, v41.Size.X.Offset, 0, 0)
		table.insert(v36, v41)
	end
	v_u_32.Position = v_u_33
	local v_u_42 = false
	local v_u_43 = nil
	if v_u_3 then
		local function v44()
			-- upvalues: (ref) v_u_43, (ref) v_u_8, (copy) v_u_31, (ref) v_u_33, (copy) v_u_32
			v_u_43 = v_u_8:AddTranslationButtonToBaseMessage(v_u_31)
			v_u_33 = v_u_33 + UDim2.new(0, v_u_32.Size.X.Offset + 2, 0, 0)
			v_u_43.Position = v_u_33
		end
		pcall(v44)
	end
	local function v_u_47(p45) -- name: useOriginalText
		-- upvalues: (ref) v_u_42, (copy) p_u_15, (copy) v_u_31, (ref) v_u_8, (ref) v_u_29
		v_u_42 = false
		if p_u_15.IsFiltered then
			v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. v_u_8:SanitizeForRichText(p45.Message)
		else
			local v46 = p45.MessageLengthUtf8 or p45.MessageLength
			v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. string.rep("_", v46)
		end
	end
	local function v50(p48) -- name: UpdateTextFunction
		-- upvalues: (ref) v_u_3, (copy) p_u_15, (ref) v_u_43, (ref) v_u_29, (ref) v_u_42, (copy) v_u_47, (copy) v_u_31, (ref) v_u_8
		if v_u_3 then
			p_u_15.TranslatedMessage = p48.TranslatedMessage
			if p48.TranslatedMessage then
				if v_u_43 == nil then
					return
				else
					if v_u_43.Visible == false then
						v_u_29 = v_u_29 + 6
					end
					v_u_43.Visible = true
					v_u_42 = true
					if p48.TranslatedMessage == "" then
						v_u_47(p48)
					else
						v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. v_u_8:SanitizeForRichText(p48.TranslatedMessage)
					end
				end
			else
				v_u_47(p48)
				return
			end
		elseif p_u_15.IsFiltered then
			v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. v_u_8:SanitizeForRichText(p48.Message)
		else
			local v49 = p48.MessageLengthUtf8 or p48.MessageLength
			v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. string.rep("_", v49)
		end
	end
	if v_u_3 and v_u_43 ~= nil then
		local v_u_52 = v_u_43.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_42, (copy) p_u_15, (ref) v_u_43, (ref) v_u_29, (copy) v_u_47, (copy) v_u_31, (ref) v_u_8, (copy) p_u_17
			if v_u_42 or not p_u_15.TranslatedMessage then
				v_u_47(p_u_15)
			else
				local v51 = p_u_15
				if v_u_43 ~= nil then
					if v_u_43.Visible == false then
						v_u_29 = v_u_29 + 6
					end
					v_u_43.Visible = true
					v_u_42 = true
					if v51.TranslatedMessage == "" then
						v_u_47(v51)
					else
						v_u_31.Text = v_u_8:CreateLeadingSpaces(v_u_29) .. v_u_8:SanitizeForRichText(v51.TranslatedMessage)
					end
				end
			end
			if p_u_17 then
				p_u_17()
			end
		end)
		local v_u_53 = nil
		v_u_53 = v_u_43.Changed:connect(function(p54)
			-- upvalues: (copy) v_u_52, (ref) v_u_53
			if p54 == "Parent" then
				v_u_52:Disconnect()
				v_u_53:Disconnect()
			end
		end)
	end
	v50(p_u_15)
	local function v56(p55) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_8, (copy) v_u_31, (copy) v_u_30
		return v_u_8:GetMessageHeight(v_u_31, v_u_30, p55)
	end
	local v57 = {
		[v_u_32] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	}
	if v_u_3 and v_u_43 ~= nil then
		v57[v_u_43] = {
			["ImageTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			}
		}
	end
	v57[v_u_31] = {
		["TextTransparency"] = {
			["FadedIn"] = 0,
			["FadedOut"] = 1
		},
		["TextStrokeTransparency"] = {
			["FadedIn"] = 0.75,
			["FadedOut"] = 1
		}
	}
	for v58, v59 in pairs(v36) do
		string.format("Tag%d", v58)
		v57[v59] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	end
	if v34 then
		v57[v34] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	end
	local v60, v61, v62 = v_u_8:CreateFadeFunctions(v57)
	return {
		[v_u_8.KEY_BASE_FRAME] = v_u_30,
		[v_u_8.KEY_BASE_MESSAGE] = v_u_31,
		[v_u_8.KEY_UPDATE_TEXT_FUNC] = v50,
		[v_u_8.KEY_GET_HEIGHT] = v56,
		[v_u_8.KEY_FADE_IN] = v60,
		[v_u_8.KEY_FADE_OUT] = v61,
		[v_u_8.KEY_UPDATE_ANIMATION] = v62
	}
end
return {
	[v_u_8.KEY_MESSAGE_TYPE] = v7.MessageTypeDefault,
	[v_u_8.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}