-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.EmotesMenuMaster
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("LocalizationService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = v1:WaitForChild("RobloxGui")
local v_u_9 = v4.LocalPlayer
if not v_u_9 then
	v4:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_9 = v4.LocalPlayer
end
local v_u_10 = require(v2.Packages.Roact)
local v_u_11 = require(v2.Packages.Rodux)
local v_u_12 = require(v2.Packages.RoactRodux)
local v13 = require(v2.Packages.UIBlox)
local v_u_14 = require(v2.Packages.Signals)
local v_u_15 = require(v2.Workspace.Packages.InExperienceTopBar)
local v_u_16 = require(v2.Packages.Foundation).Enums.ColorMode
local v17 = script.Parent
local v18 = v17.Parent
local v19 = v17.Actions
local v20 = v17.Components
local v21 = v17.Reducers
local v22 = v17.Thunks
local v23 = v17.Utility
local v_u_24 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_25
if v_u_24 then
	v_u_25 = require(v2.Workspace.Packages.System).Features
else
	v_u_25 = nil
end
local v_u_26
if v_u_24 then
	v_u_26 = nil
else
	v_u_26 = require(v18.BackpackScript)
end
local v_u_27 = require(v18.ChatSelector)
local v_u_28 = require(v18.TenFootInterface)
local v_u_29 = require(v18.TopBar.Constants)
local v_u_30 = require(v2.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_31 = v_u_15.Flags.FFlagTopBarSignalizeSetCores
local v_u_32 = v13.App.Style.Constants
local v_u_33 = require(v2.Workspace.Packages.Style).UiModeStyleProvider
local v_u_34 = require(v23.CanPlayEmotes)
local v_u_35 = require(v17.Constants)
local v_u_36 = require(v17.Flags.FFlagFixEmotesMenuAvailability)
local v_u_37 = require(v20.EmotesMenu)
local v_u_38 = require(v21.EmotesMenuReducer)
local v_u_39 = require(v22.OpenMenu)
local v_u_40 = require(v19.HideMenu)
local v_u_41 = require(v19.EmotesChanged)
local v_u_42 = require(v19.EquippedEmotesChanged)
local v_u_43 = require(v19.NumberEmotesLoadedChanged)
local v_u_44 = require(v19.SetGuiInset)
local v_u_45 = require(v19.SetLayout)
local v_u_46 = require(v19.SetLocale)
local v_u_47 = game:DefineFastFlag("EmotesStayOpenWithChat", false)
local v_u_48 = {}
v_u_48.__index = v_u_48
function v_u_48.isOpen(p49) -- name: isOpen
	return p49.store:getState().displayOptions.menuVisible
end
function v_u_48.isEmotesLoaded(p50) -- name: isEmotesLoaded
	return p50.store:getState().emotesPage.numberEmotesLoaded > 0
end
function v_u_48.open(p51) -- name: open
	-- upvalues: (copy) v_u_39
	p51.store:dispatch(v_u_39())
end
function v_u_48.close(p52) -- name: close
	-- upvalues: (copy) v_u_40
	p52.store:dispatch(v_u_40())
end
function v_u_48.setTopBarEnabled(p53, p54) -- name: setTopBarEnabled
	-- upvalues: (copy) v_u_7
	p53.topBarEnabled = p54
	if p54 and (v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) and p53.canPlayEmotes) then
		p53:_mount()
	else
		p53:_unmount()
	end
end
function v_u_48._connectCoreGuiListeners(p_u_55) -- name: _connectCoreGuiListeners
	-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_26, (copy) v_u_47, (copy) v_u_27, (copy) v_u_30
	if v_u_24 then
		v_u_25.onVisibilityChanged(v_u_25.FeatureName.Backpack, function(p56)
			-- upvalues: (copy) p_u_55
			if p56 then
				if p_u_55:isOpen() then
					p_u_55:close()
				end
			end
		end)
	else
		v_u_26.StateChanged.Event:Connect(function(p57)
			-- upvalues: (copy) p_u_55
			if p57 then
				if p_u_55:isOpen() then
					p_u_55:close()
				end
			end
		end)
	end
	if not v_u_47 then
		v_u_27.VisibilityStateChanged:connect(function(p58)
			-- upvalues: (copy) p_u_55
			if p58 then
				if p_u_55:isOpen() then
					p_u_55:close()
				end
			end
		end)
	end
	if not v_u_47 then
		v_u_30.default.visibilitySignal.Event:Connect(function(p59)
			-- upvalues: (copy) p_u_55
			if p59 and p_u_55:isOpen() then
				p_u_55:close()
			end
		end)
	end
end
function v_u_48._connectApiListeners(p_u_60) -- name: _connectApiListeners
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	v_u_7.CoreGuiChangedSignal:connect(function(p61, p62)
		-- upvalues: (copy) p_u_60
		if p_u_60.topBarEnabled then
			if p_u_60.canPlayEmotes then
				if p61 == Enum.CoreGuiType.EmotesMenu or p61 == Enum.CoreGuiType.All then
					if p62 then
						p_u_60:_mount()
						return
					end
					p_u_60:_unmount()
				end
			end
		else
			return
		end
	end)
	v_u_3.EmotesMenuOpenChanged:Connect(function(p63)
		-- upvalues: (copy) p_u_60
		if p63 then
			if not p_u_60:isOpen() then
				p_u_60:open()
				return
			end
		elseif p_u_60:isOpen() then
			p_u_60:close()
		end
	end)
end
function v_u_48._onEquippedEmotesChanged(p64, p65) -- name: _onEquippedEmotesChanged
	-- upvalues: (copy) v_u_42
	p64.store:dispatch(v_u_42(p65))
end
function v_u_48._onEmotesChanged(p66, p67) -- name: _onEmotesChanged
	-- upvalues: (copy) v_u_41
	p66.store:dispatch(v_u_41(p67))
end
function v_u_48._onNumberEmotesLoadedChanged(p68, p69) -- name: _onNumberEmotesLoadedChanged
	-- upvalues: (copy) v_u_43
	p68.store:dispatch(v_u_43(p69))
	p68.EmotesLoaded:Fire(p69 > 0)
end
function v_u_48._onHumanoidDescriptionChanged(p_u_70, p_u_71) -- name: _onHumanoidDescriptionChanged
	-- upvalues: (copy) v_u_36
	if p_u_70.equippedEmotesChangedConn then
		p_u_70.equippedEmotesChangedConn:Disconnect()
		p_u_70.equippedEmotesChangedConn = nil
	end
	if p_u_70.emotesChangedConn then
		p_u_70.emotesChangedConn:Disconnect()
		p_u_70.emotesChangedConn = nil
	end
	if p_u_70.numberEmotesLoadedChangedConn then
		p_u_70.numberEmotesLoadedChangedConn:Disconnect()
		p_u_70.numberEmotesLoadedChangedConn = nil
	end
	if p_u_70.humanoidDescriptionAncestryConn then
		p_u_70.humanoidDescriptionAncestryConn:Disconnect()
		p_u_70.humanoidDescriptionAncestryConn = nil
	end
	if p_u_71 then
		p_u_70.equippedEmotesChangedConn = p_u_71.EquippedEmotesChanged:Connect(function(p72)
			-- upvalues: (copy) p_u_70
			p_u_70:_onEquippedEmotesChanged(p72)
		end)
		p_u_70:_onEquippedEmotesChanged(p_u_71:GetEquippedEmotes())
		p_u_70.emotesChangedConn = p_u_71.EmotesChanged:Connect(function(p73)
			-- upvalues: (copy) p_u_70
			p_u_70:_onEmotesChanged(p73)
		end)
		p_u_70:_onEmotesChanged(p_u_71:GetEmotes())
		p_u_70.numberEmotesLoadedChangedConn = p_u_71:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(p74)
			-- upvalues: (ref) v_u_36, (copy) p_u_70, (copy) p_u_71
			if v_u_36 then
				p_u_70:_onNumberEmotesLoadedChanged(p_u_71.NumberEmotesLoaded)
			else
				p_u_70:_onNumberEmotesLoadedChanged(p74)
			end
		end)
		p_u_70:_onNumberEmotesLoadedChanged(p_u_71.NumberEmotesLoaded)
		p_u_70.humanoidDescriptionAncestryConn = p_u_71.AncestryChanged:Connect(function(p75, p76)
			-- upvalues: (copy) p_u_71, (copy) p_u_70
			if p75 == p_u_71 and p76 == nil then
				p_u_70:_onHumanoidDescriptionChanged(nil)
			end
		end)
	else
		p_u_70:_onEquippedEmotesChanged({})
		p_u_70:_onEmotesChanged({})
		p_u_70:_onNumberEmotesLoadedChanged(-1)
	end
