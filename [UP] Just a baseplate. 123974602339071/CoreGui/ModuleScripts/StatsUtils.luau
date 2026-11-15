-- Path: CoreGui.RobloxGui.Modules.Stats.StatsUtils
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("CorePackages")
local v_u_4 = UserSettings().GameSettings
local v5 = require(v1.RobloxGui.Modules.StyleWidgets)
local v_u_6 = require(v3.Workspace.Packages.RobloxTranslator)
local _ = require(v3.Workspace.Packages.Loggers).mutedError
function LocalizeWithFallback(p_u_7, p8) -- name: LocalizeWithFallback
	-- upvalues: (copy) v_u_6
	local function v9()
		-- upvalues: (ref) v_u_6, (copy) p_u_7
		return v_u_6:FormatByKey(p_u_7)
	end
	local v10, v11 = pcall(v9)
	return v10 and v11 and v11 or p8
end
local v_u_12 = {
	["SelectedBackgroundColor"] = Color3.new(0.4, 0.4, 0.4),
	["FontColor"] = Color3.new(1, 1, 1),
	["GraphBarGreenColor"] = Color3.new(0.49411764705882355, 0.8274509803921568, 0.12941176470588237),
	["GraphBarYellowColor"] = Color3.new(0.8196078431372549, 0.8274509803921568, 0.12941176470588237),
	["GraphBarRedColor"] = Color3.new(0.8274509803921568, 0.34509803921568627, 0.12941176470588237),
	["GraphAverageLineColor"] = Color3.new(0.8156862745098039, 0.00392156862745098, 0.10588235294117647),
	["GraphAverageLineBorderColor"] = Color3.new(1, 1, 1),
	["NormalColor"] = Color3.fromRGB(31, 31, 31),
	["Transparency"] = 0.5,
	["MiniPanelTitleFontSize"] = Enum.FontSize.Size12,
	["MiniPanelValueFontSize"] = Enum.FontSize.Size10,
	["PanelTitleFontSize"] = Enum.FontSize.Size24,
	["PanelValueFontSize"] = Enum.FontSize.Size14,
	["PanelGraphFontSize"] = Enum.FontSize.Size10,
	["ButtonHeight"] = 36 + v5.TabSelectionHeight,
	["ViewerTopMargin"] = 10,
	["ViewerHeight"] = 144,
	["ViewerWidth"] = 306,
	["TextZIndex"] = 5,
	["GraphZIndex"] = 2,
	["GraphTargetLineInnerThickness"] = 2,
	["GraphAverageLineInnerThickness"] = 2,
	["GraphAverageLineBorderThickness"] = 1
}
v_u_12.GraphAverageLineTotalThickness = v_u_12.GraphAverageLineInnerThickness + 2 * v_u_12.GraphAverageLineBorderThickness
v_u_12.TextPanelTitleHeightY = 52
v_u_12.TextPanelLegendItemHeightY = 20
v_u_12.TextPanelLeftMarginPix = 10
v_u_12.TextPanelTopMarginPix = 10
v_u_12.DecorationSize = 12
v_u_12.OvalKeySize = 8
v_u_12.TargetKeyWidth = 11
v_u_12.TargetKeyHeight = 2
v_u_12.DecorationMargin = 6
v_u_12.StatType_Memory = "st_Memory"
v_u_12.StatType_CPU = "st_CPU"
v_u_12.StatType_GPU = "st_GPU"
v_u_12.StatType_NetworkSent = "st_NetworkSent"
v_u_12.StatType_NetworkReceived = "st_NetworkReceived"
v_u_12.StatType_Ping = "st_Ping"
v_u_12.AllStatTypes = {
	v_u_12.StatType_Memory,
	v_u_12.StatType_CPU,
	v_u_12.StatType_GPU,
	v_u_12.StatType_NetworkSent,
	v_u_12.StatType_NetworkReceived,
	v_u_12.StatType_Ping
}
v_u_12.StatNames = {
	[v_u_12.StatType_Memory] = "Memory",
	[v_u_12.StatType_CPU] = "CPU",
	[v_u_12.StatType_GPU] = "GPU",
	[v_u_12.StatType_NetworkSent] = "NetworkSent",
	[v_u_12.StatType_NetworkReceived] = "NetworkReceived",
	[v_u_12.StatType_Ping] = "Ping"
}
v_u_12.StatMaxNames = {
	[v_u_12.StatType_Memory] = "MaxMemory",
	[v_u_12.StatType_CPU] = "MaxCPU",
	[v_u_12.StatType_GPU] = "MaxGPU",
	[v_u_12.StatType_NetworkSent] = "MaxNetworkSent",
	[v_u_12.StatType_NetworkReceived] = "MaxNetworkReceived",
	[v_u_12.StatType_Ping] = "MaxPing"
}
v_u_12.NumButtonTypes = #v_u_12.AllStatTypes
local v13 = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network")
local v14 = LocalizeWithFallback("InGame.UnknownNamespace.Sent", "Sent") .. "\n" .. v13
local v15 = LocalizeWithFallback("InGame.UnknownNamespace.Received", "Received") .. "\n" .. v13
v_u_12.TypeToName = {
	[v_u_12.StatType_Memory] = "Memory",
	[v_u_12.StatType_CPU] = "CPU",
	[v_u_12.StatType_GPU] = "GPU",
	[v_u_12.StatType_NetworkSent] = v14,
	[v_u_12.StatType_NetworkReceived] = v15,
	[v_u_12.StatType_Ping] = "NetworkPing"
}
v_u_12.TypeToShortName = {
	[v_u_12.StatType_Memory] = "Mem",
	[v_u_12.StatType_CPU] = "CPU",
	[v_u_12.StatType_GPU] = "GPU",
	[v_u_12.StatType_NetworkSent] = "Sent",
	[v_u_12.StatType_NetworkReceived] = "Recv",
	[v_u_12.StatType_Ping] = "NetworkPing"
}
v_u_12.MemoryAnalyzerTypeToName = {
	["HumanoidTexture"] = "Humanoid Textures",
	["HumanoidTextureOrphan"] = "Humanoid Textures (Unused)",
	["OtherTexture"] = "Other Textures",
	["OtherTextureOrphan"] = "Other Textures (Unused)",
	["CoreScript"] = "Core Scripts",
	["UserScript"] = "User Scripts",
	["Sounds"] = "Sounds",
	["CSG"] = "Solid Models",
	["Meshes"] = "Meshes"
}
function v_u_12.GetMemoryAnalyzerStatName(p16) -- name: GetMemoryAnalyzerStatName
	-- upvalues: (copy) v_u_12
	if v_u_12.MemoryAnalyzerTypeToName[p16] == nil then
		return p16
	else
		return v_u_12.MemoryAnalyzerTypeToName[p16]
	end
