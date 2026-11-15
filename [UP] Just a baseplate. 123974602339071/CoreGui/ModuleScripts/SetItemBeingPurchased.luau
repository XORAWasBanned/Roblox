-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetItemBeingPurchased
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
return v2(script.Name, function(p5, p6, p7)
	-- upvalues: (copy) v_u_4
	local v8 = {
		["itemId"] = p5,
		["itemType"] = p6
	}
	if not v_u_4 then
		p7 = nil
	end
	v8.resalePrice = p7
	return v8
end)