end
function v_u_48._onHumanoidChanged(p_u_77, p_u_78) -- name: _onHumanoidChanged
	if p_u_77.humanoidChildAddedConn then
		p_u_77.humanoidChildAddedConn:Disconnect()
		p_u_77.humanoidChildAddedConn = nil
	end
	if p_u_77.humanoidAncestryChangedConn then
		p_u_77.humanoidAncestryChangedConn:Disconnect()
		p_u_77.humanoidAncestryChangedConn = nil
	end
	if p_u_78 then
		p_u_77.humanoidChildAddedConn = p_u_78.ChildAdded:Connect(function(p79)
			-- upvalues: (copy) p_u_77
			if p79:IsA("HumanoidDescription") then
				p_u_77:_onHumanoidDescriptionChanged(p79)
			end
		end)
		local v80 = p_u_78:FindFirstChildOfClass("HumanoidDescription")
		if v80 then
			p_u_77:_onHumanoidDescriptionChanged(v80)
		end
		p_u_77.humanoidAncestryChangedConn = p_u_78.AncestryChanged:Connect(function(p81, p82)
			-- upvalues: (copy) p_u_78, (copy) p_u_77
			if p81 == p_u_78 and p82 == nil then
				p_u_77:_onHumanoidChanged(nil)
			end
		end)
	else
		p_u_77:_onHumanoidDescriptionChanged(nil)
	end
