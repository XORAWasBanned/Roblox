-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.SaveAvatarPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = v6.App.Dialog.Alert.InteractiveAlert
local v_u_8 = v6.App.Button.Enum.ButtonType
v2:WaitForChild("RobloxGui")
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v10 = script.Parent.Parent
local v11 = v10.Parent
local v_u_12 = require(v10.HumanoidViewport)
local v_u_13 = require(v10.ItemsList)
local v_u_14 = require(v11.Thunks.SignalSaveAvatarPermissionDenied)
local v_u_15 = require(v11.Thunks.PerformSaveAvatar)
local v_u_16 = require(v11.GetConformedHumanoidDescription)
local v17 = v_u_3.PureComponent:extend("SaveAvatarPrompt")
v17.validateProps = v5.strictInterface({
	["gameName"] = v5.string,
	["screenSize"] = v5.Vector2,
	["humanoidDescription"] = v5.instanceOf("HumanoidDescription"),
	["rigType"] = v5.enum(Enum.HumanoidRigType),
	["performSaveAvatar"] = v5.callback,
	["signalSaveAvatarPermissionDenied"] = v5.callback
})
function v17.init(p_u_18) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_12
	p_u_18.mounted = false
	p_u_18:setState({
		["conformedHumanoidDescription"] = nil,
		["getConformedDescriptionFailed"] = false,
		["itemListScrollable"] = false
	})
	p_u_18.middleContentRef = v_u_3.createRef()
	local v19, v20 = v_u_3.createBinding(UDim2.new(1, 0, 0, 200))
	p_u_18.contentSize = v19
	p_u_18.updateContentSize = v20
	function p_u_18.onAlertSizeChanged(p21)
		-- upvalues: (copy) p_u_18
		local v22 = p21.AbsoluteSize
		if p_u_18.middleContentRef:getValue() then
			local v23 = p_u_18.middleContentRef:getValue().AbsoluteSize.Y
			local v24 = v22.Y - v23
			local v25 = p_u_18.props.screenSize.Y - 60 - v24
			local v26 = p_u_18.middleContentRef:getValue().AbsoluteSize.X / 2 - 10 + 80
			if v26 >= v25 then
				v26 = v25
			end
			if v23 ~= v26 then
				p_u_18.updateContentSize(UDim2.new(1, 0, 0, v26))
			end
		end
	end
	function p_u_18.itemListScrollableUpdated(p27, p28)
		-- upvalues: (copy) p_u_18
		if p28 == p_u_18.contentSize:getValue().Y.Offset then
			p_u_18:setState({
				["itemListScrollable"] = p27
			})
		end
	end
	function p_u_18.retryLoadDescription()
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["getConformedDescriptionFailed"] = false
		})
		p_u_18:getConformedHumanoidDescription()
	end
	function p_u_18.renderAlertMiddleContent()
		-- upvalues: (copy) p_u_18, (ref) v_u_3, (ref) v_u_13, (ref) v_u_12
		local v29 = p_u_18.state.conformedHumanoidDescription
		local v30 = p_u_18.state.getConformedDescriptionFailed
		local v31 = v_u_3.createElement
		local v32 = {
			["BackgroundTransparency"] = 1,
			["Size"] = p_u_18.contentSize,
			[v_u_3.Ref] = p_u_18.middleContentRef
		}
		local v33 = {}
		local v34 = v_u_3.createElement
		local v35 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(0.45, 1)
		}
		local v36 = {
			["ItemsList"] = v_u_3.createElement(v_u_13, {
				["humanoidDescription"] = v29,
				["retryLoadDescription"] = p_u_18.retryLoadDescription,
				["loadingFailed"] = v30,
				["itemListScrollableUpdated"] = p_u_18.itemListScrollableUpdated
			})
		}
		v33.ItemsListFrame = v34("Frame", v35, v36)
		local v37 = v_u_3.createElement
		local v38 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.fromScale(0.55, 1),
			["Position"] = UDim2.fromScale(0.45, 0)
		}
		local v39 = {
			["UIPadding"] = v_u_3.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 5),
				["PaddingRight"] = UDim.new(0, 5)
			}),
			["HumanoidViewport"] = v_u_3.createElement(v_u_12, {
				["humanoidDescription"] = v29,
				["loadingFailed"] = v30,
				["retryLoadDescription"] = p_u_18.retryLoadDescription,
				["rigType"] = p_u_18.props.rigType
			})
		}
		v33.HumanoidViewportFrame = v37("Frame", v38, v39)
		v33.UISizeConstraint = v_u_3.createElement("UISizeConstraint", {
			["MaxSize"] = p_u_18.contentMaxSize
		})
		return v31("Frame", v32, v33)
	end
