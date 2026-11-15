-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.EmotesMenu
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("Workspace")
local v6 = game:GetService("Players")
local v_u_7 = game:GetService("VRService")
local v_u_8 = game:GetService("CoreGui")
local v_u_9 = require(v2.Packages.Roact)
local v10 = require(v2.Packages.RoactRodux)
local v11 = script.Parent
local v12 = v11.Parent
local v13 = v12.Actions
local v14 = v12.Thunks
local v_u_15 = require(v13.HideMenu)
local v_u_16 = require(v13.SetLayout)
local v_u_17 = require(v13.ShowError)
local v_u_18 = require(v13.HideError)
local v_u_19 = require(v14.OpenMenu)
local v_u_20 = require(v11.EmotesWheel)
local v_u_21 = require(v11.ErrorMessage)
local v_u_22 = require(v12.Constants)
local v_u_23 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_24 = v6.LocalPlayer
local v_u_25 = nil
local v26 = v_u_9.PureComponent:extend("EmotesMenu")
function v26.init(p27) -- name: init
	p27.savedSelectedCoreObject = nil
	p27.savedSelectedObject = nil
end
function v26.displayVisitShopMessage(p_u_28) -- name: displayVisitShopMessage
	-- upvalues: (copy) v_u_23, (copy) v_u_22
	local v29 = p_u_28.props.locale
	local v30 = v_u_23:FormatByKeyForLocale(v_u_22.LocalizationKeys.VisitShopToGetEmotes, v29)
	p_u_28.props.showError(v30)
	delay(v_u_22.ErrorDisplayTimeSeconds, function()
		-- upvalues: (copy) p_u_28
		p_u_28.props.hideError()
	end)
end
function v26.bindActions(p_u_31) -- name: bindActions
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_22
	local function v33(_, p32, _) -- name: toggleMenuFunc
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) p_u_31
		if v_u_3.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		end
		if v_u_4:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_4:IsKeyDown(Enum.KeyCode.RightShift) then
			return Enum.ContextActionResult.Pass
		end
		if p32 == Enum.UserInputState.Begin then
			if p_u_31.props.displayOptions.menuVisible then
				p_u_31.props.hideMenu()
			else
				p_u_31.props.openMenu()
			end
		end
		return nil
	end
	v_u_1:BindAction(v_u_22.ToggleMenuAction, v33, false, v_u_22.EmoteMenuOpenKey)
end
function v26.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_1, (copy) v_u_22
	v_u_1:UnbindAction(v_u_22.ToggleMenuAction)
end
function v26.saveSelectedObject(p34) -- name: saveSelectedObject
	-- upvalues: (copy) v_u_3
	p34.savedSelectedCoreObject = v_u_3.SelectedCoreObject
	v_u_3.SelectedCoreObject = nil
	p34.savedSelectedObject = v_u_3.SelectedObject
	v_u_3.SelectedObject = nil
end
function v26.resetSelectedObject(p35) -- name: resetSelectedObject
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (ref) v_u_25, (copy) v_u_24
	if v_u_3.SelectedCoreObject == nil and (p35.savedSelectedCoreObject == nil or p35.savedSelectedCoreObject:IsDescendantOf(v_u_8)) then
		v_u_3.SelectedCoreObject = p35.savedSelectedCoreObject
	end
	if v_u_3.SelectedObject == nil then
		if v_u_25 == nil then
			v_u_25 = v_u_24:FindFirstChildOfClass("PlayerGui")
		end
		local v36
		if v_u_25 then
			v36 = p35.savedSelectedObject == nil and true or p35.savedSelectedObject:IsDescendantOf(v_u_25)
		else
			v36 = false
		end
		if v36 then
			v_u_3.SelectedObject = p35.savedSelectedObject
		end
	end
end
function v26.viewPortSizeChanged(p37) -- name: viewPortSizeChanged
	-- upvalues: (copy) v_u_22, (copy) v_u_5
	if p37.props.layout == v_u_22.Layout.TenFoot then
		return
	else
		local v38 = v_u_5.CurrentCamera
		if v38 then
			local v39 = v38.ViewportSize
			if v39 ~= Vector2.new(1, 1) then
				local v40 = v_u_22.Layout.Large
				if v39.X < v_u_22.SmallScreenMaxSize.X or v39.Y < v_u_22.SmallScreenMaxSize.Y then
					v40 = v_u_22.Layout.Small
				end
				p37.props.setLayout(v40)
			end
		else
			return
		end
	end