end
function v_u_48._onCharacterAdded(p_u_83, p84) -- name: _onCharacterAdded
	if p_u_83.characterChildAddedConn then
		p_u_83.characterChildAddedConn:Disconnect()
		p_u_83.characterChildAddedConn = nil
	end
	p_u_83.characterChildAddedConn = p84.ChildAdded:Connect(function(p85)
		-- upvalues: (copy) p_u_83
		if p85:IsA("Humanoid") then
			p_u_83:_onHumanoidChanged(p85)
		end
	end)
	local v86 = p84:FindFirstChildWhichIsA("Humanoid")
	if v86 then
		p_u_83:_onHumanoidChanged(v86)
	end
end
function v_u_48._connectListeners(p_u_87) -- name: _connectListeners
	-- upvalues: (ref) v_u_9, (copy) v_u_6, (copy) v_u_46, (copy) v_u_34, (copy) v_u_7, (copy) v_u_31, (copy) v_u_14, (copy) v_u_15
	p_u_87:_connectCoreGuiListeners()
	p_u_87:_connectApiListeners()
	v_u_9.CharacterAdded:Connect(function(p88)
		-- upvalues: (copy) p_u_87
		p_u_87:_onCharacterAdded(p88)
	end)
	if v_u_9.Character then
		p_u_87:_onCharacterAdded(v_u_9.Character)
	end
	v_u_6:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: (copy) p_u_87, (ref) v_u_46, (ref) v_u_6
		p_u_87.store:dispatch(v_u_46(v_u_6.RobloxLocaleId))
	end)
	v_u_34.ChangedEvent.Event:connect(function(p89)
		-- upvalues: (copy) p_u_87, (ref) v_u_7
		p_u_87.canPlayEmotes = p89
		local v90 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu)
		if p89 and (p_u_87.topBarEnabled and v90) then
			p_u_87:_mount()
		else
			p_u_87:_unmount()
		end
	end)
	if v_u_31 then
		p_u_87.disposeEffect = v_u_14.createEffect(function(p91)
			-- upvalues: (ref) v_u_15, (copy) p_u_87
			local v92 = v_u_15.Stores.GetTopBarStore
			if v92 then
				p_u_87:setTopBarEnabled(v92(p91).getTopBarCoreGuiEnabled(p91))
			end
		end)
	end
