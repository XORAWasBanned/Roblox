-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishMakeupLookPrompt.PublishMakeupLookPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_7 = require(v1.Workspace.Packages.Loggers).mutedError
local v8 = script.Parent.Parent
local v_u_9 = require(v8.BasePublishPrompt)
local v_u_10 = require(v8.Common.ObjectViewport)
local v_u_11 = require(v8.Common.LabeledTextBox)
local v_u_12 = require(v8.Common.PublishInfoList)
local v_u_13 = require(v8.Common.MakeupPartGrid)
local v_u_14 = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
local v_u_15 = require(script.Parent.Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local v_u_16 = require(v1.Workspace.Packages.PurchasePrompt)
local v_u_17 = v_u_16.PublishAssetAnalytics
local v18 = script.Parent.Parent.Parent.Actions
local v_u_19 = require(v18.SetPromptVisibility)
local v_u_20 = UDim.new(0, 20)
local v21 = v_u_3.PureComponent:extend("PublishMakeupLookPrompt")
v21.validateProps = v5.strictInterface({
	["screenSize"] = v5.Vector2,
	["accessoryInstance"] = v5.optional(v5.union(v5.instanceIsA("Folder"), v5.instanceIsA("Decal"))),
	["makeupEntries"] = v5.optional(v5.table),
	["guid"] = v5.any,
	["scopes"] = v5.any,
	["priceInRobux"] = v5.optional(v5.number),
	["SetPromptVisibility"] = v5.callback
})
function v21.init(p_u_22) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_16, (copy) v_u_7
	local v23 = v_u_2.LocalPlayer
	assert(v23, "LocalPlayer must not be nil")
	p_u_22:setState({
		["showingPreviewView"] = false,
		["name"] = nil,
		["isNameValid"] = true,
		["description"] = nil,
		["isDescValid"] = true,
		["showTopScrim"] = false,
		["purchasePromptReady"] = true,
		["previewModel"] = nil,
		["name"] = v23.Name .. "\'s Makeup",
		["description"] = v23.Name .. "\'s Makeup"
	})
	function p_u_22.openPreviewView()
		-- upvalues: (ref) v_u_17, (copy) p_u_22
		v_u_17.sendButtonClicked(v_u_17.Section.BuyCreationPage, v_u_17.Element.Expand)
		p_u_22:setState({
			["showingPreviewView"] = true
		})
	end
	function p_u_22.closePreviewView()
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["showingPreviewView"] = false
		})
	end
	function p_u_22.canSubmit()
		-- upvalues: (copy) p_u_22
		local v24 = p_u_22.state.isNameValid and p_u_22.state.isDescValid
		if v24 then
			if p_u_22.props.accessoryInstance == nil then
				v24 = false
			else
				v24 = p_u_22.state.purchasePromptReady
			end
		end
		return v24
	end
	function p_u_22.onSubmit()
		-- upvalues: (ref) v_u_17, (copy) p_u_22, (ref) v_u_16, (ref) v_u_7
		v_u_17.sendButtonClicked(v_u_17.Section.BuyCreationPage, v_u_17.Element.Buy)
		local v25 = {
			["name"] = p_u_22.state.name,
			["description"] = p_u_22.state.description
		}
		if v_u_16.initiateAvatarCreationFeePurchase then
			v_u_16.initiateAvatarCreationFeePurchase(v25, p_u_22.props.guid, p_u_22.state.previewModel, p_u_22.props.priceInRobux)
		else
			v_u_7("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
		end
	end
	function p_u_22.onNameUpdated(p26, p27)
		-- upvalues: (copy) p_u_22, (ref) v_u_17
		p_u_22:setState({
			["name"] = p26,
			["isNameValid"] = p27
		})
		if not p_u_22.sentNameFieldTouched then
			p_u_22.sentNameFieldTouched = true
			v_u_17.sendFieldTouched(v_u_17.Section.BuyCreationPage, v_u_17.Element.Name)
		end
	end
	function p_u_22.onDescriptionUpdated(p28, p29)
		-- upvalues: (copy) p_u_22, (ref) v_u_17
		p_u_22:setState({
			["description"] = p28,
			["isDescValid"] = p29
		})
		if not p_u_22.sentDescriptionFieldTouched then
			p_u_22.sentDescriptionFieldTouched = true
			v_u_17.sendFieldTouched(v_u_17.Section.BuyCreationPage, v_u_17.Element.Description)
		end
	end
	function p_u_22.onWindowStateChanged(p30)
		-- upvalues: (copy) p_u_22
		local v31 = p30.hasCompletedPurchase
		local v32 = p30.isShown
		if v31 and not v32 then
			p_u_22.props.SetPromptVisibility(false)
		else
			p_u_22:setState({
				["showTopScrim"] = v32
			})
			if v32 then
				p_u_22:setState({
					["purchasePromptReady"] = false
				})
			end
		end
	end
	function p_u_22.onPromptStateSetToNone()
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["purchasePromptReady"] = true
		})
	end
