-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.PlayerListDisplayView
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v5 = script.Parent.Parent
local v6 = v5.Parent
local v_u_7 = require(v1.Packages.React)
require(v1.Packages.Signals)
local v8 = require(v1.Packages.UIBlox)
local v_u_9 = require(v1.Packages.Otter)
local v10 = require(v1.Packages.ReactFocusNavigation)
require(v1.Workspace.Packages.LeaderboardStore)
local v11 = require(v1.Workspace.Packages.PlayerList)
local v_u_12 = require(v1.Workspace.Packages.Chrome).Enabled
local v_u_13 = v11.Common.useLayoutValues
local v_u_14 = v11.Hooks.usePlayerListFocusNavigation
local v_u_15 = v8.Core.Style.useStyle
local v_u_16 = v10.useFocusGuiObject
local v_u_17 = v10.useFocusedGuiObject
local v_u_18 = v8.App.Button.IconButton
local v_u_19 = v8.App.ImageSet.Enum.IconSize
local v_u_20 = v8.App.ImageSet.getIconSize(v_u_19.Small)
local v_u_21 = v8.App.ImageSet.Images
local v_u_22 = require(v6.Components.Container.PlayerEntryContainer)
local v_u_23 = require(v6.Components.Container.TeamListContainer)
local v_u_24 = require(v6.Components.Container.TitleBarContainer)
local v_u_25 = require(v5.Presentation.PlayerDropDown)
local v_u_26 = require(v6.Flags.FFlagPlayerListFixMobileScrolling)
local v27 = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false)
local v_u_28 = v11.Flags.FFlagAddNewPlayerListFocusNav
local v_u_29 = v11.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_30 = v11.Flags.FFlagPlayerListUseFocusNavHook
local v_u_31 = v11.Flags.FFlagPlayerListTwoTabsOnLegacy
local v_u_32 = v11.Presentation.LegacyTwoTabsBody
local v_u_33 = v_u_12()
if v_u_33 then
	v_u_33 = not v27
