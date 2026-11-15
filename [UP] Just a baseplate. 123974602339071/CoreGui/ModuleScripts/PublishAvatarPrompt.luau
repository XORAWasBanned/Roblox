-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAvatarPrompt.PublishAvatarPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_7 = require(script.Parent.AvatarParts.AvatarPartGrid)
local v_u_8 = require(v1.Packages.UIBlox).Style.withStyle
local v_u_9 = require(v1.Workspace.Packages.Loggers).mutedError
local v10 = script.Parent.Parent
local v_u_11 = require(v10.BasePublishPrompt)
local v_u_12 = require(v10.Common.ObjectViewport)
local v_u_13 = require(v10.Common.LabeledTextBox)
local v_u_14 = require(v10.Common.PublishInfoList)
local v_u_15 = require(v1.Workspace.Packages.PurchasePrompt)
local v_u_16 = v_u_15.PublishAssetAnalytics
local v17 = script.Parent.Parent.Parent.Actions
local v_u_18 = require(v17.SetPromptVisibility)
local v_u_19 = UDim.new(0, 20)
local v20 = v_u_3.PureComponent:extend("PublishAvatarPrompt")
v20.validateProps = v5.strictInterface({
	["screenSize"] = v5.Vector2,
	["humanoidModel"] = v5.optional(v5.instanceOf("Model")),
	["guid"] = v5.any,
	["scopes"] = v5.any,
	["SetPromptVisibility"] = v5.callback
})
function v20.init(p_u_21) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_15, (copy) v_u_9
	local v22 = v_u_2.LocalPlayer
	assert(v22, "LocalPlayer must not be nil")
	p_u_21:setState({
		["showingPreviewView"] = false,
		["name"] = nil,
		["isNameValid"] = true,
		["description"] = nil,
		["isDescValid"] = true,
		["showTopScrim"] = false,
		["purchasePromptReady"] = true,
		["name"] = v22.Name .. "\'s Body",
		["description"] = v22.Name .. "\'s Body"
	})
	function p_u_21.openPreviewView()
		-- upvalues: (ref) v_u_16, (copy) p_u_21
		v_u_16.sendButtonClicked(v_u_16.Section.BuyCreationPage, v_u_16.Element.Expand)
		p_u_21:setState({
			["showingPreviewView"] = true
		})
	end
	function p_u_21.closePreviewView()
		-- upvalues: (copy) p_u_21
		p_u_21:setState({
			["showingPreviewView"] = false
		})
	end
	function p_u_21.canSubmit()
		-- upvalues: (copy) p_u_21
		local v23 = p_u_21.state.isNameValid and p_u_21.state.isDescValid
		if v23 then
			if p_u_21.props.humanoidModel == nil then
				v23 = false
			else
				v23 = p_u_21.state.purchasePromptReady
			end
		end
		return v23
	end
	function p_u_21.onSubmit()
		-- upvalues: (ref) v_u_16, (copy) p_u_21, (ref) v_u_15, (ref) v_u_9
		v_u_16.sendButtonClicked(v_u_16.Section.BuyCreationPage, v_u_16.Element.Buy)
		local v24 = {
			["name"] = p_u_21.state.name,
			["description"] = p_u_21.state.description
		}
		if v_u_15.initiateAvatarCreationFeePurchase then
			v_u_15.initiateAvatarCreationFeePurchase(v24, p_u_21.props.guid, p_u_21.props.humanoidModel, p_u_21.props.priceInRobux)
		else
			v_u_9("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
		end
	end
	function p_u_21.onNameUpdated(p25, p26)
		-- upvalues: (copy) p_u_21, (ref) v_u_16
		p_u_21:setState({
			["name"] = p25,
			["isNameValid"] = p26
		})
		if not p_u_21.sentNameFieldTouched then
			p_u_21.sentNameFieldTouched = true
			v_u_16.sendFieldTouched(v_u_16.Section.BuyCreationPage, v_u_16.Element.Name)
		end
	end
	function p_u_21.onDescriptionUpdated(p27, p28)
		-- upvalues: (copy) p_u_21, (ref) v_u_16
		p_u_21:setState({
			["description"] = p27,
			["isDescValid"] = p28
		})
		if not p_u_21.sentDescriptionFieldTouched then
			p_u_21.sentDescriptionFieldTouched = true
			v_u_16.sendFieldTouched(v_u_16.Section.BuyCreationPage, v_u_16.Element.Description)
		end
	end
	function p_u_21.onWindowStateChanged(p29)
		-- upvalues: (copy) p_u_21
		local v30 = p29.hasCompletedPurchase
		local v31 = p29.isShown
		if v30 and not v31 then
			p_u_21.props.SetPromptVisibility(false)
		else
			p_u_21:setState({
				["showTopScrim"] = v31
			})
			if v31 then
				p_u_21:setState({
					["purchasePromptReady"] = false
				})
			end
		end
	end
	function p_u_21.onPromptStateSetToNone()
		-- upvalues: (copy) p_u_21
		p_u_21:setState({
			["purchasePromptReady"] = true
		})
	end
end
function v20.didMount(p32) -- name: didMount
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_16
	p32.sentNameFieldTouched = false
	p32.sentDescriptionFieldTouched = false
	local v33 = v_u_15.windowStateChangedEvent
	local v34 = v_u_15.promptStateSetToNoneEvent
	if v33 and v34 then
		p32.windowStateChangedConnection = v33:Connect(p32.onWindowStateChanged)
		p32.promptStateSetToNoneConnection = v34:Connect(p32.onPromptStateSetToNone)
	else
		v_u_9("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	v_u_16.sendPageLoad(v_u_16.Section.BuyCreationPage)
end
function v20.willUnmount(p35) -- name: willUnmount
	-- upvalues: (copy) v_u_9
	if p35.windowStateChangedConnection then
		p35.windowStateChangedConnection:Disconnect()
	else
		v_u_9("windowStateChangedConnection was not established")
	end
	if p35.promptStateSetToNoneConnection then
		p35.promptStateSetToNoneConnection:Disconnect()
	else
		v_u_9("promptStateSetToNoneConnection was not established")
	end
end
function v20.renderPromptBody(p_u_36) -- name: renderPromptBody
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_19, (copy) v_u_12, (copy) v_u_13, (copy) v_u_6, (copy) v_u_14, (copy) v_u_7
	local v_u_37 = p_u_36.props.humanoidModel == nil
	return v_u_8(function(_)
		-- upvalues: (ref) v_u_3, (ref) v_u_19, (ref) v_u_12, (copy) p_u_36, (copy) v_u_37, (ref) v_u_13, (ref) v_u_6, (ref) v_u_14, (ref) v_u_7
		local v38 = v_u_3.createFragment
		local v39 = {
			["UIListLayout"] = v_u_3.createElement("UIListLayout", {
				["Padding"] = v_u_19,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Vertical
			})
		}
		local v40 = {
			["PaddingBottom"] = v_u_19,
			["PaddingTop"] = v_u_19
		}
		v39.UIPadding = v_u_3.createElement("UIPadding", v40)
		v39.EmbeddedPreview = v_u_3.createElement(v_u_12, {
			["openPreviewView"] = nil,
			["model"] = nil,
			["isLoading"] = nil,
			["useFullBodyCameraSettings"] = true,
			["fieldOfView"] = 30,
			["LayoutOrder"] = 1,
			["isHumanoidModel"] = true,
			["openPreviewView"] = p_u_36.openPreviewView,
			["model"] = p_u_36.props.humanoidModel,
			["isLoading"] = v_u_37
		})
		v39.DescriptionInput = v_u_3.createElement(v_u_13, {
			["LayoutOrder"] = 2,
			["labelText"] = nil,
			["centerText"] = false,
			["defaultText"] = nil,
			["maxLength"] = 1000,
			["onTextUpdated"] = nil,
			["textBoxHeight"] = 104,
			["invalidInputText"] = nil,
			["labelText"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
			["defaultText"] = p_u_36.state.description,
			["onTextUpdated"] = p_u_36.onDescriptionUpdated,
			["invalidInputText"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
		})
		v39.InfoList = v_u_3.createElement(v_u_14, {
			["typeName"] = nil,
			["LayoutOrder"] = 3,
			["typeName"] = v_u_6:FormatByKey("Feature.Catalog.Label.Body")
		})
		v39.AvatarPartGrid = v_u_3.createElement(v_u_7, {
			["humanoidModel"] = nil,
			["name"] = nil,
			["LayoutOrder"] = 4,
			["screenSize"] = nil,
			["humanoidModel"] = p_u_36.props.humanoidModel,
			["name"] = p_u_36.state.name,
			["screenSize"] = p_u_36.props.screenSize
		})
		return v38(v39)
	end)
end
function v20.render(p41) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_11, (copy) v_u_6
	local v42 = v_u_2
	assert(v42, "Players must not be nil")
	return v_u_3.createElement(v_u_11, {
		["promptBody"] = nil,
		["screenSize"] = nil,
		["showingPreviewView"] = nil,
		["closePreviewView"] = nil,
		["asset"] = nil,
		["nameLabel"] = nil,
		["defaultName"] = nil,
		["titleText"] = nil,
		["onNameUpdated"] = nil,
		["canSubmit"] = nil,
		["onSubmit"] = nil,
		["delayInputSeconds"] = 3,
		["priceInRobux"] = nil,
		["showTopScrim"] = nil,
		["promptBody"] = p41:renderPromptBody(),
		["screenSize"] = p41.props.screenSize,
		["showingPreviewView"] = p41.state.showingPreviewView,
		["closePreviewView"] = p41.closePreviewView,
		["asset"] = p41.props.humanoidModel,
		["nameLabel"] = v_u_6:FormatByKey("CoreScripts.PublishAvatarPrompt.BodyName"),
		["defaultName"] = p41.state.name,
		["titleText"] = v_u_6:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		["onNameUpdated"] = p41.onNameUpdated,
		["canSubmit"] = p41.canSubmit,
		["onSubmit"] = p41.onSubmit,
		["priceInRobux"] = p41.props.priceInRobux,
		["showTopScrim"] = p41.state.showTopScrim
	})
end
return v4.connect(function(p43) -- name: mapStateToProps
	return {
		["humanoidModel"] = p43.promptRequest.promptInfo.humanoidModel,
		["guid"] = p43.promptRequest.promptInfo.guid,
		["scopes"] = p43.promptRequest.promptInfo.scopes,
		["priceInRobux"] = p43.promptRequest.promptInfo.priceInRobux
	}
end, function(p_u_44) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_18
	return {
		["SetPromptVisibility"] = function(p45) -- name: SetPromptVisibility
			-- upvalues: (copy) p_u_44, (ref) v_u_18
			p_u_44(v_u_18(p45))
		end
	}
end)(v20)