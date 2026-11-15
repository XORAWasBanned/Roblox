-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.MoreMenu
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("VRService")
local v_u_5 = game:GetService("StarterGui")
require(v1.Packages.Signals)
require(v1.Workspace.Packages.Display)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v8 = require(v1.Packages.t)
local v9 = require(v1.Packages.UIBlox)
local v_u_10 = require(v1.Packages.Signals)
local v_u_11 = require(v1.Workspace.Packages.Display)
local v_u_12 = v9.App.Menu.ContextualMenu
local v_u_13 = v9.App.Menu.MenuDirection
local v14 = v9.App.ImageSet.Images
local v_u_15 = v9.Core.Style.withStyle
local v16 = script.Parent.Parent.Parent
local v17 = v16.Actions
local v_u_18 = require(v17.SetKeepOutArea)
local v_u_19 = require(v17.RemoveKeepOutArea)
local v_u_20 = require(v17.SetMoreMenuOpen)
local v_u_21 = require(v16.Analytics)
local v_u_22 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_23 = v_u_22.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_24 = v_u_22.Flags.FFlagTopBarSignalizeScreenSize
local v_u_25 = require(v16.Flags.GetFFlagEnableTopBarAnalytics)()
local v_u_26 = require(v16.Constants)
local _ = v_u_26.InputType
local v_u_27 = require(script.Parent.IconButton)
local v_u_28 = v2:WaitForChild("RobloxGui")
local v29 = v_u_28.Modules
local v_u_30 = require(v29.TenFootInterface)
local v_u_31 = require(v1.Workspace.Packages.VrCommon).VRHub
local v_u_32 = require(v29.EmotesMenu.EmotesMenuMaster)
local v_u_33 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_34
if v_u_33 then
	v_u_34 = require(v1.Workspace.Packages.System).Features
else
	v_u_34 = nil
end
local v_u_35
if v_u_33 then
	v_u_35 = nil
else
	v_u_35 = require(v29.BackpackScript)
end
local v_u_36 = require(v29.ChatSelector)
local v_u_37 = require(v29.PlayerList.PlayerListManager)
local v_u_38 = require(v29.EmotesMenu.Constants)
local v_u_39 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_40 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_41 = require(v29.Flags.FFlagMountCoreGuiBackpack)
local v_u_42 = v14["icons/controls/emoteOn"]
local v_u_43 = v14["icons/controls/emoteOff"]
local v44 = v_u_6.PureComponent:extend("MoreMenu")
local v45 = v8.strictInterface
local v46 = {
	["layoutOrder"] = v8.integer,
	["moreMenuOpen"] = v8.boolean,
	["setMoreMenuOpen"] = v8.callback
}
local v47
if v_u_24 then
	v47 = nil
else
	v47 = v8.Vector2
end
v46.screenSize = v47
v46.isSmallTouchDevice = v8.boolean
v46.topBarEnabled = v8.boolean
v46.leaderboardEnabled = v8.boolean
v46.emotesEnabled = v8.boolean
local v48
if v_u_41 then
	v48 = nil
else
	v48 = v8.boolean
end
v46.backpackEnabled = v48
v46.leaderboardOpen = v8.boolean
v46.backpackOpen = v8.boolean
v46.emotesOpen = v8.boolean
local v49
if v_u_23 then
	v49 = nil
else
	v49 = v8.callback
end
v46.setKeepOutArea = v49
local v50
if v_u_23 then
	v50 = nil
else
	v50 = v8.callback
