-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.PlayerEntryView
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("GuiService")
local v4 = script.Parent
local v5 = v4.Parent
local v6 = v5.Parent
local v_u_7 = require(v1.Packages.Cryo)
local v_u_8 = require(v1.Packages.React)
local v_u_9 = require(v1.Packages.Signals)
local v_u_10 = require(v1.Packages.SignalsReact)
local v11 = require(v1.Packages.UIBlox)
local v_u_12 = require(v1.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local v13 = require(v1.Packages.ReactFocusNavigation)
local v14 = v1.Workspace.Packages.SharedFlags
local v15 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
require(v1.Workspace.Packages.PlayerIconInfoStore)
local v_u_16 = require(v1.Workspace.Packages.Chrome).Enabled
local v_u_17 = v15.Common.useLayoutValues
local v_u_18 = v11.Core.Style.useStyle
local v_u_19 = v13.useFocusGuiObject
local v20 = require(v1.Packages.Foundation)
local v_u_21 = v20.Enums.ControlState
local v_u_22 = v20.View
local v_u_23 = v20.Utility.normalizeFontFace
local v_u_24 = v20.Hooks.useTokens
local v_u_25 = v20.Utility.Flags.FoundationFontFaceMigration
local v_u_26 = v15.Presentation.EntryFrameView
local v_u_27 = require(v6.Components.Container.StatEntryContainer)
local v_u_28 = require(v5.Presentation.CellExtender)
local v_u_29 = require(v4.PlayerIcon)
local v_u_30 = require(v5.Presentation.PlayerNameTag)
local v_u_31 = v15.Common.Constants
local v_u_32 = require(v14).GetFFlagGateLeaderboardPlayerDropdownViaGUAC
local v_u_33 = v15.Flags.FFlagAddNewPlayerListFocusNav
local v_u_34 = v15.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_35 = v15.Flags.FFlagRemoveNewPlayerListOverlay
local v_u_36 = v15.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_37 = require(v14).FFlagPlayerListFixLeaderstatsStacking
local v_u_38 = v15.Flags.FFlagPlayerListUseFocusNavHook
local v_u_39 = {
	["Transparency"] = 1,
	["Color"] = nil,
	["Color"] = Color3.new(1, 1, 1)
}
local v_u_44 = v_u_8.memo(function(p40) -- name: IconAndName
	-- upvalues: (copy) v_u_8, (copy) v_u_29, (copy) v_u_30
	local v41 = v_u_8.createElement
	local v42 = v_u_8.Fragment
	local v43 = {
		["Layout"] = v_u_8.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, p40.layoutValues.InitalPlayerEntryPadding)
		}),
		["InitalPadding"] = v_u_8.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, p40.layoutValues.InitalPlayerEntryPadding)
		}),
		["PlayerIcon"] = v_u_8.createElement(v_u_29, {
			["player"] = nil,
			["playerIconInfo"] = nil,
			["playerRelationship"] = nil,
			["layoutOrder"] = 1,
			["player"] = p40.player,
			["playerIconInfo"] = p40.playerIconInfo,
			["playerRelationship"] = p40.playerRelationship
		}),
		["PlayerName"] = v_u_8.createElement(v_u_30, {
			["player"] = nil,
			["isTitleEntry"] = nil,
			["isHovered"] = nil,
			["textStyle"] = nil,
			["textFont"] = nil,
			["layoutOrder"] = 3,
			["player"] = p40.player,
			["isTitleEntry"] = p40.titlePlayerEntry,
			["isHovered"] = p40.isHovered,
			["textStyle"] = p40.textStyle,
			["textFont"] = p40.playerNameFont
		})
	}
	return v41(v42, {}, v43)
