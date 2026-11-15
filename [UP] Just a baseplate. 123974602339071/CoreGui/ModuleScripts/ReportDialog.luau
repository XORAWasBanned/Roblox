-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.ReportDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.UIBlox
local v8 = v4.t
local v_u_9 = v4.Cryo
local v_u_10 = v7.App.Button.Button
local v_u_11 = v7.App.Button.Enum.ButtonType
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v13 = script.Parent.Parent.Parent
local v14 = v13.Flags
local v_u_15 = require(v14.GetFFlagIGMGamepadSelectionHistory)
local v_u_16 = require(v14.FFlagIGMDialogButtonsUseUIBloxButton)
local v_u_17 = require(script.Parent.Parent.Connection.FocusHandler)
local v_u_18 = require(v13.Resources.Assets)
local v_u_19 = require(v13.Actions.CloseReportDialog)
local v_u_20 = require(v13.Localization.withLocalization)
local v_u_21 = require(v13.Components.ThemedTextLabel)
local v_u_22 = require(script.Parent.TextEntryField)
local v_u_23 = require(v13.Components.DropDownSelection)
local v_u_24 = require(v13.Resources.Constants)
local v_u_25 = require(v13.Utility.SendAnalytics)
local v_u_26 = require(v13.Thunks.SendReport)
local v_u_27 = v7.Core.ImageSet.ImageSetLabel
local v_u_28 = require(v1.Packages.Foundation).Image
local v_u_29 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v30 = v_u_5.PureComponent:extend("ReportDialog")
local v_u_31 = {
	"Swearing",
	"Inappropriate Username",
	"Bullying",
	"Scamming",
	"Dating",
	"Cheating/Exploiting",
	"Personal Question",
	"Offsite Links"
}
local v_u_32 = {
	"CoreScripts.InGameMenu.Report.AbuseSwearing",
	"CoreScripts.InGameMenu.Report.AbuseUsername",
	"CoreScripts.InGameMenu.Report.AbuseBullying",
	"CoreScripts.InGameMenu.Report.AbuseScamming",
	"CoreScripts.InGameMenu.Report.AbuseDating",
	"CoreScripts.InGameMenu.Report.AbuseExploiting",
	"CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
	"CoreScripts.InGameMenu.Report.AbuseOffsiteLink"
}
v30.validateProps = v8.strictInterface({
	["isOpen"] = v8.boolean,
	["userId"] = v8.optional(v8.integer),
	["userName"] = v8.optional(v8.string),
	["placeName"] = v8.string,
	["dispatchCloseReportDialog"] = v8.callback,
	["dispatchSendReport"] = v8.callback,
	["canCaptureFocus"] = v8.optional(v8.boolean),
	["isGamepadLastInput"] = v8.optional(v8.boolean)
})
function v30.init(p33) -- name: init
	-- upvalues: (copy) v_u_5
	p33.state = {
		["abuseDescription"] = "",
		["typeOfAbuseIndex"] = 0
	}
	p33.selectionGroupRef = v_u_5.createRef()
	p33.reportTextEntryRef = v_u_5.createRef()
	p33.reportDropDownRef = v_u_5.createRef()
end
function v30.renderReportTitle(_, p34, p35, p36) -- name: renderReportTitle
	-- upvalues: (copy) v_u_5, (copy) v_u_21
	p35.Title = v_u_5.createElement(v_u_21, {
		["fontKey"] = "Header1",
		["themeKey"] = "TextEmphasis",
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["Text"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 48),
		["Text"] = p36
	})
	p35.Divider = v_u_5.createElement("Frame", {
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 2,
		["Size"] = nil,
		["BackgroundColor3"] = p34.Theme.Divider.Color,
		["BackgroundTransparency"] = p34.Theme.Divider.Transparency,
		["Size"] = UDim2.new(0.8, 0, 0, 1)
	})
end
function v30.renderTextEntryField(p_u_37, p38, p39, p40) -- name: renderTextEntryField
	-- upvalues: (copy) v_u_5, (copy) v_u_22
	p39.ReportDescription = v_u_5.createElement(v_u_22, {
		["enabled"] = p_u_37.props.isOpen,
		["text"] = p_u_37.state.abuseDescription,
		["textChanged"] = function(p41) -- name: textChanged
			-- upvalues: (copy) p_u_37
			p_u_37:setState({
				["abuseDescription"] = p41
			})
		end,
		["maxTextLength"] = 160,
		["autoFocusOnEnabled"] = not p_u_37.props.isGamepadLastInput,
		["PlaceholderText"] = p38.textboxPlaceHolder,
		["LayoutOrder"] = 5,
		["Size"] = p40,
		[v_u_5.Ref] = p_u_37.reportTextEntryRef
	})