end
v46.removeKeepOutArea = v50
v44.validateProps = v45(v46)
function v44.init(p_u_51) -- name: init
	-- upvalues: (copy) v_u_6, (copy) v_u_25, (copy) v_u_21, (copy) v_u_10, (copy) v_u_11, (copy) v_u_41, (copy) v_u_5, (copy) v_u_23, (copy) v_u_22, (copy) v_u_24
	p_u_51.rootRef = v_u_6.createRef()
	if v_u_25 then
		p_u_51.analytics = v_u_21.default
	end
	p_u_51.disposeUiScaleEffect = v_u_10.createEffect(function(p52)
		-- upvalues: (ref) v_u_11, (copy) p_u_51
		p_u_51:setState({
			["UiScale"] = v_u_11.GetDisplayStore(p52).getUIScale(p52)
		})
	end)
	if v_u_41 then
		p_u_51:setState({
			["mountBackpack"] = nil,
			["vrShowMenuIcon"] = false,
			["mountBackpack"] = v_u_5:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		v_u_5.CoreGuiChangedSignal:Connect(function(p53, p54)
			-- upvalues: (copy) p_u_51
			if p53 == Enum.CoreGuiType.Backpack or p53 == Enum.CoreGuiType.All then
				p_u_51:setState({
					["mountBackpack"] = p54
				})
			end
		end)
	else
		p_u_51:setState({
			["vrShowMenuIcon"] = false
		})
	end
	p_u_51.chatWasHidden = false
	p_u_51.boundAction = false
	function p_u_51.moreButtonActivated()
		-- upvalues: (copy) p_u_51
		p_u_51.props.setMoreMenuOpen(not p_u_51.props.moreMenuOpen)
		if p_u_51.analytics then
			p_u_51.analytics:onMoreMenuActivated()
		end
	end
	if v_u_23 then
		p_u_51.keepOutAreasStore = v_u_22.Stores.GetKeepOutAreasStore(false)
	end
	if v_u_24 then
		local v_u_55 = v_u_11.GetDisplayStore(false).getViewportSize
		p_u_51.disposeScreenSize = v_u_10.createEffect(function(p56)
			-- upvalues: (copy) p_u_51, (copy) v_u_55
			p_u_51:setState({
				["screenSize"] = v_u_55(p56)
			})
		end)
	end
end
function v44.willUnmount(p57) -- name: willUnmount
	-- upvalues: (copy) v_u_24
	if v_u_24 then
		p57.disposeScreenSize()
	end
	if p57.disposeUiScaleEffect then
		p57.disposeUiScaleEffect()
	end
end
function v44.renderWithStyle(p_u_58, p59) -- name: renderWithStyle
	-- upvalues: (copy) v_u_39, (copy) v_u_4, (copy) v_u_28, (copy) v_u_37, (copy) v_u_42, (copy) v_u_43, (copy) v_u_38, (copy) v_u_32, (copy) v_u_36, (copy) v_u_41, (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_24, (copy) v_u_30, (copy) v_u_23, (copy) v_u_26, (copy) v_u_6, (copy) v_u_27, (copy) v_u_12, (copy) v_u_13, (copy) v_u_40, (copy) v_u_31
	local v60 = {}
	local v_u_61
	if p_u_58.props.leaderboardEnabled then
		local v63 = {
			["icon"] = p_u_58.props.leaderboardOpen and "rbxasset://textures/ui/TopBar/leaderboardOn.png" or "rbxasset://textures/ui/TopBar/leaderboardOff.png",
			["text"] = v_u_39:FormatByKey("CoreScripts.TopBar.Leaderboard"),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_58, (ref) v_u_4, (ref) v_u_28, (ref) v_u_37
				local v62 = p_u_58.props.leaderboardOpen
				if v_u_4.VREnabled then
					require(v_u_28.Modules.InGameMenu).openPlayersPage()
				else
					v_u_37:SetVisibility(not v_u_37:GetSetVisible())
					p_u_58.props.setMoreMenuOpen(false)
				end
				if p_u_58.analytics then
					p_u_58.analytics:onLeaderboardActivated(not v62)
				end
			end
		}
		table.insert(v60, v63)
		v_u_61 = true
	else
		v_u_61 = false
	end
	if p_u_58.props.emotesEnabled then
		local v64 = v_u_42
		if not p_u_58.props.emotesOpen then
			v64 = v_u_43
		end
		local _ = v_u_38.EmoteMenuOpenKey
		local v65 = {
			["icon"] = v64,
			["text"] = v_u_39:FormatByKey("CoreScripts.TopBar.Emotes"),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_32, (copy) p_u_58, (ref) v_u_36
				if v_u_32:isOpen() then
					v_u_32:close()
				else
					if p_u_58.chatWasHidden then
						v_u_36:SetVisible(true)
						p_u_58.chatWasHidden = false
					end
					v_u_32:open()
				end
				p_u_58.props.setMoreMenuOpen(false)
				if p_u_58.analytics then
					p_u_58.analytics:onEmotesActivated(v_u_32:isOpen())
				end
			end
		}
		table.insert(v60, v65)
		v_u_61 = true
	end
	local v66
	if v_u_41 then
		v66 = p_u_58.state.mountBackpack
	else
		v66 = p_u_58.props.backpackEnabled
	end
	if v66 then
		local v67 = {
			["icon"] = p_u_58.props.backpackOpen and "rbxasset://textures/ui/TopBar/inventoryOn.png" or "rbxasset://textures/ui/TopBar/inventoryOff.png",
			["text"] = v_u_39:FormatByKey("CoreScripts.TopBar.Inventory"),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_33, (ref) v_u_34, (copy) p_u_58, (ref) v_u_35
				if v_u_33 then
					v_u_34.toggleVisibility(v_u_34.FeatureName.Backpack)
					p_u_58.props.setMoreMenuOpen(false)
					if p_u_58.analytics then
						p_u_58.analytics:onInventoryActivated(v_u_34.getVisibility(v_u_34.FeatureName.Backpack))
						return
					end
				else
					v_u_35:OpenClose()
					p_u_58.props.setMoreMenuOpen(false)
					if p_u_58.analytics then
						p_u_58.analytics:onInventoryActivated(v_u_35.IsOpen)
					end
				end
			end
		}
		table.insert(v60, v67)
		v_u_61 = true
	end
	local v68
	if v_u_24 then
		v68 = p_u_58.state.screenSize
	else
		v68 = p_u_58.props.screenSize
	end
	local v69 = UDim2.new(0, 324, 0, v68.Y)
	if v68.X < 450 then
		v69 = UDim2.new(0, v68.X - 24, 0, v68.Y)
	end
	local v70 = p_u_58.props.moreMenuOpen and "rbxasset://textures/ui/TopBar/moreOn.png" or "rbxasset://textures/ui/TopBar/moreOff.png"
	local v_u_71 = not v_u_30:IsEnabled() and (p_u_58.props.topBarEnabled and v_u_61)
	if v_u_71 then
		v_u_71 = not v_u_4.VREnabled
	end
	local function v73(p72)
		-- upvalues: (copy) v_u_71, (ref) v_u_23, (copy) p_u_58, (ref) v_u_26
		if v_u_71 and p72 then
			if v_u_23 then
				p_u_58.keepOutAreasStore.setKeepOutArea(v_u_26.MoreMenuKeepOutAreaId, p72.AbsolutePosition, p72.AbsoluteSize)
			else
				p_u_58.props.setKeepOutArea(v_u_26.MoreMenuKeepOutAreaId, p72.AbsolutePosition, p72.AbsoluteSize)
			end
		elseif v_u_23 then
			p_u_58.keepOutAreasStore.removeKeepOutArea(v_u_26.MoreMenuKeepOutAreaId)
		else
			p_u_58.props.removeKeepOutArea(v_u_26.MoreMenuKeepOutAreaId)
		end
	end
	if p_u_58.rootRef.current then
		v73(p_u_58.rootRef.current)
	end
	return v_u_6.createElement("Frame", {
		["Visible"] = v_u_71,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, 32, 1, 0),
		["LayoutOrder"] = p_u_58.props.layoutOrder,
		[v_u_6.Change.AbsoluteSize] = v73,
		[v_u_6.Change.AbsolutePosition] = v73,
		[v_u_6.Ref] = p_u_58.rootRef
	}, {
		["OpenButton"] = v_u_6.createElement(v_u_27, {
			["icon"] = nil,
			["iconSize"] = 24,
			["onActivated"] = nil,
			["icon"] = v70,
			["onActivated"] = p_u_58.moreButtonActivated
		}),
		["MoreMenuContainer"] = v_u_6.createElement("Frame", {
			["ZIndex"] = 3,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = UDim2.new(1, 12, 0, 0),
			["Size"] = v69,
			["AnchorPoint"] = Vector2.new(1, 0)
		}, {
			["ContextualMenu"] = v_u_6.createElement(v_u_12, {
				["buttonProps"] = nil,
				["open"] = nil,
				["menuDirection"] = nil,
				["openPositionY"] = nil,
				["background"] = nil,
				["closeBackgroundVisible"] = false,
				["screenSize"] = nil,
				["onDismiss"] = nil,
				["buttonProps"] = v60,
				["open"] = p_u_58.props.moreMenuOpen,
				["menuDirection"] = v_u_13.Down,
				["openPositionY"] = UDim.new(0, v_u_26.TopBarHeight * p_u_58.state.UiScale + 12),
				["background"] = p59.Theme.BackgroundUIContrast,
				["screenSize"] = v68,
				["onDismiss"] = function() -- name: onDismiss
					-- upvalues: (copy) p_u_58, (ref) v_u_37
					p_u_58.props.setMoreMenuOpen(false)
					v_u_37:SetMinimized(false)
				end
			})
		}),
		["ShowTopBarListener"] = v_u_6.createElement(v_u_40, {
			["event"] = v_u_31.ShowTopBarChanged.Event,
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_58, (ref) v_u_4, (ref) v_u_31, (ref) v_u_61
				local v74 = p_u_58
				local v75 = {}
				local v76 = v_u_4.VREnabled and v_u_31.ShowTopBar
				if v76 then
					v76 = v_u_61
				end
				v75.vrShowMenuIcon = v76
				v74:setState(v75)
			end
		})
	})
end
function v44.render(p_u_77) -- name: render
	-- upvalues: (copy) v_u_15
	return v_u_15(function(p78)
		-- upvalues: (copy) p_u_77
		return p_u_77:renderWithStyle(p78)
	end)
end
function v44.updateActionBound(p_u_79) -- name: updateActionBound
	-- upvalues: (copy) v_u_3
	if p_u_79.props.moreMenuOpen then
		v_u_3:BindCoreAction("CloseMoreMenuAction", function(_, p80, _)
			-- upvalues: (copy) p_u_79
			if p80 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			p_u_79.props.setMoreMenuOpen(false)
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Escape)
		p_u_79.boundAction = true
	elseif p_u_79.boundAction then
		v_u_3:UnbindCoreAction("CloseMoreMenuAction")
		p_u_79.boundAction = false
	end
end
function v44.didUpdate(p81, p82, _) -- name: didUpdate
	-- upvalues: (copy) v_u_37, (copy) v_u_24, (copy) v_u_36
	if p81.props.moreMenuOpen ~= p82.moreMenuOpen then
		v_u_37:SetMinimized(p81.props.moreMenuOpen)
		p81:updateActionBound()
		local v83
		if v_u_24 then
			v83 = p81.state.screenSize
		else
			v83 = p81.props.screenSize
		end
		if v83.X < 600 then
			if p81.props.moreMenuOpen and v_u_36:GetVisibility() then
				p81.chatWasHidden = true
				v_u_36:SetVisible(false)
				return
			end
			if not p81.props.moreMenuOpen and p81.chatWasHidden then
				v_u_36:SetVisible(true)
				p81.chatWasHidden = false
			end
		end
	end
end
return v7.UNSTABLE_connect2(function(p84) -- name: mapStateToProps
	-- upvalues: (copy) v_u_24, (copy) v_u_41
	local v85 = {}
	local v86
	if v_u_24 then
		v86 = nil
	else
		v86 = p84.displayOptions.screenSize
	end
	v85.screenSize = v86
	v85.moreMenuOpen = p84.moreMenu.open
	v85.isSmallTouchDevice = p84.displayOptions.isSmallTouchDevice
	v85.topBarEnabled = p84.displayOptions.topbarEnabled
	v85.leaderboardEnabled = p84.coreGuiEnabled[Enum.CoreGuiType.PlayerList]
	local v87 = p84.moreMenu.emotesEnabled
	if v87 then
		v87 = p84.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu]
	end
	v85.emotesEnabled = v87
	local v88
	if v_u_41 then
		v88 = nil
	else
		v88 = p84.coreGuiEnabled[Enum.CoreGuiType.Backpack]
	end
	v85.backpackEnabled = v88
	v85.leaderboardOpen = p84.moreMenu.leaderboardOpen
	v85.backpackOpen = p84.moreMenu.backpackOpen
	v85.emotesOpen = p84.moreMenu.emotesOpen
	return v85
end, function(p_u_89) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_20, (copy) v_u_23, (copy) v_u_18, (copy) v_u_19
	return {
		["setMoreMenuOpen"] = function(p90) -- name: setMoreMenuOpen
			-- upvalues: (copy) p_u_89, (ref) v_u_20
			return p_u_89(v_u_20(p90))
		end,
		["setKeepOutArea"] = not v_u_23 and function(p91, p92, p93)
			-- upvalues: (copy) p_u_89, (ref) v_u_18
			return p_u_89(v_u_18(p91, p92, p93))
		end or nil,
		["removeKeepOutArea"] = not v_u_23 and function(p94)
			-- upvalues: (copy) p_u_89, (ref) v_u_19
			return p_u_89(v_u_19(p94))
		end or nil
	}
end)(v44)