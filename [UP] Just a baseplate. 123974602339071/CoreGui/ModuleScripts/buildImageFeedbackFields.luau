-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.buildImageFeedbackFields
return function(p1, p2, p3)
	local v4, v5
	if p2 == nil then
		v4 = nil
		v5 = ""
	else
		v4 = string.match(p2, "rbxassetid://(%d+)")
		if v4 == nil then
			v4 = nil
			v5 = ""
		else
			v5 = string.match(p2, "version=(%d+)") or ""
		end
	end
	if v4 == nil then
		return nil
	end
	local v6, v7
	if p3 == nil then
		v6 = nil
		v7 = ""
	else
		v6 = string.match(p3, "rbxassetid://(%d+)")
		if v6 == nil then
			v6 = nil
			v7 = ""
		else
			v7 = string.match(p3, "version=(%d+)") or ""
		end
	end
	local v8 = v6 == nil and "" or v6 .. "#" .. v7
	return {
		["identifier"] = p1 .. "#" .. v4 .. "#" .. v5,
		["source"] = v4 .. "#" .. v5,
		["translation"] = v8
	}
end