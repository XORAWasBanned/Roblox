-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.ModalDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Resources.Assets)
local v_u_8 = require(v6.Components.PortedComponents.Divider)
local v_u_9 = v4.Core.ImageSet.ImageSetButton
local v_u_10 = v4.Core.Style.withStyle
local v_u_11 = v4.App.Button.IconButton
local v_u_12 = v4.App.Bar.HeaderBar
local v_u_13 = v4.App.ImageSet.Enum.IconSize
local v_u_14 = v4.App.ImageSet.Images
local v_u_15 = require(v1.Workspace.Packages.AppHeaderBar).makeBackButton
local v16 = v_u_3.Component:extend("ModalDialog")
v16.validateProps = v5.strictInterface({
	["visible"] = v5.boolean,
	["screenSize"] = v5.Vector2,
	["titleText"] = v5.optional(v5.string),
	["showCloseButton"] = v5.optional(v5.boolean),
	["headerBar"] = v5.optional(v5.table),
	["contents"] = v5.optional(v5.table),
	["actionButtons"] = v5.optional(v5.table),
	["onDismiss"] = v5.optional(v5.callback),
	["onBackButtonActivated"] = v5.optional(v5.callback),
	["maxHeight"] = v5.optional(v5.number),
	["maxWidth"] = v5.optional(v5.number)
})
function v16.init(p_u_17) -- name: init
	function p_u_17.onOverlayActivated()
		-- upvalues: (copy) p_u_17
		p_u_17.props.onDismiss()
	end
end
function v16.renderHeaderBarLeft(p18) -- name: renderHeaderBarLeft
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15
	local v_u_19 = p18.props
	return v_u_19.showCloseButton and function()
		-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_13, (ref) v_u_14, (copy) v_u_19
		return v_u_3.createElement(v_u_11, {
			["iconSize"] = v_u_13.Medium,
			["icon"] = v_u_14["icons/navigation/close"],
			["onActivated"] = v_u_19.onDismiss
		})
	end or (v_u_19.onBackButtonActivated == nil and function()
		return nil
	end or v_u_15(v_u_19.onBackButtonActivated))
end
function v16.renderHeaderBarRight(_) -- name: renderHeaderBarRight
	return function()
		return nil
	end
end
function v16.render(p_u_20) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12, (copy) v_u_8
	local v_u_21 = p_u_20.props
	local v22 = v_u_21.screenSize.Y
	local v23 = math.min(v22, 645)
	if v_u_21.maxHeight then
		local v24 = v_u_21.maxHeight
		v23 = math.min(v23, v24)
	end
	local v25 = v_u_21.screenSize.X
	local v26 = math.min(v25, 540)
	if v_u_21.maxWidth then
		local v27 = v_u_21.maxWidth
		v26 = math.min(v26, v27)
	end
	local v_u_28 = Vector2.new(v26, v23)
	local v_u_29, v_u_30
	if v_u_21.screenSize.X < 540 then
		v_u_29 = Vector2.new(0.5, 1)
		v_u_30 = UDim2.fromScale(0.5, 1)
	else
		v_u_29 = Vector2.new(0.5, 0.5)
		v_u_30 = UDim2.fromScale(0.5, 0.5)
	end
	local v31 = v_u_28.Y - 49 - 60
	local v_u_32 = math.min(600, v31)
	if not v_u_21.actionButtons then
		v_u_32 = v_u_32 + 60
	end
	return v_u_10(function(p33)
		-- upvalues: (ref) v_u_3, (copy) v_u_21, (copy) p_u_20, (ref) v_u_9, (ref) v_u_29, (ref) v_u_7, (ref) v_u_30, (copy) v_u_28, (ref) v_u_12, (ref) v_u_8, (ref) v_u_32
		local v34 = v_u_3.createElement
		local v35 = "Frame"
		local v36 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Visible"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Visible"] = v_u_21.visible
		}
		local v37 = {
			["Overlay"] = v_u_3.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = p33.Theme.Overlay.Color,
				["BackgroundTransparency"] = p33.Theme.Overlay.Transparency,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.fromScale(1, 1),
				["Text"] = "",
				[v_u_3.Event.Activated] = p_u_20.onOverlayActivated
			})
		}
		local v38 = v_u_3.createElement
		local v39 = v_u_9
		local v40 = {
			["Active"] = true,
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Position"] = nil,
			["ScaleType"] = nil,
			["Size"] = nil,
			["SliceCenter"] = nil,
			["AnchorPoint"] = v_u_29,
			["Image"] = v_u_7.Images.RoundedRect.Image,
			["ImageColor3"] = p33.Theme.BackgroundUIDefault.Color,
			["ImageTransparency"] = p33.Theme.BackgroundUIDefault.Transparency,
			["Position"] = v_u_30,
			["ScaleType"] = v_u_7.Images.RoundedRect.ScaleType,
			["Size"] = UDim2.fromOffset(v_u_28.X, v_u_28.Y),
			["SliceCenter"] = v_u_7.Images.RoundedRect.SliceCenter
		}
		local v41 = {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["HeaderBar"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 48)
			}, {
				["Bar"] = v_u_21.headerBar or (v_u_3.createElement(v_u_12, {
					["backgroundTransparency"] = 1,
					["barHeight"] = 48,
					["renderLeft"] = nil,
					["renderRight"] = nil,
					["title"] = nil,
					["renderLeft"] = p_u_20:renderHeaderBarLeft(),
					["renderRight"] = p_u_20:renderHeaderBarRight(),
					["title"] = v_u_21.titleText
				}) or nil)
			}),
			["Divider"] = v_u_3.createElement(v_u_8, {
				["LayoutOrder"] = 2
			}),
			["Content"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 3,
				["Size"] = nil,
				["ZIndex"] = 10,
				["Size"] = UDim2.new(1, 0, 0, v_u_32)
			}, {
				["Contents"] = v_u_21.contents
			})
		}
		local v42
		if v_u_21.actionButtons then
			v42 = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 4,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 60)
			}, {
				["Padding"] = v_u_3.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, 8),
					["PaddingBottom"] = UDim.new(0, 2),
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				}),
				["ActionButtons"] = v_u_21.actionButtons
			}) or nil
		else
			v42 = nil
		end
		v41.ActionBar = v42
		v37.Dialog = v38(v39, v40, v41)
		return v34(v35, v36, v37)
	end)
end
function v16.bindActions(p_u_43) -- name: bindActions
	-- upvalues: (copy) v_u_2
	v_u_2:BindCoreAction("ModalDialogDismiss", function(p44) -- name: dismissFunc
		-- upvalues: (copy) p_u_43
		if p44 == Enum.UserInputState.Begin then
			p_u_43.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end
function v16.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("ModalDialogDismiss")
end
function v16.didMount(p45) -- name: didMount
	if p45.props.visible then
		p45:bindActions()
	end
end
function v16.didUpdate(p46) -- name: didUpdate
	if p46.props.visible then
		p46:bindActions()
	else
		p46:unbindActions()
	end
end
function v16.willUnmount(p47) -- name: willUnmount
	p47:unbindActions()
end
return v16