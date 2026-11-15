-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useIconSize
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Utility.Flags)
local v_u_4 = require(v1.Utility.devAssert)
local v_u_5 = require(v1.Providers.Style.useTokens)
return function(p6, p7, p8) -- name: useIconSize
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v9 = v_u_5()
	local v10
	if p7 then
		v10 = {}
		local v11 = v_u_2.XSmall
		local v12
		if p8 then
			v12 = v9.Size.Size_400
		else
			v12 = v9.Size.Size_300
		end
		v10[v11] = v12
		local v13 = v_u_2.Small
		local v14
		if p8 then
			v14 = v9.Size.Size_500
		else
			v14 = v9.Size.Size_400
		end
		v10[v13] = v14
		local v15 = v_u_2.Medium
		local v16
		if p8 then
			v16 = v9.Size.Size_600
		else
			v16 = v9.Size.Size_500
		end
		v10[v15] = v16
		local v17 = v_u_2.Large
		local v18
		if p8 then
			v18 = v9.Size.Size_700
		else
			v18 = v9.Size.Size_600
		end
		v10[v17] = v18
		local v19 = v_u_2.XLarge
		local v20
		if p8 then
			v20 = v9.Size.Size_800
		else
			v20 = v9.Size.Size_700
		end
		v10[v19] = v20
		local v21 = v_u_2.XXLarge
		local v22
		if p8 then
			v22 = v9.Size.Size_900
		else
			v22 = v9.Size.Size_800
		end
		v10[v21] = v22
	else
		v10 = {
			[v_u_2.XSmall] = v9.Size.Size_200,
			[v_u_2.Small] = v9.Size.Size_400,
			[v_u_2.Medium] = v9.Size.Size_900,
			[v_u_2.Large] = v9.Size.Size_1200,
			[v_u_2.XLarge] = v9.Size.Size_2400,
			[v_u_2.XXLarge] = 24 * v9.Size.Size_200
		}
	end
	local v23 = nil
	local v24
	if p7 then
		local v25
		if typeof(p6) == "number" then
			v25 = true
		elseif typeof(p6) == "table" then
			v25 = typeof(p6:getValue()) == "number"
		else
			v25 = false
		end
		if v25 then
			v23 = p6
		else
			if typeof(p6) == "number" then
				v24 = true
			elseif typeof(p6) == "table" then
				v24 = typeof(p6:getValue()) == "number"
			else
				v24 = false
			end
			if not v24 then
				v23 = v10[p6]
			end
		end
	else
		if typeof(p6) == "number" then
			v24 = true
		elseif typeof(p6) == "table" then
			v24 = typeof(p6:getValue()) == "number"
		else
			v24 = false
		end
		if not v24 then
			v23 = v10[p6]
		end
	end
	if v23 == nil then
		if v_u_3.FoundationDevOnlyPropAsserts then
			v_u_4(false, "Invalid icon size: " .. tostring(p6))
			v23 = v10[v_u_2.Medium]
		else
			error("Invalid icon size: " .. tostring(p6))
		end
	end
	if typeof(v23) == "table" then
		return v23:map(function(p26)
			return UDim2.fromOffset(p26, p26)
		end)
	else
		return UDim2.fromOffset(v23, v23)
	end
end