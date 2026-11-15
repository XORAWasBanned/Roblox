-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MenuFrontButton
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
local v_u_13 = require(v2.Modules.Settings.FrontButtonController)
local v14 = v_u_3.PureComponent:extend("MenuFrontButton")
local v_u_15 = require(v2.Modules.TenFootInterface):IsEnabled()
if v_u_15 then
	v_u_15 = not v10
end
local v_u_16 = require(v2.Modules.Settings.Theme)
local v17 = game:DefineFastFlag("ShowTeleportHistoryFrontButton", false)
v14.validateProps = v5.strictInterface({
	["HubBar"] = v5.instanceOf("ImageLabel"),
	["frontEnabled"] = v5.boolean,
	["FrontBarRef"] = v5.optional(v5.table),
	["LayoutOrder"] = v5.optional(v5.integer)
})
local v18 = {}
if v17 then
	v17 = v_u_13.hasReturnUniverse()
end
v18.frontEnabled = v17
v14.defaultProps = v18
function v14.init(p19) -- name: init
	-- upvalues: (copy) v_u_13, (copy) v_u_3
	p19:setState({
		["text"] = v_u_13.getMenuText()
	})
	local v20, v21 = v_u_3.createBinding(nil)
	p19.sizeBinding = v20
	p19.updateSizeBinding = v21
	local v22, v23 = v_u_3.createBinding(nil)
	p19.sizeConstraintBinding = v22
	p19.updateSizeConstraintBinding = v23
	local v24, v25 = v_u_3.createBinding(nil)
	p19.visibleBinding = v24
	p19.updateVisibleBinding = v25
	local v26, v27 = v_u_3.createBinding(nil)
	p19.buttonHeightBinding = v26
	p19.updateButtonHeightBinding = v27
	local v28, v29 = v_u_3.createBinding(nil)
	p19.textSizeBinding = v28
	p19.updateTextSizeBinding = v29
	local v30, v31 = v_u_3.createBinding(nil)
	p19.textSizeConstraintBinding = v30
	p19.updateTextSizeConstraintBinding = v31
	p19.textLabelRef = v_u_3.createRef()
end
function v14.didMount(p32) -- name: didMount
	p32.updateSizeBinding(p32.props.HubBar.Size)
	p32.updateVisibleBinding(p32.props.HubBar.Visible)
	p32:updateViewport()
end
function v14.didUpdate(p33, p34) -- name: didUpdate
	if p33.props.HubBar ~= p34.HubBar then
		p33.updateSizeBinding(p33.props.HubBar.Size)
		p33.updateVisibleBinding(p33.props.HubBar.Visible)
	end
end
function v14.updateViewport(p35) -- name: updateViewport
	-- upvalues: (copy) v_u_16, (copy) v_u_12, (copy) v_u_15
	local v36 = v_u_16.textSize(24)
	if v_u_12:IsSmallTouchScreen() then
		v36 = v_u_16.textSize(18)
	elseif v_u_15 then
		v36 = v_u_16.textSize(36)
	end
	p35.updateTextSizeConstraintBinding(v36)
	local v37 = v_u_12:IsPortrait()
	local v38 = v_u_15 and 120 or v_u_16.LargeButtonHeight
	if v37 or v_u_12:IsSmallTouchScreen() then
		v38 = v_u_16.ButtonHeight
		v36 = v37 and v_u_16.textSize(16) or v_u_16.textSize(24)
	end
	p35.updateTextSizeBinding(v36)
	p35.updateButtonHeightBinding(v38)
	if p35.textLabelRef:getValue() and p35.props.FrontBarRef:getValue() then
		local v39 = p35.textLabelRef:getValue().AbsolutePosition.X - p35.props.FrontBarRef:getValue().AbsolutePosition.X
		p35.updateSizeConstraintBinding(Vector2.new(p35.props.FrontBarRef:getValue().AbsoluteSize.X - v39, (1 / 0)))
	end
