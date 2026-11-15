-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MenuBackButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v_u_6 = v4.App.ImageSet.Images
local v_u_7 = v4.Core.ImageSet.ImageSetLabel
local v_u_8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v10 = require(v1.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v_u_11 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_12 = require(v2.Modules.Settings.Utility)
local v_u_13 = require(v2.Modules.Settings.BackButtonController)
local v14 = v_u_3.PureComponent:extend("MenuBackButton")
local v_u_15 = require(v2.Modules.TenFootInterface):IsEnabled()
if v_u_15 then
	v_u_15 = not v10
end
local v_u_16 = require(v2.Modules.Settings.Theme)
v14.validateProps = v5.strictInterface({
	["HubBar"] = v5.instanceOf("ImageLabel"),
	["backEnabled"] = v5.boolean,
	["BackBarRef"] = v5.optional(v5.table),
	["LayoutOrder"] = v5.optional(v5.integer)
})
v14.defaultProps = {
	["backEnabled"] = v_u_13.hasReturnUniverse()
}
function v14.init(p17) -- name: init
	-- upvalues: (copy) v_u_13, (copy) v_u_3
	p17:setState({
		["text"] = v_u_13.getMenuText()
	})
	local v18, v19 = v_u_3.createBinding(nil)
	p17.sizeBinding = v18
	p17.updateSizeBinding = v19
	local v20, v21 = v_u_3.createBinding(nil)
	p17.sizeConstraintBinding = v20
	p17.updateSizeConstraintBinding = v21
	local v22, v23 = v_u_3.createBinding(nil)
	p17.visibleBinding = v22
	p17.updateVisibleBinding = v23
	local v24, v25 = v_u_3.createBinding(nil)
	p17.buttonHeightBinding = v24
	p17.updateButtonHeightBinding = v25
	local v26, v27 = v_u_3.createBinding(nil)
	p17.textSizeBinding = v26
	p17.updateTextSizeBinding = v27
	local v28, v29 = v_u_3.createBinding(nil)
	p17.textSizeConstraintBinding = v28
	p17.updateTextSizeConstraintBinding = v29
	p17.textLabelRef = v_u_3.createRef()
end
function v14.didMount(p30) -- name: didMount
	p30.updateSizeBinding(p30.props.HubBar.Size)
	p30.updateVisibleBinding(p30.props.HubBar.Visible)
	p30:updateViewport()
end
function v14.didUpdate(p31, p32) -- name: didUpdate
	if p31.props.HubBar ~= p32.HubBar then
		p31.updateSizeBinding(p31.props.HubBar.Size)
		p31.updateVisibleBinding(p31.props.HubBar.Visible)
	end
end
function v14.updateViewport(p33) -- name: updateViewport
	-- upvalues: (copy) v_u_16, (copy) v_u_12, (copy) v_u_15
	local v34 = v_u_16.textSize(24)
	if v_u_12:IsSmallTouchScreen() then
		v34 = v_u_16.textSize(18)
	elseif v_u_15 then
		v34 = v_u_16.textSize(36)
	end
	p33.updateTextSizeConstraintBinding(v34)
	local v35 = v_u_12:IsPortrait()
	local v36 = v_u_15 and 120 or v_u_16.LargeButtonHeight
	if v35 or v_u_12:IsSmallTouchScreen() then
		v36 = v_u_16.ButtonHeight
		v34 = v35 and v_u_16.textSize(16) or v_u_16.textSize(24)
	end
	p33.updateTextSizeBinding(v34)
	p33.updateButtonHeightBinding(v36)
	if p33.textLabelRef:getValue() and p33.props.BackBarRef:getValue() then
		local v37 = p33.textLabelRef:getValue().AbsolutePosition.X - p33.props.BackBarRef:getValue().AbsolutePosition.X
		p33.updateSizeConstraintBinding(Vector2.new(p33.props.BackBarRef:getValue().AbsoluteSize.X - v37, (1 / 0)))
	end
end
function v14.render(p_u_38) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_16, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v39 = v_u_3.createElement
	local v40 = "Frame"
	local v46 = {
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["LayoutOrder"] = p_u_38.props.LayoutOrder,
		["Visible"] = v_u_3.joinBindings({ p_u_38.state.text, p_u_38.visibleBinding }):map(function(p41)
			-- upvalues: (copy) p_u_38
			local v42 = p_u_38.props.backEnabled
			if v42 then
				if p41[1] == nil then
					v42 = false
				else
					v42 = p41[2]
				end
			end
			return v42
		end),
		["Size"] = v_u_3.joinBindings({ p_u_38.sizeBinding, p_u_38.buttonHeightBinding }):map(function(p43)
			local v44 = p43[1]
			local v45 = p43[2]
			if v44 and v45 then
				return UDim2.new(UDim.new(v44.X.Scale * 0.5, v44.X.Offset * 0.5), UDim.new(0, v45 + 6))
			else
				return UDim2.new()
			end
		end),
		[v_u_3.Ref] = p_u_38.props.BackBarRef
	}
	local v47 = {
		["SizeConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = p_u_38.props.HubBar:GetPropertyChangedSignal("Size"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_38
				p_u_38.updateSizeBinding(p_u_38.props.HubBar.Size)
			end
		}),
		["VisibleConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = p_u_38.props.HubBar:GetPropertyChangedSignal("Visible"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_38
				p_u_38.updateVisibleBinding(p_u_38.props.HubBar.Visible)
			end
		}),
		["ViewportSizeChangedConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_38
				p_u_38:updateViewport()
			end
		}),
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 6),
			["PaddingTop"] = UDim.new(0, 10)
		})
	}
	local v48 = v_u_3.createElement
	local v49 = "ImageButton"
	local v53 = {
		["Image"] = "",
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = v_u_16.color("DefaultButton"),
		["BackgroundTransparency"] = v_u_16.transparency("DefaultButton", 1),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = p_u_38.buttonHeightBinding:map(function(p50)
			if p50 then
				return UDim2.new(0, 0, 0, p50)
			else
				return UDim2.new()
			end
		end),
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["ScaleType"] = Enum.ScaleType.Stretch,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		[v_u_3.Event.MouseEnter] = function(p51)
			-- upvalues: (ref) v_u_16
			p51.BackgroundColor3 = v_u_16.color("DefaultButtonHover")
			p51.BackgroundTransparency = v_u_16.transparency("DefaultButtonHover")
		end,
		[v_u_3.Event.MouseLeave] = function(p52)
			-- upvalues: (ref) v_u_16
			p52.BackgroundColor3 = v_u_16.color("DefaultButton")
			p52.BackgroundTransparency = v_u_16.transparency("DefaultButton")
		end,
		[v_u_3.Event.Activated] = function(_)
			-- upvalues: (ref) v_u_13
			v_u_13.initiateBackButtonTeleport(Enum.AdTeleportMethod.InGameMenuBackButton)
		end
	}
	local v54 = {
		["UICorner"] = v_u_3.createElement("UICorner", {
			["CornerRadius"] = v_u_16.DefaultCornerRadius
		}),
		["UIStroke"] = v_u_3.createElement("UIStroke", {
			["Color"] = v_u_16.color("DefaultButtonStroke"),
			["Transparency"] = v_u_16.transparency("DefaultButtonStroke"),
			["Thickness"] = v_u_16.DefaultStokeThickness
		})
	}
	local v55 = v_u_3.createElement
	local v56 = "Frame"
	local v57 = {
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 4, 0, 0)
	}
	local v58 = {
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingRight"] = UDim.new(0, 12)
		}),
		["Container"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v59
	if v_u_9 then
		v59 = v_u_3.createElement(v_u_8.Icon, {
			["name"] = "icons/actions/cycleLeft",
			["size"] = nil,
			["LayoutOrder"] = 1,
			["size"] = v_u_8.Enums.IconSize.Large
		})
	else
		v59 = v_u_3.createElement(v_u_7, {
			["Image"] = nil,
			["Size"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Image"] = v_u_6["icons/actions/cycleLeft"],
			["Size"] = UDim2.new(1, 0, 0.75, 0)
		}, {
			["UIAspectRatioConstraint"] = v_u_3.createElement("UIAspectRatioConstraint", {})
		})
	end
	v58.ImageLabel = v59
	local v60 = v_u_3.createElement
	local v61 = {
		["Text"] = p_u_38.state.text,
		["Size"] = UDim2.new(0, 0, 1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["Font"] = v_u_16.font(Enum.Font.SourceSansBold, "Bold"),
		["TextSize"] = p_u_38.textSizeBinding,
		["TextScaled"] = true,
		["TextWrapped"] = true,
		["LayoutOrder"] = 2,
		[v_u_3.Ref] = p_u_38.textLabelRef
	}
	local v62 = {
		["UITextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = p_u_38.textSizeConstraintBinding
		}),
		["UISizeConstraint"] = v_u_3.createElement("UISizeConstraint", {
			["MaxSize"] = p_u_38.sizeConstraintBinding
		})
	}
	v58.TextLabel = v60("TextLabel", v61, v62)
	v54.Frame = v55(v56, v57, v58)
	v47.ImageButton = v48(v49, v53, v54)
	return v39(v40, v46, v47)
end
return v14