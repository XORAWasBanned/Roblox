-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Connect.ConnectIconDropdown
local v1 = script:FindFirstAncestor("Chrome")
local v2 = require(v1.Service)
local v3 = require(script.Parent.registerConnectIntegration)
local v4
if require(script.Parent.isConnectDropdownEnabled)() then
	v4 = v3("connect_dropdown", v2.AvailabilitySignal.Available)
else
	v4 = nil
end
return v4