end
function v17.render(p40) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8
	local v41 = v_u_3.createElement
	local v42 = v_u_7
	local v43 = {
		["title"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"),
		["bodyText"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", {
			["RBX_NAME"] = p40.props.gameName
		})
	}
	local v44 = {}
	local v45 = {}
	local v46 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = p40.props.signalSaveAvatarPermissionDenied,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
		}
	}
	local v47 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_8.PrimarySystem,
		["props"] = {
			["onActivated"] = p40.props.performSaveAvatar,
			["text"] = v_u_9:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
		}
	}
	__set_list(v45, 1, {v46, v47})
	v44.buttons = v45
	v43.buttonStackInfo = v44
	v43.position = UDim2.fromScale(0.5, 0.5)
	v43.screenSize = p40.props.screenSize
	v43.middleContent = p40.renderAlertMiddleContent
	v43.onAbsoluteSizeChanged = p40.onAlertSizeChanged
	v43.isMiddleContentFocusable = p40.state.itemListScrollable
	return v41(v42, v43)
end
function v17.getConformedHumanoidDescription(p_u_48, p49) -- name: getConformedHumanoidDescription
	-- upvalues: (copy) v_u_16
	v_u_16(p49, true):andThen(function(p50)
		-- upvalues: (copy) p_u_48
		if p_u_48.mounted then
			p_u_48:setState({
				["conformedHumanoidDescription"] = p50
			})
		end
	end, function(_)
		-- upvalues: (copy) p_u_48
		if p_u_48.mounted then
			p_u_48:setState({
				["getConformedDescriptionFailed"] = true
			})
		end
	end)
end
function v17.didMount(p51) -- name: didMount
	p51.mounted = true
	p51:getConformedHumanoidDescription(p51.props.humanoidDescription)
end
function v17.didUpdate(p52, p53, _) -- name: didUpdate
	-- upvalues: (copy) v_u_3
	if p52.props.humanoidDescription ~= p53.humanoidDescription then
		p52:setState({
			["conformedHumanoidDescription"] = nil,
			["getConformedDescriptionFailed"] = false,
			["conformedHumanoidDescription"] = v_u_3.None
		})
		p52:getConformedHumanoidDescription(p52.props.humanoidDescription)
	end
end
function v17.willUnmount(p54) -- name: willUnmount
	p54.mounted = false
end
return v4.connect(function(p55) -- name: mapStateToProps
	return {
		["gameName"] = p55.gameName,
		["screenSize"] = p55.screenSize,
		["humanoidDescription"] = p55.promptInfo.humanoidDescription,
		["rigType"] = p55.promptInfo.rigType
	}
end, function(p_u_56) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	return {
		["signalSaveAvatarPermissionDenied"] = function() -- name: signalSaveAvatarPermissionDenied
			-- upvalues: (copy) p_u_56, (ref) v_u_14
			return p_u_56(v_u_14)
		end,
		["performSaveAvatar"] = function() -- name: performSaveAvatar
			-- upvalues: (copy) p_u_56, (ref) v_u_15
			return p_u_56(v_u_15)
		end
	}
end)(v17)