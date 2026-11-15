-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.Tooltips.useIsTooltipTurn
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(script.Parent.TooltipContext)
require(script.Parent.TooltipProvider)
function useIsTooltipTurn(p4) -- name: useIsTooltipTurn
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = v_u_2.useContext(v_u_3)
	if v5 then
		v5 = v5.isCurrentTooltip(p4)
	end
	return v5
end
return useIsTooltipTurn