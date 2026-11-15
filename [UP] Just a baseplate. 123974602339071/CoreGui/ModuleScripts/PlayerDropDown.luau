-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.PlayerDropDown
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.React)
local v7 = require(v1.Packages.RoactRodux)
local v8 = require(v1.Packages.t)
local v_u_9 = require(v1.Packages.Otter)
local v10 = require(v1.Packages.UIBlox)
local v11 = script.Parent.Parent
local v12 = v11.Connection
local v_u_13 = require(v12.LayoutValues).WithLayoutValues
local v_u_14 = require(script.Parent.DropDownButton)
local v_u_15 = require(script.Parent.DropDownPlayerHeader)
local v_u_16 = require(script.Parent.FriendDropDownButton)
local v_u_17 = v3.LocalPlayer
local v_u_18 = v2:WaitForChild("RobloxGui")
local v_u_19 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_20 = require(v_u_18.Modules.Settings.onBlockButtonActivated)
local v_u_21 = v10.App.ImageSet.Images
local v_u_22 = require(v_u_18.Modules.isNewInGameMenuEnabled)
local v23 = v11.Parent
local v_u_24 = require(v23.Actions.ClosePlayerDropDown)
local v25 = require(v23.Flags.FFlagPlayerListReduceRerenders)
local v_u_26 = require(v23.Thunks.UnblockPlayer)
local v_u_27 = require(v23.Thunks.RequestFriendship)
local v_u_28 = require(v23.Actions.SetPlayerIsBlocked)
local v29 = v_u_5.PureComponent:extend("PlayerDropDown")
local v_u_30 = require(v1.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local v_u_31 = require(v23.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
local v32 = v8.strictInterface
local v33 = {
	["positionY"] = v8.number,
	["minPositionBoundY"] = v8.number,
	["maxPositionBoundY"] = v8.number,
	["contentsVisible"] = v8.boolean,
	["selectedPlayer"] = v8.optional(v8.instanceIsA("Player")),
	["isVisible"] = v8.boolean,
	["playerRelationship"] = v8.optional(v8.strictInterface({
		["isBlocked"] = v8.boolean,
		["friendStatus"] = v8.enum(Enum.FriendStatus),
		["isFollowing"] = v8.boolean,
		["isFollower"] = v8.boolean
	})),
	["inspectMenuEnabled"] = v8.boolean,
	["isTenFootInterface"] = v8.boolean,
	["subjectToChinaPolicies"] = v8.boolean,
	["closeDropDown"] = v8.callback,
	["blockPlayerSuccess"] = v8.callback,
	["unblockPlayer"] = v8.callback,
	["requestFriendship"] = v8.callback
}
v29.validateProps = v32(v33)
function v29.init(p_u_34) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_9
	p_u_34.innerFrameRef = v_u_5.createRef()
	p_u_34.motorOptions = {
		["dampingRatio"] = 1,
		["frequency"] = 4
	}
	p_u_34.motor = v_u_9.createSingleMotor(1)
	p_u_34.motor:onStep(function(p35)
		-- upvalues: (copy) p_u_34
		local v36 = p_u_34.innerFrameRef.current
		if v36 then
			if p35 == 1 then
				v36.Visible = false
			else
				v36.Visible = true
			end
			v36.Position = UDim2.new(p35, 0, 0, 0)
		end
	end)
	p_u_34.dropDownPosition = 0
end
function v29.createFriendButton(p37, p38) -- name: createFriendButton
	-- upvalues: (copy) v_u_5, (copy) v_u_16
	local v39 = p37.props.selectedPlayer
	return v_u_5.createElement(v_u_16, {
		["layoutOrder"] = 1,
		["playerRelationship"] = nil,
		["selectedPlayer"] = nil,
		["dropDownOpen"] = nil,
		["requestFriendship"] = nil,
		["contentVisible"] = true,
		["playerRelationship"] = p38,
		["selectedPlayer"] = v39,
		["dropDownOpen"] = p37.props.isVisible,
		["requestFriendship"] = p37.props.requestFriendship
	})
end
function v29.createBlockButton(p_u_40, p_u_41) -- name: createBlockButton
	-- upvalues: (copy) v_u_19, (copy) v_u_21, (copy) v_u_5, (copy) v_u_14, (copy) v_u_20
	local v_u_42 = p_u_40.props.selectedPlayer
	local v43 = v_u_19:FormatByKey("InGame.PlayerDropDown.Block")
	local v44 = v_u_19:FormatByKey("InGame.PlayerDropDown.UnBlock")
	local v45 = v_u_21["icons/actions/block"]
	local v46 = v_u_5.createElement
	local v47 = v_u_14
	local v48 = {
		["layoutOrder"] = 4,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = false,
		["forceShowOptions"] = false,
		["onActivated"] = nil
	}
	if p_u_41.isBlocked then
		v43 = v44 or v43
	end
	v48.text = v43
	v48.icon = v45
	function v48.onActivated() -- name: onActivated
		-- upvalues: (copy) p_u_41, (copy) p_u_40, (copy) v_u_42, (ref) v_u_20
		if p_u_41.isBlocked then
			p_u_40.props.unblockPlayer(v_u_42)
		else
			local v49 = {
				["onBlockingSuccess"] = function() -- name: onBlockingSuccess
					-- upvalues: (ref) p_u_40, (ref) v_u_42
					p_u_40.props.blockPlayerSuccess(v_u_42)
				end
			}
			v_u_20(v_u_42, nil, p_u_40.__componentName, v49)
		end
	end
	return v46(v47, v48)
end
function v29.createReportButton(p_u_50) -- name: createReportButton
	-- upvalues: (copy) v_u_30, (copy) v_u_31, (copy) v_u_21, (copy) v_u_5, (copy) v_u_14, (copy) v_u_19, (copy) v_u_22, (copy) v_u_18
	local v_u_51 = p_u_50.props.selectedPlayer
	local v52 = v_u_30 and v_u_31 and "Flag" or v_u_21["icons/actions/feedback"]
	return v_u_5.createElement(v_u_14, {
		["layoutOrder"] = 5,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = true,
		["forceShowOptions"] = false,
		["onActivated"] = nil,
		["text"] = v_u_19:FormatByKey("InGame.PlayerDropDown.Report"),
		["icon"] = v52,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_22, (ref) v_u_18, (copy) v_u_51, (copy) p_u_50
			if v_u_22() then
				require(v_u_18.Modules.InGameMenuInit).openReportDialog(v_u_51, p_u_50.__componentName)
			else
				require(v_u_18.Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(v_u_51, p_u_50.__componentName)
				p_u_50.props.closeDropDown()
			end
		end
	})
end
function v29.createInspectButton(p_u_53) -- name: createInspectButton
	-- upvalues: (copy) v_u_21, (copy) v_u_5, (copy) v_u_14, (copy) v_u_19, (copy) v_u_17, (copy) v_u_4
	local v_u_54 = p_u_53.props.selectedPlayer
	local v55 = v_u_21["icons/actions/zoomIn"]
	return v_u_5.createElement(v_u_14, {
		["layoutOrder"] = 3,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = nil,
		["forceShowOptions"] = false,
		["onActivated"] = nil,
		["text"] = v_u_19:FormatByKey("InGame.PlayerDropDown.Examine"),
		["icon"] = v55,
		["lastButton"] = v_u_54 == v_u_17,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_4, (copy) v_u_54, (copy) p_u_53
			v_u_4:InspectPlayerFromUserIdWithCtx(v_u_54.UserId, "leaderBoard")
			p_u_53.props.closeDropDown()
		end
	})
end
function v29.render(p_u_56) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_15, (copy) v_u_17
	return v_u_13(function(p57)
		-- upvalues: (copy) p_u_56, (ref) v_u_5, (ref) v_u_15, (ref) v_u_17
		local v58 = p_u_56.props.selectedPlayer
		if not v58 or p_u_56.props.isTenFootInterface then
			return nil
		end
		local v59 = {
			["UIListLayout"] = v_u_5.createElement("UIListLayout", {
				["Padding"] = UDim.new(0, p57.DropDownButtonPadding),
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["PlayerHeader"] = v_u_5.createElement(v_u_15, {
				["player"] = p_u_56.props.selectedPlayer
			})
		}
		local v60 = p57.DropDownButtonPadding + p57.DropDownHeaderSizeY
		local v61 = p_u_56.props.playerRelationship
		if v58 ~= v_u_17 then
			if not v61.isBlocked then
				v59.FriendButton = p_u_56:createFriendButton(v61)
				v60 = v60 + p57.DropDownButtonPadding + p57.DropDownButtonSizeY
			end
			v59.BlockButton = p_u_56:createBlockButton(v61)
			local v62 = v60 + p57.DropDownButtonPadding + p57.DropDownButtonSizeY
			v59.ReportButton = p_u_56:createReportButton()
			v60 = v62 + p57.DropDownButtonPadding + p57.DropDownButtonSizeY
		end
		if p_u_56.props.inspectMenuEnabled then
			v59.InspectButton = p_u_56:createInspectButton()
			v60 = v60 + p57.DropDownButtonPadding + p57.DropDownButtonSizeY
		end
		local v63 = v60 - p57.DropDownButtonPadding
		local v64 = p_u_56.dropDownPosition + (p57.DropDownHeaderBackgroundSize - p57.DropDownHeaderSizeY)
		if v64 + v63 > p_u_56.props.maxPositionBoundY then
			v64 = v64 - (v64 + v63 - p_u_56.props.maxPositionBoundY)
		elseif v64 < p_u_56.props.minPositionBoundY then
			v64 = v64 + (p_u_56.props.minPositionBoundY - v64)
		end
		return v_u_5.createElement("Frame", {
			["LayoutOrder"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = p_u_56.props.layoutOrder,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(0, 0, 0, v64),
			["Size"] = UDim2.new(0, p57.PlayerDropDownSizeX + p57.PlayerDropDownOffset, 0, v63)
		}, {
			["InnerFrame"] = v_u_5.createElement("Frame", {
				["Size"] = UDim2.new(1, -p57.PlayerDropDownOffset, 1, 0),
				["BackgroundTransparency"] = 1,
				["ClipsDescendants"] = true,
				[v_u_5.Ref] = p_u_56.innerFrameRef
			}, v59)
		})
	end)
end
function v29.getDropDownPosition(p65) -- name: getDropDownPosition
	return p65.props.isVisible and p65.props.contentsVisible and 0 or 1
end
function v29.didMount(p66) -- name: didMount
	-- upvalues: (copy) v_u_9
	local v67 = p66:getDropDownPosition()
	p66.motor:start()
	p66.motor:setGoal(v_u_9.spring(v67, p66.motorOptions))
end
function v29.willUpdate(p68, p69, _) -- name: willUpdate
	p68.dropDownPosition = p69.positionY
end
function v29.didUpdate(p70, p71, _) -- name: didUpdate
	-- upvalues: (copy) v_u_9
	if p71.selectedPlayer ~= p70.props.selectedPlayer then
		p70.motor:setGoal(v_u_9.instant(1))
		p70.motor:step(0)
	end
	local v72 = p70:getDropDownPosition()
	p70.motor:setGoal(v_u_9.spring(v72, p70.motorOptions))
end
function v29.willUnmount(p73) -- name: willUnmount
	p73.motor:destroy()
end
local function v78(p74) -- name: mapStateToProps
	local v75 = p74.playerDropDown.selectedPlayer
	local v76 = p74.playerDropDown.isVisible
	if v76 then
		v76 = p74.displayOptions.isVisible
	end
	local v77 = {
		["selectedPlayer"] = v75,
		["isVisible"] = v76
	}
	if v75 then
		v75 = p74.playerRelationship[v75.UserId]
	end
	v77.playerRelationship = v75
	v77.inspectMenuEnabled = p74.displayOptions.inspectMenuEnabled
	v77.isTenFootInterface = p74.displayOptions.isTenFootInterface
	v77.subjectToChinaPolicies = p74.displayOptions.subjectToChinaPolicies
	return v77
end
local function v83(p_u_79) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_24, (copy) v_u_28, (copy) v_u_26, (copy) v_u_27
	return {
		["closeDropDown"] = function() -- name: closeDropDown
			-- upvalues: (copy) p_u_79, (ref) v_u_24
			return p_u_79(v_u_24())
		end,
		["blockPlayerSuccess"] = function(p80) -- name: blockPlayerSuccess
			-- upvalues: (copy) p_u_79, (ref) v_u_28
			p_u_79(v_u_28(p80, true))
		end,
		["unblockPlayer"] = function(p81) -- name: unblockPlayer
			-- upvalues: (copy) p_u_79, (ref) v_u_26
			return p_u_79(v_u_26(p81))
		end,
		["requestFriendship"] = function(p82, _) -- name: requestFriendship
			-- upvalues: (copy) p_u_79, (ref) v_u_27
			return p_u_79(v_u_27(p82))
		end
	}
end
if v25 then
	return v6.memo(v7.connect(v78, v83)(v29))
else
	return v7.UNSTABLE_connect2(v78, v83)(v29)
end