-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.CreationFlowScreen
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Icon
local v_u_7 = v_u_3.View
local v_u_8 = require(v1.Components.CaptureView)
local v_u_9 = require(v1.Components.DescriptionView)
local v_u_10 = require(v1.Components.EditCTABar)
local v_u_11 = require(v1.Components.GalleryView)
local v_u_12 = require(v1.Components.MusicChip)
local v_u_13 = require(v1.Components.MusicOverlay)
local v_u_14 = require(v1.Components.PlaybackControls)
local v_u_15 = require(v1.Components.PreviewView)
local v_u_16 = v4.TextOverlayDisplay
local v_u_17 = require(v1.Components.Dialogs.ExitConfirmationDialog)
local v_u_18 = require(v1.Components.Dialogs.TextFilteredDialog)
local v_u_19 = require(v1.Components.TextOverlay.TextOverlayEditor)
local v_u_20 = require(v1.Components.TextOverlay.TextOverlayView)
local v_u_21 = require(v1.Components.TrimmingView)
local v_u_22 = require(v1.Actions.ClearEdits)
local v_u_23 = require(v1.Actions.CreationFlowStateUpdated)
local v_u_24 = require(v1.Actions.MusicEditUpdated)
local v_u_25 = require(v1.Actions.SelectedCaptureUpdated)
local v_u_26 = require(v1.Actions.TextOverlayEditsUpdated)
local v_u_27 = require(v1.Actions.TrimEditUpdated)
local v_u_28 = require(v1.Hooks.useAutoDismissState)
local v_u_29 = v_u_5.useCallback
local v_u_30 = v4.Hooks.useDeviceInsets
local v_u_31 = v4.Hooks.useDispatch
local v_u_32 = v4.Hooks.useFormFactor
local v_u_33 = v_u_5.useMemo
local v_u_34 = v_u_5.useRef
local v_u_35 = v4.Hooks.useSelector
local v_u_36 = v4.Hooks.useToggleState
local v_u_37 = v_u_3.Hooks.useTokens
local v_u_38 = v4.Hooks.useUnifiedPlayback
local v_u_39 = require(v1.Context.CreationFlowContext)
local v_u_40 = require(v1.Utils.getContentFromCapture)
local v_u_41 = require(v1.Utils.makeMomentMetadata)
local v_u_42 = require(v1.Utils.makeRegistrationInfo)
local v_u_43 = require(v1.Enums.CreationFlowState)
local v_u_44 = require(v1.Enums.DialogType)
local v_u_45 = v4.Enums.FormFactor
local v_u_46 = require(v1.Constants)
local v_u_47 = require(v1.Enums.CreationFlowLocalization)
local v_u_48 = require(v1.Analytics.EventNames)
local v_u_49 = {
	["position"] = nil,
	["rotation"] = 0,
	["scale"] = 1,
	["text"] = "",
	["textOverlayStyle"] = nil,
	["zIndex"] = 1,
	["position"] = UDim2.fromScale(0.5, 0.5),
	["textOverlayStyle"] = {
		["font"] = nil,
		["fontColor"] = nil,
		["fontSize"] = 16,
		["textXAlignment"] = nil,
		["font"] = Enum.Font.BuilderSansMedium,
		["fontColor"] = Color3.new(0, 0, 0),
		["textXAlignment"] = Enum.TextXAlignment.Center
	}
}
return function(p_u_50)
	-- upvalues: (copy) v_u_31, (copy) v_u_30, (copy) v_u_37, (copy) v_u_32, (copy) v_u_36, (copy) v_u_28, (copy) v_u_5, (copy) v_u_39, (copy) v_u_29, (copy) v_u_34, (copy) v_u_35, (copy) v_u_46, (copy) v_u_33, (copy) v_u_38, (copy) v_u_40, (copy) v_u_48, (copy) v_u_23, (copy) v_u_43, (copy) v_u_44, (copy) v_u_41, (copy) v_u_42, (copy) v_u_22, (copy) v_u_27, (copy) v_u_24, (copy) v_u_26, (copy) v_u_49, (copy) v_u_25, (copy) v_u_7, (copy) v_u_3, (copy) v_u_47, (copy) v_u_17, (copy) v_u_18, (copy) v_u_45, (copy) v_u_6, (copy) v_u_12, (copy) v_u_14, (copy) v_u_19, (copy) v_u_8, (copy) v_u_16, (copy) v_u_10, (copy) v_u_11, (copy) v_u_15, (copy) v_u_21, (copy) v_u_20, (copy) v_u_9, (copy) v_u_13
	local v_u_51 = v_u_31()
	local v52 = v_u_30()
	local v_u_53 = v_u_37()
	local v54 = v_u_32()
	local v_u_55 = v_u_36(false)
	local v56, v_u_57 = v_u_28()
	local v_u_58 = v_u_5.useContext(v_u_39)
	local v59, v60 = v_u_5.useState(Vector2.new(0, 0))
	local v61, v_u_62 = v_u_5.useState(Vector2.new(0, 0))
	local v_u_63, v_u_64 = v_u_5.useState({
		["modalType"] = nil,
		["modalProps"] = nil
	})
	local v66 = v_u_29(function(p65)
		-- upvalues: (copy) v_u_62
		v_u_62(p65.AbsoluteSize)
	end, {})
	local v67 = v_u_58.captures
	local v_u_68 = v_u_34(0)
	local v_u_70 = v_u_35(function(p69)
		-- upvalues: (ref) v_u_46
		return p69[v_u_46.RoduxKey].CreationFlow.currentState
	end)
	local v_u_72 = v_u_35(function(p71)
		-- upvalues: (ref) v_u_46
		return p71[v_u_46.RoduxKey].CreationFlow.capture
	end)
	local v_u_74 = v_u_35(function(p73)
		-- upvalues: (ref) v_u_46
		return p73[v_u_46.RoduxKey].CreationFlow.textOverlayEdits
	end)
	local v_u_76 = v_u_35(function(p75)
		-- upvalues: (ref) v_u_46
		return p75[v_u_46.RoduxKey].CreationFlow.trimEdit
	end)
	local v_u_78 = v_u_35(function(p77)
		-- upvalues: (ref) v_u_46
		return p77[v_u_46.RoduxKey].CreationFlow.musicEdit
	end)
	local v_u_80 = v_u_35(function(p79)
		-- upvalues: (ref) v_u_46
		return p79[v_u_46.RoduxKey].CreationFlow.description
	end)
	local v_u_81, v_u_82 = v_u_5.useState(nil)
	local v_u_83, v_u_84 = v_u_5.useState(nil)
	local v_u_85, v_u_86 = v_u_5.useState(nil)
	local v87 = v_u_33(function()
		-- upvalues: (copy) v_u_85, (copy) v_u_78
		return v_u_85 or v_u_78
	end, { v_u_85, v_u_78 })
	local v88 = v_u_33(function()
		-- upvalues: (copy) v_u_83, (copy) v_u_76
		return v_u_83 or v_u_76
	end, { v_u_83, v_u_76 })
	local v89 = v_u_38
	local v90 = true
	local v91 = {
		["autoplay"] = true,
		["edits"] = nil,
		["looping"] = true,
		["content"] = nil,
		["captureType"] = nil,
		["edits"] = {
			["trim"] = v88,
			["music"] = v87
		}
	}
	local v92
	if v_u_72 then
		v92 = v_u_40(v_u_72)
	else
		v92 = nil
	end
	v91.content = v92
	local v93
	if v_u_72 then
		v93 = v_u_72.CaptureType
	else
		v93 = nil
	end
	v91.captureType = v93
	local v94 = v89(v90, v91)
	local v96 = v_u_29(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_48, (copy) v_u_70, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_57
		local v95 = {
			["editFlowState"] = v_u_70
		}
		v_u_58.fireEvent(v_u_48.EditingFlowNextButtonPressed, v95)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_57()
		v_u_58.fireEvent(v_u_48.MomentsEditingFlowContinueToEditButtonPressed)
	end, { v_u_57, v_u_70 })
	local v98 = v_u_29(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_48, (copy) v_u_70, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_55
		local v97 = {
			["editFlowState"] = v_u_70
		}
		v_u_58.fireEvent(v_u_48.EditingFlowNextButtonPressed, v97)
		v_u_51(v_u_23(v_u_43.Description))
		v_u_55.disable()
		v_u_58.fireEvent(v_u_48.MomentsEditingFlowContinueToDescriptionButtonPressed)
	end, { v_u_70 })
	local v_u_103 = v_u_29(function(p99)
		-- upvalues: (copy) v_u_58, (copy) v_u_64, (ref) v_u_44
		local v100 = v_u_58.isTextFiltered(p99)
		if v100 then
			local v101 = v_u_64
			local v102 = {
				["modalType"] = v_u_44.TextFiltered,
				["modalProps"] = {
					["onConfirm"] = function() -- name: onConfirm
						-- upvalues: (ref) v_u_64
						v_u_64(nil)
					end
				}
			}
			v101(v102)
		end
		return v100
	end, {})
	local v107 = v_u_29(function()
		-- upvalues: (copy) v_u_103, (copy) v_u_80, (copy) v_u_68, (copy) v_u_76, (copy) v_u_78, (copy) v_u_74, (ref) v_u_41, (copy) v_u_72, (ref) v_u_42, (copy) v_u_58, (copy) p_u_50, (copy) v_u_51, (ref) v_u_22, (ref) v_u_43, (ref) v_u_48
		if v_u_103(v_u_80) then
			return
		else
			local v104 = os.clock()
			if v104 - v_u_68.current >= 0.5 then
				v_u_68.current = v104
				local v105 = v_u_41(v_u_72, v_u_80, {
					["trim"] = v_u_76,
					["music"] = v_u_78,
					["textOverlays"] = v_u_74
				})
				local v106 = v_u_42(v_u_72, v105)
				v_u_58.createMoment(v_u_72, v105, v106)
				if p_u_50.excludeGallery then
					v_u_51(v_u_22(v_u_43.Preview))
				else
					v_u_51(v_u_22(v_u_43.Gallery))
				end
				v_u_58.fireEvent(v_u_48.MomentsEditingFlowPublished)
				v_u_58.exitCreationFlow()
			end
		end
	end, {
		v_u_72,
		v_u_80,
		v_u_78,
		v_u_58,
		v_u_74,
		v_u_76,
		p_u_50.excludeGallery
	})
	local v109 = v_u_29(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_48, (copy) v_u_70, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43
		local v108 = {
			["editFlowState"] = v_u_70
		}
		v_u_58.fireEvent(v_u_48.EditingFlowReturnButtonPressed, v108)
		v_u_51(v_u_23(v_u_43.Preview))
	end, { v_u_70 })
	local v114 = v_u_29(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_48, (copy) v_u_70, (copy) v_u_64, (copy) v_u_51, (ref) v_u_22, (ref) v_u_43, (copy) v_u_55, (ref) v_u_44
		local v110 = {
			["editFlowState"] = v_u_70
		}
		v_u_58.fireEvent(v_u_48.EditingFlowReturnButtonPressed, v110)
		local function v111() -- name: onExitCreation
			-- upvalues: (ref) v_u_64, (ref) v_u_51, (ref) v_u_22, (ref) v_u_43, (ref) v_u_55
			v_u_64(nil)
			v_u_51(v_u_22(v_u_43.Gallery))
			v_u_55.disable()
		end
		local v112 = v_u_64
		local v113 = {
			["modalType"] = v_u_44.ExitCreationConfirmation,
			["modalProps"] = {
				["onCancel"] = function() -- name: onCancel
					-- upvalues: (ref) v_u_64
					v_u_64(nil)
				end,
				["onConfirm"] = v111
			}
		}
		v112(v113)
	end, { v_u_70 })
	local v115 = v_u_29(function()
		-- upvalues: (copy) v_u_84, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_84(nil)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowTrimBackButtonPressed)
	end, { v_u_58 })
	local v116 = v_u_29(function()
		-- upvalues: (copy) v_u_51, (ref) v_u_27, (copy) v_u_83, (copy) v_u_84, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_51(v_u_27(v_u_83))
		v_u_84(nil)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowTrimDoneButtonPressed)
	end, { v_u_83, v_u_58 })
	local v118 = v_u_29(function(p117)
		-- upvalues: (copy) v_u_84
		v_u_84(p117)
	end, {})
	local v119 = v_u_29(function()
		-- upvalues: (copy) v_u_86, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_86(nil)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowMusicBackButtonPressed)
	end, {})
	local v120 = v_u_29(function()
		-- upvalues: (copy) v_u_51, (ref) v_u_24, (copy) v_u_85, (copy) v_u_86, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_51(v_u_24(v_u_85))
		v_u_86(nil)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowMusicDoneButtonPressed)
	end, { v_u_85 })
	local v122 = v_u_29(function(p121)
		-- upvalues: (copy) v_u_86
		v_u_86(p121)
	end, {})
	local v123 = v_u_29(function()
		-- upvalues: (copy) v_u_82, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_82(nil)
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowTextOverlayBackButtonPressed)
	end, { v_u_81, v_u_58 })
	local v125 = v_u_29(function()
		-- upvalues: (copy) v_u_81, (copy) v_u_51, (ref) v_u_26, (copy) v_u_103, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48, (copy) v_u_82
		local v124 = v_u_81 and v_u_81[1]
		if v124 then
			v124 = v_u_81[1].text
		end
		if v124 == "" then
			v_u_51(v_u_26(nil))
		else
			if v_u_103(v124) then
				return
			end
			v_u_51(v_u_26(v_u_81))
		end
		v_u_51(v_u_23(v_u_43.Preview))
		v_u_58.fireEvent(v_u_48.EditingFlowTextOverlayDoneButtonPressed)
		v_u_82(nil)
	end, { v_u_81, v_u_58, v_u_103 })
	local v127 = v_u_29(function(p126)
		-- upvalues: (copy) v_u_82
		v_u_82(p126)
	end, {})
	local v129 = v_u_29(function(p128)
		-- upvalues: (copy) v_u_51, (ref) v_u_26
		v_u_51(v_u_26(p128))
	end, {})
	local v130 = v_u_29(function()
		-- upvalues: (copy) v_u_82, (copy) v_u_74, (copy) v_u_51, (ref) v_u_23, (ref) v_u_43
		v_u_82(v_u_74)
		v_u_51(v_u_23(v_u_43.TextOverlay))
	end, { v_u_74 })
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_70, (ref) v_u_43, (copy) v_u_82, (copy) v_u_74, (ref) v_u_49
		if v_u_70 == v_u_43.TextOverlay then
			v_u_82(v_u_74 or { v_u_49 })
		end
	end, { v_u_74, v_u_70 })
	local v131 = v_u_29(function()
		-- upvalues: (copy) v_u_51, (ref) v_u_23, (ref) v_u_43, (copy) v_u_58, (ref) v_u_48
		v_u_51(v_u_23(v_u_43.Music))
		v_u_58.fireEvent(v_u_48.EditingFlowMusicButtonPressed)
	end, {})
	local v133 = v_u_29(function(p132)
		-- upvalues: (copy) v_u_51, (ref) v_u_25, (copy) v_u_57, (copy) v_u_58, (ref) v_u_48
		v_u_51(v_u_25(p132))
		v_u_57()
		v_u_58.fireEvent(v_u_48.EditingFlowGalleryItemSelected)
	end, { v_u_57, v_u_58 })
	local v138 = v_u_5.useCallback(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_7, (ref) v_u_3, (copy) v_u_58, (ref) v_u_47, (copy) v_u_53
		local v134 = v_u_5.createElement
		local v135 = v_u_7
		local v136 = {
			["Size"] = UDim2.fromScale(1, 1),
			["stateLayer"] = {
				["affordance"] = v_u_3.Enums.StateLayerAffordance.None
			}
		}
		local v137 = {
			["ModeratedText"] = v_u_5.createElement("TextLabel", {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["Size"] = UDim2.fromScale(1, 1),
				["Text"] = v_u_58.getLocalization(v_u_47.PostRemovedTitle),
				["TextColor3"] = v_u_53.Color.Extended.White.White_70
			})
		}
		return v134(v135, v136, v137)
	end, {})
	local v142 = v_u_29(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_48, (copy) v_u_64, (copy) p_u_50, (copy) v_u_51, (ref) v_u_22, (ref) v_u_43, (copy) v_u_72, (ref) v_u_44
		local function v139() -- name: onExitCreation
			-- upvalues: (ref) v_u_58, (ref) v_u_48, (ref) v_u_64, (ref) p_u_50, (ref) v_u_51, (ref) v_u_22, (ref) v_u_43
			v_u_58.fireEvent(v_u_48.MomentsEditingFlowExited)
			v_u_64(nil)
			if p_u_50.excludeGallery then
				v_u_51(v_u_22(v_u_43.Preview))
			else
				v_u_51(v_u_22(v_u_43.Gallery))
			end
			v_u_58.exitCreationFlow()
		end
		if v_u_72 then
			local v140 = v_u_64
			local v141 = {
				["modalType"] = v_u_44.ExitCreationConfirmation,
				["modalProps"] = {
					["onCancel"] = function() -- name: onCancel
						-- upvalues: (ref) v_u_64
						v_u_64(nil)
					end,
					["onConfirm"] = v139
				}
			}
			v140(v141)
		else
			v139()
		end
	end, { v_u_72, v_u_58, p_u_50.excludeGallery })
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_58
		v_u_58.setScreenOrientation(Enum.ScreenOrientation.Portrait)
		return function()
			-- upvalues: (ref) v_u_58
			v_u_58.setScreenOrientation(Enum.ScreenOrientation.Sensor)
		end
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_70, (ref) v_u_43, (copy) v_u_55
		if v_u_70 == v_u_43.Gallery or (v_u_70 == v_u_43.Music or v_u_70 == v_u_43.Description) then
			v_u_55.disable()
		end
	end, { v_u_70 })
	local v143 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_63, (ref) v_u_44, (ref) v_u_5, (ref) v_u_17, (ref) v_u_18
		if v_u_63 then
			if v_u_63.modalType == v_u_44.ExitCreationConfirmation then
				return v_u_5.createElement(v_u_17, v_u_63.modalProps)
			elseif v_u_63.modalType == v_u_44.TextFiltered then
				return v_u_5.createElement(v_u_18, v_u_63.modalProps)
			else
				return nil
			end
		else
			return nil
		end
	end, { v_u_63 })
	local v144 = v_u_5.createElement
	local v145 = v_u_7
	local v146 = {
		["backgroundStyle"] = nil,
		["tag"] = "anchor-center-center position-center-center size-full-full",
		["backgroundStyle"] = v_u_53.Color.Common.Scrim
	}
	local v147 = {}
	local v148 = v_u_5.createElement
	local v149 = v_u_7
	local v150 = {
		["tag"] = "anchor-center-center bg-surface-0 position-center-center radius-large size-full-full",
		["sizeConstraint"] = nil
	}
	local v151 = {}
	local v152
	if v54 == v_u_45.Wide then
		v152 = Vector2.new(600, 700)
	else
		v152 = nil
	end
	v151.MaxSize = v152
	v150.sizeConstraint = v151
	local v153 = {
		["CloseButtonContainer"] = v_u_5.createElement(v_u_7, {
			["tag"] = "auto-xy anchor-top-right position-top-right"
		}, {
			["Padding"] = v_u_5.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v52.top + v_u_53.Padding.Medium),
				["PaddingRight"] = UDim.new(0, v52.right + v_u_53.Padding.Medium)
			}),
			["CloseButton"] = v_u_5.createElement(v_u_7, {
				["LayoutOrder"] = 1,
				["onActivated"] = nil,
				["tag"] = "size-1100-1100 bg-over-media-0 padding-medium radius-circle",
				["onActivated"] = v142
			}, {
				["CloseIcon"] = v_u_5.createElement(v_u_6, {
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["name"] = "icons/navigation/close_small",
					["size"] = nil,
					["style"] = nil,
					["ZIndex"] = 2,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.fromScale(0.5, 0.5),
					["size"] = v_u_3.Enums.IconSize.Small,
					["style"] = v_u_53.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local v154 = v_u_5.createElement
	local v155 = v_u_7
	local v156 = {
		["tag"] = "size-full"
	}
	local v157 = {}
	local v158 = v_u_5.createElement
	local v159 = v_u_7
	local v160 = {
		["tag"] = "size-full col align-x-center"
	}
	local v161 = {}
	local v162 = v_u_5.createElement
	local v163 = "CanvasGroup"
	local v164 = {
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["BackgroundTransparency"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = v_u_53.Color.None.Transparency
	}
	local v165 = {
		["UIFlexItem"] = v_u_5.createElement("UIFlexItem", {
			["FlexMode"] = Enum.UIFlexMode.Custom,
			["ShrinkRatio"] = v_u_72 and 1 or 2
		}),
		["UICorner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, v_u_53.Radius.Large)
		}),
		["ClickCapture"] = v_u_5.createElement(v_u_7, {
			["tag"] = "size-full",
			["onActivated"] = nil,
			["stateLayer"] = nil,
			["ZIndex"] = 0,
			["onActivated"] = v_u_57,
			["stateLayer"] = {
				["affordance"] = v_u_3.Enums.StateLayerAffordance.None
			}
		})
	}
	local v166 = v_u_5.createElement
	local v167 = v_u_7
	local v168 = {
		["tag"] = "auto-y anchor-bottom-center col position-bottom-center size-full-0",
		["ZIndex"] = 5
	}
	local v169 = {}
	local v170 = v_u_5.createElement
	local v171 = v_u_7
	local v172 = {
		["tag"] = "auto-y padding-x-large padding-bottom-large size-full-0",
		["LayoutOrder"] = 1
	}
	local v173 = {}
	local v174 = v_u_5.createElement
	local v175 = {}
	local v176 = UDim.new
	local v177 = v52.right
	local v178 = v_u_53.Padding.Large
	v175.PaddingLeft = v176(0, (math.max(v177, v178)))
	local v179 = UDim.new
	local v180 = v52.right
	local v181 = v_u_53.Padding.Large
	v175.PaddingRight = v179(0, (math.max(v180, v181)))
	v173.Padding = v174("UIPadding", v175)
	local v182
	if v_u_78 and (v_u_70 == v_u_43.Preview or v_u_70 == v_u_43.Description) then
		v182 = v_u_5.createElement(v_u_7, {
			["tag"] = "anchor-bottom-left auto-xy position-bottom-left"
		}, {
			["MusicChip"] = v_u_5.createElement(v_u_12, {
				["musicAssetId"] = v_u_78.assetId,
				["onActivated"] = v131
			})
		})
	else
		v182 = nil
	end
	v173.MusicIndicator = v182
	v169.OtherControls = v170(v171, v172, v173)
	local v183
	if v_u_72 and (v_u_72.CaptureType == Enum.CaptureType.Video and (v56 and (v_u_70 == v_u_43.Gallery or v_u_70 == v_u_43.Preview))) then
		v183 = v_u_5.createElement(v_u_14, {
			["layoutOrder"] = 2,
			["playbackController"] = nil,
			["toggleFitMode"] = nil,
			["isFitMode"] = nil,
			["playbackController"] = v94,
			["toggleFitMode"] = v_u_55.toggle,
			["isFitMode"] = v_u_55.enabled
		})
	else
		v183 = nil
	end
	v169.PlaybackControls = v183
	v165.PreviewMediaOverlay = v166(v167, v168, v169)
	local v184
	if v_u_70 == v_u_43.TextOverlay then
		v184 = v_u_5.createElement(v_u_19, {
			["layoutOrder"] = 2,
			["onTextOverlayDiscard"] = nil,
			["onTextOverlaySave"] = nil,
			["onTextOverlayUpdated"] = nil,
			["textOverlayEdits"] = nil,
			["onTextOverlayDiscard"] = v123,
			["onTextOverlaySave"] = v125,
			["onTextOverlayUpdated"] = v127,
			["textOverlayEdits"] = v_u_81
		})
	else
		v184 = nil
	end
	v165.TextOverlayEditor = v184
	local v185 = v_u_5.createElement
	local v186 = v_u_8
	local v187 = {
		["capture"] = v_u_72,
		["playbackController"] = v94,
		["onAbsoluteSizeChanged"] = v66,
		["onRenderFailed"] = v138,
		["onResolutionChanged"] = v60
	}
	local v188
	if v_u_55.enabled then
		v188 = Enum.ScaleType.Fit
	else
		v188 = Enum.ScaleType.Crop
	end
	v187.scaleType = v188
	local v189 = {}
	local v190 = v_u_5.createElement
	local v191 = v_u_16
	local v192 = {
		["draggable"] = nil,
		["editable"] = nil,
		["itemResolution"] = nil,
		["itemSize"] = nil,
		["scaleType"] = nil,
		["onTextOverlayActivated"] = nil,
		["onTextOverlayDragEnd"] = nil,
		["textOverlayEdits"] = nil,
		["zIndex"] = 3,
		["draggable"] = v_u_70 == v_u_43.Preview,
		["editable"] = v_u_70 == v_u_43.TextOverlay,
		["itemResolution"] = v59,
		["itemSize"] = v61
	}
	local v193
	if v_u_55.enabled then
		v193 = Enum.ScaleType.Fit
	else
		v193 = Enum.ScaleType.Crop
	end
	v192.scaleType = v193
	v192.onTextOverlayActivated = v130
	v192.onTextOverlayDragEnd = v129
	v192.textOverlayEdits = v_u_74
	v189.TextOverlayDisplay = v190(v191, v192)
	v165.CaptureView = v185(v186, v187, v189)
	local v194
	if v_u_70 == v_u_43.Preview then
		local v195 = v_u_5.createElement
		local v196 = v_u_10
		local v197 = {
			["captureType"] = nil,
			["showText"] = nil,
			["zIndex"] = 4
		}
		local v198
		if v_u_72 then
			v198 = v_u_72.CaptureType
		else
			v198 = nil
		end
		v197.captureType = v198
		v197.showText = v56
		v194 = v195(v196, v197)
	else
		v194 = nil
	end
	v165.EditCTABar = v194
	v161.PreviewContainer = v162(v163, v164, v165)
	local v199
	if v_u_70 == v_u_43.Gallery then
		v199 = v_u_5.createElement(v_u_11, {
			["layoutOrder"] = 2,
			["captures"] = nil,
			["selectedCapture"] = nil,
			["onCaptureSelected"] = nil,
			["onNextCallback"] = nil,
			["captures"] = v67,
			["selectedCapture"] = v_u_72,
			["onCaptureSelected"] = v133,
			["onNextCallback"] = v96
		})
	else
		v199 = nil
	end
	v161.GalleryView = v199
	local v200
	if v_u_70 == v_u_43.Preview then
		local v201 = v_u_5.createElement
		local v202 = v_u_15
		local v203 = {
			["layoutOrder"] = 2,
			["onContinueCallback"] = nil,
			["onReturnToGalleryCallback"] = nil,
			["onContinueCallback"] = v98
		}
		if p_u_50.excludeGallery then
			v114 = nil
		end
		v203.onReturnToGalleryCallback = v114
		v200 = v201(v202, v203)
	else
		v200 = nil
	end
	v161.PreviewView = v200
	local v204
	if v_u_70 == v_u_43.Trimming then
		v204 = v_u_5.createElement(v_u_21, {
			["layoutOrder"] = 2,
			["playbackController"] = nil,
			["onTrimDiscard"] = nil,
			["onTrimSave"] = nil,
			["onTrimUpdate"] = nil,
			["selectedCapture"] = nil,
			["trimEdit"] = nil,
			["playbackController"] = v94,
			["onTrimDiscard"] = v115,
			["onTrimSave"] = v116,
			["onTrimUpdate"] = v118,
			["selectedCapture"] = v_u_72,
			["trimEdit"] = v88
		})
	else
		v204 = nil
	end
	v161.TrimmingView = v204
	local v205
	if v_u_70 == v_u_43.TextOverlay then
		v205 = v_u_5.createElement(v_u_20, {
			["layoutOrder"] = 2,
			["onTextOverlayDiscard"] = nil,
			["onTextOverlaySave"] = nil,
			["onTextOverlayDiscard"] = v123,
			["onTextOverlaySave"] = v125
		})
	else
		v205 = nil
	end
	v161.TextOverlayView = v205
	local v206
	if v_u_70 == v_u_43.Description then
		v206 = v_u_5.createElement(v_u_9, {
			["layoutOrder"] = 2,
			["onPublish"] = nil,
			["onReturnToEditing"] = nil,
			["onPublish"] = v107,
			["onReturnToEditing"] = v109
		})
	else
		v206 = nil
	end
	v161.DescriptionView = v206
	v157.MainView = v158(v159, v160, v161)
	local v207
	if v_u_70 == v_u_43.Music then
		v207 = v_u_5.createElement(v_u_7, {
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.fromScale(1, 1)
		}, {
			["MusicOverlay"] = v_u_5.createElement(v_u_13, {
				["musicEdit"] = v87,
				["playbackController"] = v94,
				["onMusicDiscard"] = v119,
				["onMusicSave"] = v120,
				["onMusicUpdate"] = v122
			})
		})
	else
		v207 = nil
	end
	v157.MusicView = v207
	v153.MainViewContainer = v154(v155, v156, v157)
	v147.CreationFlowView = v148(v149, v150, v153)
	v147.Modal = v143()
	return v144(v145, v146, v147)
end