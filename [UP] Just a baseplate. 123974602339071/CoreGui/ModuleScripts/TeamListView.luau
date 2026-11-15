-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.TeamListView
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_6 = v5.Common.useLayoutValues
local v_u_7 = v4.Core.Style.useStyle
local v_u_8 = require(v2.Components.Container.PlayerEntryContainer)
local v_u_9 = require(v2.Components.Container.TeamEntryContainer)
local v_u_10 = require(v1.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local v_u_11 = v5.Flags.FFlagPlayerListUseFocusNavHook
local v_u_12 = require(v1.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
return v_u_3.memo(function(p_u_13) -- name: TeamListView
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_11
	local v_u_14 = v_u_6()
	local v_u_15 = v_u_7()
	local v_u_16 = {}
	local v17 = v_u_3.createElement
	local v18 = "UIListLayout"
	local v19 = {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["FillDirection"] = Enum.FillDirection.Vertical,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
	}
	local v20
	if p_u_13.isDirectionalPreferred then
		v20 = UDim.new(0, v_u_14.EntryPadding)
	else
		v20 = nil
	end
	v19.Padding = v20
	v_u_16.UIListLayout = v17(v18, v19)
	if p_u_13.showTeamEntry then
		v_u_16.TeamEntry = v_u_3.createElement(v_u_9, {
			["size"] = nil,
			["teamData"] = nil,
			["entrySizeX"] = nil,
			["isSmallTouchDevice"] = nil,
			["isDirectionalPreferred"] = nil,
			["layoutOrder"] = -1,
			["size"] = UDim2.new(1, 0, 0, v_u_14.TeamEntrySizeY),
			["teamData"] = p_u_13.teamData,
			["entrySizeX"] = p_u_13.entrySizeX,
			["isSmallTouchDevice"] = p_u_13.isSmallTouchDevice,
			["isDirectionalPreferred"] = p_u_13.isDirectionalPreferred
		})
	end
	if p_u_13.teamPlayersCount > 0 then
		local v_u_21 = 0
		if p_u_13.isSmallTouchDevice then
			v_u_16.BottomDiv = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0.8,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["AnchorPoint"] = Vector2.new(0, 0),
				["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
				["LayoutOrder"] = p_u_13.teamPlayersCount * 2
			})
		end
		p_u_13.teamData.players.iterateData(function(p22, p23)
			-- upvalues: (ref) v_u_21, (ref) v_u_10, (ref) v_u_12, (copy) p_u_13, (copy) v_u_16, (ref) v_u_3, (ref) v_u_8, (copy) v_u_14, (ref) v_u_11, (copy) v_u_15
			v_u_21 = v_u_21 + 1
			local v24
			if v_u_10 then
				v24 = v_u_12.getPlayerIconInfoReactive(p22.UserId)(false)
			else
				v24 = p_u_13.playerIconInfos[p23]
			end
			local v25 = p_u_13.playerRelationships[p23]
			if v24 and v25 then
				local v26 = v_u_16
				local v27 = "PlayerEntry_" .. tostring(p23)
				local v28 = v_u_3.createElement
				local v29 = v_u_8
				local v30 = {
					["size"] = nil,
					["player"] = nil,
					["titlePlayerEntry"] = false,
					["entrySizeX"] = nil,
					["playerIconInfo"] = nil,
					["playerRelationship"] = nil,
					["setDropDownPlayerDimensionY"] = nil,
					["firstPlayerRef"] = nil,
					["prevFocusedEntry"] = nil,
					["destroyedFocusedPlayerId"] = nil,
					["registerPlayerInstance"] = nil,
					["unregisterPlayerInstance"] = nil,
					["setSelectedPlayerId"] = nil,
					["size"] = UDim2.new(1, v_u_14.EntryXOffset, 0, v_u_14.PlayerEntrySizeY),
					["player"] = p22,
					["entrySizeX"] = p_u_13.entrySizeX,
					["playerIconInfo"] = v24,
					["playerRelationship"] = v25,
					["setDropDownPlayerDimensionY"] = p_u_13.setDropDownPlayerDimensionY,
					["firstPlayerRef"] = p_u_13.firstPlayerRef,
					["prevFocusedEntry"] = p_u_13.prevFocusedEntry,
					["destroyedFocusedPlayerId"] = p_u_13.destroyedFocusedPlayerId
				}
				local v31
				if v_u_11 then
					v31 = p_u_13.registerPlayerInstance
				else
					v31 = nil
				end
				v30.registerPlayerInstance = v31
				local v32
				if v_u_11 then
					v32 = p_u_13.unregisterPlayerInstance
				else
					v32 = nil
				end
				v30.unregisterPlayerInstance = v32
				local v33
				if v_u_11 then
					v33 = p_u_13.setSelectedPlayerId
				else
					v33 = nil
				end
				v30.setSelectedPlayerId = v33
				v26[v27] = v28(v29, v30)
				if p_u_13.isSmallTouchDevice then
					v_u_16["TopDiv_" .. v_u_21] = v_u_3.createElement("Frame", {
						["Size"] = nil,
						["Position"] = nil,
						["AnchorPoint"] = nil,
						["BackgroundColor3"] = nil,
						["BackgroundTransparency"] = 0.8,
						["LayoutOrder"] = nil,
						["Size"] = UDim2.new(1, 0, 0, 1),
						["Position"] = UDim2.new(0, 0, 0, 0),
						["AnchorPoint"] = Vector2.new(0, 0),
						["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
						["LayoutOrder"] = (v_u_21 - 1) * 2
					})
				end
				if v_u_21 < p_u_13.teamPlayersCount and not (p_u_13.isSmallTouchDevice or p_u_13.isDirectionalPreferred) then
					v_u_16["Divider_" .. v_u_21] = v_u_3.createElement("Frame", {
						["Size"] = nil,
						["Position"] = nil,
						["AnchorPoint"] = nil,
						["BackgroundTransparency"] = nil,
						["BackgroundColor3"] = nil,
						["BorderSizePixel"] = 0,
						["LayoutOrder"] = nil,
						["Size"] = UDim2.new(1, 0, 0, 1),
						["Position"] = UDim2.new(0, 0, 1, 0),
						["AnchorPoint"] = Vector2.new(0, 1),
						["BackgroundTransparency"] = v_u_15.Theme.Divider.Transparency,
						["BackgroundColor3"] = v_u_15.Theme.Divider.Color,
						["LayoutOrder"] = v_u_21 * 2
					})
				end
			end
		end, false)
	end
	return v_u_3.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_13.layoutOrder
	}, v_u_16)
end)