end
function v30.renderButtons(p_u_42, _, p43, p44) -- name: renderButtons
	-- upvalues: (copy) v_u_31, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_16
	local v45 = utf8.len(utf8.nfcnormalize(p_u_42.state.abuseDescription))
	local v46
	if v45 >= 0 then
		v46 = v45 <= 160
	else
		v46 = false
	end
	local v47 = p_u_42.state.typeOfAbuseIndex > 0 and true or p_u_42.props.userId == nil
	local function v49()
		-- upvalues: (copy) p_u_42, (ref) v_u_31
		local v48 = p_u_42.props.userId == nil and "Inappropriate Content" or v_u_31[p_u_42.state.typeOfAbuseIndex]
		p_u_42.props.dispatchSendReport(v48, p_u_42.state.abuseDescription, p_u_42.props.userId)
		p_u_42.props.dispatchCloseReportDialog()
	end
	local v50 = v_u_5.createElement
	local v51 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 6,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 60)
	}
	local v52 = {
		["Layout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["Padding"] = UDim.new(0, 12),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
		}),
		["CancelButton"] = v_u_5.createElement(v_u_10, {
			["buttonType"] = nil,
			["layoutOrder"] = 1,
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["DO_NOT_USE_useUIBloxButton"] = nil,
			["buttonType"] = v_u_11.Secondary,
			["size"] = UDim2.fromOffset(144, 36),
			["text"] = p43.cancel,
			["onActivated"] = p_u_42.props.dispatchCloseReportDialog,
			["DO_NOT_USE_useUIBloxButton"] = v_u_16 and true or nil
		}),
		["ConfirmButton"] = v_u_5.createElement(v_u_10, {
			["buttonType"] = nil,
			["layoutOrder"] = 2,
			["size"] = nil,
			["isDisabled"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["DO_NOT_USE_useUIBloxButton"] = nil,
			["buttonType"] = v_u_11.PrimarySystem,
			["size"] = UDim2.fromOffset(144, 36),
			["isDisabled"] = not (v46 and v47),
			["text"] = p43.report,
			["onActivated"] = v49,
			["DO_NOT_USE_useUIBloxButton"] = v_u_16 and true or nil
		})
	}
	p44.ButtonContainer = v50("Frame", v51, v52)
