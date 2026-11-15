-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Thunks.OpenMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("VRService")
local v4 = game:GetService("RbxAnalyticsService")
local v5 = script.Parent.Parent
local v6 = v5.Actions
local v7 = v5.Parent
local v8 = require(v1.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v9 = require(v5.Analytics)
local v_u_10 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_11
if v_u_10 then
	v_u_11 = require(v1.Workspace.Packages.System).Features
else
	v_u_11 = nil
end
local v_u_12
if v_u_10 then
	v_u_12 = nil
else
	v_u_12 = require(v7.BackpackScript)
end
local v_u_13 = require(v6.ShowMenu)
local v_u_14 = v9.new():withEventStream(v8.new(v4))
return function(_) -- name: OpenMenu
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_13
	return function(p15)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_14, (ref) v_u_13
		if v_u_2.MenuIsOpen then
			if not v_u_3.VREnabled then
				return
			end
			v_u_2:SetMenuIsOpen(false, "VRMenu")
		end
		if v_u_10 then
			v_u_11.setVisibility(v_u_11.FeatureName.Backpack, false)
			if v_u_11.getVisibility(v_u_11.FeatureName.Backpack) then
				return
			end
		else
			if v_u_12.IsOpen then
				v_u_12.OpenClose()
			end
			if v_u_12.IsOpen then
				return
			end
		end
		v_u_14:onMenuOpened()
		p15:dispatch(v_u_13())
	end
end