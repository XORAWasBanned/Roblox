-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.ChromeIntegrationUtils
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
function dismissRobloxMenuAndRun(p_u_6) -- name: dismissRobloxMenuAndRun
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	if v_u_5 and v_u_4.GamepadEnabled then
		v_u_2.SelectedCoreObject = nil
	end
	local v7 = require(v_u_3.Modules.Settings.SettingsHub)
	if v_u_2.MenuIsOpen then
		local v_u_8 = tick() + 3
		local v_u_9 = nil
		v_u_9 = v_u_2.MenuClosed:Connect(function()
			-- upvalues: (ref) v_u_9, (copy) v_u_8, (copy) p_u_6
			if v_u_9 then
				v_u_9:Disconnect()
				v_u_9 = nil
			end
			if tick() < v_u_8 then
				p_u_6(true)
			end
		end)
		v7:SetVisibility(false)
	else
		p_u_6(false)
	end
end
return {
	["dismissRobloxMenuAndRun"] = dismissRobloxMenuAndRun
}