end
function v30.renderReportPlayer(p_u_53, p54, p55, p56) -- name: renderReportPlayer
	-- upvalues: (copy) v_u_5, (copy) v_u_29, (copy) v_u_28, (copy) v_u_18, (copy) v_u_27, (copy) v_u_9, (copy) v_u_21, (copy) v_u_23, (copy) v_u_32
	p_u_53:renderReportTitle(p54, p56, p55.reportPlayerTitle)
	local v57 = {
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0.5, -140, 0.5, 0),
		["Size"] = UDim2.new(0, 44, 0, 44)
	}
	local v58 = p_u_53.props.userId
	local v59 = v_u_5.createElement
	local v60 = "Frame"
	local v61 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 68)
	}
	local v62 = {}
	local v63
	if v_u_29 then
		v63 = v_u_5.createElement(v_u_28, {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = nil,
			["imageStyle"] = nil,
			["ZIndex"] = 2,
			["AnchorPoint"] = v57.AnchorPoint,
			["Position"] = v57.Position,
			["Size"] = v57.Size,
			["Image"] = v_u_18.Images.CircleCutout,
			["imageStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = p54.Theme.BackgroundUIDefault.Color
			}
		})
	else
		v63 = v_u_5.createElement(v_u_27, v_u_9.Dictionary.join(v57, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ZIndex"] = 2,
			["Image"] = v_u_18.Images.CircleCutout,
			["ImageColor3"] = p54.Theme.BackgroundUIDefault.Color
		}))
	end
	v62.PlayerCutout = v63
	local v64
	if v_u_29 then
		v64 = v_u_5.createElement(v_u_28, {
			["AnchorPoint"] = v57.AnchorPoint,
			["Position"] = v57.Position,
			["Size"] = v57.Size,
			["Image"] = v58 > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v58 .. "&w=48&h=48" or ""
		})
	else
		v64 = v_u_5.createElement(v_u_27, v_u_9.Dictionary.join(v57, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Image"] = v58 > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. v58 .. "&w=48&h=48" or ""
		}))
	end
	v62.PlayerIcon = v64
	v62.PlayerBackground = v_u_5.createElement("Frame", v_u_9.Dictionary.join(v57, {
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["BorderSizePixel"] = 0,
		["ZIndex"] = 0,
		["BackgroundColor3"] = p54.Theme.UIDefault.Color
	}))
	v62.PlayerName = v_u_5.createElement(v_u_21, {
		["fontKey"] = "Body",
		["themeKey"] = "TextEmphasis",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["TextXAlignment"] = nil,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0.5, -76, 0.5, 0),
		["Size"] = UDim2.new(0.5, 76, 0, 44),
		["Text"] = p_u_53.props.userName,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
	p56.ReportPlayerTextContainer = v59(v60, v61, v62)
	p56.AbuseTypeDropDown = v_u_5.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 68)
	}, {
		["DropDown"] = v_u_5.createElement(v_u_23, {
			["Size"] = nil,
			["placeHolderText"] = nil,
			["selections"] = nil,
			["localize"] = true,
			["selectedIndex"] = nil,
			["enabled"] = true,
			["selectionParentName"] = "abuseTypeDropDown",
			["canOpen"] = nil,
			["canCaptureFocus"] = nil,
			["selectionChanged"] = nil,
			["ButtonRef"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 44),
			["placeHolderText"] = p55.selectTypeOfAbuse,
			["selections"] = v_u_32,
			["selectedIndex"] = p_u_53.state.typeOfAbuseIndex,
			["canOpen"] = p_u_53.props.canCaptureFocus,
			["canCaptureFocus"] = p_u_53.props.isGamepadLastInput,
			["selectionChanged"] = function(p65) -- name: selectionChanged
				-- upvalues: (copy) p_u_53
				p_u_53:setState({
					["typeOfAbuseIndex"] = p65
				})
			end,
			["ButtonRef"] = p_u_53.reportDropDownRef
		})
	})
	p_u_53:renderTextEntryField(p55, p56, UDim2.new(1, 0, 0, 180))
	p_u_53:renderButtons(p54, p55, p56)
