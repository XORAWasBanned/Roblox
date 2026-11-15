-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.PlayerDropDown
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = require(v1.Packages.Cryo)
local v_u_6 = require(v1.Packages.Roact)
local v_u_7 = require(v1.Packages.React)
local v8 = require(v1.Packages.RoactRodux)
local v9 = require(v1.Packages.t)
local v_u_10 = require(v1.Packages.Otter)
local v_u_11 = require(v1.Packages.ReactFocusNavigation)
local v12 = require(v1.Packages.UIBlox)
local v13 = require(v1.Workspace.Packages.PlayerList)
local v_u_14 = v13.Common.useLayoutValues
local v15 = script.Parent.Parent
local v16 = v15.Connection
local v_u_17 = require(v16.LayoutValues).WithLayoutValues
local v_u_18 = require(script.Parent.DropDownButton)
local v_u_19 = require(script.Parent.DropDownPlayerHeader)
local v_u_20 = require(script.Parent.FriendDropDownButton)
local v_u_21 = v3.LocalPlayer
local v_u_22 = v2:WaitForChild("RobloxGui")
local v_u_23 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_24 = require(v_u_22.Modules.Settings.onBlockButtonActivated)
local v_u_25 = v12.App.ImageSet.Images
local v_u_26 = require(v_u_22.Modules.isNewInGameMenuEnabled)
local v27 = v15.Parent
local v_u_28 = require(v27.Actions.ClosePlayerDropDown)
local v_u_29 = require(v27.Actions.SetPlayerListVisibility)
local v30 = require(v27.Flags.FFlagPlayerListReduceRerenders)
local v_u_31 = v13.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_32 = require(v27.Thunks.UnblockPlayer)
local v_u_33 = require(v27.Thunks.RequestFriendship)
local v_u_34 = require(v27.Actions.SetPlayerIsBlocked)
local v_u_35 = v_u_6.PureComponent:extend("PlayerDropDown")
local v_u_36 = require(v1.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local v_u_37 = require(v27.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
local v38 = v9.strictInterface
local v39 = {
	["contentsVisible"] = v9.boolean,
	["selectedPlayer"] = v9.optional(v9.instanceIsA("Player")),
	["isVisible"] = v9.boolean,
	["playerRelationship"] = v9.optional(v9.strictInterface({
		["isBlocked"] = v9.boolean,
		["friendStatus"] = v9.enum(Enum.FriendStatus),
		["isFollowing"] = v9.boolean,
		["isFollower"] = v9.boolean
	})),
	["inspectMenuEnabled"] = v9.boolean,
	["isTenFootInterface"] = v9.boolean,
	["isUsingGamepad"] = v9.optional(v9.boolean),
	["subjectToChinaPolicies"] = v9.boolean,
	["preferredTransparency"] = v9.number,
	["closeDropDown"] = v9.callback,
	["blockPlayerSuccess"] = v9.callback,
	["unblockPlayer"] = v9.callback,
	["requestFriendship"] = v9.callback,
	["setPlayerListVisibility"] = v9.callback,
	["focusGuiObject"] = v9.optional(v9.callback),
	["focusedGuiObject"] = v9.optional(v9.instanceIsA("GuiObject")),
	["layoutValues"] = v9.optional(v9.table)
}
v_u_35.validateProps = v38(v39)
local v_u_40 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
function v_u_35.init(p_u_41) -- name: init
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_10
	p_u_41.state = {
		["allVisible"] = false,
		["contentVisible"] = false
	}
	p_u_41.buttonsContainerRef = v_u_7.createRef()
	local v42, v43 = v_u_6.createBinding(1)
	p_u_41.containerScale = v42
	p_u_41.updateContainerScale = v43
	p_u_41.containerScaleMotor = v_u_10.createSingleMotor(0)
	p_u_41.containerScaleMotor:onStep(function(p44)
		-- upvalues: (copy) p_u_41
		p_u_41.updateContainerScale(p44)
	end)
	local v45, v46 = v_u_6.createBinding(1)
	p_u_41.transparency = v45
	p_u_41.updateTransparency = v46
	p_u_41.transparencyMotor = v_u_10.createSingleMotor(0)
	p_u_41.transparencyMotor:onStep(function(p47)
		-- upvalues: (copy) p_u_41
		p_u_41.updateTransparency(p47)
		if p47 < 0.5 and (p_u_41.props.isVisible and p_u_41.props.contentsVisible) then
			p_u_41:setState({
				["contentVisible"] = true
			})
		else
			p_u_41:setState({
				["contentVisible"] = false
			})
		end
		p_u_41:setState({
			["allVisible"] = p47 < 1
		})
	end)
	local v48, v49 = v_u_6.createBinding(1)
	p_u_41.buttonTransparency = v48
	p_u_41.updateButtonTransparency = v49
	p_u_41.buttonTransparencyMotor = v_u_10.createSingleMotor(0)
	p_u_41.buttonTransparencyMotor:onStep(function(p50)
		-- upvalues: (copy) p_u_41
		p_u_41.updateButtonTransparency(p50)
	end)
end
function v_u_35.createFriendButton(p51, p52) -- name: createFriendButton
	-- upvalues: (copy) v_u_6, (copy) v_u_20
	local v53 = p51.props.selectedPlayer
	return v_u_6.createElement(v_u_20, {
		["layoutOrder"] = 1,
		["playerRelationship"] = nil,
		["selectedPlayer"] = nil,
		["dropDownOpen"] = nil,
		["requestFriendship"] = nil,
		["contentVisible"] = nil,
		["isUsingGamepad"] = nil,
		["playerRelationship"] = p52,
		["selectedPlayer"] = v53,
		["dropDownOpen"] = p51.props.isVisible,
		["requestFriendship"] = p51.props.requestFriendship,
		["contentVisible"] = p51.state.contentVisible,
		["isUsingGamepad"] = p51.props.isUsingGamepad
	})
end
function v_u_35.createBlockButton(p_u_54, p_u_55) -- name: createBlockButton
	-- upvalues: (copy) v_u_23, (copy) v_u_25, (copy) v_u_6, (copy) v_u_18, (copy) v_u_24, (copy) v_u_31
	local v_u_56 = p_u_54.props.selectedPlayer
	local v57 = v_u_23:FormatByKey("InGame.PlayerDropDown.Block")
	local v58 = v_u_23:FormatByKey("InGame.PlayerDropDown.UnBlock")
	local v59 = v_u_25["icons/actions/block"]
	local v60 = v_u_6.createElement
	local v61 = v_u_18
	local v62 = {
		["contentVisible"] = nil,
		["buttonTransparency"] = nil,
		["layoutOrder"] = 4,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = false,
		["forceShowOptions"] = false,
		["onActivated"] = nil,
		["contentVisible"] = p_u_54.state.contentVisible,
		["buttonTransparency"] = p_u_54.buttonTransparency
	}
	if p_u_55.isBlocked then
		v57 = v58 or v57
	end
	v62.text = v57
	v62.icon = v59
	function v62.onActivated() -- name: onActivated
		-- upvalues: (copy) p_u_55, (copy) p_u_54, (copy) v_u_56, (ref) v_u_24, (ref) v_u_31
		if p_u_55.isBlocked then
			p_u_54.props.unblockPlayer(v_u_56)
		else
			local v63 = {
				["onBlockingSuccess"] = function() -- name: onBlockingSuccess
					-- upvalues: (ref) p_u_54, (ref) v_u_56
					p_u_54.props.blockPlayerSuccess(v_u_56)
				end,
				["onBlockingModalClose"] = v_u_31 and function()
					-- upvalues: (ref) p_u_54
					if p_u_54.props.isUsingGamepad then
						p_u_54.props.focusGuiObject(p_u_54.buttonsContainerRef.current)
					end
				end or nil
			}
			v_u_24(v_u_56, nil, p_u_54.__componentName, v63)
		end
	end
	return v60(v61, v62)
end
function v_u_35.createReportButton(p_u_64) -- name: createReportButton
	-- upvalues: (copy) v_u_36, (copy) v_u_37, (copy) v_u_25, (copy) v_u_6, (copy) v_u_18, (copy) v_u_23, (copy) v_u_26, (copy) v_u_22
	local v_u_65 = p_u_64.props.selectedPlayer
	local v66 = v_u_36 and v_u_37 and "Flag" or v_u_25["icons/actions/feedback"]
	return v_u_6.createElement(v_u_18, {
		["contentVisible"] = nil,
		["buttonTransparency"] = nil,
		["layoutOrder"] = 5,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = true,
		["forceShowOptions"] = false,
		["onActivated"] = nil,
		["contentVisible"] = p_u_64.state.contentVisible,
		["buttonTransparency"] = p_u_64.buttonTransparency,
		["text"] = v_u_23:FormatByKey("InGame.PlayerDropDown.Report"),
		["icon"] = v66,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_26, (ref) v_u_22, (copy) v_u_65, (copy) p_u_64
			if v_u_26() then
				require(v_u_22.Modules.InGameMenuInit).openReportDialog(v_u_65, p_u_64.__componentName)
			else
				require(v_u_22.Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(v_u_65, p_u_64.__componentName)
				p_u_64.props.closeDropDown()
			end
		end
	})
end
function v_u_35.createInspectButton(p_u_67) -- name: createInspectButton
	-- upvalues: (copy) v_u_25, (copy) v_u_6, (copy) v_u_18, (copy) v_u_23, (copy) v_u_21, (copy) v_u_4
	local v_u_68 = p_u_67.props.selectedPlayer
	local v69 = v_u_25["icons/actions/zoomIn"]
	return v_u_6.createElement(v_u_18, {
		["contentVisible"] = nil,
		["buttonTransparency"] = nil,
		["layoutOrder"] = 3,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = nil,
		["forceShowOptions"] = false,
		["onActivated"] = nil,
		["contentVisible"] = p_u_67.state.contentVisible,
		["buttonTransparency"] = p_u_67.buttonTransparency,
		["text"] = v_u_23:FormatByKey("InGame.PlayerDropDown.Examine"),
		["icon"] = v69,
		["lastButton"] = v_u_68 == v_u_21,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_4, (copy) v_u_68, (copy) p_u_67
			v_u_4:InspectPlayerFromUserIdWithCtx(v_u_68.UserId, "leaderBoard")
			p_u_67.props.closeDropDown()
			p_u_67.props.setPlayerListVisibility(false)
		end
	})
end
function v_u_35.render(p_u_70) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_6, (copy) v_u_19, (copy) v_u_21, (copy) v_u_31
	return v_u_17(function(_)
		-- upvalues: (copy) p_u_70, (ref) v_u_6, (ref) v_u_19, (ref) v_u_21, (ref) v_u_31
		local v71 = p_u_70.props.layoutValues
		local v72 = p_u_70.props.selectedPlayer
		if not v72 or p_u_70.props.isTenFootInterface then
			return nil
		end
		local v73 = {
			["UIScale"] = v_u_6.createElement("UIScale", {
				["Scale"] = p_u_70.containerScale
			}),
			["UIListLayout"] = v_u_6.createElement("UIListLayout", {
				["Padding"] = UDim.new(0, v71.DropDownButtonPadding),
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["PlayerHeader"] = v_u_6.createElement(v_u_19, {
				["player"] = p_u_70.props.selectedPlayer,
				["contentVisible"] = p_u_70.state.contentVisible,
				["transparency"] = p_u_70.transparency
			})
		}
		local v74 = 4 * v71.DropDownButtonSizeY + v71.DropDownHeaderSizeY
		local v75 = v71.DropDownButtonPadding + v71.DropDownHeaderSizeY
		local v76 = p_u_70.props.playerRelationship
		if v72 ~= v_u_21 then
			if not v76.isBlocked then
				v73.FriendButton = p_u_70:createFriendButton(v76)
				v75 = v75 + v71.DropDownButtonPadding + v71.DropDownButtonSizeY
			end
			v73.BlockButton = p_u_70:createBlockButton(v76)
			local v77 = v75 + v71.DropDownButtonPadding + v71.DropDownButtonSizeY
			v73.ReportButton = p_u_70:createReportButton()
			v75 = v77 + v71.DropDownButtonPadding + v71.DropDownButtonSizeY
		end
		if p_u_70.props.inspectMenuEnabled then
			v73.InspectButton = p_u_70:createInspectButton()
			v75 = v75 + v71.DropDownButtonPadding + v71.DropDownButtonSizeY
		end
		local v78 = v75 - v71.DropDownButtonPadding
		local v79 = v_u_6.createElement
		local v80 = "ImageButton"
		local v81 = {
			["LayoutOrder"] = p_u_70.props.layoutOrder,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = 1,
			["Selectable"] = false,
			["Modal"] = false,
			["Visible"] = p_u_70.state.allVisible,
			["AutoButtonColor"] = false,
			["Active"] = p_u_70.props.isVisible,
			["Image"] = "",
			["SelectionGroup"] = v_u_31 and true or nil
		}
		local v82
		if v_u_31 then
			v82 = Enum.SelectionBehavior.Stop
		else
			v82 = nil
		end
		v81.SelectionBehaviorUp = v82
		local v83
		if v_u_31 then
			v83 = Enum.SelectionBehavior.Stop
		else
			v83 = nil
		end
		v81.SelectionBehaviorDown = v83
		local v84
		if v_u_31 then
			v84 = Enum.SelectionBehavior.Stop
		else
			v84 = nil
		end
		v81.SelectionBehaviorLeft = v84
		local v85
		if v_u_31 then
			v85 = Enum.SelectionBehavior.Stop
		else
			v85 = nil
		end
		v81.SelectionBehaviorRight = v85
		v81[v_u_6.Event.Activated] = p_u_70.props.closeDropDown
		v81[v_u_6.Ref] = p_u_70.imageButtonRef
		local v86 = {}
		local v87 = v_u_6.createElement
		local v88 = "Frame"
		local v89 = {
			["LayoutOrder"] = p_u_70.props.layoutOrder,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0.5, -v74 / 2),
			["Size"] = UDim2.new(0, v71.PlayerDropDownSizeXMobile, 0, v78),
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true
		}
		local v90 = v_u_6.Ref
		local v91
		if v_u_31 then
			v91 = p_u_70.buttonsContainerRef
		else
			v91 = nil
		end
		v89[v90] = v91
		v86.Container = v87(v88, v89, v73)
		return v79(v80, v81, v86)
	end)
end
function v_u_35.getScale(p92) -- name: getScale
	return p92.props.isVisible and p92.props.contentsVisible and 1 or 1.25
end
function v_u_35.getTransparency(p93) -- name: getTransparency
	return p93.props.isVisible and p93.props.contentsVisible and 0 or 1
end
function v_u_35.getButtonTransparency(p94) -- name: getButtonTransparency
	return not (p94.props.isVisible and p94.props.contentsVisible) and 1 or p94.props.preferredTransparency * 0.3
end
function v_u_35.didUpdate(p95, _, p96) -- name: didUpdate
	-- upvalues: (copy) v_u_10, (copy) v_u_40, (copy) v_u_31
	p95.containerScaleMotor:setGoal(v_u_10.spring(p95:getScale(), v_u_40))
	p95.transparencyMotor:setGoal(v_u_10.spring(p95:getTransparency(), v_u_40))
	p95.buttonTransparencyMotor:setGoal(v_u_10.spring(p95:getButtonTransparency(), v_u_40))
	if v_u_31 and (p95.props.isUsingGamepad and (p96.contentVisible ~= p95.state.contentVisible or not p95.props.focusedGuiObject)) and (p95.state.contentVisible and p95.buttonsContainerRef.current) then
		p95.props.focusGuiObject(p95.buttonsContainerRef.current)
		if not v_u_31 then
			p95.buttonsContainerRef.current.SelectionGroup = true
			p95.buttonsContainerRef.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			p95.buttonsContainerRef.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			p95.buttonsContainerRef.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			p95.buttonsContainerRef.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		end
	end
end
function v_u_35.didMount(_) -- name: didMount end
function v_u_35.willUnmount(p97) -- name: willUnmount
	p97.transparencyMotor:destroy()
	p97.containerScaleMotor:destroy()
	p97.buttonTransparencyMotor:destroy()
	p97.transparencyMotor = nil
	p97.containerScaleMotor = nil
	p97.buttonTransparencyMotor = nil
end
local function v103(p98) -- name: mapStateToProps
	-- upvalues: (copy) v_u_31
	local v99 = p98.playerDropDown.selectedPlayer
	local v100 = p98.playerDropDown.isVisible
	if v100 then
		v100 = p98.displayOptions.isVisible
	end
	local v101 = {
		["selectedPlayer"] = v99,
		["isVisible"] = v100
	}
	if v99 then
		v99 = p98.playerRelationship[v99.UserId]
	end
	v101.playerRelationship = v99
	v101.inspectMenuEnabled = p98.displayOptions.inspectMenuEnabled
	v101.isTenFootInterface = p98.displayOptions.isTenFootInterface
	local v102
	if v_u_31 then
		v102 = p98.displayOptions.isUsingGamepad
	else
		v102 = nil
	end
	v101.isUsingGamepad = v102
	v101.subjectToChinaPolicies = p98.displayOptions.subjectToChinaPolicies
	v101.preferredTransparency = p98.settings.preferredTransparency
	return v101
end
local function v109(p_u_104) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (copy) v_u_34, (copy) v_u_32, (copy) v_u_33
	return {
		["closeDropDown"] = function() -- name: closeDropDown
			-- upvalues: (copy) p_u_104, (ref) v_u_28
			return p_u_104(v_u_28())
		end,
		["setPlayerListVisibility"] = function(p105) -- name: setPlayerListVisibility
			-- upvalues: (copy) p_u_104, (ref) v_u_29
			return p_u_104(v_u_29(p105))
		end,
		["blockPlayerSuccess"] = function(p106) -- name: blockPlayerSuccess
			-- upvalues: (copy) p_u_104, (ref) v_u_34
			p_u_104(v_u_34(p106, true))
		end,
		["unblockPlayer"] = function(p107) -- name: unblockPlayer
			-- upvalues: (copy) p_u_104, (ref) v_u_32
			return p_u_104(v_u_32(p107))
		end,
		["requestFriendship"] = function(p108, _) -- name: requestFriendship
			-- upvalues: (copy) p_u_104, (ref) v_u_33
			return p_u_104(v_u_33(p108))
		end
	}
end
local function v113(p110) -- name: PlayerDropDownWrapper
	-- upvalues: (copy) v_u_14, (copy) v_u_11, (copy) v_u_6, (copy) v_u_35, (copy) v_u_5
	local v111 = v_u_14()
	local v112 = {
		["focusGuiObject"] = v_u_11.useFocusGuiObject(),
		["focusedGuiObject"] = v_u_11.useFocusedGuiObject(),
		["layoutValues"] = v111
	}
	return v_u_6.createElement(v_u_35, v_u_5.Dictionary.join(p110, v112))
end
if v30 then
	return v_u_7.memo(v8.connect(v103, v109)(v113))
else
	return v8.connect(v103, v109)(v113)
end