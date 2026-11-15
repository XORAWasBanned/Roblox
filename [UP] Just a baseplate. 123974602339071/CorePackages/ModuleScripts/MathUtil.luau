-- Path: CorePackages.Packages._Index.Graphing.Graphing.Util.MathUtil
return {
	["lerp"] = function(p1, p2, p3) -- name: lerp
		return p2 * p3 + p1 * (1 - p3)
	end,
	["inverseLerp"] = function(p4, p5, p6) -- name: inverseLerp
		return p5 - p4 == 0 and 0 or (p6 - p4) / (p5 - p4)
	end,
	["signedPow"] = function(p7, p8) -- name: signedPow
		local v9 = math.abs(p7)
		return math.pow(v9, p8) * math.sign(p7)
	end,
	["log"] = function(p10, p11) -- name: log
		if p10 == 10 then
			return math.log10(p11)
		else
			return math.log(p11) / math.log(p10)
		end
	end,
	["roundToNearest"] = function(p12, p13) -- name: roundToNearest
		local v14 = p12 / p13
		return math.round(v14) * p13
	end
}