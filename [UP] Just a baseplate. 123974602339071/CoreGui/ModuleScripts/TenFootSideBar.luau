-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.TenFootSideBar
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RunService")
local v6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Actions.ClosePlayerDropDown)
local v_u_10 = require(v8.Actions.SetPlayerListVisibility)
local v_u_11 = require(v2.RobloxGui.Modules.isNewInGameMenuEnabled)
local v_u_12 = v2:WaitForChild("RobloxGui")
local v13 = v6.PureComponent:extend("TenFootSideBar")
function v13.init(p14) -- name: init
	p14.sideBar = nil
end
function v13.render(_) -- name: render
	return nil
end
function v13.openSidebar(p_u_15, p_u_16) -- name: openSidebar
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11
	local v17 = not v_u_5:IsStudio()
	if v17 then
		v17 = p_u_16 ~= v_u_3.LocalPlayer
	end
	if v17 then
		local v_u_18 = v_u_4.SelectedCoreObject
		local v19 = v_u_12.Modules:FindFirstChild("ScreenManager") or v_u_12.Modules.Shell.ScreenManager
		local v20 = require(v19)
		local v21 = v_u_12.Modules:FindFirstChild("LocalizedStrings") or v_u_12.Modules.Shell.LocalizedStrings
		local v22 = require(v21)
		if not p_u_15.sideBar then
			local v23 = v_u_12.Modules:FindFirstChild("SideBar") or v_u_12.Modules.Shell.SideBar
			p_u_15.sideBar = require(v23)()
		end
		p_u_15.sideBar:RemoveAllItems()
		if v17 then
			local v24 = v22:LocStringUA("Xbox.Old.ReportPlayer")
			p_u_15.sideBar:AddItem(v24, function()
				-- upvalues: (copy) p_u_15, (ref) v_u_4, (ref) v_u_11, (ref) v_u_12, (copy) p_u_16
				p_u_15.props.closePlayerList()
				v_u_4.SelectedCoreObject = nil
				if v_u_11() then
					require(v_u_12.Modules.InGameMenuInit).openReportDialog(p_u_16, p_u_15.__componentName)
				else
					require(v_u_12.Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(p_u_16, p_u_15.__componentName)
				end
			end)
		end
		local v_u_25 = nil
		v_u_25 = p_u_15.sideBar.Closed:connect(function()
			-- upvalues: (ref) v_u_25, (copy) p_u_15, (copy) v_u_18, (ref) v_u_4
			v_u_25:disconnect()
			p_u_15.props.closeSideBar()
			if p_u_15.props.playerListVisible then
				if v_u_18 and v_u_18.Parent then
					v_u_4.SelectedCoreObject = v_u_18
					return
				end
				p_u_15.props.closePlayerList()
				p_u_15.props.openPlayerList()
			end
		end)
		v20:OpenScreen(p_u_15.sideBar, false)
	else
		p_u_15.props.closeSideBar()
	end
end
function v13.didMount(p26) -- name: didMount
	if p26.props.sideBarVisible then
		p26:openSidebar(p26.props.selectedPlayer)
	end
end
function v13.didUpdate(p27, p28) -- name: didUpdate
	if p27.props.sideBarVisible and p27.props.sideBarVisible ~= p28.sideBarVisible then
		p27:openSidebar(p27.props.selectedPlayer)
	end
end
return v7.connect(function(p29) -- name: mapStateToProps
	local v30 = {
		["selectedPlayer"] = p29.playerDropDown.selectedPlayer
	}
	local v31 = p29.displayOptions.isTenFootInterface
	if v31 then
		v31 = p29.playerDropDown.isVisible
	end
	v30.sideBarVisible = v31
	v30.playerListVisible = p29.displayOptions.isVisible
	return v30
end, function(p_u_32) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9, (copy) v_u_10
	return {
		["closeSideBar"] = function() -- name: closeSideBar
			-- upvalues: (copy) p_u_32, (ref) v_u_9
			return p_u_32(v_u_9())
		end,
		["closePlayerList"] = function() -- name: closePlayerList
			-- upvalues: (copy) p_u_32, (ref) v_u_10
			return p_u_32(v_u_10(false))
		end,
		["openPlayerList"] = function() -- name: openPlayerList
			-- upvalues: (copy) p_u_32, (ref) v_u_10
			return p_u_32(v_u_10(true))
		end
	}
end)(v13)