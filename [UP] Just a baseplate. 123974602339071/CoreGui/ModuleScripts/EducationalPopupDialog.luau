-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.EducationalPopupDialog
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("ContextActionService")
local v5 = require(v3.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.t
local v_u_8 = v5.UIBlox.App.Dialog.Modal.EducationalModal
local v_u_9 = require(v3.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v10 = v_u_6.PureComponent:extend("EducationalPopupDialog")
local v11 = v7.strictInterface
local v12 = {
	["bodyContents"] = v7.array(v7.strictInterface({
		["icon"] = v7.optional(v7.union(v7.string, v7.table)),
		["text"] = v7.string,
		["layoutOrder"] = v7.optional(v7.integer),
		["isSystemMenuIcon"] = v7.optional(v7.boolean)
	})),
	["cancelText"] = v7.string,
	["confirmText"] = v7.string,
	["titleText"] = v7.optional(v7.string),
	["titleBackgroundImageProps"] = v7.strictInterface({
		["image"] = v7.string,
		["imageHeight"] = v7.number,
		["text"] = v7.optional(v7.string)
	}),
	["screenSize"] = v7.Vector2,
	["onDismiss"] = v7.callback,
	["onCancel"] = v7.callback,
	["onConfirm"] = v7.callback,
	["blurBackground"] = v7.boolean,
	["visible"] = v7.boolean
}
v10.validateProps = v11(v12)
v10.defaultProps = {
	["blurBackground"] = false
}
function v10.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_1, (copy) v_u_8
	return v_u_9(function(p14)
		local v15 = {}
		local v16 = {
			["Overlay"] = {
				["Color"] = p14.Color.Common.Scrim.Color3,
				["Transparency"] = p14.Color.Common.Scrim.Transparency
			}
		}
		v15.Theme = v16
		return v15
	end, function(p17)
		-- upvalues: (ref) v_u_6, (ref) v_u_1, (copy) p_u_13, (ref) v_u_8
		local v18 = v_u_6.createElement
		local v19 = v_u_6.Portal
		local v20 = {
			["target"] = v_u_1
		}
		local v21 = {}
		local v22 = v_u_6.createElement
		local v23 = {
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = nil,
			["Enabled"] = nil,
			["ZIndexBehavior"] = nil,
			["OnTopOfCoreBlur"] = p_u_13.props.blurBackground,
			["Enabled"] = p_u_13.props.visible,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
		local v24 = {
			["Overlay"] = v_u_6.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Text"] = "",
				["BackgroundColor3"] = p17.Theme.Overlay.Color,
				["BackgroundTransparency"] = p17.Theme.Overlay.Transparency,
				["Size"] = UDim2.fromScale(1, 1)
			}),
			["Popup"] = v_u_6.createElement(v_u_8, {
				["bodyContents"] = p_u_13.props.bodyContents,
				["cancelText"] = p_u_13.props.cancelText,
				["confirmText"] = p_u_13.props.confirmText,
				["titleText"] = p_u_13.props.titleText,
				["titleBackgroundImageProps"] = p_u_13.props.titleBackgroundImageProps,
				["screenSize"] = p_u_13.props.screenSize,
				["onDismiss"] = p_u_13.props.onDismiss,
				["onCancel"] = p_u_13.props.onCancel,
				["onConfirm"] = p_u_13.props.onConfirm
			})
		}
		v21.InGameMenuEducationalPopupDialog = v22("ScreenGui", v23, v24)
		return v18(v19, v20, v21)
	end)
end
function v10.bindActions(p_u_25) -- name: bindActions
	-- upvalues: (copy) v_u_4
	v_u_4:BindCoreAction("EducationalPopupConfirm", function(_, p26, _) -- name: dismissFunc
		-- upvalues: (copy) p_u_25
		if p26 == Enum.UserInputState.Begin then
			p_u_25.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end
function v10.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_4
	v_u_4:UnbindCoreAction("EducationalPopupConfirm")
end
function v10.updateBlur(p27) -- name: updateBlur
	-- upvalues: (copy) v_u_2
	local v28 = p27.props.blurBackground
	if v28 then
		v28 = p27.props.visible
	end
	if v28 then
		v28 = not game:GetService("VRService").VREnabled
	end
	v_u_2:SetRobloxGuiFocused(v28)
end
function v10.didMount(p29) -- name: didMount
	p29:updateBlur()
	if p29.props.visible then
		p29:bindActions()
	end
end
function v10.didUpdate(p30) -- name: didUpdate
	p30:updateBlur()
	if p30.props.visible then
		p30:bindActions()
	else
		p30:unbindActions()
	end
end
function v10.willUnmount(p31) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	if p31.props.blurBackground then
		v_u_2:SetRobloxGuiFocused(false)
	end
	p31:unbindActions()
end
return v10