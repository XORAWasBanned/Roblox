-- Path: CoreGui.RobloxGui.Modules.SelfieView.Components.Window
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v4 = v1.Packages
local v_u_5 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_6 = require(v4.React)
local v7 = require(v1.Workspace.Packages.RoactUtils)
local v_u_8 = require(v1.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local v_u_9 = v7.Hooks.RoactRodux.useSelector
local v10 = require(v4.LuauPolyfill)
local v_u_11 = v10.setTimeout
local v_u_12 = v10.clearTimeout
require(script.Parent.Parent.Parent.Chrome.ChromeShared.Service.WindowSizeSignal)
local v_u_13 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge)
local v14 = require(v4.UIBlox)
local v_u_15 = v14.Core.Control.Interactable
local v_u_16 = v14.App.Text.StyledTextLabel
local v_u_17 = v14.Core.Style.useStyle
local v_u_18 = v14.App.Dialog.TooltipV2.withTooltip
local v_u_19 = v14.App.Dialog.Enum.TooltipOrientation
local v_u_20 = v14.Core.Control.Enum.ControlState
local v21 = v14.App.ImageSet.Images
local v_u_22 = v14.Core.ImageSet.ImageSetLabel
local v_u_23 = require(script.Parent.CameraStatusIcon)
local v_u_24 = require(script.Parent.CameraStatusDot)
local v_u_25 = require(script.Parent.Parent.Utils.SizingUtils)
local v_u_26 = require(script.Parent.Parent.Utils.FaceChatUtils)
local v_u_27 = require(script.Parent.Parent.Utils.ModelUtils)
local v_u_28 = require(script.Parent.Parent.Hooks.useCameraOn)
local v_u_29 = require(script.Parent.Parent.Hooks.useLocalPlayer)
local v_u_30 = require(script.Parent.Parent.Hooks.useTrackerMessage)
local v_u_31 = require(script.Parent.Parent.Hooks.useTooltipDismissal)
local v_u_32 = require(v_u_2.RobloxGui.Modules.Common.Hooks.useScreenSize)
local v_u_33 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Unibar.Constants)
local v34 = script.Parent.Parent.Parent.Chrome
local v_u_35
if require(v1.Workspace.Packages.Chrome).Enabled() then
	v_u_35 = require(v34.Service)
else
	v_u_35 = nil
