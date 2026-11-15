-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.getEasingNumberSequence
local v_u_1 = game:GetService("TweenService")
return function(p2, p3, p4, p5, p6) -- name: getEasingNumberSequence
	-- upvalues: (copy) v_u_1
	local v7 = {}
	for v8 = 0, p4 do
		local v9 = v8 / p4
		local v10 = v_u_1:GetValue(v9, p5, p6)
		local v11 = p2 + (p3 - p2) * v10
		local v12 = NumberSequenceKeypoint.new(v9, v11)
		table.insert(v7, v12)
	end
	return v7
end