end
local v_u_34 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
return v_u_7.memo(function(p_u_35) -- name: PlayerListDisplayView
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_30, (copy) v_u_17, (copy) v_u_14, (copy) v_u_7, (copy) v_u_9, (copy) v_u_34, (copy) v_u_28, (copy) v_u_2, (copy) v_u_3, (copy) v_u_29, (copy) v_u_4, (copy) v_u_22, (copy) v_u_24, (copy) v_u_23, (copy) v_u_26, (copy) v_u_31, (copy) v_u_12, (copy) v_u_32, (copy) v_u_25, (copy) v_u_33, (copy) v_u_20, (copy) v_u_18, (copy) v_u_19, (copy) v_u_21
	local v_u_36 = v_u_13()
	local v37 = v_u_15()
	local v38 = (v_u_36.OverrideBackgroundTransparency or 0) * v37.Settings.PreferredTransparency
	local v_u_39 = v_u_16()
	local v_u_40
	if v_u_30 then
		v_u_40 = nil
	else
		v_u_40 = v_u_17()
	end
	local v_u_41
	if v_u_30 then
		v_u_41 = v_u_14()
	else
		v_u_41 = nil
	end
	local v_u_42 = v_u_7.useRef(nil)
	local v_u_43 = v_u_7.useRef(nil)
	local v_u_44
	if v_u_30 then
		v_u_44 = nil
	else
		v_u_44 = v_u_7.useRef(nil)
	end
	local v_u_45
	if v_u_30 then
		v_u_45 = nil
	else
		v_u_45 = v_u_7.useRef(nil)
	end
	local v_u_46 = v_u_7.useRef(v_u_9.createSingleMotor(0))
	local v47, v_u_48 = v_u_7.useState(Vector2.new(0, 0))
	local v_u_49, v_u_50 = v_u_7.useState(100)
	local v51, v_u_52 = v_u_7.useState(0)
	local v53, v_u_54 = v_u_7.useState(true)
	local v_u_55, v_u_56 = v_u_7.useState(Vector2.new(0, 0))
	local v57, v_u_58 = v_u_7.useState(0)
	local v_u_59, v_u_60 = v_u_7.useState(0)
	local v61, v_u_62 = v_u_7.useState(0)
	local v63, v_u_64 = v_u_7.useState(nil)
	local v65, v_u_66 = v_u_7.createBinding(0)
	local v67, v68 = v_u_7.createBinding(0)
	local v69, v70 = v_u_7.createBinding(0)
	local v74 = v_u_7.joinBindings({ v65, v67, v69 }):map(function(p71)
		local v72 = p71[1]
		local v73 = p71[2]
		return v73 + (p71[3] - v73) * v72
	end)
	local v76 = v_u_7.useCallback(function(p75)
		-- upvalues: (copy) v_u_60
		v_u_60(p75.AbsoluteSize.Y)
	end, {})
	local v78 = v_u_7.useCallback(function(p77)
		-- upvalues: (copy) v_u_50
		v_u_50(p77.AbsoluteSize.Y)
	end, {})
	local v80 = v_u_7.useCallback(function(p79)
		-- upvalues: (copy) v_u_48
		v_u_48(p79.CanvasPosition)
	end, {})
	local v82 = v_u_7.useCallback(function(p81)
		-- upvalues: (copy) v_u_52
		v_u_52(p81.AbsolutePosition.Y)
	end, {})
	local v83 = v_u_7.useCallback(function()
		-- upvalues: (copy) p_u_35
		if p_u_35.isSmallTouchDevice then
			return p_u_35.teamList and p_u_35.teamList.getCount(false) > 0 and true or false or p_u_35.gameStatsCount > 0
		else
			return false
		end
	end, { p_u_35.gameStatsCount, p_u_35.isSmallTouchDevice, p_u_35.teamList })
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_66, (copy) v_u_54
		v_u_46.current:onStep(v_u_66)
		v_u_46.current:onComplete(function(p84)
			-- upvalues: (ref) v_u_54
			if p84 == 0 then
				v_u_54(true)
			end
		end)
	end, { v_u_66 })
	v_u_7.useEffect(function()
		-- upvalues: (copy) p_u_35, (copy) v_u_54, (copy) v_u_46, (ref) v_u_9, (ref) v_u_34
		if p_u_35.isSmallTouchDevice then
			v_u_54(not p_u_35.isMinimized)
		else
			if v_u_46.current then
				v_u_46.current:setGoal(v_u_9.spring(p_u_35.isMinimized and 1 or 0, v_u_34))
			end
			if p_u_35.isMinimized then
				v_u_54(false)
			end
		end
	end, { p_u_35.isSmallTouchDevice, p_u_35.isMinimized, v_u_46.current })
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_49, (copy) p_u_35, (copy) v_u_36, (copy) v_u_59, (copy) v_u_58
		local v85 = v_u_49 - 8
		if p_u_35.gameStatsCount > 0 then
			v85 = v85 - (v_u_36.TitleBarSizeY or 0)
		end
		local v86 = v_u_59
		v_u_58((math.min(v86, v85)))
	end, {
		v_u_49,
		v_u_59,
		p_u_35.gameStatsCount,
		v_u_36.TitleBarSizeY
	})
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_55, (copy) v_u_42, (copy) p_u_35, (copy) v_u_62, (copy) v_u_64
		local v87 = v_u_55.X
		local v88 = v_u_55.Y
		local v89 = v_u_42.current
		if p_u_35.isSmallTouchDevice or not v89 then
			v_u_62(v87)
			v_u_64(nil)
			return
		else
			local v90 = v87 - v89.AbsolutePosition.Y
			if v90 + v88 >= v89.AbsoluteSize.Y then
				local v91 = v90 + v88 - v89.AbsoluteSize.Y
				v_u_62(v90 - v91)
				v_u_64(Vector2.new(0, v89.CanvasPosition.Y + v91))
			else
				v_u_62(v90)
				v_u_64(nil)
			end
		end
	end, { v_u_55, p_u_35.isSmallTouchDevice, v_u_42.current })
	if not v_u_30 then
		v_u_7.useEffect(function()
			-- upvalues: (ref) v_u_28, (copy) p_u_35, (ref) v_u_2, (copy) v_u_43, (ref) v_u_3, (copy) v_u_42
			if not v_u_28 then
				if p_u_35.isVisible then
					if p_u_35.isDirectionalPreferred and p_u_35.isUsingGamepad then
						v_u_2.SelectedCoreObject = v_u_43.current
						v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					end
					if v_u_42.current and not p_u_35.isSmallTouchDevice then
						v_u_42.current.SelectionGroup = true
						v_u_42.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
						v_u_42.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
						v_u_42.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
						v_u_42.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
						return
					end
				else
					if p_u_35.isDirectionalPreferred and p_u_35.isUsingGamepad then
						v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
					end
					if v_u_42.current and (v_u_2.SelectedCoreObject and v_u_2.SelectedCoreObject:IsDescendantOf(v_u_42.current)) then
						v_u_2.SelectedCoreObject = nil
					end
					if v_u_42.current and not p_u_35.isSmallTouchDevice then
						v_u_42.current.SelectionGroup = false
					end
				end
			end
		end, {
			p_u_35.isVisible,
			p_u_35.isSmallTouchDevice,
			p_u_35.isDirectionalPreferred,
			p_u_35.isUsingGamepad,
			v_u_43.current,
			v_u_42.current
		})
		v_u_7.useEffect(function()
			-- upvalues: (ref) v_u_28, (copy) p_u_35, (copy) v_u_42, (copy) v_u_39, (ref) v_u_3
			if v_u_28 and (p_u_35.isVisible and v_u_42.current) then
				if p_u_35.isDirectionalPreferred and p_u_35.isUsingGamepad then
					v_u_39(nil)
					v_u_39(v_u_42.current)
					v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				end
				if not p_u_35.isSmallTouchDevice then
					v_u_42.current.SelectionGroup = true
					v_u_42.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
					v_u_42.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
					v_u_42.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
					v_u_42.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				end
			end
		end, {
			v_u_39,
			p_u_35.isVisible,
			p_u_35.isSmallTouchDevice,
			p_u_35.isDirectionalPreferred,
			p_u_35.isUsingGamepad,
			v_u_42.current
		})
		v_u_7.useEffect(function()
			-- upvalues: (ref) v_u_29, (copy) p_u_35, (copy) v_u_42, (ref) v_u_4, (copy) v_u_39
			if v_u_29 and (p_u_35.isVisible and (p_u_35.isSmallTouchDevice and (p_u_35.isUsingGamepad and v_u_42.current))) then
				local v92 = false
				if p_u_35.dropDownPlayer and not p_u_35.dropDownVisible then
					local v93
					if v_u_4 and p_u_35.dropDownPlayer.UserId == v_u_4.UserId then
						v93 = v_u_42.current:FindFirstChild("TitlePlayer", true)
					else
						v93 = v_u_42.current:FindFirstChild("PlayerEntry_" .. p_u_35.dropDownPlayer.UserId, true)
					end
					if v93 and v93:IsA("GuiObject") then
						v_u_39(v93)
						v92 = true
					end
				end
				if not v92 then
					v_u_39(nil)
					v_u_39(v_u_42.current)
				end
			end
		end, {
			v_u_39,
			p_u_35.isVisible,
			p_u_35.dropDownVisible,
			p_u_35.dropDownPlayer,
			p_u_35.isSmallTouchDevice,
			p_u_35.isUsingGamepad,
			v_u_42.current
		})
		v_u_7.useEffect(function()
			-- upvalues: (ref) v_u_28, (copy) p_u_35, (copy) v_u_42, (ref) v_u_29, (ref) v_u_3, (copy) v_u_40, (copy) v_u_39
			if v_u_28 and (not p_u_35.isVisible and v_u_42.current) then
				if (v_u_29 and p_u_35.isSmallTouchDevice or p_u_35.isDirectionalPreferred) and p_u_35.isUsingGamepad then
					v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if v_u_40 and v_u_40:IsDescendantOf(v_u_42.current) then
					v_u_39(nil)
				end
				if v_u_29 or not p_u_35.isSmallTouchDevice then
					v_u_42.current.SelectionGroup = false
				end
			end
		end, {
			v_u_40,
			v_u_39,
			p_u_35.isVisible,
			p_u_35.isSmallTouchDevice,
			p_u_35.isDirectionalPreferred,
			p_u_35.isUsingGamepad,
			v_u_42.current
		})
		v_u_7.useEffect(function()
			-- upvalues: (ref) v_u_28, (copy) p_u_35, (copy) v_u_40, (copy) v_u_45, (copy) v_u_42, (copy) v_u_39, (copy) v_u_44
			if v_u_28 and (p_u_35.isVisible and (not v_u_40 and (v_u_45.current and v_u_42.current))) then
				local v94 = v_u_42.current:FindFirstChild("PlayerEntry_" .. v_u_45.current, true)
				if v94 and v94:IsA("GuiObject") then
					v_u_39(v94)
				elseif v_u_44.current and v_u_44.current:IsDescendantOf(v_u_42.current) then
					v_u_39(v_u_44.current)
				else
					v_u_39(v_u_42.current)
				end
				v_u_45.current = nil
			end
		end, {
			v_u_40,
			v_u_39,
			p_u_35.isVisible,
			v_u_44.current,
			v_u_45.current,
			v_u_42.current
		})
	end
	if v_u_30 then
		v_u_7.useEffect(function()
			-- upvalues: (copy) p_u_35, (copy) v_u_41
			if p_u_35.isVisible and (p_u_35.isSmallTouchDevice and (p_u_35.isUsingGamepad and not p_u_35.dropDownVisible)) then
				v_u_41.getFocus()
			end
		end, {
			v_u_41,
			p_u_35.isVisible,
			p_u_35.isSmallTouchDevice,
			p_u_35.isUsingGamepad,
			p_u_35.dropDownVisible
		})
		v_u_7.useEffect(function()
			-- upvalues: (copy) p_u_35, (copy) v_u_42, (ref) v_u_2, (copy) v_u_41
			if not p_u_35.isVisible then
				local v95 = v_u_42.current and v_u_2.SelectedCoreObject
				if v95 then
					v95 = v_u_2.SelectedCoreObject:IsDescendantOf(v_u_42.current)
				end
				v_u_41.cleanup(v95)
			end
		end, { v_u_41, p_u_35.isVisible })
	end
	local v96
	if v_u_30 then
		v96 = v_u_7.useCallback(function(_, p97, _)
			-- upvalues: (copy) v_u_41
			v_u_41.setTitlePlayerInstance(p97)
		end, { v_u_41 })
	else
		v96 = nil
	end
	local v98
	if v_u_30 then
		v98 = v_u_7.useCallback(function(_)
			-- upvalues: (copy) v_u_41
			v_u_41.setTitlePlayerInstance(nil)
		end, { v_u_41 })
	else
		v98 = nil
	end
	local v_u_99 = {}
	local v100 = v_u_7.createElement
	local v101 = "UIListLayout"
	local v102 = {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["FillDirection"] = Enum.FillDirection.Vertical,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
	}
	local v103
	if p_u_35.isDirectionalPreferred then
		v103 = UDim.new(0, v_u_36.EntryPadding)
	else
		v103 = nil
	end
	v102.Padding = v103
	v_u_99.UIListLayout = v100(v101, v102)
	if v_u_4 and (p_u_35.isSmallTouchDevice and v83()) then
		local v104 = v_u_7.createElement
		local v105 = v_u_22
		local v106 = {
			["entrySizeX"] = nil,
			["layoutOrder"] = -3,
			["titlePlayerEntry"] = true,
			["player"] = nil,
			["playerIconInfo"] = nil,
			["playerRelationship"] = nil,
			["setDropDownPlayerDimensionY"] = nil,
			["registerPlayerInstance"] = nil,
			["unregisterPlayerInstance"] = nil,
			["setSelectedPlayerId"] = nil,
			["entrySizeX"] = p_u_35.entrySizeX,
			["player"] = v_u_4,
			["playerIconInfo"] = p_u_35.playerIconInfo[v_u_4.UserId] or {
				["isPlaceOwner"] = false
			},
			["playerRelationship"] = p_u_35.playerRelationship[v_u_4.UserId] or {
				["isBlocked"] = false,
				["friendStatus"] = nil,
				["isFollowing"] = false,
				["isFollower"] = false,
				["friendStatus"] = Enum.FriendStatus.NotFriend
			},
			["setDropDownPlayerDimensionY"] = v_u_56
		}
		if not v_u_30 then
			v96 = nil
		end
		v106.registerPlayerInstance = v96
		if not v_u_30 then
			v98 = nil
		end
		v106.unregisterPlayerInstance = v98
		local v107
		if v_u_30 then
			v107 = v_u_41.setSelectedPlayerId
		else
			v107 = nil
		end
		v106.setSelectedPlayerId = v107
		v_u_99.TitlePlayer = v104(v105, v106)
		v_u_99.BottomDiv = v_u_7.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.8,
			["LayoutOrder"] = -2,
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		})
	end
	if p_u_35.isSmallTouchDevice then
		v_u_99.TitleBar = v_u_7.createElement(v_u_24, {
			["size"] = nil,
			["entrySizeX"] = nil,
			["layoutOrder"] = -1,
			["contentsVisible"] = nil,
			["isSmallTouchDevice"] = true,
			["size"] = UDim2.new(1, 0, 0, v_u_36.TitleBarSizeY),
			["entrySizeX"] = p_u_35.entrySizeX,
			["contentsVisible"] = v53
		})
	end
	if p_u_35.teamListCount > 0 then
		local v_u_108 = (1 / 0)
		p_u_35.teamList.iterateData(function(p109, p110)
			-- upvalues: (ref) v_u_28, (ref) v_u_108, (copy) v_u_99, (ref) v_u_7, (ref) v_u_23, (copy) p_u_35, (ref) v_u_30, (copy) v_u_43, (copy) v_u_56, (copy) v_u_44, (copy) v_u_45, (copy) v_u_41
			local v111
			if v_u_28 or (p110.order(false) > v_u_108 or p110.players.getCount(false) <= 0) then
				v111 = false
			else
				v_u_108 = p110.order(false)
				v111 = true
			end
			local v112 = v_u_99
			local v113 = "TeamList_" .. tostring(p109)
			local v114 = v_u_7.createElement
			local v115 = v_u_23
			local v116 = {
				["entrySizeX"] = p_u_35.entrySizeX
			}
			if not v_u_30 then
				p109 = nil
			end
			v116.teamId = p109
			v116.teamData = p110
			v116.playerIconInfos = p_u_35.playerIconInfo
			v116.playerRelationships = p_u_35.playerRelationship
			local v117
			if v_u_28 or not v111 then
				v117 = nil
			else
				v117 = v_u_43
			end
			v116.firstPlayerRef = v117
			v116.setDropDownPlayerDimensionY = v_u_56
			local v118
			if v_u_30 or not v_u_28 then
				v118 = nil
			else
				v118 = v_u_44
			end
			v116.prevFocusedEntry = v118
			local v119
			if v_u_30 or not v_u_28 then
				v119 = nil
			else
				v119 = v_u_45
			end
			v116.destroyedFocusedPlayerId = v119
			local v120
			if v_u_30 then
				v120 = v_u_41.registerTeamInstance
			else
				v120 = nil
			end
			v116.registerTeamInstance = v120
			local v121
			if v_u_30 then
				v121 = v_u_41.unregisterTeamInstance
			else
				v121 = nil
			end
			v116.unregisterTeamInstance = v121
			local v122
			if v_u_30 then
				v122 = v_u_41.setSelectedPlayerId
			else
				v122 = nil
			end
			v116.setSelectedPlayerId = v122
			v116.isSmallTouchDevice = p_u_35.isSmallTouchDevice
			v116.isDirectionalPreferred = p_u_35.isDirectionalPreferred
			v112[v113] = v114(v115, v116)
		end, false)
	end
	if p_u_35.isSmallTouchDevice then
		local v123 = v_u_26 and true or not p_u_35.dropDownVisible
		local v124 = v_u_7.createElement
		local v125 = "ScrollingFrame"
		local v126 = {
			["Active"] = v_u_26,
			["Size"] = UDim2.fromScale(1, 1),
			["CanvasSize"] = UDim2.new(0, 0, 0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["BackgroundTransparency"] = 1,
			["ScrollBarImageColor3"] = v_u_36.ScrollImageColor,
			["ScrollBarImageTransparency"] = v_u_36.ScrollImageTransparency,
			["BorderSizePixel"] = 0,
			["ScrollBarThickness"] = v_u_36.ScrollBarSizeMobile,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.None,
			["HorizontalScrollBarInset"] = Enum.ScrollBarInset.None,
			["ClipsDescendants"] = true,
			["ScrollingEnabled"] = v123,
			["ElasticBehavior"] = Enum.ElasticBehavior.Never,
			["Selectable"] = false,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["SelectionGroup"] = v_u_29 and true or nil
		}
		local v127
		if v_u_29 then
			v127 = Enum.SelectionBehavior.Stop
		else
			v127 = nil
		end
		v126.SelectionBehaviorUp = v127
		local v128
		if v_u_29 then
			v128 = Enum.SelectionBehavior.Stop
		else
			v128 = nil
		end
		v126.SelectionBehaviorDown = v128
		local v129
		if v_u_29 then
			v129 = Enum.SelectionBehavior.Stop
		else
			v129 = nil
		end
		v126.SelectionBehaviorLeft = v129
		local v130
		if v_u_29 then
			v130 = Enum.SelectionBehavior.Stop
		else
			v130 = nil
		end
		v126.SelectionBehaviorRight = v130
		if not v_u_29 then
			v_u_42 = nil
		end
		v126.ref = v_u_42
		v126[v_u_7.Change.CanvasPosition] = v80
		v126[v_u_7.Change.AbsoluteSize] = v78
		local v131 = v124(v125, v126, v_u_99)
		if not v_u_31 then
			return v131
		end
		local v132
		if v_u_12() then
			v132 = v37.Theme.BackgroundUIContrast.Color
		else
			v132 = v37.Theme.BackgroundContrast.Color
		end
		return v_u_7.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v_u_36.PlayerScrollListSizeTwoTabsOnLegacy
		}, {
			["TwoTabsBody"] = v_u_7.createElement(v_u_32, {
				["serverBody"] = v131,
				["isVisible"] = p_u_35.isVisible,
				["isDirectionalPreferred"] = p_u_35.isDirectionalPreferred,
				["backgroundColor"] = v132,
				["backgroundTransparency"] = v38
			})
		})
	end
	if p_u_35.isDirectionalPreferred then
		local v133 = v_u_7.createElement
		local v134 = "ScrollingFrame"
		local v135 = {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["CanvasSize"] = UDim2.new(0, 0, 0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["BackgroundTransparency"] = 1,
			["ScrollBarImageColor3"] = v_u_36.ScrollImageColor,
			["ScrollBarImageTransparency"] = v_u_36.ScrollImageTransparency,
			["BorderSizePixel"] = 0,
			["ScrollBarThickness"] = 6,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
			["ClipsDescendants"] = true,
			["ScrollingEnabled"] = not p_u_35.dropDownVisible,
			["Selectable"] = false
		}
		if p_u_35.dropDownVisible then
			v47 = v63 or v47
		end
		v135.CanvasPosition = v47
		v135.ref = v_u_42
		v135[v_u_7.Change.CanvasPosition] = v80
		local v136 = v133(v134, v135, v_u_99)
		local v137 = v_u_7.createElement
		local v138 = "Frame"
		local v139 = {
			["Position"] = v_u_36.PlayerScrollListPosition,
			["Size"] = v_u_36.PlayerScrollListSize,
			["BackgroundTransparency"] = 1,
			[v_u_7.Change.AbsoluteSize] = v78
		}
		local v140 = {}
		local v141
		if v_u_31 then
			v141 = nil
		else
			v141 = v136
		end
		v140.TenFootScrollingFrame = v141
		local v142
		if v_u_31 then
			local v143 = v_u_7.createElement
			local v144 = v_u_32
			local v145 = {
				["serverBody"] = v136,
				["isVisible"] = p_u_35.isVisible,
				["isDirectionalPreferred"] = p_u_35.isDirectionalPreferred
			}
			local v146
			if v_u_12() then
				v146 = v37.Theme.BackgroundUIContrast.Color
			else
				v146 = v37.Theme.BackgroundContrast.Color
			end
			v145.backgroundColor = v146
			v145.backgroundTransparency = v38
			v142 = v143(v144, v145)
		else
			v142 = nil
		end
		v140.TwoTabsBody = v142
		return v137(v138, v139, v140)
	end
	local v_u_147 = v_u_36.FadedBackgroundScaleDelta or 0
	local v148 = v_u_36.ScrollBarOffset or 0
	local v149 = v_u_36.ScrollBarSize or 0
	local v150
	if v_u_12() then
		v150 = v37.Theme.BackgroundUIContrast.Color
	else
		v150 = v37.Theme.BackgroundContrast.Color
	end
	v68(v38)
	v70(v_u_36.FadedBackgroundTransparency or 0)
	local v151 = v_u_7.createElement
	local v152 = "Frame"
	local v153 = {
		["LayoutOrder"] = 3,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 0, v57),
		["BackgroundColor3"] = v150,
		["BackgroundTransparency"] = v74,
		["BorderSizePixel"] = 0,
		[v_u_7.Change.AbsolutePosition] = v82
	}
	local v154 = {}
	local v155
	if v53 then
		v155 = v_u_7.createElement(v_u_25, {
			["contentsVisible"] = v53,
			["selectedPlayer"] = p_u_35.dropDownPlayer,
			["positionY"] = v61,
			["minPositionBoundY"] = -v51 + v_u_36.DropDownScreenSidePadding,
			["maxPositionBoundY"] = p_u_35.screenSizeY - v51 - v_u_36.DropDownScreenSidePadding
		})
	else
		v155 = nil
	end
	v154.PlayerDropDown = v155
	local v156 = v_u_7.createElement
	local v157 = "Frame"
	local v158 = {
		["Visible"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["Visible"] = v53,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v159 = {}
	local v160 = v_u_7.createElement
	local v161 = "ScrollingFrame"
	local v162 = {
		["Size"] = UDim2.new(1, -v148, 0, v57),
		["CanvasSize"] = UDim2.new(0, 0, 0, 0),
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
		["BackgroundTransparency"] = 1,
		["ScrollBarImageColor3"] = v_u_36.ScrollImageColor,
		["ScrollBarImageTransparency"] = v_u_36.ScrollImageTransparency,
		["BorderSizePixel"] = 0,
		["ScrollBarThickness"] = v_u_36.ScrollBarSize,
		["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
		["ClipsDescendants"] = false,
		["ScrollingEnabled"] = not p_u_35.dropDownVisible,
		["Selectable"] = false
	}
	if p_u_35.dropDownVisible then
		v47 = v63 or v47
	end
	v162.CanvasPosition = v47
	v162.ref = v_u_42
	v162[v_u_7.Change.CanvasPosition] = v80
	v159.ScrollingFrame = v160(v161, v162, {
		["OffsetUndoFrame"] = v_u_7.createElement("Frame", {
			["Size"] = UDim2.new(1, v148 + v149, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["BackgroundTransparency"] = 1,
			[v_u_7.Change.AbsoluteSize] = v76
		}, v_u_99)
	})
	v154.ScrollingFrameClippingFrame = v156(v157, v158, v159)
	local v163 = v151(v152, v153, v154)
	local v164
	if p_u_35.gameStatsCount > 0 then
		v164 = v_u_7.createElement(v_u_24, {
			["size"] = nil,
			["entrySizeX"] = nil,
			["layoutOrder"] = 2,
			["contentsVisible"] = nil,
			["showBackground"] = true,
			["backgroundTransparency"] = nil,
			["size"] = UDim2.new(1, 0, 0, v_u_36.TitleBarSizeY),
			["entrySizeX"] = p_u_35.entrySizeX,
			["contentsVisible"] = v53,
			["backgroundTransparency"] = v74
		})
	else
		v164 = nil
	end
	local v165 = v_u_7.createElement
	local v166 = "Frame"
	local v167 = {
		["Position"] = v_u_36.PlayerScrollListPosition,
		["Size"] = v_u_36.PlayerScrollListSize,
		["BackgroundTransparency"] = 1,
		[v_u_7.Change.AbsoluteSize] = v78
	}
	local v168 = {}
	local v169 = v_u_7.createElement
	local v170 = "Frame"
	local v171 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	}
	local v173 = {
		["UIScale"] = v_u_7.createElement("UIScale", {
			["Scale"] = v65:map(function(p172)
				-- upvalues: (copy) v_u_147
				return 1 - v_u_147 * p172
			end)
		}),
		["UIListLayout"] = v_u_7.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
		})
	}
	local v174
	if v_u_33 then
		v174 = v_u_7.createElement("Frame", {
			["LayoutOrder"] = 1,
			["ClipsDescendants"] = true,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_20 + 2)
		}, {
			["DismissIconFrame"] = v_u_7.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 0, (v_u_20 + 2) * 2),
				["BackgroundColor3"] = v150,
				["BackgroundTransparency"] = v74
			}, {
				["DismissButton"] = v_u_7.createElement(v_u_18, {
					["position"] = UDim2.new(0, 1, 0, 1),
					["iconSize"] = v_u_19.Small,
					["icon"] = v_u_21["icons/navigation/close"],
					["onActivated"] = p_u_35.dismissPlayerList
				}),
				["UICorner"] = v_u_7.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 7)
				})
			})
		})
	else
		v174 = v_u_7.createElement("ImageLabel", {
			["LayoutOrder"] = 1,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/TopRoundedRect8px.png",
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["SliceScale"] = 0.5,
			["Size"] = nil,
			["ImageColor3"] = v150,
			["ImageTransparency"] = v74,
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(8, 8, 24, 18),
			["Size"] = UDim2.new(1, 0, 0, 4)
		})
	end
	v173.TopRoundedRect = v174
	local v175
	if v_u_31 then
		v175 = nil
	elseif p_u_35.gameStatsCount > 0 then
		v175 = v_u_7.createElement(v_u_24, {
			["size"] = nil,
			["entrySizeX"] = nil,
			["layoutOrder"] = 2,
			["contentsVisible"] = nil,
			["showBackground"] = true,
			["backgroundTransparency"] = nil,
			["size"] = UDim2.new(1, 0, 0, v_u_36.TitleBarSizeY),
			["entrySizeX"] = p_u_35.entrySizeX,
			["contentsVisible"] = v53,
			["backgroundTransparency"] = v74
		})
	else
		v175 = false
	end
	v173.TitleBar = v175
	local v176
	if v_u_31 then
		v176 = nil
	else
		v176 = v163
	end
	v173.ScrollingFrameContainer = v176
	local v177
	if v_u_31 then
		v177 = v_u_7.createElement(v_u_32, {
			["titleBar"] = nil,
			["serverBody"] = nil,
			["isVisible"] = nil,
			["isDirectionalPreferred"] = nil,
			["layoutOrder"] = 2,
			["platformBodyHeight"] = nil,
			["backgroundColor"] = nil,
			["backgroundTransparency"] = nil,
			["titleBar"] = v164,
			["serverBody"] = v163,
			["isVisible"] = p_u_35.isVisible,
			["isDirectionalPreferred"] = p_u_35.isDirectionalPreferred,
			["platformBodyHeight"] = v57 + (p_u_35.gameStatsCount > 0 and (v_u_36.TitleBarSizeY or 0) or 0),
			["backgroundColor"] = v150,
			["backgroundTransparency"] = v74
		})
	else
		v177 = nil
	end
	v173.TwoTabsBody = v177
	local v178
	if v_u_33 then
		v178 = v_u_7.createElement("Frame", {
			["LayoutOrder"] = 4,
			["ClipsDescendants"] = true,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 7)
		}, { v_u_7.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0, 0, 0, -8),
				["Size"] = UDim2.new(1, 0, 0, 14),
				["BackgroundColor3"] = v150,
				["BackgroundTransparency"] = v74
			}, { v_u_7.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 7)
				}) }) })
	else
		v178 = v_u_7.createElement("ImageLabel", {
			["LayoutOrder"] = 4,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["SliceScale"] = 0.5,
			["Size"] = nil,
			["ImageColor3"] = v150,
			["ImageTransparency"] = v74,
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(8, 8, 24, 16),
			["Size"] = UDim2.new(1, 0, 0, 4)
		})
	end
	v173.BottomRoundedRect = v178
	v168.SizeOffsetFrame = v169(v170, v171, v173)
	return v165(v166, v167, v168)
end)