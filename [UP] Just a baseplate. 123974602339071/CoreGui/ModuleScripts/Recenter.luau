-- Path: CoreGui.RobloxGui.Modules.VR.Recenter
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("ContextActionService")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("CorePackages")
v3:WaitForChild("RobloxGui")
local v5 = require(v4.Workspace.Packages.VrCommon).Panel3D
local v_u_6 = require(v4.Workspace.Packages.VrCommon).VRHub
local v7 = require(v4.Workspace.Packages.AppCommonLib).Create
local v_u_8 = false
local v_u_9 = {
	["ModuleName"] = "Recenter",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = false
}
v_u_6:RegisterModule(v_u_9)
local v_u_10 = v5.Get("RecenterCountdown")
v_u_10:SetType(v5.Type.HorizontalFollow)
v_u_10:ResizeStuds(5, 3, 128)
v_u_10:SetCanFade(false)
local v_u_11 = v7("TextLabel")({
	["Parent"] = nil,
	["Position"] = nil,
	["Size"] = nil,
	["BackgroundTransparency"] = 0.9,
	["BackgroundColor3"] = nil,
	["TextColor3"] = nil,
	["Text"] = "",
	["TextScaled"] = true,
	["Font"] = nil,
	["Visible"] = true,
	["Parent"] = v_u_10:GetGUI(),
	["Position"] = UDim2.new(0.5, -64, 0.5, -64),
	["Size"] = UDim2.new(0, 128, 0, 128),
	["BackgroundColor3"] = Color3.new(0.2, 0.2, 0.2),
	["TextColor3"] = Color3.new(1, 1, 1),
	["Font"] = Enum.Font.SourceSansBold
})
v7("ImageLabel")({
	["Parent"] = nil,
	["Position"] = nil,
	["Size"] = nil,
	["BackgroundTransparency"] = 1,
	["Image"] = "rbxasset://textures/ui/VR/recenterFrame.png",
	["Parent"] = v_u_10:GetGUI(),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["Size"] = UDim2.new(1, 0, 1, 0)
})
v_u_10:SetVisible(false)
local v_u_12 = false
v_u_6.ModuleOpened.Event:connect(function(p13)
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (ref) v_u_12, (copy) v_u_10
	if p13 ~= v_u_9.ModuleName and v_u_6:GetModule(p13).VRIsExclusive then
		v_u_12 = false
		v_u_10:SetVisible(false)
	end
end)
function v_u_9.SetVisible(_, p14) -- name: SetVisible
	-- upvalues: (ref) v_u_8, (ref) v_u_12, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_2, (copy) v_u_11, (copy) v_u_1
	v_u_8 = p14
	if v_u_8 then
		if v_u_12 then
			v_u_12 = false
			v_u_10:SetVisible(false)
			v_u_6:FireModuleClosed(v_u_9.ModuleName)
		else
			v_u_6:FireModuleOpened(v_u_9.ModuleName)
			spawn(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_10, (ref) v_u_2, (ref) v_u_11, (ref) v_u_1, (ref) v_u_6, (ref) v_u_9
				v_u_12 = true
				v_u_10:SetVisible(true)
				v_u_2:BindCoreAction("CancelRecenterShortcut", function(_, p15, _)
					-- upvalues: (ref) v_u_12, (ref) v_u_10
					if p15 == Enum.UserInputState.Begin then
						v_u_12 = false
						v_u_10:SetVisible(false)
					end
				end, false, Enum.KeyCode.ButtonB)
				if v_u_12 then
					v_u_11.Text = tostring(3)
					wait(1)
				end
				if v_u_12 then
					v_u_11.Text = tostring(2)
					wait(1)
				end
				if v_u_12 then
					v_u_11.Text = tostring(1)
					wait(1)
				end
				if v_u_12 then
					v_u_1:RecenterUserHeadCFrame()
				end
				v_u_10:SetVisible(false)
				v_u_12 = false
				v_u_2:UnbindCoreAction("CancelRecenterShortcut")
				v_u_6:FireModuleClosed(v_u_9.ModuleName)
			end)
		end
	else
		v_u_12 = false
		v_u_10:SetVisible(false)
		v_u_6:FireModuleClosed(v_u_9.ModuleName)
		return
	end
end
function v_u_9.IsVisible(_) -- name: IsVisible
	-- upvalues: (ref) v_u_8
	return v_u_8
end
return v_u_9