-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SideNavigation
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = v3.UIBlox
local v7 = v3.t
local v_u_8 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_9 = v6.Core.Control.Interactable
local v_u_10 = v6.Core.Control.Enum.ControlState
local v11 = script.Parent.Parent
local v_u_12 = require(v11.Components.Connection.FocusHandler)
local v_u_13 = require(v11.Components.ZonePortal)
local v_u_14 = require(v11.Thunks.CloseMenu)
local v_u_15 = require(v11.Actions.SetCurrentPage)
local v_u_16 = require(v11.Resources.Constants)
local v_u_17 = require(v11.Enums.Direction)
local v_u_18 = require(script.CloseMenuButton)
local v_u_19 = require(script.HomeButton)
local v_u_20 = require(script.SystemMenuButton)
local v21 = require(v11.InGameMenuPolicy)
local v_u_22 = require(v11.Flags.GetFFlagIGMGamepadSelectionHistory)
local v23 = v_u_4.PureComponent:extend("SideNavigation")
local v24 = v7.strictInterface
local v25 = {
	["open"] = v7.boolean,
	["closeMenu"] = v7.callback,
	["goToHomePage"] = v7.callback,
	["goToSystemMenu"] = v7.callback,
	["currentPage"] = v7.string,
	["canCaptureFocus"] = v7.optional(v7.boolean)
}
local v26
if v_u_22() then
	v26 = v7.optional(v7.number) or nil
else
	v26 = nil
end
v25.currentZone = v26
v25.enableInGameHomeIcon = v7.optional(v7.boolean)
v23.validateProps = v24(v25)
function v23.init(p_u_27) -- name: init
	-- upvalues: (copy) v_u_10, (copy) v_u_16, (copy) v_u_4, (copy) v_u_2
	function p_u_27.controlStateUpdated(p28, p29)
		-- upvalues: (ref) v_u_10, (copy) p_u_27, (ref) v_u_16
		if p28 == v_u_10.Hover and (p29 ~= v_u_10.Hover and p_u_27.props.currentPage == v_u_16.InitalPageKey) then
			p_u_27.props.closeMenu()
		end
	end
	p_u_27.firstItemRef = v_u_4.createRef()
	function p_u_27.onContainerRendered(p30)
		-- upvalues: (ref) v_u_2
		if p30 then
			v_u_2:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup")
			v_u_2:AddSelectionParent("SideNavigation_IGMSelectionGroup", p30)
		end
	end
end
function v23.oldRender(p_u_31) -- name: oldRender
	-- upvalues: (copy) v_u_22, (copy) v_u_8, (copy) v_u_4, (copy) v_u_18, (copy) v_u_12, (copy) v_u_2, (copy) v_u_16, (copy) v_u_13, (copy) v_u_17
	local v_u_32
	if v_u_22() then
		v_u_32 = p_u_31.props.currentZone ~= 0 and true or not p_u_31.props.open
	else
		v_u_32 = nil
	end
	return v_u_8(function(p33)
		local v34 = {}
		local v35 = {
			["BackgroundUIContrast"] = {
				["Color"] = p33.Color.OverMedia.OverMedia_0.Color3,
				["Transparency"] = p33.Color.OverMedia.OverMedia_0.Transparency
			}
		}
		v34.Theme = v35
		return v34
	end, function(p36)
		-- upvalues: (ref) v_u_4, (copy) p_u_31, (ref) v_u_18, (ref) v_u_12, (ref) v_u_32, (ref) v_u_22, (ref) v_u_2, (ref) v_u_16, (ref) v_u_13, (ref) v_u_17
		local v37 = v_u_4.createElement
		local v38 = "TextButton"
		local v39 = {
			["AutoButtonColor"] = false,
			["Text"] = "",
			["BackgroundColor3"] = p36.Theme.BackgroundUIContrast.Color,
			["BackgroundTransparency"] = p36.Theme.BackgroundUIContrast.Transparency,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, 64, 1, 0),
			["Visible"] = p_u_31.props.open,
			["Selectable"] = false,
			[v_u_4.Ref] = p_u_31.onContainerRendered
		}
		local v41 = {
			["Padding"] = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 1)
			}),
			["CloseMenuButton"] = v_u_4.createElement(v_u_18, {
				["onActivated"] = p_u_31.props.closeMenu,
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 4),
				[v_u_4.Ref] = p_u_31.firstItemRef
			}),
			["FocusHandler"] = v_u_4.createElement(v_u_12, {
				["isFocused"] = p_u_31.props.canCaptureFocus,
				["shouldForgetPreviousSelection"] = v_u_32,
				["didFocus"] = v_u_22() and function(p40)
					-- upvalues: (ref) v_u_2, (ref) p_u_31
					v_u_2.SelectedCoreObject = p40 or p_u_31.firstItemRef:getValue()
				end or function()
					-- upvalues: (ref) v_u_2, (ref) p_u_31
					v_u_2.SelectedCoreObject = p_u_31.firstItemRef:getValue()
				end
			})
		}
		local v42
		if p_u_31.props.currentPage == v_u_16.InitalPageKey then
			v42 = nil
		else
			v42 = v_u_4.createElement(v_u_13, {
				["targetZone"] = 1,
				["direction"] = nil,
				["direction"] = v_u_17.Right
			}) or nil
		end
		v41.ZonePortal = v42
		return v37(v38, v39, v41)
	end)
