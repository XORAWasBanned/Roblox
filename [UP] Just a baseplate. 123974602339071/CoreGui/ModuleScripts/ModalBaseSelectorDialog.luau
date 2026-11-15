-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.ModalBaseSelectorDialog
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Foundation).Hooks.useTokens
local v4 = require(v2.Packages.UIBlox)
local v_u_5 = require(v2.Packages.React)
local v_u_6 = v4.App.Table.ScrollingListTable
local v_u_7 = v4.App.Table.CellHeadDetail
local v_u_8 = v4.App.Table.Cell
local v_u_9 = v4.App.Table.CellTailDescription
local v_u_10 = v4.App.Dialog.Modal.ModalWindow
local v_u_11 = require(v2.Packages.Dash)
local v_u_12 = require(v2.Packages.Cryo)
local v_u_13 = v4.Core.Style.useStyle
local v_u_14 = v4.App.Button.IconButton
local v_u_15 = v4.App.ImageSet.Enum.IconSize
local v_u_16 = v4.Utility.OpenTypeSupport
local v_u_17 = v4.App.ImageSet.Images
local v_u_18 = require(v2.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v19 = require(v2.Workspace.Packages.FocusNavigationUtils)
local v_u_20 = v19.FocusRoot
local v_u_21 = v19.FocusNavigableSurfaceIdentifierEnum
local v22 = require(v2.Workspace.Packages.SharedFlags)
local v_u_23 = require(v1.Flags.GetFFlagModalSelectorCloseButton)
local v_u_24 = v22.GetFFlagLuaAppEnableOpenTypeSupport
local v_u_25 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_26, v_u_27, v_u_28
if v_u_25 then
	v_u_26 = require(v2.Workspace.Packages.Responsive)
	local v29 = require(v2.Workspace.Packages.VrSpatialUi)
	v_u_27 = v29.UIManager
	v_u_28 = v29.Constants.PanelType
else
	v_u_26 = nil
	v_u_27 = nil
	v_u_28 = nil
end
local function v_u_67(p_u_30) -- name: ModalBaseSelectorDialog
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_28, (copy) v_u_5, (copy) v_u_23, (copy) v_u_12, (copy) v_u_14, (copy) v_u_15, (copy) v_u_17, (copy) v_u_6, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (copy) v_u_24, (copy) v_u_16, (copy) v_u_9, (copy) v_u_10
	local v_u_31 = v_u_3()
	local v32 = v_u_13()
	local v33 = v32.Theme
	local v34 = v32.Tokens.Size.Size_1000
	local v35
	if v_u_25 then
		local v36 = v_u_26.useIsSpatial()
		local v37 = p_u_30.viewportHeight
		if v36 then
			v37 = v_u_27.getInstance():getPanelObject(v_u_28.MoreMenu).AbsoluteSize.Y
		end
		local v38 = #p_u_30.cellData * v_u_31.Size.Size_1000
		local v39 = v37 - 80 - 24
		v35 = math.min(v38, v39)
	else
		local v40 = #p_u_30.cellData * v_u_31.Size.Size_1000
		local v41 = p_u_30.viewportHeight - 80 - 24
		v35 = math.min(v40, v41)
	end
	local v42 = v35 + 24
	local v43 = {
		["Paddings"] = v_u_5.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingBottom"] = UDim.new(0, 12),
			["PaddingLeft"] = UDim.new(0, 12),
			["PaddingRight"] = UDim.new(0, 12)
		})
	}
	local v44, v45
	if v_u_23() then
		v42 = v35 + 48 + v34
		local v46 = v_u_12.Dictionary.join
		local v47 = {
			["Layout"] = v_u_5.createElement("UIListLayout", {
				["FillDirection"] = nil,
				["SortOrder"] = nil,
				["HorizontalAlignment"] = 0,
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Header"] = v_u_5.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v34)
			}, {
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
				}),
				["CloseButton"] = v_u_5.createElement(v_u_14, {
					["size"] = UDim2.fromOffset(0, 0),
					["iconSize"] = v_u_15.Medium,
					["icon"] = v_u_17["icons/navigation/close"],
					["onActivated"] = function() -- name: onActivated
						-- upvalues: (copy) p_u_30
						p_u_30.onClose()
					end
				})
			}),
			["Divider"] = v_u_5.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1),
				["BackgroundTransparency"] = v32.Theme.Divider.Transparency,
				["BackgroundColor3"] = v32.Theme.Divider.Color
			})
		}
		v43 = v46(v43, v47)
		v44 = -36
		v45 = 12
	else
		v44 = 0
		v45 = 0
	end
	local v48 = v_u_12.Dictionary.join
	local v57 = {
		["SelectorFrame"] = v_u_5.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3,
			["Size"] = UDim2.new(1, 0, 1, v44)
		}, {
			["Paddings"] = v_u_5.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v45)
			}),
			["ModalSelector"] = v_u_5.createElement(v_u_6, {
				["selectable"] = false,
				["size"] = nil,
				["cells"] = nil,
				["size"] = UDim2.new(1, 0, 1, 0),
				["cells"] = v_u_11.map(p_u_30.cellData, function(p_u_49)
					-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_7, (ref) v_u_24, (ref) v_u_16, (ref) v_u_9, (copy) v_u_31, (copy) p_u_30
					local v50 = v_u_5.createElement
					local v51 = v_u_8
					local v52 = {
						["head"] = nil,
						["tail"] = nil,
						["background"] = nil,
						["size"] = nil,
						["userInteractionEnabled"] = true,
						["onActivated"] = nil
					}
					local v53 = v_u_5.createElement
					local v54 = v_u_7
					local v55 = {
						["labelText"] = p_u_49.label,
						["subLabelText"] = p_u_49.subLabel
					}
					local v56
					if v_u_24() then
						v56 = v_u_16:getUserNameStylisticAlternative()
					else
						v56 = nil
					end
					v55.openTypeFeatures = v56
					v52.head = v53(v54, v55)
					v52.tail = v_u_5.createElement(v_u_9, {
						["text"] = "",
						["showArrow"] = false
					})
					v52.background = v_u_5.createElement("Frame", {
						["BackgroundTransparency"] = 1,
						["Size"] = nil,
						["Size"] = UDim2.fromScale(1, 1)
					})
					v52.size = UDim2.new(1, 0, 0, v_u_31.Size.Size_1000)
					function v52.onActivated() -- name: onActivated
						-- upvalues: (ref) p_u_30, (copy) p_u_49
						p_u_30.onSelect(p_u_49.label, p_u_49.subLabel, p_u_49.identifier)
						p_u_30.onClose()
					end
					return v50(v51, v52)
				end)
			})
		})
	}
	local v58 = v48(v43, v57)
	local v59 = v_u_5.createElement
	local v60 = "Frame"
	local v61 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0)
	}
	local v62 = {}
	local v63
	if p_u_30.isShown then
		local v64 = v_u_5.createElement
		local v65 = {
			["Selectable"] = false,
			["AutoButtonColor"] = false,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = v33.Overlay.Color,
			["BackgroundTransparency"] = v33.Overlay.Transparency,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ZIndex"] = 10,
			["Text"] = "",
			[v_u_5.Event.Activated] = function()
				-- upvalues: (copy) p_u_30
				p_u_30.onClose()
			end
		}
		local v66 = {
			["Modal"] = v_u_5.createElement(v_u_10, {
				["isFullHeight"] = false,
				["screenSize"] = nil,
				["screenSize"] = Vector2.new(p_u_30.viewportWidth, p_u_30.viewportHeight)
			}, {
				["ModalContent"] = v_u_5.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 0,
					["BackgroundColor3"] = nil,
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["Size"] = UDim2.new(1, 0, 0, v42),
					["BackgroundColor3"] = v33.BackgroundDefault.Color,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 0.5, 20)
				}, v58)
			})
		}
		v63 = v64("TextButton", v65, v66)
	else
		v63 = nil
	end
	v62.Overlay = v63
	return v59(v60, v61, v62)
end
function DialogWrapper(p68) -- name: DialogWrapper
	-- upvalues: (copy) v_u_5, (copy) v_u_18, (copy) v_u_20, (copy) v_u_21, (copy) v_u_67
	local v69 = v_u_5.createElement
	local v70 = v_u_18
	local v71 = {
		["FocusNavigationCoreScriptsWrapper"] = v_u_5.createElement(v_u_20, {
			["surfaceIdentifier"] = nil,
			["isIsolated"] = true,
			["isAutoFocusRoot"] = true,
			["surfaceIdentifier"] = v_u_21.CentralOverlay
		}, {
			["DialogContainer"] = v_u_5.createElement(v_u_67, p68)
		})
	}
	return v69(v70, {}, v71)
end
return DialogWrapper