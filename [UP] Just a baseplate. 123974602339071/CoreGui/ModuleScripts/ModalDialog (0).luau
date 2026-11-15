-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.ModalDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Components.VirtualKeyboardMonitor)
local v_u_8 = require(v6.Resources.Assets)
local v9 = require(v6.Dependencies)
local v_u_10 = require(v9.Divider)
local v_u_11 = v4.Core.ImageSet.ImageSetButton
local v_u_12 = v4.Core.Style.withStyle
local v_u_13 = v4.App.Button.IconButton
local v_u_14 = v4.App.Bar.HeaderBar
local v_u_15 = v4.App.ImageSet.Enum.IconSize
local v_u_16 = v4.App.ImageSet.Images
local v_u_17 = require(v1.Workspace.Packages.AppHeaderBar).makeBackButton
local v18 = v_u_3.Component:extend("ModalDialog")
v18.validateProps = v5.strictInterface({
	["visible"] = v5.boolean,
	["screenSize"] = v5.Vector2,
	["titleText"] = v5.optional(v5.string),
	["showCloseButton"] = v5.optional(v5.boolean),
	["headerBar"] = v5.optional(v5.table),
	["contents"] = v5.optional(v5.table),
	["actionButtons"] = v5.optional(v5.table),
	["onDismiss"] = v5.optional(v5.callback),
	["onBackButtonActivated"] = v5.optional(v5.callback)
})
function v18.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_7
	p_u_19.virtualKeyboardMonitor = v_u_7.getInstance()
	function p_u_19.onOverlayActivated()
		-- upvalues: (copy) p_u_19
		if not p_u_19.virtualKeyboardMonitor:isKeyboardJustOff() then
			p_u_19.props.onDismiss()
		end
	end
end
function v18.renderHeaderBarLeft(p20) -- name: renderHeaderBarLeft
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17
	local v_u_21 = p20.props
	return v_u_21.showCloseButton and function()
		-- upvalues: (ref) v_u_3, (ref) v_u_13, (ref) v_u_15, (ref) v_u_16, (copy) v_u_21
		return v_u_3.createElement(v_u_13, {
			["iconSize"] = v_u_15.Medium,
			["icon"] = v_u_16["icons/navigation/close"],
			["onActivated"] = v_u_21.onDismiss
		})
	end or (v_u_21.onBackButtonActivated == nil and function()
		return nil
	end or v_u_17(v_u_21.onBackButtonActivated))
end
function v18.renderHeaderBarRight(_) -- name: renderHeaderBarRight
	return function()
		return nil
	end
end
function v18.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_8, (copy) v_u_14, (copy) v_u_10
	local v_u_23 = p_u_22.props
	local v24 = Vector2.new
	local v25 = v_u_23.screenSize.X
	local v26 = math.min(v25, 540)
	local v27 = v_u_23.screenSize.Y
	local v_u_28 = v24(v26, (math.min(v27, 375)))
	local v_u_29, v_u_30
	if v_u_23.screenSize.X < 540 then
		v_u_29 = Vector2.new(0.5, 1)
		v_u_30 = UDim2.fromScale(0.5, 1)
	else
		v_u_29 = Vector2.new(0.5, 0.5)
		v_u_30 = UDim2.fromScale(0.5, 0.5)
	end
	local v31 = v_u_28.Y - 49 - 96
	local v_u_32 = math.min(230, v31)
	if not v_u_23.actionButtons then
		v_u_32 = v_u_32 + 96
	end
	return v_u_12(function(p33)
		-- upvalues: (ref) v_u_3, (copy) v_u_23, (copy) p_u_22, (ref) v_u_11, (ref) v_u_29, (ref) v_u_8, (ref) v_u_30, (copy) v_u_28, (ref) v_u_14, (ref) v_u_10, (ref) v_u_32
		local v34 = v_u_3.createElement
		local v35 = "Frame"
		local v36 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Visible"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Visible"] = v_u_23.visible
		}
		local v37 = {
			["Overlay"] = v_u_3.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = p33.Theme.Overlay.Color,
				["BackgroundTransparency"] = p33.Theme.Overlay.Transparency,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.fromScale(1, 1),
				["Text"] = "",
				["ZIndex"] = -10,
				[v_u_3.Event.Activated] = p_u_22.onOverlayActivated
			})
		}
		local v38 = v_u_3.createElement
		local v39 = v_u_11
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
			["Image"] = v_u_8.Images.RoundedRect.Image,
			["ImageColor3"] = p33.Theme.BackgroundUIDefault.Color,
			["ImageTransparency"] = p33.Theme.BackgroundUIDefault.Transparency,
			["Position"] = v_u_30,
			["ScaleType"] = v_u_8.Images.RoundedRect.ScaleType,
			["Size"] = UDim2.fromOffset(v_u_28.X, v_u_28.Y),
			["SliceCenter"] = v_u_8.Images.RoundedRect.SliceCenter
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
				["Bar"] = v_u_23.headerBar or (v_u_3.createElement(v_u_14, {
					["backgroundTransparency"] = 1,
					["barHeight"] = 48,
					["renderLeft"] = nil,
					["renderRight"] = nil,
					["title"] = nil,
					["renderLeft"] = p_u_22:renderHeaderBarLeft(),
					["renderRight"] = p_u_22:renderHeaderBarRight(),
					["title"] = v_u_23.titleText
				}) or nil)
			}),
			["Divider"] = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = 2
			}),
			["Content"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 3,
				["Size"] = nil,
				["ZIndex"] = 10,
				["Size"] = UDim2.new(1, 0, 0, v_u_32)
			}, {
				["Contents"] = v_u_23.contents
			})
		}
		local v42
		if v_u_23.actionButtons then
			v42 = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 4,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 96)
			}, {
				["Padding"] = v_u_3.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, 24),
					["PaddingBottom"] = UDim.new(0, 24),
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				}),
				["ActionButtons"] = v_u_23.actionButtons
			}) or nil
		else
			v42 = nil
		end
		v41.ActionBar = v42
		v37.Dialog = v38(v39, v40, v41)
		return v34(v35, v36, v37)
	end)
end
function v18.bindActions(p_u_43) -- name: bindActions
	-- upvalues: (copy) v_u_2
	v_u_2:BindCoreAction("ModalDialogDismiss", function(_, p44, _) -- name: dismissFunc
		-- upvalues: (copy) p_u_43
		if p44 == Enum.UserInputState.Begin then
			p_u_43.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end
function v18.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("ModalDialogDismiss")
end
function v18.didMount(p45) -- name: didMount
	if p45.props.visible then
		p45:bindActions()
	end
end
function v18.didUpdate(p46) -- name: didUpdate
	if p46.props.visible then
		p46:bindActions()
	else
		p46:unbindActions()
	end
end
function v18.willUnmount(p47) -- name: willUnmount
	p47:unbindActions()
end
return v18