end
function v23.newRender(p_u_43) -- name: newRender
	-- upvalues: (copy) v_u_4, (copy) v_u_20, (copy) v_u_16, (copy) v_u_19, (copy) v_u_13, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9
	local v44 = p_u_43.props.currentPage
	local v45 = {
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 4)
		}),
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, 4)
		}),
		["SystemMenuButton"] = v_u_4.createElement(v_u_20, {
			["on"] = nil,
			["onClose"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 1,
			["anchorPoint"] = nil,
			["position"] = nil,
			["canCaptureFocus"] = nil,
			["on"] = v44 == v_u_16.MainPagePageKey,
			["onClose"] = p_u_43.props.closeMenu,
			["onActivated"] = p_u_43.props.goToSystemMenu,
			["anchorPoint"] = Vector2.new(0.5, 0),
			["position"] = UDim2.new(0.5, 0, 0, 4),
			["canCaptureFocus"] = p_u_43.props.canCaptureFocus
		}),
		["HomeButton"] = v_u_4.createElement(v_u_19, {
			["on"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 2,
			["anchorPoint"] = nil,
			["position"] = nil,
			["on"] = v44 == v_u_16.LeaveToAppPromptPageKey,
			["onActivated"] = p_u_43.props.goToHomePage,
			["anchorPoint"] = Vector2.new(0.5, 0),
			["position"] = UDim2.new(0.5, 0, 0, 8)
		})
	}
	local v_u_46 = {
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 1)
		}),
		["Content"] = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Selectable"] = false,
			["Size"] = UDim2.fromScale(1, 1)
		}, v45)
	}
	local v47
	if p_u_43.props.currentPage == v_u_16.InitalPageKey then
		v47 = nil
	else
		v47 = v_u_4.createElement(v_u_13, {
			["targetZone"] = 1,
			["direction"] = nil,
			["direction"] = v_u_17.Right
		}) or nil
	end
	v_u_46.ZonePortal = v47
	return v_u_8(function(p48)
		local v49 = {}
		local v50 = {
			["BackgroundUIContrast"] = {
				["Color"] = p48.Color.OverMedia.OverMedia_0.Color3,
				["Transparency"] = p48.Color.OverMedia.OverMedia_0.Transparency
			}
		}
		v49.Theme = v50
		return v49
	end, function(p51)
		-- upvalues: (ref) v_u_4, (ref) v_u_9, (copy) p_u_43, (copy) v_u_46
		return v_u_4.createElement(v_u_9, {
			["onStateChanged"] = p_u_43.controlStateUpdated,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = p51.Theme.BackgroundUIContrast.Color,
			["BackgroundTransparency"] = p51.Theme.BackgroundUIContrast.Transparency,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, 64, 1, 0),
			["Visible"] = p_u_43.props.open,
			["Selectable"] = false,
			[v_u_4.Ref] = p_u_43.onContainerRendered
		}, v_u_46)
	end)
end
function v23.render(p52) -- name: render
	if p52.props.enableInGameHomeIcon then
		return p52:newRender()
	else
		return p52:oldRender()
	end
end
local v54 = v21.connect(function(p53, _)
	return {
		["enableInGameHomeIcon"] = p53.enableInGameHomeIcon()
	}
end)(v23)
return v5.UNSTABLE_connect2(function(p55, _)
	-- upvalues: (copy) v_u_16, (copy) v_u_22
	local v56 = p55.isMenuOpen and not p55.respawn.dialogOpen
	if v56 then
		if p55.displayOptions.inputType == v_u_16.InputType.Gamepad then
			v56 = p55.currentZone == 0
		else
			v56 = false
		end
	end
	local v57
	if v_u_22() then
		v57 = p55.currentZone
	else
		v57 = nil
	end
	return {
		["canCaptureFocus"] = v56,
		["currentPage"] = p55.menuPage,
		["open"] = p55.isMenuOpen,
		["currentZone"] = v57
	}
end, function(p_u_58)
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_58, (ref) v_u_14
			p_u_58(v_u_14)
		end,
		["goToSystemMenu"] = function() -- name: goToSystemMenu
			-- upvalues: (copy) p_u_58, (ref) v_u_15, (ref) v_u_16
			p_u_58(v_u_15(v_u_16.MainPagePageKey))
		end,
		["goToHomePage"] = function() -- name: goToHomePage
			-- upvalues: (copy) p_u_58, (ref) v_u_15, (ref) v_u_16
			p_u_58(v_u_15(v_u_16.LeaveToAppPromptPageKey))
		end
	}
end)(v54)