end
function v30.renderReportGame(p66, p67, p68, p69) -- name: renderReportGame
	-- upvalues: (copy) v_u_18, (copy) v_u_5, (copy) v_u_29, (copy) v_u_28, (copy) v_u_27, (copy) v_u_21
	p66:renderReportTitle(p67, p69, "Report " .. p66.props.placeName)
	local v70 = v_u_18.Images.PlaceholderGameIcon
	if game.GameId > 0 then
		v70 = "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150"
	end
	local v71 = v_u_5.createElement
	local v72 = "Frame"
	local v73 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 126)
	}
	local v74 = {}
	local v75
	if v_u_29 then
		v75 = v_u_5.createElement(v_u_28, {
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 17, 0.5, 0),
			["Size"] = UDim2.new(0, 64, 0, 64),
			["Image"] = v70
		})
	else
		v75 = v_u_5.createElement(v_u_27, {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 17, 0.5, 0),
			["Size"] = UDim2.new(0, 64, 0, 64),
			["Image"] = v70
		})
	end
	v74.GameIcon = v75
	v74.GameName = v_u_5.createElement(v_u_21, {
		["fontKey"] = "Body",
		["themeKey"] = "TextEmphasis",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["TextXAlignment"] = nil,
		["TextWrapped"] = true,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0, 104, 0.5, 0),
		["Size"] = UDim2.new(1, -104, 0, 44),
		["Text"] = p68.flagingGame,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
	p69.ReportGameTextContainer = v71(v72, v73, v74)
	p66:renderTextEntryField(p68, p69, UDim2.new(1, 0, 0, 191))
	p66:renderButtons(p67, p68, p69)
end
function v30.render(p_u_76) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_20, (copy) v_u_5, (copy) v_u_29, (copy) v_u_28, (copy) v_u_18, (copy) v_u_27, (copy) v_u_15, (copy) v_u_17, (copy) v_u_3
	return v_u_12(function(p77)
		local v78 = {}
		local v79 = {
			["Overlay"] = {
				["Color"] = p77.Color.Common.Scrim.Color3,
				["Transparency"] = p77.Color.Common.Scrim.Transparency
			},
			["BackgroundUIDefault"] = {
				["Color"] = p77.Color.Surface.Surface_300.Color3,
				["Transparency"] = p77.Color.Surface.Surface_300.Transparency
			},
			["UIDefault"] = {
				["Color"] = p77.Color.Shift.Shift_200.Color3,
				["Transparency"] = p77.Color.Shift.Shift_200.Transparency
			},
			["Divider"] = {
				["Color"] = p77.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p77.Color.Stroke.Emphasis.Transparency
			}
		}
		v78.Theme = v79
		return v78
	end, function(p_u_80)
		-- upvalues: (ref) v_u_20, (copy) p_u_76, (ref) v_u_5, (ref) v_u_29, (ref) v_u_28, (ref) v_u_18, (ref) v_u_27, (ref) v_u_15, (ref) v_u_17, (ref) v_u_3
		local v81 = v_u_20
		local v82 = {
			["flagingGame"] = nil,
			["reportGameTitle"] = nil,
			["reportPlayerTitle"] = "CoreScripts.InGameMenu.Report.ReportPlayerTitle",
			["selectTypeOfAbuse"] = "CoreScripts.InGameMenu.Report.SelectAbuseType",
			["cancel"] = "CoreScripts.InGameMenu.Cancel",
			["report"] = "CoreScripts.InGameMenu.Report.SendReport",
			["textboxPlaceHolder"] = "CoreScripts.InGameMenu.Report.AdditionalDetails",
			["flagingGame"] = {
				"CoreScripts.InGameMenu.Report.FlagingGame",
				["RBX_NAME"] = p_u_76.props.placeName
			},
			["reportGameTitle"] = {
				"CoreScripts.InGameMenu.Report.ReportGameTitle",
				["RBX_NAME"] = p_u_76.props.placeName
			}
		}
		return v81(v82)(function(p83)
			-- upvalues: (ref) v_u_5, (ref) p_u_76, (copy) p_u_80, (ref) v_u_29, (ref) v_u_28, (ref) v_u_18, (ref) v_u_27, (ref) v_u_15, (ref) v_u_17, (ref) v_u_3
			local v84 = {
				["Padding"] = v_u_5.createElement("UIPadding", {
					["PaddingBottom"] = UDim.new(0, 24),
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				}),
				["Layout"] = v_u_5.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				})
			}
			if p_u_76.props.userId == nil then
				p_u_76:renderReportGame(p_u_80, p83, v84)
			else
				p_u_76:renderReportPlayer(p_u_80, p83, v84)
			end
			local v85 = v_u_5.createElement
			local v86 = "Frame"
			local v87 = {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BackgroundTransparency"] = 1,
				["ZIndex"] = 8,
				["Visible"] = p_u_76.props.isOpen,
				[v_u_5.Ref] = p_u_76.selectionGroupRef
			}
			local v88 = {
				["Overlay"] = v_u_5.createElement("TextButton", {
					["AutoButtonColor"] = false,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["Text"] = "",
					["Selectable"] = false,
					["BackgroundColor3"] = p_u_80.Theme.Overlay.Color,
					["BackgroundTransparency"] = p_u_80.Theme.Overlay.Transparency,
					["Size"] = UDim2.new(1, 0, 1, 0)
				})
			}
			local v89
			if v_u_29 then
				v89 = v_u_5.createElement(v_u_28, {
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Image"] = v_u_18.Images.RoundedRectImageKey,
					["imageStyle"] = {
						["Color3"] = p_u_80.Theme.BackgroundUIDefault.Color,
						["Transparency"] = p_u_80.Theme.BackgroundUIDefault.Transparency
					},
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["Size"] = UDim2.new(0, 600, 0, 450),
					["slice"] = {
						["center"] = Rect.new(8, 8, 9, 9)
					}
				}, v84)
			else
				v89 = v_u_5.createElement(v_u_27, {
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["Position"] = nil,
					["ScaleType"] = nil,
					["Size"] = nil,
					["SliceCenter"] = nil,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Image"] = v_u_18.Images.RoundedRect.Image,
					["ImageColor3"] = p_u_80.Theme.BackgroundUIDefault.Color,
					["ImageTransparency"] = p_u_80.Theme.BackgroundUIDefault.Transparency,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
					["Size"] = UDim2.new(0, 600, 0, 450),
					["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter
				}, v84)
			end
			v88.DialogMainFrame = v89
			local v90
			if v_u_15() then
				local v91 = v_u_5.createElement
				local v92 = v_u_17
				local v93 = {}
				local v94 = p_u_76.props.canCaptureFocus
				if v94 then
					v94 = p_u_76.props.isGamepadLastInput
				end
				v93.isFocused = v94
				v93.shouldForgetPreviousSelection = not p_u_76.props.isOpen
				function v93.didFocus(p95) -- name: didFocus
					-- upvalues: (ref) p_u_76, (ref) v_u_3
					local v96
					if p_u_76.props.userId then
						v96 = p_u_76.reportDropDownRef:getValue()
					else
						v96 = p_u_76.reportTextEntryRef:getValue()
					end
					v_u_3.SelectedCoreObject = p95 or v96
				end
				v90 = v91(v92, v93) or nil
			else
				v90 = nil
			end
			v88.FocusHandler = v90
			return v85(v86, v87, v88)
		end)
	end)