end)
local function v79(p45) -- name: PlayerEntryChildren
	-- upvalues: (copy) v_u_8, (ref) v_u_44, (copy) v_u_26, (copy) v_u_35, (copy) v_u_37, (copy) v_u_10, (copy) v_u_9, (copy) v_u_27, (copy) v_u_7, (copy) v_u_28
	local v46 = p45.isSmallTouchDevice or false
	local v47 = p45.isDirectionalPreferred or false
	local v48 = p45.layoutValues
	local v49 = p45.textStyle
	local v50 = p45.playerNameFont
	local v51 = p45.isHovered
	local v52 = p45.backgroundStyle
	local v53 = p45.overlayStyle
	local v54 = p45.isPressed
	local v_u_55 = p45.gameStats
	local v_u_56 = p45.playerStats
	local v57 = p45.gameStatsCount
	local v58 = p45.playerStatsCount
	local v_u_59 = {}
	local v60 = {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center
	}
	if v47 then
		v60.Padding = UDim.new(0, v48.PlayerEntryPadding)
	end
	v_u_59.Layout = v_u_8.createElement("UIListLayout", v60)
	local v61 = v_u_8.createElement(v_u_44, {
		["player"] = p45.player,
		["playerIconInfo"] = p45.playerIconInfo,
		["playerRelationship"] = p45.playerRelationship,
		["titlePlayerEntry"] = p45.titlePlayerEntry,
		["isHovered"] = v51,
		["textStyle"] = v49,
		["playerNameFont"] = v50,
		["layoutValues"] = v48
	})
	local v62 = {
		["LayoutOrder"] = 0,
		["BackgroundTransparency"] = 1
	}
	if v46 then
		v62.Size = UDim2.new(0, v48.PlayerNameSizeXMobile, 0, v48.PlayerEntrySizeY)
	else
		v62.Size = UDim2.new(0, p45.entrySizeX, 0, v48.PlayerEntrySizeY)
	end
	v_u_59.NameFrame = v_u_8.createElement("Frame", v62, v61)
	if v47 then
		local v63 = v_u_8.createElement
		local v64 = {
			["Shadow"] = v_u_8.createElement("ImageLabel", {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["Visible"] = nil,
				["Image"] = v48.ShadowImage,
				["Position"] = UDim2.new(0, -v48.ShadowSize, 0, 0),
				["Size"] = UDim2.new(1, v48.ShadowSize * 2, 1, v48.ShadowSize),
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = v48.ShadowSliceRect,
				["Visible"] = v47
			}),
			["BackgroundFrame"] = v_u_8.createElement(v_u_26, p45.backgroundFrameProps, v61)
		}
		v_u_59.NameFrame = v63("Frame", v62, v64)
	end
	local v_u_65 = v48.MaxLeaderstats
	local v_u_66 = {
		["isTeamEntry"] = false,
		["showStatTitle"] = nil,
		["textStyle"] = nil,
		["showStatTitle"] = p45.titlePlayerEntry and v47,
		["textStyle"] = v49
	}
	if v47 then
		v_u_66.backgroundStyle = v52
		if not v_u_35 then
			v_u_66.overlayStyle = v53
			v_u_66.doubleOverlay = v54
		end
	end
	if v_u_37 then
		local v68 = v_u_10.useSignalState(v_u_9.createComputed(function(p67)
			-- upvalues: (copy) v_u_55
			return not v_u_55 and {} or v_u_55.getAllData(p67)
		end))
		local v70 = v_u_10.useSignalState(v_u_9.createComputed(function(p69)
			-- upvalues: (copy) v_u_56
			return not v_u_56 and {} or v_u_56.getAllData(p69)
		end))
		for v71, v72 in v68 do
			if v_u_65 < v72.order(false) then
				continue
			end
			v_u_59["GameStat_" .. v71] = v_u_8.createElement(v_u_27, v_u_7.Dictionary.join(v_u_66, {
				["statName"] = v71,
				["stat"] = v70[v71]
			}))
		end
	elseif v_u_55 and (v57 and (v57 > 0 and (v_u_56 and (v58 and v58 >= 0)))) then
		v_u_55.iterateData(function(p73, p74)
			-- upvalues: (copy) v_u_65, (copy) v_u_56, (copy) v_u_59, (ref) v_u_8, (ref) v_u_27, (ref) v_u_7, (copy) v_u_66
			if v_u_65 >= p74.order(false) then
				local v75 = {
					["statName"] = p73,
					["stat"] = v_u_56.getData(p73, false)
				}
				v_u_59["GameStat_" .. p73] = v_u_8.createElement(v_u_27, v_u_7.Dictionary.join(v_u_66, v75))
			end
		end, false)
	end
	if not (v_u_35 or (v46 or v47)) then
		local v76 = v_u_8.createElement
		local v77 = v_u_28
		local v78 = {
			["layoutOrder"] = 100,
			["size"] = nil,
			["backgroundStyle"] = nil,
			["overlayStyle"] = nil,
			["doubleOverlay"] = nil,
			["size"] = UDim2.new(0, v48.ExtraContainerPadding, 1, 0),
			["backgroundStyle"] = {
				["Color"] = nil,
				["Transparency"] = 1,
				["Color"] = Color3.new(1, 1, 1)
			},
			["overlayStyle"] = {
				["Color"] = nil,
				["Transparency"] = 1,
				["Color"] = Color3.new(1, 1, 1)
			},
			["doubleOverlay"] = v54
		}
		v_u_59.BackgroundExtender = v76(v77, v78)
	end
	return v_u_8.createElement(v_u_8.Fragment, {}, v_u_59)
