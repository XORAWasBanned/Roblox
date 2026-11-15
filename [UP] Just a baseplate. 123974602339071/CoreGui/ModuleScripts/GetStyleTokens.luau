-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Utility.GetStyleTokens
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Style.Tokens
local v_u_5 = v3.App.Style.Constants
local v_u_6 = v_u_5.DeviceType
local v_u_7 = require(v2.Modules.TenFootInterface)
return function(p8, p9)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v10
	if v_u_7:IsEnabled() then
		v10 = v_u_6.Console
	else
		v10 = p8 or v_u_6.DefaultDeviceType
	end
	return v_u_4.getFoundationTokens(v10, p9 or v_u_5.DefaultThemeName)
end