end
function v_u_12.StyleFrame(p17) -- name: StyleFrame
	-- upvalues: (copy) v_u_12
	p17.BackgroundColor3 = v_u_12.NormalColor
	p17.BackgroundTransparency = v_u_12.Transparency
end
function v_u_12.StyleButton(p18) -- name: StyleButton
	-- upvalues: (copy) v_u_12
	p18.BackgroundColor3 = v_u_12.NormalColor
	p18.BackgroundTransparency = v_u_12.Transparency
end
function v_u_12.StyleTextWidget(p19) -- name: StyleTextWidget
	-- upvalues: (copy) v_u_12
	p19.BackgroundTransparency = 1
	p19.TextColor3 = v_u_12.FontColor
	p19.Font = Enum.Font.SourceSansBold
end
function v_u_12.StyleButtonSelected(p20, p21) -- name: StyleButtonSelected
	-- upvalues: (copy) v_u_12
	v_u_12.StyleButton(p20)
	if p21 then
		p20.BackgroundColor3 = v_u_12.SelectedBackgroundColor
	end
end
function v_u_12.FormatTypedValue(p22, p23) -- name: FormatTypedValue
	-- upvalues: (copy) v_u_12
	if p23 == v_u_12.StatType_Memory then
		return string.format("%.2f MB", p22)
	end
	if p23 == v_u_12.StatType_CPU then
		return string.format("%.2f ms", p22)
	end
	if p23 == v_u_12.StatType_GPU then
		return string.format("%.2f ms", p22)
	end
	if p23 == v_u_12.StatType_NetworkSent then
		return string.format("%.2f KB/s", p22)
	end
	if p23 == v_u_12.StatType_NetworkReceived then
		return string.format("%.2f KB/s", p22)
	end
	if p23 == v_u_12.StatType_Ping then
		return string.format("%.0f ms", p22)
	end
end
function v_u_12.StyleAverageLine(p24) -- name: StyleAverageLine
	-- upvalues: (copy) v_u_12
	p24.BackgroundColor3 = v_u_12.GraphAverageLineColor
	p24.BorderSizePixel = v_u_12.GraphAverageLineBorderThickness
	p24.BorderColor3 = v_u_12.GraphAverageLineBorderColor
end
function v_u_12.GetColorForValue(p25, p26) -- name: GetColorForValue
	-- upvalues: (copy) v_u_12
	if p25 < 0.666 * p26 then
		return v_u_12.GraphBarGreenColor
	elseif p25 < 1.333 * p26 then
		return v_u_12.GraphBarYellowColor
	else
		return v_u_12.GraphBarRedColor
	end
end
function v_u_12.PerformanceStatsShouldBeVisible() -- name: PerformanceStatsShouldBeVisible
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v27 = v_u_2.LocalPlayer
	local v28 = v_u_4.PerformanceStatsVisible
	if v28 then
		v28 = v27 ~= nil
	end
	return v28
end
return v_u_12