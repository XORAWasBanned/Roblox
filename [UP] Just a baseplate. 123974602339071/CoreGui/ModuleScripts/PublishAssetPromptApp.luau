-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAssetPromptApp
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.RoactGamepad)
local v6 = require(v1.Packages.t)
local v_u_7 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_8 = require(v1.Workspace.Packages.InputType)
local v_u_9 = require(v1.Workspace.Packages.InputType).getInputGroup
local v10 = script.Parent
local v_u_11 = require(v10.Parent.PromptType)
local v_u_12 = require(v10.PublishAssetPromptSingleStep)
local v_u_13 = require(v10.PublishAvatarPrompt.PublishAvatarPrompt)
local v_u_14 = require(v10.PublishAvatarAssetPrompt.PublishAvatarAssetPrompt)
local v_u_15 = require(v10.PublishMakeupLookPrompt.PublishMakeupLookPrompt)
local v_u_16 = require(v10.ResultModal)
local v_u_17 = require(v1.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local v_u_18 = require(v1.Packages.ReactFocusNavigation)
local v_u_19 = v_u_18.FocusNavigationService.new(v_u_18.EngineInterface.CoreGui)
local v20 = require(v1.Workspace.Packages.FocusNavigationUtils)
local v_u_21 = v20.FocusNavigableSurfaceRegistry.Provider
local v_u_22 = v20.FocusRoot
local v_u_23 = v20.FocusNavigableSurfaceIdentifierEnum
local v_u_24 = require(v10.Parent.Flags.GetFFlagUploadMakeupSupport)
local v25 = v_u_3.PureComponent:extend("PublishAssetPromptApp")
v25.validateProps = v6.strictInterface({
	["assetType"] = v6.optional(v6.enum(Enum.AssetType)),
	["assetInstance"] = v6.optional(v6.Instance)
})
function v25.init(p_u_26) -- name: init
	p_u_26:setState({
		["screenSize"] = Vector2.new(0, 0)
	})
	function p_u_26.absoluteSizeChanged(p27)
		-- upvalues: (copy) p_u_26
		if p_u_26.state.screenSize ~= p27.AbsoluteSize then
			p_u_26:setState({
				["screenSize"] = p27.AbsoluteSize
			})
		end
	end
	p_u_26.selectedCoreGuiObject = nil
	p_u_26.selectedGuiObject = nil
end
function v25.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_24, (copy) v_u_15, (copy) v_u_7, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23
	local v29 = nil
	if p_u_28.props.resultModalType then
		v29 = v_u_3.createElement(v_u_16, {
			["screenSize"] = p_u_28.state.screenSize
		})
	elseif p_u_28.props.assetInstance then
		if p_u_28.props.promptType == v_u_11.PublishAssetSingleStep then
			v29 = v_u_3.createElement(v_u_12, {
				["screenSize"] = p_u_28.state.screenSize
			})
		end
	elseif p_u_28.props.promptType == v_u_11.PublishAvatar then
		v29 = v_u_3.createElement(v_u_13, {
			["screenSize"] = p_u_28.state.screenSize
		})
	elseif p_u_28.props.promptType == v_u_11.PublishAvatarAsset then
		v29 = v_u_3.createElement(v_u_14, {
			["screenSize"] = p_u_28.state.screenSize
		})
	elseif v_u_24() and p_u_28.props.promptType == v_u_11.PublishMakeupLook then
		v29 = v_u_3.createElement(v_u_15, {
			["screenSize"] = p_u_28.state.screenSize
		})
	end
	if v29 == nil then
		return nil
	end
	local v30 = v_u_3.createElement
	local v31 = {
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		["AutoLocalize"] = false,
		["DisplayOrder"] = -1,
		[v_u_3.Change.AbsoluteSize] = p_u_28.absoluteSizeChanged
	}
	local v33 = {
		["LastInputTypeConnection"] = v_u_3.createElement(v_u_7, {
			["event"] = v_u_2.LastInputTypeChanged,
			["callback"] = function(p32) -- name: callback
				-- upvalues: (copy) p_u_28, (ref) v_u_9, (ref) v_u_8
				p_u_28:setState({
					["isGamepad"] = v_u_9(p32) == v_u_8.InputTypeConstants.Gamepad
				})
			end
		})
	}
	local v34 = v_u_3.createElement
	local v35 = v_u_5.Focusable.Frame
	local v36 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v37 = {}
	local v38 = v_u_3.createElement
	local v39 = v_u_17
	local v40 = {}
	local v41 = v_u_3.createElement
	local v42 = v_u_18.FocusNavigationContext.Provider
	local v43 = {
		["value"] = v_u_19
	}
	local v44 = {}
	local v45 = v_u_3.createElement
	local v46 = v_u_21
	local v47 = {
		["FocusNavigationCoreScriptsWrapper"] = v_u_3.createElement(v_u_22, {
			["surfaceIdentifier"] = nil,
			["isIsolated"] = true,
			["isAutoFocusRoot"] = true,
			["surfaceIdentifier"] = v_u_23.RouterView
		}, {
			["Prompt"] = v29
		})
	}
	v44.FocusNavigationRegistryProvider = v45(v46, nil, v47)
	v40.FocusNavigationProvider = v41(v42, v43, v44)
	v37.CursorProvider = v38(v39, {}, v40)
	v33.PromptFrame = v34(v35, v36, v37)
	return v30("ScreenGui", v31, v33)
end
return v4.connect(function(p48) -- name: mapStateToProps
	return {
		["resultModalType"] = p48.promptRequest.resultModalType,
		["promptType"] = p48.promptRequest.promptInfo.promptType,
		["assetInstance"] = p48.promptRequest.promptInfo.assetInstance,
		["assetType"] = p48.promptRequest.promptInfo.assetType
	}
end)(v25)