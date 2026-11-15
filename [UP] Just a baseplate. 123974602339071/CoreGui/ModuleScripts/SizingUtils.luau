-- Path: CoreGui.RobloxGui.Modules.SelfieView.Utils.SizingUtils
return {
	["getSize"] = function(p1, p2) -- name: getSize
		local v3 = p1.Y * 0.7
		local v4 = math.round(v3)
		local v5 = math.min(v4, 285)
		local v6 = v5 * 0.6596491228070176
		if not p2 then
			v5 = v5 * 0.45614035087719296
		end
		return Vector2.new(v6, v5)
	end
}