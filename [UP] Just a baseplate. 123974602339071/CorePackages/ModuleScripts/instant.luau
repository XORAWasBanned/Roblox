-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.instant
local function v_u_2(p1, _, _) -- name: step
	return {
		["value"] = nil,
		["complete"] = true,
		["value"] = p1.__targetValue
	}
end
return function(p3) -- name: instant
	-- upvalues: (copy) v_u_2
	return {
		["__targetValue"] = p3,
		["step"] = v_u_2
	}
end