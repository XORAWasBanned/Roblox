-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.TitleBarView
local v_u_1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v_u_4 = require(v_u_1.Packages.React)
local v_u_5 = require(v_u_1.Packages.SignalsReact)
local v6 = require(v_u_1.Packages.UIBlox)
local v7 = require(v_u_1.Packages.Foundation)
local v_u_8 = v7.Utility.normalizeFontFace
local v_u_9 = v7.Utility.Flags.FoundationFontFaceMigration
local v10 = require(v_u_1.Workspace.Packages.PlayerList)
require(v_u_1.Workspace.Packages.LeaderboardStore)
local v_u_11 = require(v3.Modules.GameTranslator)
local v_u_12 = require(v_u_1.Workspace.Packages.RobloxTranslator)
local v_u_13 = v10.Common.useLayoutValues
local v_u_14 = v6.Core.Style.useStyle
local v_u_15 = require(v_u_1.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local v_u_16 = v10.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_17 = {
	["showDivider"] = false,
	["showBackground"] = false,
	["backgroundTransparency"] = 1,
	["useCustomTextColor"] = false,
	["customTextColor"] = nil,
	["headerPaddingLeft"] = 15,
	["customTextColor"] = Color3.fromRGB(255, 255, 255)
}
return v_u_4.memo(function(p18) -- name: TitleBarView
	-- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_14, (copy) v_u_4, (copy) v_u_12, (copy) v_u_9, (copy) v_u_8, (copy) v_u_16, (copy) v_u_15, (copy) v_u_5, (copy) v_u_11, (copy) v_u_2, (copy) v_u_1
	local v19 = {}
	for v20, v22 in pairs(v_u_17) do
		if p18[v20] ~= nil then
			local v22 = p18[v20] or v22
		end
		v19[v20] = v22
	end
	for v23, v24 in pairs(p18) do
		v19[v23] = v24
	end
	local v_u_25 = v_u_13()
	local v_u_26 = v_u_14()
	local v_u_27 = {
		["layout"] = v_u_4.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		})
	}
	local v28 = v19.entrySizeX
	if v19.isSmallTouchDevice then
		v28 = v_u_25.PlayerNameSizeXMobile
	end
	local v_u_29 = v19.useCustomTextColor and v19.customTextColor or v_u_26.Theme.TextMuted.Color
	local v_u_30 = v19.useCustomTextColor and 0 or v_u_26.Theme.TextMuted.Transparency
	local v31 = v_u_4.createElement
	local v32 = "TextLabel"
	local v33 = {
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["Text"] = nil,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextTransparency"] = nil,
		["TextColor3"] = nil,
		["Size"] = UDim2.new(0, v28, 1, 0),
		["Text"] = v_u_12:FormatByKey("InGame.PlayerList.Players"),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextYAlignment"] = Enum.TextYAlignment.Center
	}
	local v34
	if v_u_9 then
		v34 = nil
	else
		v34 = v_u_26.Font.Footer.Font
	end
	v33.Font = v34
	local v35
	if v_u_9 then
		v35 = v_u_8(v_u_26.Tokens.Typography.CaptionSmall.Font)
	else
		v35 = nil
	end
	v33.FontFace = v35
	local v36
	if v_u_16 then
		v36 = v_u_25.TitleBarTextSize
	else
		v36 = v_u_26.Font.BaseSize * v_u_26.Font.Footer.RelativeSize
	end
	v33.TextSize = v36
	v33.TextTransparency = v_u_30
	v33.TextColor3 = v_u_29
	v_u_27.playersHeader = v31(v32, v33, {
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v19.headerPaddingLeft)
		})
	})
	local v_u_37 = v_u_25.MaxLeaderstats
	if v_u_15 then
		for v38, v39 in v_u_5.useSignalState(v19.gameStats.getAllData) do
			if v_u_37 < v39.order(false) then
				continue
			end
			local v40 = v_u_11:TranslateGameText(v_u_2, v38)
			local v41 = "stat_" .. v38
			local v42 = v_u_4.createElement
			local v43 = "TextLabel"
			local v44 = {
				["LayoutOrder"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["BackgroundTransparency"] = 1,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["TextSize"] = nil,
				["TextTransparency"] = nil,
				["TextColor3"] = nil,
				["TextTruncate"] = nil,
				["LayoutOrder"] = v39.order(false) + 1,
				["Size"] = UDim2.new(0, v_u_25.StatEntrySizeX, 1, 0),
				["Text"] = v40,
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center
			}
			local v45
			if v_u_9 then
				v45 = nil
			else
				v45 = v_u_26.Font.Footer.Font
			end
			v44.Font = v45
			local v46
			if v_u_9 then
				v46 = v_u_8(v_u_26.Tokens.Typography.CaptionSmall.Font)
			else
				v46 = nil
			end
			v44.FontFace = v46
			local v47
			if v_u_16 then
				v47 = v_u_25.TitleBarTextSize
			else
				v47 = v_u_26.Font.BaseSize * v_u_26.Font.Footer.RelativeSize
			end
			v44.TextSize = v47
			v44.TextTransparency = v_u_30
			v44.TextColor3 = v_u_29
			v44.TextTruncate = Enum.TextTruncate.AtEnd
			v_u_27[v41] = v42(v43, v44)
		end
	elseif v19.gameStatsCount and v19.gameStatsCount > 0 then
		v19.gameStats.iterateData(function(p48, p49)
			-- upvalues: (copy) v_u_37, (ref) v_u_11, (ref) v_u_2, (copy) v_u_27, (ref) v_u_4, (copy) v_u_25, (ref) v_u_9, (copy) v_u_26, (ref) v_u_8, (ref) v_u_16, (copy) v_u_30, (copy) v_u_29
			if v_u_37 >= p49.order(false) then
				local v50 = v_u_11:TranslateGameText(v_u_2, p48)
				local v51 = v_u_27
				local v52 = "stat_" .. p48
				local v53 = v_u_4.createElement
				local v54 = "TextLabel"
				local v55 = {
					["LayoutOrder"] = nil,
					["Size"] = nil,
					["Text"] = nil,
					["BackgroundTransparency"] = 1,
					["TextXAlignment"] = nil,
					["TextYAlignment"] = nil,
					["Font"] = nil,
					["FontFace"] = nil,
					["TextSize"] = nil,
					["TextTransparency"] = nil,
					["TextColor3"] = nil,
					["TextTruncate"] = nil,
					["LayoutOrder"] = p49.order(false) + 1,
					["Size"] = UDim2.new(0, v_u_25.StatEntrySizeX, 1, 0),
					["Text"] = v50,
					["TextXAlignment"] = Enum.TextXAlignment.Center,
					["TextYAlignment"] = Enum.TextYAlignment.Center
				}
				local v56
				if v_u_9 then
					v56 = nil
				else
					v56 = v_u_26.Font.Footer.Font
				end
				v55.Font = v56
				local v57
				if v_u_9 then
					v57 = v_u_8(v_u_26.Tokens.Typography.CaptionSmall.Font)
				else
					v57 = nil
				end
				v55.FontFace = v57
				local v58
				if v_u_16 then
					v58 = v_u_25.TitleBarTextSize
				else
					v58 = v_u_26.Font.BaseSize * v_u_26.Font.Footer.RelativeSize
				end
				v55.TextSize = v58
				v55.TextTransparency = v_u_30
				v55.TextColor3 = v_u_29
				v55.TextTruncate = Enum.TextTruncate.AtEnd
				v51[v52] = v53(v54, v55)
			end
		end, false)
	end
	local v59 = Color3.fromRGB(0, 0, 0)
	if v19.showBackground then
		if require(v_u_1.Workspace.Packages.Chrome).Enabled() then
			v59 = v_u_26.Theme.BackgroundUIContrast.Color
		else
			v59 = v_u_26.Theme.BackgroundContrast.Color
		end
	end
	local v60 = {}
	if v19.showDivider then
		v60.Divider = v_u_4.createElement("Frame", {
			["Visible"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Visible"] = v19.contentsVisible,
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(0, 1),
			["BackgroundTransparency"] = v_u_26.Theme.Divider.Transparency,
			["BackgroundColor3"] = v_u_26.Theme.Divider.Color
		})
	end
	v60.ChildrenFrame = v_u_4.createElement("Frame", {
		["Visible"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["Visible"] = v19.contentsVisible,
		["Position"] = v19.showBackground and UDim2.new(0, 0, 0, -2) or UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, v_u_27)
	return v_u_4.createElement("Frame", {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = v19.size,
		["LayoutOrder"] = v19.layoutOrder,
		["BackgroundTransparency"] = v19.backgroundTransparency,
		["BackgroundColor3"] = v59
	}, v60)
end)