end
local v_u_36 = require(v1.Workspace.Packages.Chrome).UnibarStyle
local v_u_37 = require(v34.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_38 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v_u_39 = game:DefineFastFlag("ReactDevtoolsFixTopbar", true)
local v_u_40 = require(v3.Modules.SelfView.Analytics).new()
local v_u_41 = v21["icons/actions/previewShrink"]
local v_u_42 = v21["icons/actions/previewExpand"]
local v_u_43 = require(script.Parent.FaceClone)
return function(p_u_44) -- name: Window
	-- upvalues: (copy) v_u_17, (copy) v_u_37, (copy) v_u_36, (copy) v_u_33, (copy) v_u_8, (copy) v_u_5, (copy) v_u_28, (copy) v_u_30, (copy) v_u_13, (copy) v_u_32, (copy) v_u_38, (copy) v_u_25, (copy) v_u_9, (copy) v_u_6, (copy) v_u_29, (copy) v_u_26, (copy) v_u_31, (copy) v_u_12, (copy) v_u_11, (copy) v_u_27, (copy) v_u_40, (copy) v_u_43, (copy) v_u_20, (copy) v_u_15, (copy) v_u_23, (copy) v_u_35, (copy) v_u_22, (copy) v_u_41, (copy) v_u_42, (copy) v_u_16, (copy) v_u_39, (copy) v_u_18, (copy) v_u_2, (copy) v_u_19, (copy) v_u_24
	local v_u_45 = p_u_44.id
	local v_u_46 = v_u_17()
	local v47 = v_u_46.Theme
	local v48 = v_u_46.Font
	local v49
	if v_u_37 then
		v49 = v_u_36.use().CLOSE_BUTTON_FRAME
	else
		v49 = v_u_33.CLOSE_BUTTON_FRAME
	end
	local v_u_51 = v_u_5({
		["robloxPermissionErrorHeader"] = "CoreScripts.TopBar.RobloxPermissionErrorHeader",
		["robloxPermissionErrorBody"] = nil,
		["dynamicAvatarMissingErrorHeader"] = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader",
		["dynamicAvatarMissingErrorBody"] = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody",
		["robloxPermissionErrorBody"] = v_u_8(function(p50)
			return p50.getShowUpdatedCameraPath()
		end) and "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" or "CoreScripts.TopBar.RobloxPermissionErrorBody"
	})
	local v52 = v_u_28()
	local v53 = v_u_30()
	local v_u_54 = v_u_13(p_u_44.windowSize)
	local v55 = v_u_32()
	local v_u_56
	if v_u_38 then
		v_u_56 = v_u_25.getSize(v55, v_u_54)
	else
		v_u_56 = v_u_9(function(p57)
			-- upvalues: (ref) v_u_25, (copy) v_u_54
			return v_u_25.getSize(p57.displayOptions.screenSize, v_u_54)
		end)
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) p_u_44, (copy) v_u_56
		p_u_44.windowSize:requestSize(v_u_56.X, v_u_56.Y)
	end, { v_u_56 })
	local v_u_58 = v_u_29()
	local v60 = v_u_6.useMemo(function()
		-- upvalues: (ref) v_u_26
		local v59 = v_u_26.getPermissions().userCamEligible
		if v59 then
			v59 = v_u_26.getPermissions().placeCamEnabled
		end
		return v59
	end)
	local v61, v62, v63, v_u_64 = v_u_31(2000)
	local v65, v_u_66 = v_u_6.useState(true)
	local v67, v_u_68 = v_u_6.useState(false)
	local v_u_69, v_u_70 = v_u_6.useState(false)
	local v71, v_u_72 = v_u_6.useState(false)
	local v_u_73 = v_u_6.useRef(nil)
	local function v74()
		-- upvalues: (copy) v_u_73, (ref) v_u_12, (copy) v_u_66, (ref) v_u_11
		if v_u_73.current then
			v_u_12(v_u_73.current)
		end
		v_u_66(true)
		v_u_73.current = v_u_11(function()
			-- upvalues: (ref) v_u_66
			v_u_66(false)
		end, 2000)
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_73, (ref) v_u_12, (copy) v_u_66, (ref) v_u_11
		if v_u_73.current then
			v_u_12(v_u_73.current)
		end
		v_u_66(true)
		v_u_73.current = v_u_11(function()
			-- upvalues: (ref) v_u_66
			v_u_66(false)
		end, 2000)
		return function()
			-- upvalues: (ref) v_u_73, (ref) v_u_12
			if v_u_73.current then
				v_u_12(v_u_73.current)
			end
		end
	end, { v_u_73 })
	local function v_u_76(p75)
		-- upvalues: (copy) v_u_73, (ref) v_u_12, (copy) v_u_66, (ref) v_u_11, (ref) v_u_26, (copy) v_u_64, (copy) v_u_51, (copy) v_u_58, (ref) v_u_27, (ref) v_u_40
		if v_u_73.current then
			v_u_12(v_u_73.current)
		end
		v_u_66(true)
		v_u_73.current = v_u_11(function()
			-- upvalues: (ref) v_u_66
			v_u_66(false)
		end, 2000)
		if v_u_26.getPermissions().userCamEnabled or p75 then
			if v_u_58.Character and not (v_u_27.hasDynamicHead(v_u_58.Character) or (v_u_26.isCameraOn() or p75)) then
				v_u_64(v_u_51.dynamicAvatarMissingErrorHeader, v_u_51.dynamicAvatarMissingErrorBody)
			end
			v_u_40:setLastCtx("SelfView")
			v_u_26.toggleVideoAnimation()
		else
			v_u_64(v_u_51.robloxPermissionErrorHeader, v_u_51.robloxPermissionErrorBody)
		end
	end
	local v77 = {
		v_u_26,
		v_u_27,
		v_u_51,
		v_u_58
	}
	local v_u_78 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_76
		v_u_76(false)
	end, v77)
	local v79 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_73, (ref) v_u_12, (copy) v_u_66, (ref) v_u_11
		if v_u_73.current then
			v_u_12(v_u_73.current)
		end
		v_u_66(true)
		v_u_73.current = v_u_11(function()
			-- upvalues: (ref) v_u_66
			v_u_66(false)
		end, 2000)
	end, { v74, v65, p_u_44.windowSize })
	local v_u_80 = v_u_6.useRef(nil)
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_43, (copy) v_u_58, (copy) v_u_80
		if not _G.__TESTEZ_RUNNING_TEST__ then
			local v_u_81 = v_u_43(v_u_58, v_u_80.current)
			return function()
				-- upvalues: (copy) v_u_81
				if v_u_81 then
					v_u_81()
				end
			end
		end
	end, { v_u_58, v_u_80 })
	local v_u_83 = v_u_6.useCallback(function(_, p82)
		-- upvalues: (copy) v_u_70, (ref) v_u_20
		v_u_70(p82 == v_u_20.Hover)
	end, { v_u_70 })
	local v85 = v_u_6.useCallback(function(_, p84)
		-- upvalues: (copy) v_u_68, (ref) v_u_20
		v_u_68(p84 == v_u_20.Hover)
	end, { v_u_68 })
	local v87 = v_u_6.useCallback(function(_, p86)
		-- upvalues: (copy) v_u_72, (ref) v_u_20
		v_u_72(p86 == v_u_20.Hover)
	end, { v_u_72 })
	local v94 = v_u_6.useCallback(function(p88)
		-- upvalues: (ref) v_u_6, (ref) v_u_15, (copy) v_u_69, (ref) v_u_26, (copy) v_u_46, (copy) v_u_83, (copy) v_u_78, (ref) v_u_23
		local v89 = v_u_6.createElement
		local v90 = v_u_15
		local v91 = {
			["Size"] = UDim2.fromOffset(36, 36)
		}
		local v92
		if v_u_69 and v_u_26.getPermissions().userCamEnabled then
			v92 = v_u_46.Theme.BackgroundOnHover.Color
		else
			v92 = v_u_46.Theme.BackgroundUIContrast.Color
		end
		v91.BackgroundColor3 = v92
		v91.BackgroundTransparency = v_u_46.Theme.Overlay.Transparency
		v91.onStateChanged = v_u_83
		v91.Position = UDim2.fromScale(0.5, 0.5)
		v91.AnchorPoint = Vector2.new(0.5, 0.5)
		v91[v_u_6.Change.AbsoluteSize] = p88
		v91[v_u_6.Change.AbsolutePosition] = p88
		v91[v_u_6.Event.Activated] = v_u_78
		local v93 = {
			["Corner"] = v_u_6.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			}),
			["CameraStatusIcon"] = v_u_6.createElement(v_u_23, {
				["iconSize"] = UDim2.fromOffset(28, 28),
				["transparency"] = v_u_26.getPermissions().userCamEnabled and 0 or 0.5
			})
		}
		return v89(v90, v91, v93)
	end, { v_u_83, v_u_78 })
	local v95 = v_u_6.createElement
	local v96 = "Frame"
	local v97 = {
		["Name"] = "SelfieViewFrame",
		["Active"] = true,
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundColor3"] = v_u_46.Theme.BackgroundUIDefault.Color,
		["BackgroundTransparency"] = 0,
		[v_u_6.Event.MouseEnter] = v74,
		[v_u_6.Event.MouseMoved] = v74,
		["ref"] = v_u_80
	}
	local v98 = {}
	local v99 = {}
	local v100
	if v65 then
		local v101 = v_u_6.createElement
		local v102 = "Frame"
		local v103 = {
			["ZIndex"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = v49
		}
		local v104 = {
			["CloseButtonLayout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			})
		}
		local v105 = v_u_6.createElement
		local v106 = v_u_15
		local v107 = {
			["Size"] = UDim2.fromOffset(36, 36)
		}
		local v108
		if v67 then
			v108 = v_u_46.Theme.BackgroundOnHover.Color
		else
			v108 = v_u_46.Theme.BackgroundUIContrast.Color
		end
		v107.BackgroundColor3 = v108
		v107.BackgroundTransparency = 0.8
		v107.onStateChanged = v85
		v107[v_u_6.Event.Activated] = v_u_35 and function()
			-- upvalues: (ref) v_u_35, (copy) v_u_45
			v_u_35:toggleWindow(v_u_45)
		end or nil
		v104.CloseButtonInteractable = v105(v106, v107, {
			["Corner"] = v_u_6.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			}),
			["Fragment"] = v_u_6.createElement(v_u_6.Fragment, nil, { v_u_6.createElement("Frame", {
					["Name"] = "X1",
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Size"] = nil,
					["BorderSizePixel"] = 0,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = 0,
					["Rotation"] = 45,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Size"] = UDim2.new(0, 16, 0, 2),
					["BackgroundColor3"] = v_u_46.Theme.IconEmphasis.Color
				}, {
					["Corner"] = v_u_6.createElement("UICorner", {
						["CornerRadius"] = UDim.new(1, 0)
					})
				}), (v_u_6.createElement("Frame", {
					["Name"] = "X2",
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Size"] = nil,
					["BorderSizePixel"] = 0,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = 0,
					["Rotation"] = -45,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Size"] = UDim2.new(0, 16, 0, 2),
					["BackgroundColor3"] = v_u_46.Theme.IconEmphasis.Color
				}, {
					["Corner"] = v_u_6.createElement("UICorner", {
						["CornerRadius"] = UDim.new(1, 0)
					})
				})) })
		})
		v100 = v101(v102, v103, v104)
	else
		v100 = v65
	end
	v99.CloseButtonWrapper = v100
	local v109
	if v65 then
		local v110 = v_u_6.createElement
		local v111 = "Frame"
		local v112 = {
			["ZIndex"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = v49,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 0)
		}
		local v113 = {
			["ExpandButtonLayout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			}),
			["ExpandButtonPadding"] = v_u_6.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 4),
				["PaddingLeft"] = UDim.new(0, 4),
				["PaddingRight"] = UDim.new(0, 4),
				["PaddingBottom"] = UDim.new(0, 4)
			})
		}
		local v114 = v_u_6.createElement
		local v115 = v_u_15
		local v116 = {
			["Size"] = UDim2.fromOffset(36, 36)
		}
		local v117
		if v71 then
			v117 = v_u_46.Theme.BackgroundOnHover.Color
		else
			v117 = v_u_46.Theme.BackgroundUIContrast.Color
		end
		v116.BackgroundColor3 = v117
		v116.BackgroundTransparency = 0.8
		v116.onStateChanged = v87
		v116[v_u_6.Event.Activated] = v_u_35 and function()
			-- upvalues: (copy) p_u_44
			p_u_44.windowSize:toggleIsLarge()
		end or nil
		local v118 = {
			["Corner"] = v_u_6.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			})
		}
		local v119 = v_u_6.createElement
		local v120 = v_u_22
		local v121 = {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Size"] = UDim2.fromOffset(28, 28),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		}
		local v122
		if v_u_54 then
			v122 = v_u_41
		else
			v122 = v_u_42
		end
		v121.Image = v122
		v121.ImageColor3 = v47.TextEmphasis.Color
		v121.ImageTransparency = v47.TextEmphasis.Transparency
		v118.ExpandImage = v119(v120, v121)
		v113.ExpandButtonInteractable = v114(v115, v116, v118)
		v109 = v110(v111, v112, v113)
	else
		v109 = nil
	end
	v99.ExpandButtonWrapper = v109
	v99.Corners = v_u_6.createElement("UICorner", {
		["CornerRadius"] = UDim.new(0, 8)
	})
	local v123 = v_u_6.createElement
	local v124 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["AutomaticSize"] = nil,
		["ZIndex"] = 2,
		["BorderSizePixel"] = 0,
		["Visible"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Position"] = UDim2.new(0.5, 0, 1, -44),
		["BackgroundColor3"] = v47.BackgroundUIDefault.Color,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["Visible"] = v53.visible
	}
	local v125 = {
		["Corners"] = v_u_6.createElement("UICorner", {}),
		["UIPadding"] = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 4),
			["PaddingRight"] = UDim.new(0, 8),
			["PaddingBottom"] = UDim.new(0, 4),
			["PaddingLeft"] = UDim.new(0, 8)
		}),
		["UIListLayout"] = v_u_6.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical
		}),
		["Line1"] = v_u_6.createElement(v_u_16, {
			["text"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["textXAlignment"] = nil,
			["layoutOrder"] = 1,
			["size"] = nil,
			["TextWrapped"] = nil,
			["textWrapped"] = nil,
			["text"] = v53.text,
			["fontStyle"] = v48.Footer,
			["colorStyle"] = v47.TextDefault,
			["textXAlignment"] = Enum.TextXAlignment.Center,
			["size"] = UDim2.fromOffset(46, 36),
			["TextWrapped"] = not v_u_39 and true or nil,
			["textWrapped"] = v_u_39 and true or nil
		}),
		["Line2"] = v_u_6.createElement(v_u_16, {
			["text"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["textXAlignment"] = nil,
			["layoutOrder"] = 2,
			["size"] = nil,
			["automaticSize"] = nil,
			["text"] = v53.status,
			["fontStyle"] = v48.Footer,
			["colorStyle"] = v47.ContextualPrimaryContent,
			["textXAlignment"] = Enum.TextXAlignment.Center,
			["size"] = UDim2.fromOffset(46, 12),
			["automaticSize"] = Enum.AutomaticSize.Y
		})
	}
	v99.ControlMessage = v123("Frame", v124, v125)
	local v126
	if v65 and v60 then
		v126 = v_u_6.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ZIndex"] = 2,
			["Size"] = v49,
			["Position"] = UDim2.fromScale(0.5, 1),
			["AnchorPoint"] = Vector2.new(0.5, 1)
		}, {
			["Tooltip"] = v_u_18({
				["headerText"] = v61,
				["bodyText"] = v62,
				["textXAlignment"] = Enum.TextXAlignment.Left
			}, {
				["guiTarget"] = nil,
				["active"] = nil,
				["DisplayOrder"] = 101,
				["preferredOrientation"] = nil,
				["guiTarget"] = v_u_2,
				["active"] = v63,
				["preferredOrientation"] = v_u_19.Bottom
			}, v94),
			["Hover"] = v_u_6.createElement("Frame", {
				["Size"] = UDim2.fromOffset(32, 32),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["BackgroundTransparency"] = v_u_46.Theme.BackgroundOnHover.Transparency,
				["BackgroundColor3"] = v_u_46.Theme.BackgroundOnHover.Color
			}, {
				["Corner"] = v_u_6.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 8)
				})
			})
		}) or nil
	else
		v126 = nil
	end
	v99.IconFrame = v126
	local v127
	if v52 then
		v127 = v_u_6.createElement(v_u_24, {
			["Position"] = nil,
			["ZIndex"] = 2,
			["Size"] = nil,
			["Position"] = UDim2.new(1, -12, 1, -12),
			["Size"] = UDim2.fromOffset(8, 8)
		})
	else
		v127 = nil
	end
	v99.CameraStatusDot = v127
	v99.Interactable = v_u_6.createElement(v_u_15, {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = 1,
		[v_u_6.Event.Activated] = v79
	})
	return v95(v96, v97, v98, v99)
end