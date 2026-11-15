-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Utility.GetSegmentFromPosition
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Constants)
return function(p3) -- name: GetSegmentIndexFromPosition
	-- upvalues: (copy) v_u_2
	local v4 = p3.X
	local v5 = p3.Y
	local v6 = math.atan2(v4, v5)
	local v7 = math.deg(v6)
	if v7 < 0 then
		v7 = v7 + 360
	end
	local v8 = 360 / v_u_2.EmotesPerPage
	local v9 = v8 / 2
	local v10 = v7 + math.ceil(v9)
	local v11 = math.fmod(v10, 360) / v8
	local v12 = math.ceil(v11) + (v_u_2.SegmentsStartRotation + 90) / v8
	local v13 = math.ceil(v12)
	if v_u_2.EmotesPerPage < v13 then
		return v13 - v_u_2.EmotesPerPage
	end
	if v13 < 1 then
		v13 = v13 + v_u_2.EmotesPerPage
	end
	return v13
end