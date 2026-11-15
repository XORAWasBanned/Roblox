-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getMultiLineTextHeight
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Components.Text.FontScales)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2
	if p3 <= 0 or p4 <= 0 then
		return 0
	end
	local v6 = p5 <= 1 and 1 or p5
	local v7 = math.floor(p3)
	local v8 = v_u_2[Font.fromEnum(Enum.Font.BuilderSans).Family]
	local v9 = v8 == nil and 0 or (v7 / v8 * (v6 * v8) - v7) / 2
	local v10 = (p4 - 1) * v6 * v7
	local v11 = math.ceil(v10)
	local v12
	if v9 >= 1 then
		v12 = math.ceil(v9)
	else
		v12 = math.floor(v9)
	end
	return v11 + v7 + v12
end