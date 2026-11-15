-- Path: CoreGui.RobloxGui.Modules.VR.UserGui
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("VRService")
local v3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("GuiService")
game:GetService("GamepadService")
local v_u_5 = game:GetService("CoreGui")
local v6 = game:GetService("CorePackages")
local v7 = v_u_5.RobloxGui
local v8 = v7:WaitForChild("Modules")
local v9 = require(v6.Workspace.Packages.VrCommon).Panel3D
local v_u_10 = require(v6.Workspace.Packages.VrCommon).VRHub
local v11 = require(v7.Modules.VR.VirtualKeyboard)
local v_u_12 = require(v7.Modules.InGameMenuConstants)
local v_u_13 = require(v7.Modules.VR.IsSpatialRobloxGuiEnabled)
local v14 = game:GetService("CorePackages")
local v15 = require(v14.Workspace.Packages.VrCompatibility).VRConstants
game:GetService("UserInputService")
game:GetService("RunService")
local v16 = require(v14.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v17, v_u_18
if require(v14.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify then
	local v19 = require(v14.Workspace.Packages.VrSpatialUi)
	v17 = v19.Constants.PanelType
	v_u_18 = v19.UIManager
else
	local v20 = v8:WaitForChild("UIManager")
	v17 = require(v20.Constants).PanelType
	v_u_18 = require(v20.UIManager)
end
local v_u_21 = (require(v7.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local v22 = game:DefineFastFlag("FixVRActionBinding", false)
local v_u_23 = game:DefineFastFlag("FixUserGuiRenderingAfterVRDisabled", false)
if not v_u_2.VREnabled then
	warn("UserGui should not be required while not in VR")
	return nil
end
v_u_2.QuestDisplayRefreshRate = 90
local v_u_24 = {
	["ModuleName"] = "UserGui",
	["KeepVRTopbarOpen"] = false,
	["VRIsExclusive"] = false,
	["VRClosesNonExclusive"] = false,
	["SetVisible"] = nil
}
v_u_10:RegisterModule(v_u_24)
Vector2.new(4, 3)
local v_u_25 = Vector2.new(2.66 * v_u_21, 2 * v_u_21)
local v_u_26 = false
local v_u_27 = v9.Get(v_u_24.ModuleName)
v_u_27:SetType(v9.Type.NewStandard)
v_u_27:GetPart().CanQuery = false
local v28 = Vector2.new(2.7978, 2.09835)
v_u_27:ResizeStuds(v28.x, v28.y, 128)
v_u_27:SetVisible(false)
local v_u_29
if v_u_13 then
	v_u_29 = v9.Get(v15.PositionLockedPanelName)
	config = {}
	local v30 = {
		["panelType"] = v17.RobloxGui
	}
	config.uiManagerPanelPart = v_u_18.getInstance():createUI(v30).panelObject
	v_u_29:SetType(v9.Type.UIManagerManaged, config)
else
	v_u_29 = v9.Get(v15.PositionLockedPanelName)
	v_u_29:SetType(v9.Type.PositionLocked)
end
v_u_29:GetPart().CanQuery = false
v_u_29:ResizeStuds(v_u_25.x, v_u_25.y, 128)
v_u_29:SetVisible(false)
v_u_29.showCursor = true
v_u_10.ModuleOpened.Event:connect(function(p31)
	-- upvalues: (copy) v_u_24, (copy) v_u_10, (copy) v_u_27
	if p31 ~= v_u_24.ModuleName and (v_u_10:GetModule(p31).VRClosesNonExclusive and v_u_27:IsVisible()) then
		v_u_24:SetVisible(false, nil)
	end
end)
local v_u_32 = false
local v_u_33 = false
function v_u_24.SetVisible(_, p34, p35) -- name: SetVisible
	-- upvalues: (ref) v_u_33, (copy) v_u_10, (copy) v_u_24, (ref) v_u_32, (copy) v_u_13, (copy) v_u_5
	v_u_33 = p34
	if p35 then
		p35:SetVisible(v_u_33)
	end
	if v_u_33 then
		v_u_10:FireModuleOpened(v_u_24.ModuleName)
	else
		v_u_10:FireModuleClosed(v_u_24.ModuleName)
	end
	local v36 = v_u_33
	if v36 then
		v36 = not v_u_32
	end
	if v_u_13 then
		v_u_5:SetUserGuiRendering(true, v36 and (p35 and p35:GetPart()) or nil, Enum.NormalId.Back)
	else
		v_u_5:SetUserGuiRendering(true, v36 and (p35 and p35:GetPart()) or nil, Enum.NormalId.Front)
	end
end
function v_u_24.IsVisible(_) -- name: IsVisible
	-- upvalues: (ref) v_u_33
	return v_u_33
end
function v_u_24.Update(p37) -- name: Update
	-- upvalues: (ref) v_u_33
	p37:SetVisible(v_u_33)
end
local function v38() -- name: onGuiSelection
	-- upvalues: (copy) v_u_23, (copy) v_u_2, (copy) v_u_10, (copy) v_u_24, (ref) v_u_29, (copy) v_u_21, (ref) v_u_26, (copy) v_u_25, (copy) v_u_4
	if not v_u_23 or v_u_2.VREnabled then
		v_u_10.LaserPointer:updateInputUserCFrame()
		if v_u_10.ShowTopBar then
			v_u_24:SetVisible(true, v_u_29)
			v_u_29.initialCFLerp = 1
			v_u_29:ForcePositionUpdate(true)
			v_u_29.distance = 2.5 * v_u_21
			if not v_u_26 then
				v_u_29:StartLerp(v_u_25)
				v_u_26 = true
				return
			end
		else
			v_u_29:StartLerp(v_u_25 * 0.25)
			v_u_24:SetVisible(false, v_u_29)
			v_u_4.SelectedObject = nil
			v_u_26 = false
		end
	end
end
v_u_10.ShowTopBarChanged.Event:connect(v38)
v_u_4:GetPropertyChangedSignal("MenuIsOpen"):Connect(v38)
v_u_2.UserCFrameEnabled:Connect(v38)
v_u_4.PurchasePromptShown:Connect(function()
	-- upvalues: (copy) v_u_10
	if not v_u_10.ShowTopBar then
		v_u_10:SetShowTopBar(true)
	end
end)
local function v39(_) -- name: onGuiSelectedObjectChanged
	-- upvalues: (copy) v_u_4, (copy) v_u_10
	if (v_u_4.SelectedObject or v_u_4.SelectedCoreObject) and not v_u_10.ShowTopBar then
		v_u_10:SetShowTopBar(true)
	end
	v_u_4.SelectedObject = nil
	v_u_4.SelectedCoreObject = nil
end
v_u_4:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v39)
v_u_4:GetPropertyChangedSignal("SelectedObject"):Connect(v39)
local v_u_40 = require(v7.Modules.InGameMenu)
local function v_u_42(p41) -- name: onVRMenuClicked
	-- upvalues: (copy) v_u_10, (copy) v_u_1, (copy) v_u_40, (copy) v_u_12
	if p41 == "OpenVRMenu" then
		if v_u_10.ShowTopBar then
			v_u_10:SetShowTopBar(false)
			v_u_40.closeInGameMenu()
			v_u_1:ReportCounter("VR-BindAction-ToggleGui-Off")
		else
			v_u_10:SetShowTopBar(true)
			v_u_1:ReportCounter("VR-BindAction-ToggleGui-On")
		end
	end
	if p41 == "OpenIGMenu" then
		if not v_u_10.ShowTopBar then
			v_u_10:SetShowTopBar(true)
		end
		if not v_u_40.getOpen() then
			v_u_40.openInGameMenu(v_u_12.MainPagePageKey)
		end
	end
end
local function v45(p43, p44, _) -- name: handleAction
	-- upvalues: (copy) v_u_42
	if p44 == Enum.UserInputState.Begin then
		v_u_42(p43)
	end
end
if v16 then
	local v_u_46 = require(v14.Packages.InputHandlers)
	local v_u_47 = false
	local v_u_48 = false
	function v_u_24.isInputNeededForOpenVRMenu(_, p49) -- name: isInputNeededForOpenVRMenu
		return p49.KeyCode == Enum.KeyCode.ButtonSelect
	end
	function v_u_24.getOpenVRMenuHandler(_) -- name: getOpenVRMenuHandler
		-- upvalues: (copy) v_u_46, (ref) v_u_47, (ref) v_u_48, (ref) v_u_18, (copy) v_u_10, (copy) v_u_1, (copy) v_u_40
		local v50 = {
			["onPress"] = function() -- name: onPress
				-- upvalues: (ref) v_u_47, (ref) v_u_48
				v_u_47 = true
				v_u_48 = false
			end,
			["hold"] = {
				["durationSeconds"] = 1,
				["onComplete"] = nil,
				["allowReleaseAfterHold"] = true,
				["onComplete"] = function() -- name: onComplete
					-- upvalues: (ref) v_u_48, (ref) v_u_18
					v_u_48 = true
					v_u_18.getInstance():resetDragAndDrop()
				end
			},
			["onRelease"] = function() -- name: onRelease
				-- upvalues: (ref) v_u_48, (ref) v_u_10, (ref) v_u_1, (ref) v_u_40, (ref) v_u_47
				if not v_u_48 then
					if v_u_10.ShowTopBar then
						v_u_10:SetShowTopBar(false)
						v_u_40.closeInGameMenu()
						v_u_1:ReportCounter("VR-BindAction-ToggleGui-Off")
					else
						v_u_10:SetShowTopBar(true)
						v_u_1:ReportCounter("VR-BindAction-ToggleGui-On")
					end
				end
				v_u_47 = false
				v_u_48 = false
			end
		}
		local v_u_51 = v_u_46.handleInput(v50)
		return function(_, p52, _)
			-- upvalues: (copy) v_u_51
			local v53 = {
				["eventData"] = {
					["UserInputState"] = p52
				}
			}
			v_u_51(v53)
		end
	end
end
if v22 or v16 then
	if v16 then
		v3:BindCoreAction("OpenVRMenu", v_u_24:getOpenVRMenuHandler(), false, Enum.KeyCode.ButtonSelect)
	else
		v3:BindCoreAction("OpenVRMenu", v45, false, Enum.KeyCode.ButtonSelect)
	end
else
	v3:BindAction("OpenVRMenu", v45, false, Enum.KeyCode.ButtonSelect)
end
v3:BindAction("OpenIGMenu", v45, false, Enum.KeyCode.ButtonStart)
local function v54() -- name: OnVREnabledChanged
	-- upvalues: (copy) v_u_2, (copy) v_u_27, (copy) v_u_5, (copy) v_u_24, (ref) v_u_29, (copy) v_u_10
	if v_u_2.VREnabled then
		v_u_24:SetVisible(false, v_u_27)
		v_u_24:SetVisible(true, v_u_29)
		v_u_10:SetShowTopBar(true)
	else
		v_u_27:SetVisible(false)
		v_u_5:SetUserGuiRendering(false, nil, Enum.NormalId.Front)
	end
end
v_u_2:GetPropertyChangedSignal("VREnabled"):connect(v54)
v54()
v11.OpenedEvent:connect(function()
	-- upvalues: (ref) v_u_32, (copy) v_u_24
	v_u_32 = true
	v_u_24:Update()
end)
v11.ClosedEvent:connect(function()
	-- upvalues: (ref) v_u_32, (copy) v_u_24
	v_u_32 = false
	v_u_24:Update()
end)
v_u_10:SetShowTopBar(true)
v38()
function v_u_24.getPanel(_) -- name: getPanel
	-- upvalues: (ref) v_u_29
	return v_u_29
end
return v_u_24