-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.CurveUtil
local v_u_44 = {
	["Expt"] = function(_, p1, p2, p3, p4) -- name: Expt
		-- upvalues: (copy) v_u_44
		local v5 = p2 - p1
		if math.abs(v5) < 0.01 then
			return p2
		end
		local v6 = v_u_44:Expty(p1, p2, p3, p4)
		return p1 + (p2 - p1) * v6
	end,
	["Expty"] = function(_, _, _, p7, p8) -- name: Expty
		local v9 = 1 - p7
		local v10 = -(-math.log(v9)) * p8
		return 1 - math.exp(v10)
	end,
	["Sign"] = function(_, p11) -- name: Sign
		return p11 > 0 and 1 or (p11 < 0 and -1 or 0)
	end,
	["BezierValForT"] = function(_, p12, p13, p14, p15, p16) -- name: BezierValForT
		local v17 = (1 - p16) * (1 - p16) * (1 - p16)
		local v18 = 3 * p16 * (1 - p16) * (1 - p16)
		local v19 = 3 * p16 * p16 * (1 - p16)
		local v20 = p16 * p16 * p16
		return v17 * p12 + v18 * p13 + v19 * p14 + v20 * p15
	end,
	["_BezierPt2ForT"] = {
		["x"] = 0,
		["y"] = 0
	},
	["BezierPt2ForT"] = function(_, p21, p22, p23, p24, p25, p26, p27, p28, p29) -- name: BezierPt2ForT
		-- upvalues: (copy) v_u_44
		v_u_44._BezierPt2ForT.x = v_u_44:BezierValForT(p21, p23, p25, p27, p29)
		v_u_44._BezierPt2ForT.y = v_u_44:BezierValForT(p22, p24, p26, p28, p29)
		return v_u_44._BezierPt2ForT
	end,
	["YForPointOf2PtLine"] = function(_, p30, p31, p32) -- name: YForPointOf2PtLine
		local v33 = (p30.y - p31.y) / (p30.x - p31.x)
		local v34 = p30.y - v33 * p30.x
		return v33 * p32 + v34
	end,
	["DeltaTimeToTimescale"] = function(_, p35) -- name: DeltaTimeToTimescale
		return p35 / 0.016666666666666666
	end,
	["SecondsToTick"] = function(_, p36) -- name: SecondsToTick
		return 0.016666666666666666 / p36
	end,
	["ExptValueInSeconds"] = function(_, p37, p38, p39) -- name: ExptValueInSeconds
		local v40 = p37 / p38
		local v41 = 1 / (60 * p39)
		return 1 - math.pow(v40, v41)
	end,
	["NormalizedDefaultExptValueInSeconds"] = function(p42, p43) -- name: NormalizedDefaultExptValueInSeconds
		return p42:ExptValueInSeconds(0.01, 1, p43)
	end
}
return v_u_44