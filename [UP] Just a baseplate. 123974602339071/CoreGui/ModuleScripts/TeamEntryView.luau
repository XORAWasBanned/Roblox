-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.TeamEntryView
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v1.Packages.React)
local v_u_5 = require(v1.Packages.SignalsReact)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v8 = require(v1.Packages.Foundation)
local v_u_9 = v8.Utility.normalizeFontFace
local v_u_10 = v8.Hooks.useTokens
local v_u_11 = v7.Common.useLayoutValues
local v_u_12 = v6.Core.Style.useStyle
local v_u_13 = v7.Presentation.EntryFrameView
local v_u_14 = require(v3.Components.Container.StatEntryContainer)
local v15 = require(v1.Workspace.Packages.SharedFlags)
local v_u_16 = v15.FFlagPlayerListFixLeaderstatsStacking
local v_u_17 = v15.FFlagFontFacePlayerList
if v_u_17 then
	v_u_17 = v8.Utility.Flags.FoundationFontFaceMigration
end
local v_u_18 = v7.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_19 = require(v2.Presentation.CellExtender)
return v_u_4.memo(function(p_u_20) -- name: TeamEntryView
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_17, (copy) v_u_10, (copy) v_u_18, (copy) v_u_9, (copy) v_u_4, (copy) v_u_16, (copy) v_u_5, (copy) v_u_14, (copy) v_u_13, (copy) v_u_19
	local v_u_21 = v_u_11()
	local v_u_22 = v_u_12()
	local v23
	if v_u_17 then
		v23 = v_u_10()
	else
		v23 = nil
	end
	local v_u_24 = p_u_20.isSmallTouchDevice or false
	local v_u_25 = p_u_20.isDirectionalPreferred or false
	local v_u_26 = v_u_22.Theme.TextEmphasis
	local v27
	if v_u_18 then
		v27 = v_u_21.TeamNameTextSize
	else
		v27 = v_u_22.Font.CaptionHeader.RelativeSize * v_u_22.Font.BaseSize
	end
	local v28
	if v_u_17 then
		v28 = v_u_9(v23.Typography.CaptionLarge.Font)
	else
		v28 = v_u_22.Font.CaptionHeader.Font
	end
	if v_u_25 then
		v_u_26 = v_u_21.DefaultTextStyle
		v27 = v_u_21.PlayerNameTextSize
		if v_u_17 then
			v28 = v_u_9(v_u_21.TeamEntryFont)
		else
			v28 = v_u_21.TeamEntryFont
		end
	end
	local v_u_30 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_24, (copy) v_u_22, (copy) p_u_20, (copy) v_u_25, (copy) v_u_21
		if not v_u_24 then
			return v_u_25 and {
				["Color"] = p_u_20.teamColor,
				["Transparency"] = not v_u_21.BackgroundStyle and 0 or v_u_21.BackgroundStyle.Default.Transparency
			} or {
				["Color"] = p_u_20.teamColor,
				["Transparency"] = v_u_21.TeamEntryBackgroundTransparency * v_u_22.Settings.PreferredTransparency
			}
		end
		local v29 = v_u_22.Settings
		return {
			["Color"] = p_u_20.teamColor,
			["Transparency"] = v29.PreferredTransparency * 0.5
		}
	end, {
		v_u_24,
		v_u_25,
		p_u_20.teamColor,
		v_u_22,
		v_u_21
	})
	local v_u_31 = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = Color3.new(1, 1, 1)
	}
	local v_u_32 = v_u_21.MaxLeaderstats
	local v33
	if v_u_16 then
		v33 = v_u_5.useSignalState(p_u_20.gameStats.getAllData)
	else
		v33 = nil
	end
	if v_u_24 then
		local v_u_34 = {
			["UIListLayout"] = v_u_4.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			})
		}
		local v35 = v_u_4.createElement
		local v36 = "TextLabel"
		local v37 = {
			["Size"] = nil,
			["TextXAlignment"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["LayoutOrder"] = 0,
			["TextColor3"] = nil,
			["TextStrokeTransparency"] = nil,
			["TextStrokeColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["Size"] = UDim2.new(0, v_u_21.PlayerNameSizeXMobile, 1, 0),
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}
		local v38
		if v_u_17 then
			v38 = nil
		else
			v38 = v28
		end
		v37.Font = v38
		if not v_u_17 then
			v28 = nil
		end
		v37.FontFace = v28
		v37.TextSize = v27
		v37.TextColor3 = v_u_26.Color
		v37.TextStrokeTransparency = v_u_26.StrokeTransparency
		v37.TextStrokeColor3 = v_u_26.StrokeColor
		v37.Text = p_u_20.teamName
		v37.TextTruncate = Enum.TextTruncate.AtEnd
		v_u_34.NameFrame = v35(v36, v37, {
			["UIPadding"] = v_u_4.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, v_u_21.TeamEntryTextPaddingMobile)
			})
		})
		if v_u_16 then
			for v39, v40 in v33 do
				if v_u_32 < v40.order(false) then
					continue
				end
				local v41 = {
					["statName"] = nil,
					["stat"] = nil,
					["isTeamEntry"] = true,
					["showStatTitle"] = false,
					["textStyle"] = nil,
					["statName"] = v39,
					["stat"] = p_u_20.teamStats.getData(v39, false),
					["textStyle"] = v_u_26
				}
				v_u_34["GameStat_" .. v39] = v_u_4.createElement(v_u_14, v41)
			end
		elseif p_u_20.gameStatsCount and (p_u_20.teamStatsCount and (p_u_20.gameStatsCount > 0 and p_u_20.teamStatsCount >= 0)) then
			p_u_20.gameStats.iterateData(function(p42, p43)
				-- upvalues: (copy) v_u_32, (copy) p_u_20, (copy) v_u_34, (ref) v_u_4, (ref) v_u_14, (ref) v_u_26
				if v_u_32 >= p43.order(false) then
					local v44 = {
						["statName"] = nil,
						["stat"] = nil,
						["isTeamEntry"] = true,
						["showStatTitle"] = false,
						["textStyle"] = nil,
						["statName"] = p42,
						["stat"] = p_u_20.teamStats.getData(p42, false),
						["textStyle"] = v_u_26
					}
					v_u_34["GameStat_" .. p42] = v_u_4.createElement(v_u_14, v44)
				end
			end, false)
		end
		return v_u_4.createElement("Frame", {
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["GroupTransparency"] = nil,
			["LayoutOrder"] = p_u_20.layoutOrder,
			["Size"] = p_u_20.size,
			["BackgroundColor3"] = v_u_30.Color,
			["BackgroundTransparency"] = v_u_30.Transparency
		}, v_u_34)
	end
	local v_u_45 = {}
	local v46
	if v_u_25 then
		v46 = UDim.new(0, v_u_21.PlayerEntryPadding)
	else
		v46 = nil
	end
	v_u_45.UIListLayout = v_u_4.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["Padding"] = v46
	})
	local v47 = v_u_4.createElement
	local v48 = "Frame"
	local v49 = {
		["LayoutOrder"] = 0,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, p_u_20.entrySizeX, 0, v_u_21.TeamEntrySizeY)
	}
	local v50 = {
		["Shadow"] = v_u_4.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["Visible"] = nil,
			["Image"] = v_u_21.ShadowImage,
			["Position"] = UDim2.new(0, -v_u_21.ShadowSize, 0, 0),
			["Size"] = UDim2.new(1, v_u_21.ShadowSize * 2, 1, v_u_21.ShadowSize),
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = v_u_21.ShadowSliceRect,
			["Visible"] = v_u_25
		})
	}
	local v51 = v_u_4.createElement
	local v52 = v_u_13
	local v53 = {
		["size"] = nil,
		["isTeamFrame"] = true,
		["backgroundStyle"] = nil,
		["overlayStyle"] = nil,
		["doubleOverlay"] = false,
		["size"] = UDim2.new(0, p_u_20.entrySizeX, 0, v_u_21.TeamEntrySizeY),
		["backgroundStyle"] = v_u_30,
		["overlayStyle"] = v_u_31
	}
	local v54 = {}
	local v55 = v_u_4.createElement
	local v56 = "TextLabel"
	local v57 = {
		["Position"] = nil,
		["Size"] = nil,
		["TextXAlignment"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextStrokeTransparency"] = nil,
		["TextStrokeColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextTruncate"] = nil,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["TextXAlignment"] = Enum.TextXAlignment.Left
	}
	local v58
	if v_u_17 then
		v58 = nil
	else
		v58 = v28
	end
	v57.Font = v58
	if not v_u_17 then
		v28 = nil
	end
	v57.FontFace = v28
	v57.TextSize = v27
	v57.TextColor3 = v_u_26.Color
	v57.TextStrokeTransparency = v_u_26.StrokeTransparency
	v57.TextStrokeColor3 = v_u_26.StrokeColor
	v57.Text = p_u_20.teamName
	v57.TextTruncate = Enum.TextTruncate.AtEnd
	v54.TeamName = v55(v56, v57, { v_u_4.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v_u_21.TeamEntryTextPadding)
		}) })
	v50.BGFrame = v51(v52, v53, v54)
	v_u_45.NameFrame = v47(v48, v49, v50)
	if v_u_16 then
		for v59, v60 in v33 do
			if v_u_32 < v60.order(false) then
				continue
			end
			local v61 = {
				["statName"] = nil,
				["stat"] = nil,
				["isTeamEntry"] = true,
				["showStatTitle"] = false,
				["backgroundStyle"] = nil,
				["overlayStyle"] = nil,
				["doubleOverlay"] = false,
				["textStyle"] = nil,
				["statName"] = v59,
				["stat"] = p_u_20.teamStats.getData(v59, false),
				["backgroundStyle"] = v_u_30,
				["overlayStyle"] = v_u_31,
				["textStyle"] = v_u_26
			}
			v_u_45["GameStat_" .. v59] = v_u_4.createElement(v_u_14, v61)
		end
	elseif p_u_20.gameStatsCount and (p_u_20.teamStatsCount and (p_u_20.gameStatsCount > 0 and p_u_20.teamStatsCount >= 0)) then
		p_u_20.gameStats.iterateData(function(p62, p63)
			-- upvalues: (copy) v_u_32, (copy) p_u_20, (copy) v_u_45, (ref) v_u_4, (ref) v_u_14, (copy) v_u_30, (copy) v_u_31, (ref) v_u_26
			if v_u_32 >= p63.order(false) then
				local v64 = {
					["statName"] = nil,
					["stat"] = nil,
					["isTeamEntry"] = true,
					["showStatTitle"] = false,
					["backgroundStyle"] = nil,
					["overlayStyle"] = nil,
					["doubleOverlay"] = false,
					["textStyle"] = nil,
					["statName"] = p62,
					["stat"] = p_u_20.teamStats.getData(p62, false),
					["backgroundStyle"] = v_u_30,
					["overlayStyle"] = v_u_31,
					["textStyle"] = v_u_26
				}
				v_u_45["GameStat_" .. p62] = v_u_4.createElement(v_u_14, v64)
			end
		end, false)
	end
	if not v_u_25 then
		v_u_45.BackgroundExtender = v_u_4.createElement(v_u_19, {
			["layoutOrder"] = 100,
			["size"] = nil,
			["backgroundStyle"] = nil,
			["overlayStyle"] = nil,
			["doubleOverlay"] = false,
			["size"] = UDim2.new(0, v_u_21.ExtraContainerPadding, 1, 0),
			["backgroundStyle"] = v_u_30,
			["overlayStyle"] = v_u_31
		})
	end
	return v_u_4.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = nil,
		["GroupTransparency"] = nil,
		["Size"] = p_u_20.size,
		["BackgroundColor3"] = Color3.new(1, 1, 1),
		["LayoutOrder"] = p_u_20.layoutOrder
	}, v_u_45)
end)