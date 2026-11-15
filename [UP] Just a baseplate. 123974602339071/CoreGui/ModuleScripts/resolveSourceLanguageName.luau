-- Path: CoreGui.RobloxGui.Modules.Feedback.Network.resolveSourceLanguageName
return function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	for _, v3 in pairs(p1) do
		local v4 = v3.locale
		if not v4 or (not v4.language or v4.language.languageCode ~= p2) then
			continue
		end
		return v4.language.name
	end
	return nil
end