-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.Container
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v3.Components.InitialView)
local v_u_7 = require(v3.Components.AssetDetails)
local v_u_8 = require(v3.Components.CloseButton)
local v_u_9 = require(v3.Components.Overlay)
local v_u_10 = require(v3.Components.NoInventoryNotice)
local v_u_11 = require(v3.Colors)
local v_u_12 = require(v3.Constants)
local v_u_13 = require(v1.Packages.Signals)
local v_u_14 = require(v1.Workspace.Packages.Display)
local v15 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_16 = require(v15.Settings.Theme)
local v_u_17 = require(v15.TopBar.Constants)
local v_u_18 = require(v3.Components.InspectAndBuyContext)
local v19 = v_u_4.PureComponent:extend("Container")
function v19.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_14
	p_u_20.frameRef = v_u_4.createRef()
	p_u_20.lastSavedSelectedCoreGui = nil
	p_u_20.disposeUiScaleEffect = v_u_13.createEffect(function(p21)
		-- upvalues: (ref) v_u_14, (copy) p_u_20
		p_u_20:setState({
			["UiScale"] = v_u_14.GetDisplayStore(p21).getUIScale(p21)
		})
	end)
end
function v19.didMount(p_u_22) -- name: didMount
	-- upvalues: (copy) v_u_2
	local v23 = p_u_22.props.gamepadEnabled
	p_u_22.selectedCoreObjectChangedSignal = v_u_2:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: (copy) p_u_22, (ref) v_u_2
		if p_u_22.props.visible and v_u_2.SelectedCoreObject then
			p_u_22.lastSavedSelectedCoreGui = v_u_2.SelectedCoreObject
		end
	end)
	if v23 then
		v_u_2:AddSelectionParent("InspectMenu", p_u_22.frameRef.current)
	end
end
function v19.didUpdate(p24, p25) -- name: didUpdate
	-- upvalues: (copy) v_u_2
	local v26 = p24.props.visible
	local v27 = p24.props.gamepadEnabled
	if v26 and (v27 and p24.frameRef.current) then
		v_u_2:RemoveSelectionGroup("InspectMenu")
		v_u_2:AddSelectionParent("InspectMenu", p24.frameRef.current)
		if p24.lastSavedSelectedCoreGui then
			v_u_2.SelectedCoreObject = p24.lastSavedSelectedCoreGui
		end
	elseif not v27 and p25.gamepadEnabled or not v26 then
		v_u_2:RemoveSelectionGroup("InspectMenu")
	end
	if v26 and not p25.visible then
		v_u_2.SelectedCoreObject = p24.lastSavedSelectedCoreGui
	end
end
function v19.willUnmount(p28) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	p28.selectedCoreObjectChangedSignal:disconnect()
	v_u_2:RemoveSelectionGroup("InspectMenu")
	v_u_2.SelectedCoreObject = nil
	if p28.disposeUiScaleEffect then
		p28.disposeUiScaleEffect()
	end
end
function v19.render(p_u_29) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_4, (copy) v_u_18, (copy) v_u_12, (copy) v_u_2, (copy) v_u_9, (copy) v_u_11, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10
	local v_u_30 = p_u_29.props.view
	local v_u_31 = p_u_29.props.localPlayerModel
	local v_u_32 = p_u_29.props.visible
	local v_u_33 = v_u_16.UseInspectAndBuyPanel()
	local v_u_34 = v_u_17.TopBarHeight * p_u_29.state.UiScale
	local v_u_35 = v_u_17.ScreenSideOffset * p_u_29.state.UiScale
	local v56 = {
		["render"] = function(p36) -- name: render
			-- upvalues: (copy) v_u_30, (copy) p_u_29, (ref) v_u_4, (copy) v_u_33, (copy) v_u_35, (ref) v_u_16, (copy) v_u_34, (copy) v_u_32, (ref) v_u_12, (ref) v_u_2, (ref) v_u_9, (ref) v_u_11, (ref) v_u_8, (ref) v_u_6, (ref) v_u_7, (copy) v_u_31, (ref) v_u_10
			local v37 = p36[v_u_30]
			local v38 = v37.ContainerSize(p_u_29.state.UiScale)
			local v39 = v37.ContainerPosition(p_u_29.state.UiScale)
			local v40 = v_u_4.createElement
			local v41 = "ImageButton"
			local v42 = {}
			local v43 = UDim2.new
			local v44 = 1
			local v45 = not v_u_33 and 0 or v_u_35 * -2
			local v46 = 1
			local v47
			if v_u_33 then
				v47 = v_u_16.DefaultCornerRadius.Offset
			else
				v47 = v_u_34
			end
			v42.Size = v43(v44, v45, v46, v47)
			v42.Position = UDim2.new(0, not v_u_33 and 0 or v_u_35, 0, v_u_33 and 0 or -v_u_34)
			v42.BackgroundColor3 = v37.ContainerBackgroundColor
			v42.BackgroundTransparency = v37.ContainerBackgroundTransparency
			v42.Visible = v_u_32
			v42.Selectable = false
			v42.AutoButtonColor = false
			v42.AutoLocalize = false
			v42[v_u_4.Event.Activated] = function()
				-- upvalues: (ref) v_u_30, (ref) v_u_12, (ref) v_u_2
				if v_u_30 == v_u_12.View.Wide then
					v_u_2:CloseInspectMenu()
				end
			end
			local v48 = {}
			local v49
			if v_u_33 then
				v49 = v_u_4.createElement("UICorner", {
					["CornerRadius"] = v_u_16.DefaultCornerRadius
				})
			else
				v49 = nil
			end
			v48.UICorner = v49
			v48.Overlay = v_u_4.createElement(v_u_9)
			local v50 = v_u_4.createElement
			local v51 = "ImageButton"
			local v52 = {
				["AnchorPoint"] = v37.ContainerAnchorPoint,
				["Size"] = v38,
				["Position"] = v39,
				["BackgroundColor3"] = v_u_11.Carbon,
				["BorderSizePixel"] = 0,
				["Active"] = true,
				["AutoButtonColor"] = false,
				["Selectable"] = false,
				[v_u_4.Ref] = p_u_29.frameRef
			}
			local v53 = {}
			local v54 = v37.UseContainerAspectRatio
			if v54 then
				v54 = v_u_4.createElement("UIAspectRatioConstraint", {
					["AspectRatio"] = v37.ContainerAspectRatio
				})
			end
			v53.AspectRatioConstraint = v54
			v53.CloseButton = v_u_4.createElement(v_u_8)
			v53.InitialView = v_u_4.createElement(v_u_6)
			local v55 = {
				["localPlayerModel"] = v_u_31
			}
			v53.AssetDetails = v_u_4.createElement(v_u_7, v55)
			v53.NoInventoryNotice = v_u_4.createElement(v_u_10)
			v48.MainContainer = v50(v51, v52, v53)
			return v40(v41, v42, v48)
		end
	}
	return v_u_4.createElement(v_u_18.Consumer, v56)
end
return v5.UNSTABLE_connect2(function(p57, _)
	return {
		["view"] = p57.view,
		["visible"] = p57.visible,
		["gamepadEnabled"] = p57.gamepadEnabled
	}
end)(v19)