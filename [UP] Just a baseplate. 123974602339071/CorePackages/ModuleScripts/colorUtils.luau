-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.colorUtils
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
return {
	["calculateSVFromPosition"] = function(p2, p3, p4) -- name: calculateSVFromPosition
		local v5 = p2.X - p3.X
		local v6 = p4.X
		local v7 = math.clamp(v5, 0, v6)
		local v8 = p2.Y - p3.Y
		local v9 = p4.Y
		local v10 = math.clamp(v8, 0, v9)
		return v7 / p4.X, 1 - v10 / p4.Y
	end,
	["createHSVUpdateHandler"] = function(p_u_11, p_u_12, p_u_13, p_u_14, p_u_15) -- name: createHSVUpdateHandler
		return function(p16, p17, p18)
			-- upvalues: (copy) p_u_15, (copy) p_u_11, (copy) p_u_12, (copy) p_u_13, (copy) p_u_14
			p_u_15.current = true
			p_u_11(p16)
			p_u_12(p17)
			p_u_13(p18)
			p_u_14((Color3.fromHSV(p16, p17, p18)))
			p_u_15.current = false
		end
	end,
	["createColorInputChangeHandler"] = function(p_u_19, p_u_20, p_u_21, p_u_22, p_u_23) -- name: createColorInputChangeHandler
		return function(p24)
			-- upvalues: (copy) p_u_19, (copy) p_u_20, (copy) p_u_21, (copy) p_u_22, (copy) p_u_23
			p_u_19(p24)
			if not p_u_20.current then
				local v25, v26, v27 = p24:ToHSV()
				p_u_21(v25)
				p_u_22(v26)
				p_u_23(v27)
			end
		end
	end,
	["isPartialHSV"] = function(p28) -- name: isPartialHSV
		if typeof(p28) == "Color3" then
			return false
		else
			return p28.S == nil and true or p28.V == nil
		end
	end,
	["toColor3"] = function(p29) -- name: toColor3
		if typeof(p29) == "Color3" then
			return p29
		else
			return Color3.fromHSV(p29.H / 360, (p29.S or 100) / 100, (p29.V or 100) / 100)
		end
	end
}