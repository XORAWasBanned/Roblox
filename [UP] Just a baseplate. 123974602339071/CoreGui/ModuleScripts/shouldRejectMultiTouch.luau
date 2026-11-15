-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Utility.shouldRejectMultiTouch
return function(p1, p2)
	if p1 == nil or p2 == nil then
		return false
	end
	local v3
	if p1.UserInputType == Enum.UserInputType.Touch then
		v3 = p2 ~= p1
	else
		v3 = false
	end
	return v3
end