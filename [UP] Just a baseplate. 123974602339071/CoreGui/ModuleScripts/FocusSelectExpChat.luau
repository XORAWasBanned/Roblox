-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Utility.FocusSelectExpChat
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Workspace.Packages.Chrome).FocusUtils
local v_u_5 = require(v1.Workspace.Packages.InputType)
local v_u_6 = v_u_5.getInputGroup
local v_u_7 = require(v1.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local v_u_8 = require(v2.Modules.ChatSelector)
return function(_)
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	if v_u_8:GetVisibility() and v_u_6(v_u_3:GetLastInputType()) == v_u_5.InputTypeConstants.Gamepad then
		v_u_4.FocusOffChrome(function()
			-- upvalues: (ref) v_u_7
			v_u_7.focusChatInputBar()
		end)
	end
end