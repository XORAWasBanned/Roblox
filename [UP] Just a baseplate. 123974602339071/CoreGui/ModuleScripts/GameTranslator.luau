-- Path: CoreGui.RobloxGui.Modules.GameTranslator
local v_u_1 = game:GetService("LocalizationService")
local v_u_2 = game:GetService("Players")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = Instance.new("BindableEvent")
local function v_u_8() -- name: handlePlayerOrLocaleChanged
	-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_7
	if v_u_4 and v_u_4.LocaleId ~= v_u_5 then
		v_u_5 = v_u_4.LocaleId
		v_u_7:Fire(v_u_5)
	end
end
local v_u_9 = {}
local function v_u_16(p_u_10, p11, p12) -- name: makeRegistryInfo
	-- upvalues: (copy) v_u_9
	local v_u_13 = {
		["hasBeenAdded"] = game:IsAncestorOf(p_u_10),
		["context"] = p11,
		["text"] = p12
	}
	v_u_13.connection = p_u_10.AncestryChanged:Connect(function(_, _)
		-- upvalues: (copy) p_u_10, (copy) v_u_13, (ref) v_u_9
		if game:IsAncestorOf(p_u_10) then
			v_u_13.hasBeenAdded = true
		elseif v_u_13.hasBeenAdded then
			local v14 = p_u_10
			local v15 = v_u_9[v14]
			if v15 then
				v15.connection:Disconnect()
				v_u_9[v14] = nil
			end
		end
	end)
	return v_u_13
end
v_u_2:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_6, (copy) v_u_2, (copy) v_u_1, (ref) v_u_5, (copy) v_u_7, (copy) v_u_8
	v_u_3 = nil
	v_u_4 = nil
	if v_u_6 then
		v_u_6:Disconnect()
		v_u_6 = nil
	end
	v_u_4 = not v_u_3 and v_u_2.LocalPlayer
	if v_u_4 then
		v_u_3 = v_u_1:GetTranslatorForPlayer(v_u_4)
		if v_u_4 and v_u_4.LocaleId ~= v_u_5 then
			v_u_5 = v_u_4.LocaleId
			v_u_7:Fire(v_u_5)
		end
		v_u_6 = v_u_4:GetPropertyChangedSignal("LocaleId"):Connect(v_u_8)
	end
end)
local v_u_20 = {
	["LocaleChanged"] = v_u_7.Event,
	["TranslateGameText"] = function(_, p17, p18) -- name: TranslateGameText
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_2, (copy) v_u_1, (ref) v_u_5, (copy) v_u_7, (ref) v_u_6, (copy) v_u_8
		v_u_4 = not v_u_3 and v_u_2.LocalPlayer
		if v_u_4 then
			v_u_3 = v_u_1:GetTranslatorForPlayer(v_u_4)
			if v_u_4 and v_u_4.LocaleId ~= v_u_5 then
				v_u_5 = v_u_4.LocaleId
				v_u_7:Fire(v_u_5)
			end
			v_u_6 = v_u_4:GetPropertyChangedSignal("LocaleId"):Connect(v_u_8)
		end
		local v19 = v_u_3
		if v19 then
			return v19:RobloxOnlyTranslate(p17, p18)
		else
			return p18
		end
	end
}
v_u_1.AutoTranslateWillRun:Connect(function() -- name: retranslateAll
	-- upvalues: (copy) v_u_9, (copy) v_u_20
	for v21, v22 in pairs(v_u_9) do
		v21.Text = v_u_20:TranslateGameText(v22.context, v22.text)
	end
end)
function v_u_20.TranslateAndRegister(p23, p24, p25, p26) -- name: TranslateAndRegister
	-- upvalues: (copy) v_u_9, (copy) v_u_16
	p24.Text = p23:TranslateGameText(p25, p26)
	if v_u_9[p24] == nil then
		v_u_9[p24] = v_u_16(p24, p25, p26)
		return p26
	end
	local v27 = v_u_9[p24]
	v27.context = p25
	v27.text = p26
	return p26
end
return v_u_20