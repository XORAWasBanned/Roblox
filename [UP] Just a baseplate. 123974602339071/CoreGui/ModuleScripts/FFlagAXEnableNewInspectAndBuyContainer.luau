-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Flags.FFlagAXEnableNewInspectAndBuyContainer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
if v2 then
	v2 = game:DefineFastFlag("AXEnableNewInspectAndBuyContainer21", false)
end
return v2