end
function v21.updatePreviewModel(p_u_33) -- name: updatePreviewModel
	-- upvalues: (copy) v_u_14
	local v_u_34 = p_u_33.props.accessoryInstance
	if v_u_34 and v_u_34:IsA("Folder") then
		local v_u_35 = p_u_33.props.makeupEntries
		task.spawn(function()
			-- upvalues: (ref) v_u_14, (copy) v_u_34, (copy) v_u_35, (copy) p_u_33
			local v36 = v_u_14.compositeMakeupFolder(v_u_34)
			local v37 = v_u_14.getFolderAccessories(v_u_34, v_u_35)
			if (v36 or #v37 ~= 0) and p_u_33.isMounted then
				local v38 = v_u_14.createMakeupHeadPreview(v36, Enum.AvatarAssetType.FaceMakeup, v37)
				if v38 and p_u_33.isMounted then
					local v_u_39 = p_u_33.state.previewModel
					p_u_33:setState({
						["previewModel"] = v38
					}, function()
						-- upvalues: (copy) v_u_39
						if v_u_39 then
							v_u_39:Destroy()
						end
					end)
				end
			end
		end)
	end
end
function v21.didMount(p40) -- name: didMount
	-- upvalues: (copy) v_u_16, (copy) v_u_7, (copy) v_u_17
	p40.isMounted = true
	p40:updatePreviewModel()
	p40.sentNameFieldTouched = false
	p40.sentDescriptionFieldTouched = false
	local v41 = v_u_16.windowStateChangedEvent
	local v42 = v_u_16.promptStateSetToNoneEvent
	if v41 and v42 then
		p40.windowStateChangedConnection = v41:Connect(p40.onWindowStateChanged)
		p40.promptStateSetToNoneConnection = v42:Connect(p40.onPromptStateSetToNone)
	else
		v_u_7("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	v_u_17.sendPageLoad(v_u_17.Section.BuyCreationPage)
end
function v21.didUpdate(p43, p44) -- name: didUpdate
	if p44.accessoryInstance ~= p43.props.accessoryInstance then
		p43:updatePreviewModel()
	end
end
function v21.willUnmount(p45) -- name: willUnmount
	-- upvalues: (copy) v_u_7
	p45.isMounted = false
	if p45.state.previewModel then
		p45.state.previewModel:Destroy()
	end
	if p45.windowStateChangedConnection then
		p45.windowStateChangedConnection:Disconnect()
	else
		v_u_7("windowStateChangedConnection was not established")
	end
	if p45.promptStateSetToNoneConnection then
		p45.promptStateSetToNoneConnection:Disconnect()
	else
		v_u_7("promptStateSetToNoneConnection was not established")
	end
end
function v21.renderPromptBody(p46) -- name: renderPromptBody
	-- upvalues: (copy) v_u_3, (copy) v_u_20, (copy) v_u_10, (copy) v_u_15, (copy) v_u_11, (copy) v_u_6, (copy) v_u_12, (copy) v_u_13
	local v47 = p46.state.previewModel
	local v48 = v47 == nil
	local v49 = v_u_3.createFragment
	local v50 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["Padding"] = v_u_20,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical
		})
	}
	local v51 = {
		["PaddingBottom"] = v_u_20,
		["PaddingTop"] = v_u_20
	}
	v50.UIPadding = v_u_3.createElement("UIPadding", v51)
	v50.EmbeddedPreview = v_u_3.createElement(v_u_10, {
		["openPreviewView"] = nil,
		["model"] = nil,
		["isLoading"] = nil,
		["useFullBodyCameraSettings"] = false,
		["fieldOfView"] = 30,
		["LayoutOrder"] = 1,
		["isMakeupPreview"] = nil,
		["openPreviewView"] = p46.openPreviewView,
		["model"] = v47,
		["isLoading"] = v48,
		["isMakeupPreview"] = v_u_15()
	})
	v50.DescriptionInput = v_u_3.createElement(v_u_11, {
		["LayoutOrder"] = 2,
		["labelText"] = nil,
		["centerText"] = false,
		["defaultText"] = nil,
		["maxLength"] = 1000,
		["onTextUpdated"] = nil,
		["textBoxHeight"] = 104,
		["invalidInputText"] = nil,
		["labelText"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
		["defaultText"] = p46.state.description,
		["onTextUpdated"] = p46.onDescriptionUpdated,
		["invalidInputText"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
	})
	v50.InfoList = v_u_3.createElement(v_u_12, {
		["typeName"] = nil,
		["LayoutOrder"] = 3,
		["typeName"] = v_u_6:FormatByKey("Feature.Catalog.Label.Makeup")
	})
	v50.MakeupGrid = v_u_3.createElement(v_u_13, {
		["makeupFolder"] = nil,
		["makeupEntries"] = nil,
		["name"] = nil,
		["LayoutOrder"] = 4,
		["screenSize"] = nil,
		["makeupFolder"] = p46.props.accessoryInstance,
		["makeupEntries"] = p46.props.makeupEntries,
		["name"] = p46.state.name,
		["screenSize"] = p46.props.screenSize
	})
	return v49(v50)
end
function v21.render(p52) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_15, (copy) v_u_6
	return v_u_3.createElement(v_u_9, {
		["promptBody"] = nil,
		["screenSize"] = nil,
		["showingPreviewView"] = nil,
		["closePreviewView"] = nil,
		["isMakeupPreview"] = nil,
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
		["promptBody"] = p52:renderPromptBody(),
		["screenSize"] = p52.props.screenSize,
		["showingPreviewView"] = p52.state.showingPreviewView,
		["closePreviewView"] = p52.closePreviewView,
		["isMakeupPreview"] = v_u_15(),
		["asset"] = p52.state.previewModel,
		["nameLabel"] = v_u_6:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		["defaultName"] = p52.state.name,
		["titleText"] = v_u_6:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		["onNameUpdated"] = p52.onNameUpdated,
		["canSubmit"] = p52.canSubmit,
		["onSubmit"] = p52.onSubmit,
		["priceInRobux"] = p52.props.priceInRobux,
		["showTopScrim"] = p52.state.showTopScrim
	})
end
return v4.connect(function(p53) -- name: mapStateToProps
	return {
		["accessoryInstance"] = p53.promptRequest.promptInfo.accessoryInstance,
		["guid"] = p53.promptRequest.promptInfo.guid,
		["scopes"] = p53.promptRequest.promptInfo.scopes,
		["priceInRobux"] = p53.promptRequest.promptInfo.priceInRobux,
		["makeupEntries"] = p53.promptRequest.promptInfo.makeupEntries
	}
end, function(p_u_54) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_19
	return {
		["SetPromptVisibility"] = function(p55) -- name: SetPromptVisibility
			-- upvalues: (copy) p_u_54, (ref) v_u_19
			p_u_54(v_u_19(p55))
		end
	}
end)(v21)