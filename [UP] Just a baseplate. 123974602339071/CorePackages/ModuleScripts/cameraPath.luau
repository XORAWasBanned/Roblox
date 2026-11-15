-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.cameraPath
local function v_u_27(p1, p2, p3, p4) -- name: sampleSegment
	local v5 = #p1
	local v6
	if v5 >= 3 then
		local v7 = p2 - 1
		local v8 = #p1
		v6 = p1[(v7 - 1) % v8 + 1]
	else
		v6 = p1[p2]
	end
	local v9 = p1[p2]
	local v10 = p1[p3]
	local v11
	if v5 >= 3 then
		local v12 = p3 + 1
		local v13 = #p1
		v11 = p1[(v12 - 1) % v13 + 1]
	else
		v11 = p1[p3]
	end
	local v14 = v6.yawDegrees
	local v15 = v9.yawDegrees
	local v16 = v10.yawDegrees
	local v17 = v11.yawDegrees
	local v18 = p4 * p4
	local v19 = v18 * p4
	local v20 = (v15 * 2 + (-v14 + v16) * p4 + (v14 * 2 - v15 * 5 + v16 * 4 - v17) * v18 + (-v14 + v15 * 3 - v16 * 3 + v17) * v19) * 0.5
	local v21 = v6.pitchDegrees
	local v22 = v9.pitchDegrees
	local v23 = v10.pitchDegrees
	local v24 = v11.pitchDegrees
	local v25 = p4 * p4
	local v26 = v25 * p4
	return v20, (v22 * 2 + (-v21 + v23) * p4 + (v21 * 2 - v22 * 5 + v23 * 4 - v24) * v25 + (-v21 + v22 * 3 - v23 * 3 + v24) * v26) * 0.5
end
local function v_u_38(p28, p29) -- name: sampleKeys
	-- upvalues: (copy) v_u_27
	if #p28 == 0 then
		return 0, 0
	elseif #p28 == 1 then
		return p28[1].yawDegrees, p28[1].pitchDegrees
	else
		if p29 < 0 then
			p29 = 0
		elseif p29 > 1 then
			p29 = p29 - math.floor(p29)
		end
		local v30 = p28[1]
		local v31 = p28[#p28]
		if p29 <= v30.alpha then
			return v30.yawDegrees, v30.pitchDegrees
		elseif v31.alpha <= p29 then
			local v32 = 1 - v31.alpha
			if v32 <= 0 then
				return v31.yawDegrees, v31.pitchDegrees
			else
				return v_u_27(p28, #p28, 1, (p29 - v31.alpha) / v32)
			end
		else
			for v33 = 1, #p28 - 1 do
				local v34 = p28[v33]
				local v35 = p28[v33 + 1]
				if p29 > v35.alpha then
					continue
				end
				local v36 = v35.alpha - v34.alpha
				local v37 = v36 <= 0 and 0 or (p29 - v34.alpha) / v36
				return v_u_27(p28, v33, v33 + 1, v37)
			end
			return v31.yawDegrees, v31.pitchDegrees
		end
	end
end
local function v_u_44(p39, p40, p41, p42) -- name: cframeAroundLookAt
	local v43 = (CFrame.Angles(0, math.rad(p41), 0) * CFrame.Angles(-math.rad(p42), 0, 0)):VectorToWorldSpace((Vector3.new(0, 0, p40)))
	return CFrame.lookAt(p39 + v43, p39)
end
local v_u_45 = {
	{
		["alpha"] = 0,
		["yawDegrees"] = 0,
		["pitchDegrees"] = 0
	},
	{
		["alpha"] = 0.35,
		["yawDegrees"] = 8,
		["pitchDegrees"] = 4
	},
	{
		["alpha"] = 0.7,
		["yawDegrees"] = -6,
		["pitchDegrees"] = 2
	},
	{
		["alpha"] = 1,
		["yawDegrees"] = 0,
		["pitchDegrees"] = 0
	}
}
local v46 = {
	{
		["alpha"] = 0,
		["yawDegrees"] = 0,
		["pitchDegrees"] = 12
	},
	{
		["alpha"] = 1,
		["yawDegrees"] = 360,
		["pitchDegrees"] = 12
	}
}
local v47 = {
	{
		["alpha"] = 0,
		["yawDegrees"] = 0,
		["pitchDegrees"] = 0
	}
}
local v_u_48 = {
	["static"] = v47,
	["subtle"] = v_u_45,
	["closeup"] = v_u_45,
	["fullOrbit"] = v46
}
return {
	["eval"] = function(p49, p50, p51, p52) -- name: eval
		-- upvalues: (copy) v_u_38, (copy) v_u_44
		local v53, v54 = v_u_38(p51, p52)
		return v_u_44(p49, p50, v53, v54)
	end,
	["cframeAroundLookAt"] = v_u_44,
	["sampleKeys"] = v_u_38,
	["resolve"] = function(p55) -- name: resolve
		-- upvalues: (copy) v_u_48, (copy) v_u_45
		if p55 == "static" or (p55 == "subtle" or (p55 == "closeup" or p55 == "fullOrbit")) then
			return v_u_48[p55]
		else
			return v_u_45
		end
	end,
	["framingFor"] = function(p56) -- name: framingFor
		return p56 == "closeup" and "face" or "standing"
	end,
	["EMOTE_ORBIT"] = v_u_45,
	["FULL_ORBIT"] = v46,
	["STATIC"] = v47
}