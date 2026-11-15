-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useFormFactor
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Hooks.useScreenSize)
local v_u_5 = require(v1.Enums.FormFactor)
return function() -- name: useFormFactor
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v_u_6 = v_u_4()
	return v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_6, (ref) v_u_5
		if v_u_6.X < 600 then
			return v_u_5.MobilePortrait
		elseif v_u_6.Y < 480 then
			return v_u_5.MobileLandscape
		else
			return v_u_5.Wide
		end
	end, { v_u_6 })
end