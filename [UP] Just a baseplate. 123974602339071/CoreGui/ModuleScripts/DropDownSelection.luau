-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.DropDownSelection
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.UIBlox
local v7 = v4.t
local v8 = script.Parent.Parent
local v_u_9 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_10 = require(v8.Resources.Assets)
local v_u_11 = require(v8.Utility.divideTransparency)
local v_u_12 = require(script.Parent.ThemedButton)
local v_u_13 = require(script.Parent.ThemedTextLabel)
local v_u_14 = require(script.Parent.Divider)
local v_u_15 = require(script.Parent.BarOnTopScrollingFrame)
local v_u_16 = require(script.Parent.Connection.FocusHandler)
local v_u_17 = require(v8.Localization.withLocalization)
local v_u_18 = v6.Core.ImageSet.ImageSetLabel
local v19 = v_u_5.PureComponent:extend("DropDownSelection")
v19.validateProps = v7.intersection(v7.strictInterface({
	["Size"] = v7.UDim2,
	["Position"] = v7.optional(v7.UDim2),
	["LayoutOrder"] = v7.optional(v7.integer),
	["placeHolderText"] = v7.optional(v7.string),
	["selectedIndex"] = v7.numberMin(0),
	["selections"] = v7.array(v7.string),
	["localize"] = v7.boolean,
	["enabled"] = v7.boolean,
	["truncate"] = v7.optional(v7.boolean),
	["selectionChanged"] = v7.callback,
	["canOpen"] = v7.optional(v7.boolean),
	["canCaptureFocus"] = v7.optional(v7.boolean),
	["selectionParentName"] = v7.optional(v7.string),
	["ButtonRef"] = v7.optional(v7.table)
}), function(p20)
	if p20.selectedIndex > #p20.selections then
		return false, "selectedIndex must not be greater than the number of selections"
	else
		return true
	end
end)
v19.defaultProps = {
	["canOpen"] = true
}
function v19.init(p21) -- name: init
	-- upvalues: (copy) v_u_5
	p21.rootRef = v_u_5.createRef()
	p21.firstOptionRef = v_u_5.createRef()
	p21.openDropDownButtonRef = p21.props.ButtonRef or v_u_5.createRef()
	p21.state = {
		["isOpen"] = false,
		["dropDownItemHeight"] = 10,
		["absolutePositionX"] = 0,
		["absolutePositionY"] = 0,
		["screenSizeX"] = 0,
		["screenSizeY"] = 0
	}
	p21.ancestryConnection = nil
	p21.sizeConnection = nil
end
function v19.getDerivedStateFromProps(p22) -- name: getDerivedStateFromProps
	return not p22.canOpen and {
		["isOpen"] = false
	} or nil
