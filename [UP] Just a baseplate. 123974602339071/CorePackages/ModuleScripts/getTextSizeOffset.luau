-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getTextSizeOffset
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers).Services.TextService
local v_u_3 = require(v1.Utility.noYield)
return function() -- name: getTextSizeOffset
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3(function(p4, p5)
		-- upvalues: (ref) v_u_2
		local v_u_6 = p4 or 0
		local v_u_7 = p5 or Font.fromEnum(Enum.Font.BuilderSans)
		local function v8()
			-- upvalues: (ref) v_u_2, (ref) v_u_6, (ref) v_u_7
			return v_u_2:GetTextSizeOffsetAsync(v_u_6, v_u_7)
		end
		local v9, v10 = pcall(v8)
		if v9 then
			return v10
		else
			return nil
		end
	end)
end