end
local v_u_80 = v_u_8.memo(v79)
local function v157(p_u_81) -- name: PlayerEntryView
	-- upvalues: (copy) v_u_37, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_38, (copy) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_25, (copy) v_u_24, (copy) v_u_2, (copy) v_u_31, (copy) v_u_32, (copy) v_u_12, (copy) v_u_21, (copy) v_u_39, (copy) v_u_23, (copy) v_u_36, (copy) v_u_35, (copy) v_u_33, (copy) v_u_3, (copy) v_u_34, (copy) v_u_22, (ref) v_u_80, (copy) v_u_26, (copy) v_u_7
	local v_u_82
	if v_u_37 then
		v_u_82 = nil
	else
		v_u_82 = v_u_10.useSignalState(p_u_81.playerData.stats.getCount)
	end
	local v_u_84 = v_u_10.useSignalBinding(v_u_9.createComputed(function(p83)
		-- upvalues: (copy) p_u_81
		return p_u_81.playerData.order(p83) * 2 - 1
	end))
	local v85 = v_u_8.useMemo(function()
		-- upvalues: (copy) p_u_81, (copy) v_u_84
		if p_u_81.layoutOrder then
			return p_u_81.layoutOrder
		else
			return v_u_84
		end
	end, { p_u_81.layoutOrder, v_u_84 })
	local v_u_86 = v_u_8.useMemo(function()
		-- upvalues: (copy) p_u_81
		if p_u_81.playerData.order(false) == 1 then
			return p_u_81.firstPlayerRef
		else
			return nil
		end
	end, { p_u_81.playerData.order, p_u_81.firstPlayerRef })
	local v_u_87, v_u_88 = v_u_8.useState(false)
	local v_u_89, v_u_90 = v_u_8.useState(false)
	local v_u_91 = v_u_8.useRef(nil)
	local v_u_92
	if v_u_38 then
		v_u_92 = nil
	else
		v_u_92 = v_u_8.useRef(nil)
	end
	local v_u_93 = v_u_19()
	local v_u_94 = v_u_16()
	local v_u_95 = v_u_17()
	local v_u_96 = v_u_18()
	local v_u_97
	if v_u_25 then
		v_u_97 = v_u_24()
	else
		v_u_97 = nil
	end
	local v98
	if p_u_81.size then
		v98 = p_u_81.size
	else
		v98 = UDim2.new(1, v_u_95.EntryXOffset, 0, v_u_95.PlayerEntrySizeY)
	end
	local v_u_99 = p_u_81.isSmallTouchDevice
	local v_u_100 = v_u_95.IsTenFoot
	local v_u_101 = p_u_81.player == v_u_2.LocalPlayer
	local v_u_104 = v_u_8.useCallback(function()
		-- upvalues: (copy) p_u_81, (ref) v_u_38, (ref) v_u_31, (ref) v_u_32, (ref) v_u_12, (copy) v_u_91
		if p_u_81.openDropdown and p_u_81.closeDropdown then
			if p_u_81.dropdownOpen and p_u_81.selectedPlayer == p_u_81.player then
				p_u_81.closeDropdown()
			else
				if v_u_38 and p_u_81.setSelectedPlayerId then
					if p_u_81.titlePlayerEntry then
						p_u_81.setSelectedPlayerId(v_u_31.SELECTED_TITLE_PLAYER_ID)
					else
						p_u_81.setSelectedPlayerId(p_u_81.player.UserId)
					end
				end
				if v_u_32() then
					if v_u_12.canViewPlayerDropdownInLeaderboard then
						p_u_81.openDropdown(p_u_81.player)
						if v_u_91.current then
							local v102 = Vector2.new(v_u_91.current.AbsolutePosition.Y, v_u_91.current.AbsoluteSize.Y)
							if p_u_81.setDropDownPlayerDimensionY then
								p_u_81.setDropDownPlayerDimensionY(v102)
								return
							end
						end
					end
				else
					p_u_81.openDropdown(p_u_81.player)
					if v_u_91.current then
						local v103 = Vector2.new(v_u_91.current.AbsolutePosition.Y, v_u_91.current.AbsoluteSize.Y)
						if p_u_81.setDropDownPlayerDimensionY then
							p_u_81.setDropDownPlayerDimensionY(v103)
						end
					end
				end
			end
		else
			return
		end
	end, {
		p_u_81.dropdownOpen,
		p_u_81.selectedPlayer,
		p_u_81.player,
		p_u_81.openDropdown,
		p_u_81.closeDropdown,
		p_u_81.setDropDownPlayerDimensionY,
		p_u_81.titlePlayerEntry,
		p_u_81.setSelectedPlayerId,
		v_u_91.current
	})
	local v_u_106 = v_u_8.useCallback(function(p105)
		-- upvalues: (ref) v_u_21, (copy) v_u_90, (copy) v_u_88
		if p105 == v_u_21.Pressed or p105 == v_u_21.SelectedPressed then
			v_u_90(true)
			return
		elseif p105 == v_u_21.Hover or p105 == v_u_21.Selected then
			v_u_88(true)
		elseif p105 == v_u_21.Default then
			v_u_88(false)
			v_u_90(false)
		end
	end, {})
	local v_u_108 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_94, (copy) v_u_96
		local v107
		if v_u_94 then
			v107 = v_u_96.Theme.BackgroundUIContrast.Color
		else
			v107 = v_u_96.Theme.BackgroundContrast.Color
		end
		return {
			["Color"] = nil,
			["Transparency"] = 1,
			["Color"] = v107
		}
	end, { v_u_94, v_u_100 })
	local v_u_109 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_95
		return {
			["Color"] = nil,
			["Transparency"] = 0.8,
			["Color"] = v_u_95.RowHoverColor
		}
	end, { v_u_95 })
	local v_u_110 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_95
		return {
			["Color"] = nil,
			["Transparency"] = 0.8,
			["Color"] = v_u_95.RowDefaultColor
		}
	end, { v_u_95 })
	local v113 = v_u_8.useCallback(function()
		-- upvalues: (copy) v_u_99, (copy) v_u_87, (copy) v_u_89, (copy) v_u_109, (copy) v_u_110, (copy) v_u_100, (copy) v_u_108, (copy) p_u_81, (copy) v_u_95
		if v_u_99 then
			return (v_u_87 or v_u_89) and v_u_109 or v_u_110
		elseif v_u_100 then
			local v111 = p_u_81.dropdownOpen
			if v111 then
				v111 = p_u_81.selectedPlayer == p_u_81.player
			end
			local v112 = v_u_87
			if p_u_81.titlePlayerEntry and v_u_95.BackgroundStyle then
				if v112 and v_u_95.BackgroundStyle.HoveredTitle then
					return v_u_95.BackgroundStyle.HoveredTitle
				end
				if v_u_95.BackgroundStyle.Title then
					return v_u_95.BackgroundStyle.Title
				end
			end
			if v111 and (v_u_95.BackgroundStyle and v_u_95.BackgroundStyle.Selected) then
				return v_u_95.BackgroundStyle.Selected or v_u_95.BackgroundStyle.Default
			elseif v112 and (v_u_95.BackgroundStyle and v_u_95.BackgroundStyle.Hovered) then
				return v_u_95.BackgroundStyle.Hovered
			elseif v_u_95.BackgroundStyle and v_u_95.BackgroundStyle.Default then
				return v_u_95.BackgroundStyle.Default
			else
				return v_u_108
			end
		else
			return v_u_108
		end
	end, {
		v_u_108,
		v_u_99,
		p_u_81.dropdownOpen,
		p_u_81.selectedPlayer,
		p_u_81.player,
		p_u_81.titlePlayerEntry,
		v_u_87,
		v_u_89
	})
	local v114 = v_u_8.useCallback(function()
		-- upvalues: (copy) v_u_100, (copy) v_u_87, (copy) v_u_95, (copy) v_u_101, (copy) v_u_96
		if v_u_100 then
			if v_u_87 then
				return v_u_95.HoveredTextStyle, v_u_95.PlayerNameTextSize
			else
				return v_u_95.DefaultTextStyle, v_u_95.PlayerNameTextSize
			end
		elseif v_u_101 then
			return v_u_96.Theme.TextEmphasis, v_u_95.PlayerNameTextSize
		else
			return v_u_96.Theme.TextDefault, v_u_95.PlayerNameTextSize
		end
	end, {
		v_u_87,
		v_u_101,
		v_u_100,
		v_u_95,
		v_u_96
	})
	local v116 = v_u_8.useCallback(function()
		-- upvalues: (copy) v_u_100, (copy) p_u_81, (copy) v_u_89, (copy) v_u_96, (copy) v_u_87, (ref) v_u_39
		if not v_u_100 then
			local v115 = p_u_81.dropdownOpen
			if v115 then
				v115 = p_u_81.selectedPlayer == p_u_81.player
			end
			if v_u_89 then
				return v_u_96.Theme.BackgroundOnPress
			end
			if v115 then
				return v_u_96.Theme.BackgroundOnPress
			end
			if v_u_87 then
				return v_u_96.Theme.BackgroundOnHover
			end
		end
		return v_u_39
	end, {
		v_u_87,
		v_u_89,
		p_u_81.dropdownOpen,
		p_u_81.selectedPlayer,
		p_u_81.player,
		v_u_96,
		v_u_100
	})
	local v_u_133 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_99, (copy) v_u_101, (copy) v_u_96, (ref) v_u_25, (ref) v_u_23, (copy) v_u_97, (ref) v_u_36, (copy) v_u_95, (copy) v_u_100, (copy) p_u_81
		if v_u_99 then
			if v_u_101 then
				local v117 = {
					["Font"] = v_u_96.Font.CaptionHeader.Font
				}
				local v118
				if v_u_25 then
					v118 = v_u_23(v_u_97.Typography.CaptionMedium.Font)
				else
					v118 = nil
				end
				v117.FontFace = v118
				local v119
				if v_u_36 then
					v119 = v_u_95.PlayerNameTextSize
				else
					v119 = v_u_96.Font.CaptionHeader.RelativeSize * v_u_96.Font.BaseSize
				end
				v117.Size = v119
				local v120
				if v_u_36 then
					v120 = v_u_95.PlayerNameTextSize
				else
					v120 = v_u_96.Font.Footer.RelativeMinSize * v_u_96.Font.BaseSize
				end
				v117.MinSize = v120
				return v117
			else
				local v121 = {
					["Font"] = v_u_96.Font.CaptionBody.Font
				}
				local v122
				if v_u_25 then
					v122 = v_u_23(v_u_97.Typography.BodySmall.Font)
				else
					v122 = nil
				end
				v121.FontFace = v122
				local v123
				if v_u_36 then
					v123 = v_u_95.PlayerNameTextSize
				else
					v123 = v_u_96.Font.CaptionBody.RelativeSize * v_u_96.Font.BaseSize
				end
				v121.Size = v123
				local v124
				if v_u_36 then
					v124 = v_u_95.PlayerNameTextSize
				else
					v124 = v_u_96.Font.Footer.RelativeMinSize * v_u_96.Font.BaseSize
				end
				v121.MinSize = v124
				return v121
			end
		elseif v_u_100 then
			if p_u_81.titlePlayerEntry then
				local v125 = {
					["Font"] = v_u_95.TitlePlayerEntryFont
				}
				local v126
				if v_u_25 then
					v126 = v_u_23(v_u_95.TitlePlayerEntryFont)
				else
					v126 = nil
				end
				v125.FontFace = v126
				v125.Size = v_u_95.PlayerNameTextSize
				v125.MinSize = v_u_95.PlayerNameTextSize
				return v125
			else
				local v127 = {
					["Font"] = v_u_95.PlayerEntryFont
				}
				local v128
				if v_u_25 then
					v128 = v_u_23(v_u_95.PlayerEntryFont)
				else
					v128 = nil
				end
				v127.FontFace = v128
				v127.Size = v_u_95.PlayerNameTextSize
				v127.MinSize = v_u_95.PlayerNameTextSize
				return v127
			end
		elseif v_u_101 then
			local v129 = {
				["Font"] = v_u_96.Font.CaptionHeader.Font
			}
			local v130
			if v_u_25 then
				v130 = v_u_23(v_u_97.Typography.CaptionMedium.Font)
			else
				v130 = nil
			end
			v129.FontFace = v130
			v129.Size = v_u_96.Font.CaptionHeader.RelativeSize * v_u_96.Font.BaseSize
			v129.MinSize = v_u_96.Font.Footer.RelativeMinSize * v_u_96.Font.BaseSize
			return v129
		else
			local v131 = {
				["Font"] = v_u_96.Font.CaptionBody.Font
			}
			local v132
			if v_u_25 then
				v132 = v_u_23(v_u_97.Typography.BodySmall.Font)
			else
				v132 = nil
			end
			v131.FontFace = v132
			v131.Size = v_u_96.Font.CaptionBody.RelativeSize * v_u_96.Font.BaseSize
			v131.MinSize = v_u_96.Font.Footer.RelativeMinSize * v_u_96.Font.BaseSize
			return v131
		end
	end, {
		v_u_99,
		v_u_100,
		v_u_101,
		v_u_96,
		v_u_95,
		v_u_97
	})
	local v_u_134 = v113()
	local v_u_135 = v114()
	local v_u_136
	if v_u_35 then
		v_u_136 = nil
	else
		v_u_136 = v116()
	end
	local v_u_141 = v_u_8.useMemo(function()
		-- upvalues: (copy) p_u_81, (copy) v_u_95, (copy) v_u_134, (ref) v_u_35, (ref) v_u_136, (copy) v_u_89, (copy) v_u_86, (ref) v_u_38, (ref) v_u_33, (copy) v_u_92, (copy) v_u_104, (copy) v_u_106
		local v137 = {
			["size"] = nil,
			["isTeamFrame"] = false,
			["backgroundStyle"] = nil,
			["overlayStyle"] = nil,
			["doubleOverlay"] = nil,
			["firstPlayerRef"] = nil,
			["ref"] = nil,
			["onActivated"] = nil,
			["onStateChanged"] = nil,
			["size"] = UDim2.new(0, p_u_81.entrySizeX, 0, v_u_95.PlayerEntrySizeY),
			["backgroundStyle"] = v_u_134
		}
		local v138
		if v_u_35 then
			v138 = nil
		else
			v138 = v_u_136
		end
		v137.overlayStyle = v138
		local v139
		if v_u_35 then
			v139 = nil
		else
			v139 = v_u_89
		end
		v137.doubleOverlay = v139
		v137.firstPlayerRef = v_u_86
		local v140
		if v_u_38 or not v_u_33 then
			v140 = nil
		else
			v140 = v_u_92
		end
		v137.ref = v140
		v137.onActivated = v_u_104
		v137.onStateChanged = v_u_106
		return v137
	end, {
		p_u_81.entrySizeX,
		v_u_95.PlayerEntrySizeY,
		v_u_134,
		v_u_136,
		v_u_89,
		v_u_92,
		v_u_104,
		v_u_106
	})
	local v145 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_99, (copy) v_u_100, (copy) v_u_95, (copy) v_u_135, (copy) v_u_133, (copy) v_u_87, (copy) v_u_134, (ref) v_u_35, (ref) v_u_136, (copy) v_u_89, (copy) p_u_81, (copy) v_u_82, (copy) v_u_141
		local v142 = {
			["isSmallTouchDevice"] = v_u_99,
			["isDirectionalPreferred"] = v_u_100,
			["layoutValues"] = v_u_95,
			["textStyle"] = v_u_135,
			["playerNameFont"] = v_u_133,
			["isHovered"] = v_u_87,
			["backgroundStyle"] = v_u_134
		}
		local v143
		if v_u_35 then
			v143 = nil
		else
			v143 = v_u_136
		end
		v142.overlayStyle = v143
		local v144
		if v_u_35 then
			v144 = nil
		else
			v144 = v_u_89
		end
		v142.isPressed = v144
		v142.player = p_u_81.player
		v142.playerIconInfo = p_u_81.playerIconInfo
		v142.playerRelationship = p_u_81.playerRelationship
		v142.titlePlayerEntry = p_u_81.titlePlayerEntry
		v142.entrySizeX = p_u_81.entrySizeX
		v142.gameStats = p_u_81.gameStats
		v142.playerStats = p_u_81.playerData.stats
		v142.playerStatsCount = v_u_82
		v142.gameStatsCount = p_u_81.gameStatsCount
		v142.backgroundFrameProps = v_u_141
		return v142
	end, {
		v_u_99,
		v_u_100,
		v_u_95,
		v_u_135,
		v_u_133,
		v_u_87,
		v_u_134,
		v_u_136,
		v_u_89,
		p_u_81.player,
		p_u_81.playerIconInfo,
		p_u_81.playerRelationship,
		p_u_81.titlePlayerEntry,
		p_u_81.entrySizeX,
		p_u_81.playerData.stats,
		p_u_81.gameStats,
		v_u_82,
		p_u_81.gameStatsCount,
		v_u_141
	})
	if not v_u_38 then
		v_u_8.useEffect(function()
			-- upvalues: (ref) v_u_33, (copy) v_u_92, (copy) p_u_81, (ref) v_u_3, (copy) v_u_93
			local v_u_146 = nil
			local v_u_147
			if v_u_33 and (v_u_92.current and (p_u_81.prevFocusedEntry and p_u_81.destroyedFocusedPlayerId)) then
				local v_u_148 = v_u_92.current
				v_u_147 = v_u_92.current.SelectionLost:Connect(function()
					-- upvalues: (ref) p_u_81, (copy) v_u_148
					p_u_81.prevFocusedEntry.current = v_u_148
				end)
				local _ = v_u_92.current.Destroying:Connect(function()
					-- upvalues: (ref) v_u_147, (ref) v_u_3, (copy) v_u_148, (ref) p_u_81, (ref) v_u_93, (ref) v_u_146
					v_u_147:Disconnect()
					if v_u_3.SelectedCoreObject == v_u_148 then
						p_u_81.destroyedFocusedPlayerId.current = p_u_81.player.UserId
						v_u_93(nil)
					end
					v_u_146:Disconnect()
				end)
			else
				v_u_147 = nil
			end
			return function()
				-- upvalues: (ref) v_u_147
				if v_u_147 then
					v_u_147:Disconnect()
				end
			end
		end, {
			v_u_93,
			p_u_81.player,
			p_u_81.prevFocusedEntry,
			p_u_81.destroyedFocusedPlayerId,
			v_u_92.current
		})
	end
	if v_u_38 then
		v_u_8.useEffect(function()
			-- upvalues: (copy) p_u_81
			return function()
				-- upvalues: (ref) p_u_81
				if p_u_81.unregisterPlayerInstance then
					p_u_81.unregisterPlayerInstance(p_u_81.player.UserId)
				end
			end
		end, { p_u_81.unregisterPlayerInstance, p_u_81.player })
	end
	local v150 = v_u_8.useCallback(function(p149)
		-- upvalues: (ref) v_u_38, (copy) p_u_81, (ref) v_u_34, (copy) v_u_92, (copy) v_u_91
		if v_u_38 and p_u_81.registerPlayerInstance then
			p_u_81.registerPlayerInstance(p_u_81.player.UserId, p149, p_u_81.playerData.order)
		end
		if v_u_38 or not v_u_34 then
			v_u_91.current = p149
		else
			v_u_92.current = p149
		end
	end, { p_u_81.player, p_u_81.playerData, p_u_81.registerPlayerInstance })
	if v_u_99 then
		return v_u_8.createElement(v_u_22, {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["AutoButtonColor"] = false,
			["BorderSizePixel"] = 0,
			["Image"] = "",
			["LayoutOrder"] = nil,
			["ref"] = nil,
			["onActivated"] = nil,
			["onStateChanged"] = nil,
			["Size"] = v98,
			["BackgroundColor3"] = v_u_134.Color,
			["BackgroundTransparency"] = v_u_134.Transparency,
			["LayoutOrder"] = v85,
			["ref"] = v150,
			["onActivated"] = v_u_104,
			["onStateChanged"] = v_u_106
		}, {
			["ChildrenFrame"] = v_u_8.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromScale(1, 1),
				["Position"] = UDim2.new(0, 0, 0, 0)
			}, v_u_8.createElement(v_u_80, v145))
		})
	elseif v_u_100 then
		local v151 = v_u_8.createElement
		local v152 = "Frame"
		local v153 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["ref"] = nil,
			["Size"] = v98,
			["LayoutOrder"] = v85
		}
		if v_u_38 then
			v_u_91 = v150
		end
		v153.ref = v_u_91
		return v151(v152, v153, v_u_8.createElement(v_u_80, v145))
	else
		local v154 = v_u_8.createElement
		local v155 = "Frame"
		local v156 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["ref"] = nil,
			["Size"] = v98,
			["LayoutOrder"] = v85
		}
		if v_u_38 then
			v_u_91 = v150
		end
		v156.ref = v_u_91
		return v154(v155, v156, {
			["PlayerEntryContentFrame"] = v_u_8.createElement(v_u_26, v_u_7.Dictionary.join(v_u_141, {
				["size"] = UDim2.new(1, 0, 0, v_u_95.PlayerEntrySizeY)
			}), v_u_8.createElement(v_u_80, v145))
		})
	end
end
return v_u_8.memo(v157)