end
function v_u_48._onStateChanged(p93, p94, p95) -- name: _onStateChanged
	-- upvalues: (copy) v_u_3
	if p95.displayOptions.menuVisible ~= p94.displayOptions.menuVisible then
		p93.EmotesMenuToggled:Fire(p94.displayOptions.menuVisible)
		v_u_3:SetEmotesMenuOpen(p94.displayOptions.menuVisible)
	end
end
function v_u_48._mount(p96) -- name: _mount
	-- upvalues: (copy) v_u_16, (copy) v_u_32, (copy) v_u_10, (copy) v_u_12, (copy) v_u_33, (copy) v_u_37, (copy) v_u_8
	local v97 = {
		["themeName"] = v_u_16.Dark,
		["fontName"] = v_u_32.FontName.Gotham
	}
	if not p96.instance then
		local v98 = v_u_10.createElement
		local v99 = v_u_12.StoreProvider
		local v100 = {
			["store"] = p96.store
		}
		local v101 = {
			["StyleProvider"] = v_u_10.createElement(v_u_33, {
				["style"] = v97
			}, {
				["EmotesMenu"] = v_u_10.createElement(v_u_37)
			})
		}
		local v102 = v98(v99, v100, v101)
		local v103 = v_u_10.createElement("Folder", {
			["Name"] = "EmotesMenu"
		}, v102)
		p96.instance = v_u_10.mount(v103, v_u_8, "EmotesMenu")
		p96.MenuIsVisible = true
		p96.MenuVisibilityChanged:Fire(true)
	end
end
function v_u_48._unmount(p104) -- name: _unmount
	-- upvalues: (copy) v_u_10
	if p104.instance then
		v_u_10.unmount(p104.instance)
		p104.instance = nil
		p104.MenuIsVisible = false
		p104.MenuVisibilityChanged:Fire(false)
	end
end
function v_u_48.new() -- name: new
	-- upvalues: (copy) v_u_48, (copy) v_u_34, (copy) v_u_11, (copy) v_u_38, (copy) v_u_5, (copy) v_u_46, (copy) v_u_6, (copy) v_u_28, (copy) v_u_45, (copy) v_u_35, (copy) v_u_29, (copy) v_u_8, (copy) v_u_44
	local v105 = v_u_48
	local v_u_106 = setmetatable({}, v105)
	v_u_106.canPlayEmotes = v_u_34.Value
	v_u_106.topBarEnabled = true
	v_u_106.EmotesMenuToggled = Instance.new("BindableEvent")
	v_u_106.MenuIsVisible = false
	v_u_106.MenuVisibilityChanged = Instance.new("BindableEvent")
	v_u_106.EmotesLoaded = Instance.new("BindableEvent")
	v_u_106.store = v_u_11.Store.new(v_u_38, {}, { v_u_11.thunkMiddleware })
	local v107 = v_u_5:IsClient() and not v_u_5:IsEdit()
	if v107 then
		v107 = not v_u_5:IsRunMode()
	end
	if not v107 then
		return v_u_106
	end
	v_u_106.store.changed:connect(function(p108, p109)
		-- upvalues: (copy) v_u_106
		v_u_106:_onStateChanged(p108, p109)
	end)
	v_u_106.store:dispatch(v_u_46(v_u_6.RobloxLocaleId))
	if v_u_28:IsEnabled() then
		v_u_106.store:dispatch(v_u_45(v_u_35.Layout.TenFoot))
	end
	local v110 = v_u_29.ApplyDisplayScale(v_u_29.TopBarHeight)
	if not v_u_8.IgnoreGuiInset then
		v_u_106.store:dispatch(v_u_44(v110))
	end
	v_u_106:_mount()
	v_u_106:_connectListeners()
	return v_u_106
end
return v_u_48.new()