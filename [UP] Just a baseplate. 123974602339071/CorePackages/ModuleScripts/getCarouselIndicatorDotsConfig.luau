-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CarouselIndicator.getCarouselIndicatorDotsConfig
local function v_u_7(p1, p2, p3) -- name: getDefaultDots
	local v4 = {}
	for v5 = 1, p2 do
		local v6 = {
			["isActive"] = v5 == p1,
			["page"] = v5,
			["size"] = p3
		}
		table.insert(v4, v6)
	end
	return v4
end
local function v_u_19(p8, p9, p10, p11, p12) -- name: getOverflowDots
	local v13 = p8 + 2
	local v14 = {}
	for v15 = p10, math.min(v13, p9) do
		local v16 = {
			["isActive"] = v15 == p8,
			["page"] = v15
		}
		local v17 = v15 - p8
		local v18
		if math.abs(v17) == 2 then
			v18 = p12
		else
			v18 = p11
		end
		v16.size = v18
		table.insert(v14, v16)
	end
	return v14
end
return function(p20, p21, p22, p23) -- name: getCarouselIndicatorDotsConfig
	-- upvalues: (copy) v_u_19, (copy) v_u_7
	local v24 = math.floor(p23)
	local v25 = math.max(v24, 1)
	local v26 = math.floor(p22)
	local v27 = math.clamp(v26, 1, v25)
	local v28 = math.min(v25, 5)
	local v29 = v25 > 5
	local v30
	if v29 then
		local v31 = v27 - 2
		v30 = math.max(v31, 1)
	else
		v30 = 1
	end
	local v32 = v27 - v30 + 1
	local v33
	if v29 then
		v33 = v_u_19(v27, v25, v30, p20, p21)
	else
		v33 = v_u_7(v27, v28, p20)
	end
	return {
		["activeVisibleIndex"] = v32,
		["page"] = v27,
		["dots"] = v33,
		["count"] = v25
	}
end