end
function v19.renderDropDownList(p_u_23, p_u_24, p25) -- name: renderDropDownList
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_10, (copy) v_u_11, (copy) v_u_18, (copy) v_u_13, (copy) v_u_14
	local v26 = {
		["Layout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	for v_u_27, v_u_29 in ipairs(p_u_23.props.selections) do
		if p_u_23.props.localize then
			local v_u_29 = p25[v_u_27]
		end
		local v_u_30 = p_u_23.props.truncate and v_u_27 == 1 and -48 or -25
		local v31 = "button" .. v_u_27
		local v32 = v_u_5.createElement
		local v33 = v_u_12
		local v34 = {
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["onActivated"] = nil,
			["normalThemeKey"] = "BackgroundUIDefault",
			["hoverThemeKey"] = "BackgroundOnHover",
			["ButtonRef"] = nil,
			["imageProps"] = nil,
			["renderChildren"] = nil,
			["Size"] = UDim2.new(1, 0, 0, p_u_23.state.dropDownItemHeight - 1),
			["LayoutOrder"] = v_u_27 * 2,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_23, (copy) v_u_27
				p_u_23:setState({
					["isOpen"] = false
				})
				p_u_23.props.selectionChanged(v_u_27)
			end
		}
		local v35
		if v_u_27 == 1 then
			v35 = p_u_23.firstOptionRef or nil
		else
			v35 = nil
		end
		v34.ButtonRef = v35
		v34.imageProps = v_u_10.Images.WhiteSquare
		function v34.renderChildren(_, p36, p37) -- name: renderChildren
			-- upvalues: (copy) p_u_24, (ref) v_u_11, (ref) v_u_5, (ref) v_u_18, (ref) v_u_10, (copy) p_u_23, (copy) v_u_27, (ref) v_u_13, (ref) v_u_30, (ref) v_u_29
			local v38 = p36 and p_u_24.Theme.IconOnHover or p_u_24.Theme.IconDefault
			local v39 = v38.Color
			local v40 = v_u_11(v38.Transparency, p37 and 2 or 1)
			local v41 = {
				["SelectedIcon"] = v_u_5.createElement(v_u_18, {
					["BackgroundTransparency"] = 1,
					["AnchorPoint"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["Visible"] = nil,
					["AnchorPoint"] = Vector2.new(1, 0.5),
					["Size"] = UDim2.new(0, 15, 0, 12),
					["Position"] = UDim2.new(1, -25, 0.5, 0),
					["Image"] = v_u_10.Images.SelectedCheck,
					["ImageColor3"] = v39,
					["ImageTransparency"] = v40,
					["Visible"] = p_u_23.props.selectedIndex == v_u_27
				})
			}
			local v42 = v_u_5.createElement
			local v43 = v_u_13
			local v44 = {
				["fontKey"] = "Header2",
				["themeKey"] = "TextEmphasis",
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextTruncate"] = nil,
				["TextXAlignment"] = nil,
				["Position"] = UDim2.new(0, 25, 0, 0),
				["Size"] = UDim2.new(1, v_u_30, 1, 0),
				["Text"] = v_u_29
			}
			local v45
			if p_u_23.props.truncate then
				v45 = Enum.TextTruncate.AtEnd
			else
				v45 = Enum.TextTruncate.None
			end
			v44.TextTruncate = v45
			v44.TextXAlignment = Enum.TextXAlignment.Left
			v41.TextLabel = v42(v43, v44)
			return v41
		end
		v26[v31] = v32(v33, v34)
		if v_u_27 >= #p_u_23.props.selections then
			continue
		end
		v26["divider" .. v_u_27] = v_u_5.createElement(v_u_14, {
			["LayoutOrder"] = v_u_27 * 2 + 1
		})
	end
	return v26
end
function v19.renderFocusHandler(p_u_46) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_2, (copy) v_u_3
	local v47
	if p_u_46.props.selectionParentName then
		local v48 = v_u_5.createElement
		local v49 = v_u_16
		local v50 = {}
		local v51 = p_u_46.props.canOpen
		if v51 then
			v51 = p_u_46.state.isOpen
		end
		v50.isFocused = v51
		function v50.didFocus() -- name: didFocus
			-- upvalues: (ref) v_u_2, (copy) p_u_46, (ref) v_u_3
			v_u_2:BindCoreAction("settings_dropdown_close_action", function(_, p52)
				-- upvalues: (ref) p_u_46
				if p52 ~= Enum.UserInputState.End then
					return Enum.ContextActionResult.Pass
				end
				p_u_46:setState({
					["isOpen"] = false
				})
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB)
			if p_u_46.props.canCaptureFocus then
				v_u_3:RemoveSelectionGroup(p_u_46.props.selectionParentName)
				v_u_3:AddSelectionParent(p_u_46.props.selectionParentName, p_u_46.rootRef.current)
				v_u_3.SelectedCoreObject = p_u_46.firstOptionRef.current
			end
		end
		function v50.didBlur() -- name: didBlur
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_46
			v_u_2:UnbindCoreAction("settings_dropdown_close_action")
			v_u_3:RemoveSelectionGroup(p_u_46.props.selectionParentName)
			if p_u_46.props.canOpen and (not p_u_46.state.isOpen and p_u_46.props.canCaptureFocus) then
				v_u_3.SelectedCoreObject = p_u_46.openDropDownButtonRef.current
			end
		end
		v47 = v48(v49, v50) or nil
	else
		v47 = nil
	end
	return v47
end
function v19.render(p_u_53) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_10, (copy) v_u_5, (copy) v_u_12, (copy) v_u_11, (copy) v_u_18, (copy) v_u_13, (copy) v_u_15
	return v_u_9(function(p54)
		local v55 = {}
		local v56 = {
			["BackgroundUIDefault"] = {
				["Color"] = p54.Color.Surface.Surface_300.Color3,
				["Transparency"] = p54.Color.Surface.Surface_300.Transparency
			},
			["IconDefault"] = {
				["Color"] = p54.Color.Content.Default.Color3,
				["Transparency"] = p54.Color.Content.Default.Transparency
			},
			["IconOnHover"] = {
				["Color"] = p54.Color.Content.Emphasis.Color3,
				["Transparency"] = p54.Color.Content.Emphasis.Transparency
			}
		}
		v55.Theme = v56
		return v55
	end, function(p_u_57)
		-- upvalues: (ref) v_u_17, (copy) p_u_53, (ref) v_u_10, (ref) v_u_5, (ref) v_u_12, (ref) v_u_11, (ref) v_u_18, (ref) v_u_13, (ref) v_u_15
		return v_u_17(p_u_53.props.localize and p_u_53.props.selections or {})(function(p58)
			-- upvalues: (ref) p_u_53, (ref) v_u_10, (copy) p_u_57, (ref) v_u_5, (ref) v_u_12, (ref) v_u_11, (ref) v_u_18, (ref) v_u_13, (ref) v_u_15
			local v_u_59 = p_u_53.props.placeHolderText
			if p_u_53.props.selectedIndex > 0 then
				if p_u_53.props.localize then
					v_u_59 = p58[p_u_53.props.selectedIndex]
				else
					v_u_59 = p_u_53.props.selections[p_u_53.props.selectedIndex]
				end
			end
			local v60 = v_u_10.Images.Shadow.Size
			local v61 = #p_u_53.props.selections
			local v62 = math.min(v61, 7.5) * 44
			local v63 = p_u_53:renderDropDownList(p_u_57, p58)
			local v64 = v_u_5.createElement
			local v67 = {
				["Size"] = p_u_53.props.Size,
				["Position"] = p_u_53.props.Position,
				["LayoutOrder"] = p_u_53.props.LayoutOrder,
				["BackgroundTransparency"] = 1,
				[v_u_5.Ref] = p_u_53.rootRef,
				[v_u_5.Change.AbsoluteSize] = function(p65)
					-- upvalues: (ref) p_u_53
					p_u_53:setState({
						["dropDownItemHeight"] = p65.AbsoluteSize.Y
					})
				end,
				[v_u_5.Change.AbsolutePosition] = function(p66)
					-- upvalues: (ref) p_u_53
					p_u_53:setState({
						["absolutePositionX"] = p66.AbsolutePosition.X,
						["absolutePositionY"] = p66.AbsolutePosition.Y
					})
				end
			}
			local v79 = {
				["OpenDropDownButton"] = v_u_5.createElement(v_u_12, {
					["Size"] = nil,
					["Visible"] = nil,
					["enabled"] = nil,
					["onActivated"] = nil,
					["normalThemeKey"] = "SecondaryDefault",
					["hoverThemeKey"] = "SecondaryOnHover",
					["imageProps"] = nil,
					["renderChildren"] = nil,
					["ButtonRef"] = nil,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Visible"] = not p_u_53.state.isOpen,
					["enabled"] = p_u_53.props.enabled,
					["onActivated"] = function() -- name: onActivated
						-- upvalues: (ref) p_u_53
						p_u_53:setState({
							["isOpen"] = true
						})
					end,
					["imageProps"] = v_u_10.Images.RoundedRectBorder,
					["renderChildren"] = function(p68, p69, p70) -- name: renderChildren
						-- upvalues: (ref) p_u_57, (ref) v_u_11, (ref) v_u_5, (ref) v_u_18, (ref) v_u_10, (ref) v_u_13, (ref) v_u_59, (ref) p_u_53
						local v71 = p69 and p_u_57.Theme.IconOnHover or p_u_57.Theme.IconDefault
						local v72 = v71.Color
						local v73 = v_u_11(v71.Transparency, p70 and 2 or 1)
						local v74 = {
							["ButtonIcon"] = v_u_5.createElement(v_u_18, {
								["BackgroundTransparency"] = 1,
								["Size"] = nil,
								["Position"] = nil,
								["AnchorPoint"] = nil,
								["Image"] = nil,
								["ImageColor3"] = nil,
								["ImageTransparency"] = nil,
								["Size"] = UDim2.new(0, 36, 0, 36),
								["Position"] = UDim2.new(1, -16, 0.5, 0),
								["AnchorPoint"] = Vector2.new(1, 0.5),
								["Image"] = v_u_10.Images.ExpandArrow,
								["ImageColor3"] = v72,
								["ImageTransparency"] = v73
							})
						}
						local v75 = v_u_5.createElement
						local v76 = v_u_13
						local v77 = {
							["Text"] = nil,
							["themeKey"] = "SecondaryContent",
							["fontKey"] = "Header2",
							["Position"] = nil,
							["Size"] = nil,
							["TextTransparency"] = nil,
							["TextTruncate"] = nil,
							["TextXAlignment"] = nil,
							["Text"] = v_u_59,
							["Position"] = UDim2.new(0, 12, 0, 0),
							["Size"] = UDim2.new(1, p_u_53.props.truncate and -48 or -12, 1, 0),
							["TextTransparency"] = p68
						}
						local v78
						if p_u_53.props.truncate then
							v78 = Enum.TextTruncate.AtEnd
						else
							v78 = Enum.TextTruncate.None
						end
						v77.TextTruncate = v78
						v77.TextXAlignment = Enum.TextXAlignment.Left
						v74.ButtonText = v75(v76, v77)
						return v74
					end,
					["ButtonRef"] = p_u_53.openDropDownButtonRef
				}),
				["CloseDropDownArea"] = v_u_5.createElement("TextButton", {
					["BackgroundTransparency"] = 1,
					["Text"] = "",
					["Position"] = UDim2.new(0, -p_u_53.state.absolutePositionX, 0, -p_u_53.state.absolutePositionY),
					["Size"] = UDim2.new(0, p_u_53.state.screenSizeX, 0, p_u_53.state.screenSizeY),
					["Visible"] = p_u_53.state.isOpen,
					["Selectable"] = false,
					[v_u_5.Event.Activated] = function()
						-- upvalues: (ref) p_u_53
						p_u_53:setState({
							["isOpen"] = false
						})
					end,
					["ZIndex"] = 2
				})
			}
			local v80 = v_u_5.createElement
			local v81 = v_u_18
			local v82 = {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["Visible"] = nil,
				["ZIndex"] = 3,
				["Image"] = v_u_10.Images.Shadow.Image,
				["Position"] = UDim2.new(0, -v60, 0, -v60),
				["Size"] = UDim2.new(1, v60 * 2, 0, v60 * 2 + 8 + v62),
				["ScaleType"] = v_u_10.Images.Shadow.ScaleType,
				["SliceCenter"] = v_u_10.Images.Shadow.SliceCenter,
				["Visible"] = p_u_53.state.isOpen
			}
			local v83 = {
				["FocusHandler"] = p_u_53:renderFocusHandler()
			}
			local v84 = v_u_5.createElement
			local v85 = v_u_18
			local v86 = {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["ScaleType"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["SliceCenter"] = nil,
				["SliceScale"] = 0.5,
				["Image"] = v_u_10.Images.RoundedRect.Image,
				["ImageColor3"] = p_u_57.Theme.BackgroundUIDefault.Color,
				["ImageTransparency"] = p_u_57.Theme.BackgroundUIDefault.Transparency,
				["ScaleType"] = v_u_10.Images.RoundedRect.ScaleType,
				["Size"] = UDim2.new(1, -(v60 * 2), 1, -(v60 * 2)),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["SliceCenter"] = v_u_10.Images.RoundedRect.SliceCenter
			}
			local v87 = {
				["DropDownList"] = v_u_5.createElement(v_u_15, {
					["Position"] = UDim2.new(0, 0, 0, 4),
					["Size"] = UDim2.new(1, 0, 1, -8),
					["CanvasSize"] = UDim2.new(1, 0, 0, #p_u_53.props.selections * p_u_53.state.dropDownItemHeight)
				}, v63)
			}
			v83.DropDownBackground = v84(v85, v86, v87)
			v79.DropDownShadow = v80(v81, v82, v83)
			return v64("Frame", v67, v79)
		end)
	end)
end
function v19.watchLayerCollector(p_u_88, p_u_89) -- name: watchLayerCollector
	p_u_88:setState({
		["screenSizeX"] = p_u_89.AbsoluteSize.X,
		["screenSizeY"] = p_u_89.AbsoluteSize.Y
	})
	p_u_88.sizeConnection = p_u_89:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: (copy) p_u_88, (copy) p_u_89
		p_u_88:setState({
			["screenSizeX"] = p_u_89.AbsoluteSize.X,
			["screenSizeY"] = p_u_89.AbsoluteSize.Y
		})
	end)
end
function v19.didMount(p_u_90) -- name: didMount
	local v_u_91 = p_u_90.rootRef.current
	local v_u_92 = v_u_91:FindFirstAncestorWhichIsA("LayerCollector")
	if v_u_92 == nil then
		p_u_90.ancestryConnection = v_u_91.AncestryChanged:Connect(function()
			-- upvalues: (ref) v_u_92, (copy) v_u_91, (copy) p_u_90
			v_u_92 = v_u_91:FindFirstAncestorWhichIsA("LayerCollector")
			if v_u_92 ~= nil then
				p_u_90.ancestryConnection:Disconnect()
				p_u_90.ancestryConnection = nil
				p_u_90:watchLayerCollector(v_u_92)
			end
		end)
	else
		p_u_90:watchLayerCollector(v_u_92)
	end
end
function v19.didUpdate(p93, p94) -- name: didUpdate
	-- upvalues: (copy) v_u_5
	if p94.ButtonRef ~= p93.props.ButtonRef then
		p93.openDropDownButtonRef = p93.props.ButtonRef or v_u_5.createRef()
	end
	if p93.state.isOpen and p94.canCaptureFocus ~= p93.props.canCaptureFocus then
		p93:setState({
			["isOpen"] = false
		})
	end
end
function v19.willUnmount(p95) -- name: willUnmount
	if p95.ancestryConnection then
		p95.ancestryConnection:Disconnect()
	end
	if p95.sizeConnection then
		p95.sizeConnection:Disconnect()
	end
end
return v19