end
function v14.render(p_u_40) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_16, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v41 = v_u_3.createElement
	local v42 = "Frame"
	local v48 = {
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(1, 0),
		["Position"] = UDim2.new(1, 0, 0, 0),
		["LayoutOrder"] = p_u_40.props.LayoutOrder,
		["Visible"] = v_u_3.joinBindings({ p_u_40.state.text, p_u_40.visibleBinding }):map(function(p43)
			-- upvalues: (copy) p_u_40
			local v44 = p_u_40.props.frontEnabled
			if v44 then
				if p43[1] == nil then
					v44 = false
				else
					v44 = p43[2]
				end
			end
			return v44
		end),
		["Size"] = v_u_3.joinBindings({ p_u_40.sizeBinding, p_u_40.buttonHeightBinding }):map(function(p45)
			local v46 = p45[1]
			local v47 = p45[2]
			if v46 and v47 then
				return UDim2.new(UDim.new(v46.X.Scale * 0.5, v46.X.Offset * 0.5), UDim.new(0, v47 + 6))
			else
				return UDim2.new()
			end
		end),
		[v_u_3.Ref] = p_u_40.props.FrontBarRef
	}
	local v49 = {
		["SizeConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = p_u_40.props.HubBar:GetPropertyChangedSignal("Size"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_40
				p_u_40.updateSizeBinding(p_u_40.props.HubBar.Size)
			end
		}),
		["VisibleConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = p_u_40.props.HubBar:GetPropertyChangedSignal("Visible"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_40
				p_u_40.updateVisibleBinding(p_u_40.props.HubBar.Visible)
			end
		}),
		["ViewportSizeChangedConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_40
				p_u_40:updateViewport()
			end
		}),
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 6),
			["PaddingTop"] = UDim.new(0, 10)
		})
	}
	local v50 = v_u_3.createElement
	local v51 = "ImageButton"
	local v55 = {
		["Image"] = "",
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = v_u_16.color("DefaultButton"),
		["BackgroundTransparency"] = v_u_16.transparency("DefaultButton", 1),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = p_u_40.buttonHeightBinding:map(function(p52)
			if p52 then
				return UDim2.new(0, 0, 0, p52)
			else
				return UDim2.new()
			end
		end),
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["ScaleType"] = Enum.ScaleType.Stretch,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		[v_u_3.Event.MouseEnter] = function(p53)
			-- upvalues: (ref) v_u_16
			p53.BackgroundColor3 = v_u_16.color("DefaultButtonHover")
			p53.BackgroundTransparency = v_u_16.transparency("DefaultButtonHover")
		end,
		[v_u_3.Event.MouseLeave] = function(p54)
			-- upvalues: (ref) v_u_16
			p54.BackgroundColor3 = v_u_16.color("DefaultButton")
			p54.BackgroundTransparency = v_u_16.transparency("DefaultButton")
		end,
		[v_u_3.Event.Activated] = function(_)
			-- upvalues: (ref) v_u_13
			v_u_13.initiateFrontButtonTeleport()
		end
	}
	local v56 = {
		["UICorner"] = v_u_3.createElement("UICorner", {
			["CornerRadius"] = v_u_16.DefaultCornerRadius
		}),
		["UIStroke"] = v_u_3.createElement("UIStroke", {
			["Color"] = v_u_16.color("DefaultButtonStroke"),
			["Transparency"] = v_u_16.transparency("DefaultButtonStroke"),
			["Thickness"] = v_u_16.DefaultStokeThickness
		})
	}
	local v57 = v_u_3.createElement
	local v58 = "Frame"
	local v59 = {
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 4, 0, 0)
	}
	local v60 = {
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingRight"] = UDim.new(0, 12)
		}),
		["Container"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v61 = v_u_3.createElement
	local v62 = {
		["Text"] = p_u_40.state.text,
		["Size"] = UDim2.new(0, 0, 1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["Font"] = v_u_16.font(Enum.Font.SourceSansBold, "Bold"),
		["TextSize"] = p_u_40.textSizeBinding,
		["TextScaled"] = true,
		["TextWrapped"] = true,
		["LayoutOrder"] = 1,
		[v_u_3.Ref] = p_u_40.textLabelRef
	}
	local v63 = {
		["UITextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = p_u_40.textSizeConstraintBinding
		}),
		["UISizeConstraint"] = v_u_3.createElement("UISizeConstraint", {
			["MaxSize"] = p_u_40.sizeConstraintBinding
		})
	}
	v60.TextLabel = v61("TextLabel", v62, v63)
	local v64
	if v_u_9 then
		v64 = v_u_3.createElement(v_u_8.Icon, {
			["name"] = "icons/actions/cycleRight",
			["size"] = nil,
			["LayoutOrder"] = 2,
			["size"] = v_u_8.Enums.IconSize.Large
		})
	else
		v64 = v_u_3.createElement(v_u_7, {
			["Image"] = nil,
			["Size"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Image"] = v_u_6["icons/actions/cycleRight"],
			["Size"] = UDim2.new(1, 0, 0.75, 0)
		}, {
			["UIAspectRatioConstraint"] = v_u_3.createElement("UIAspectRatioConstraint", {})
		})
	end
	v60.ImageLabel = v64
	v56.Frame = v57(v58, v59, v60)
	v49.ImageButton = v50(v51, v55, v56)
	return v41(v42, v48, v49)
end
return v14