end
function v26.currentCameraChanged(p_u_41) -- name: currentCameraChanged
	-- upvalues: (copy) v_u_5
	if p_u_41.viewportSizeChangedConn then
		p_u_41.viewportSizeChangedConn:Disconnect()
	end
	local v42 = v_u_5.CurrentCamera
	if v42 then
		p_u_41.viewportSizeChangedConn = v42:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: (copy) p_u_41
			p_u_41:viewPortSizeChanged()
		end)
		p_u_41:viewPortSizeChanged()
	end
end
function v26.didMount(p_u_43) -- name: didMount
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4
	p_u_43.currentCameraChangedConn = v_u_5:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: (copy) p_u_43
		p_u_43:currentCameraChanged()
	end)
	p_u_43:currentCameraChanged()
	p_u_43.menuOpenedConn = v_u_3.MenuOpened:Connect(function()
		-- upvalues: (copy) p_u_43, (ref) v_u_7
		if p_u_43.props.displayOptions.menuVisible and not v_u_7.VREnabled then
			p_u_43.props.hideMenu()
		end
	end)
	p_u_43.inputOutsideMenuConn = v_u_4.InputBegan:Connect(function(p44, p45)
		-- upvalues: (copy) p_u_43
		if p45 then
			return
		elseif p_u_43.props.displayOptions.menuVisible then
			local v46 = p44.UserInputType
			if v46 == Enum.UserInputType.MouseButton1 or v46 == Enum.UserInputType.Touch then
				p_u_43.props.hideMenu()
			end
		end
	end)
	p_u_43:bindActions()
end
function v26.willUnmount(p47) -- name: willUnmount
	p47.currentCameraChangedConn:Disconnect()
	p47.viewportSizeChangedConn:Disconnect()
	p47.menuOpenedConn:Disconnect()
	p47.inputOutsideMenuConn:Disconnect()
	p47.currentCameraChangedConn = nil
	p47.viewportSizeChangedConn = nil
	p47.menuOpenedConn = nil
	p47.inputOutsideMenuConn = nil
	p47:unbindActions()
end
function v26.didUpdate(p48, p49, _) -- name: didUpdate
	if p48.props.displayOptions.menuVisible ~= p49.displayOptions.menuVisible then
		if p48.props.displayOptions.menuVisible then
			p48:saveSelectedObject()
			return
		end
		p48:resetSelectedObject()
	end
end
function v26.render(p50) -- name: render
	-- upvalues: (copy) v_u_22, (copy) v_u_9, (copy) v_u_20, (copy) v_u_21
	local v51 = v_u_22.Layouts[p50.props.layout]
	local v52 = p50.props.displayOptions.guiInset
	local v53 = v_u_9.createElement
	local v54 = {
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = nil,
		["AutoLocalize"] = false,
		["Position"] = UDim2.new(0, 0, 0, -v52),
		["Size"] = UDim2.new(1, 0, 1, v52),
		["ZIndex"] = v_u_22.EmotesMenuZIndex
	}
	local v55 = {}
	local v56 = v_u_9.createElement
	local v57 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = v_u_22.ScreenAvailable
	}
	local v58 = {
		["AsspectRatioConstraint"] = v_u_9.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = 1
		}),
		["SizeConstraint"] = v_u_9.createElement("UISizeConstraint", {
			["MinSize"] = v51.EmotesWheelMinSize,
			["MaxSize"] = v51.EmotesWheelMaxSize
		}),
		["EmotesWheel"] = v_u_9.createElement(v_u_20)
	}
	v55.Main = v56("Frame", v57, v58)
	v55.ErrorMessage = v_u_9.createElement(v_u_21)
	return v53("Frame", v54, v55)
end
return v10.connect(function(p59) -- name: mapStateToProps
	return {
		["displayOptions"] = p59.displayOptions,
		["emotesInfo"] = p59.emotesPage.emotesInfo,
		["layout"] = p59.layout,
		["locale"] = p59.locale
	}
end, function(p_u_60) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_19, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	return {
		["openMenu"] = function() -- name: openMenu
			-- upvalues: (copy) p_u_60, (ref) v_u_19
			return p_u_60(v_u_19())
		end,
		["hideMenu"] = function() -- name: hideMenu
			-- upvalues: (copy) p_u_60, (ref) v_u_15
			return p_u_60(v_u_15())
		end,
		["setLayout"] = function(p61) -- name: setLayout
			-- upvalues: (copy) p_u_60, (ref) v_u_16
			return p_u_60(v_u_16(p61))
		end,
		["showError"] = function(p62) -- name: showError
			-- upvalues: (copy) p_u_60, (ref) v_u_17
			return p_u_60(v_u_17(p62))
		end,
		["hideError"] = function() -- name: hideError
			-- upvalues: (copy) p_u_60, (ref) v_u_18
			return p_u_60(v_u_18())
		end
	}
end)(v26)