end
function v30.bindActions(p_u_97) -- name: bindActions
	-- upvalues: (copy) v_u_2
	v_u_2:BindCoreAction("InGameMenuReportModalClose", function(_, p98, _) -- name: closeReportFunc
		-- upvalues: (copy) p_u_97
		if p98 == Enum.UserInputState.Begin then
			p_u_97.props.dispatchCloseReportDialog()
		end
	end, false, Enum.KeyCode.Escape)
end
function v30.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("InGameMenuReportModalClose")
end
function v30.didMount(p99) -- name: didMount
	-- upvalues: (copy) v_u_3
	v_u_3:RemoveSelectionGroup("ReportDialogGroup")
	v_u_3:AddSelectionParent("ReportDialogGroup", p99.selectionGroupRef:getValue())
	if p99.props.isOpen then
		p99:bindActions()
	end
end
function v30.didUpdate(p100, p101) -- name: didUpdate
	-- upvalues: (copy) v_u_15, (copy) v_u_3
	if p101.isOpen and not p100.props.isOpen then
		p100:setState({
			["typeOfAbuseIndex"] = 0,
			["abuseDescription"] = ""
		})
	end
	if not (v_u_15() or p101.canCaptureFocus and p101.isGamepadLastInput) and (p100.props.canCaptureFocus and p100.props.isGamepadLastInput) then
		local v102
		if p100.props.userId then
			v102 = p100.reportDropDownRef:getValue()
		else
			v102 = p100.reportTextEntryRef:getValue()
		end
		v_u_3.SelectedCoreObject = v102
	end
	if p100.props.isOpen then
		p100:bindActions()
	else
		p100:unbindActions()
	end
end
function v30.willUnmount(p103) -- name: willUnmount
	p103:unbindActions()
end
return v6.UNSTABLE_connect2(function(p104, _)
	-- upvalues: (copy) v_u_24
	local v105 = {
		["isOpen"] = p104.report.dialogOpen,
		["userId"] = p104.report.userId,
		["userName"] = p104.report.userName,
		["placeName"] = p104.gameInfo.name
	}
	local v106 = p104.report.dialogOpen
	if v106 then
		v106 = not p104.respawn.dialogOpen
	end
	v105.canCaptureFocus = v106
	v105.isGamepadLastInput = p104.displayOptions.inputType == v_u_24.InputType.Gamepad
	return v105
end, function(p_u_107)
	-- upvalues: (copy) v_u_19, (copy) v_u_26, (copy) v_u_25, (copy) v_u_24
	return {
		["dispatchCloseReportDialog"] = function() -- name: dispatchCloseReportDialog
			-- upvalues: (copy) p_u_107, (ref) v_u_19
			p_u_107(v_u_19())
		end,
		["dispatchSendReport"] = function(p108, p109, p110) -- name: dispatchSendReport
			-- upvalues: (copy) p_u_107, (ref) v_u_26, (ref) v_u_25, (ref) v_u_24
			p_u_107(v_u_26(p108, p109, p110))
			local v111 = {}
			if p108 == "Inappropriate Content" then
				table.insert(v111, "report_type=game")
				local v112 = game.GameId
				local v113 = "reported_entity_id=" .. tostring(v112)
				table.insert(v111, v113)
			else
				table.insert(v111, "report_type=user")
				local v114 = "reported_entity_id=" .. tostring(p110)
				table.insert(v111, v114)
			end
			table.insert(v111, "report_source=ingame")
			local v115 = table.concat(v111, "&")
			v_u_25(v_u_24.AnalyticsReportSubmittedName, v115, {})
		end
	}
end)(v30)