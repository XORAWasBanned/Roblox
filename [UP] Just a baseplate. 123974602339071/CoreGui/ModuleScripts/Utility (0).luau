-- Path: CoreGui.RobloxGui.Modules.Shell.Utility
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("TextService")
local v_u_4 = game:GetService("Players")
game:GetService("CoreGui")
local v_u_5 = game:GetService("LocalizationService")
local v_u_6 = nil
local function v7()
	-- upvalues: (ref) v_u_6
	v_u_6 = game:GetService("PlatformService")
end
pcall(v7)
local v_u_32 = {
	["IsFinite"] = function(p8) -- name: IsFinite
		local v9
		if p8 == p8 and p8 ~= (1 / 0) then
			v9 = p8 ~= (-1 / 0)
		else
			v9 = false
		end
		return v9
	end,
	["FindAncestorOfType"] = function(p10, p11) -- name: FindAncestorOfType
		-- upvalues: (copy) v_u_32
		if p10 then
			p10 = p10.Parent
		end
		if p10 then
			if p10:IsA(p11) then
				return p10
			else
				return v_u_32.FindAncestorOfType(p10, p11)
			end
		else
			return nil
		end
	end,
	["CalculateRelativeDimensions"] = function(p12, p13, p14, _) -- name: CalculateRelativeDimensions
		-- upvalues: (copy) v_u_2, (copy) v_u_32
		local v15 = v_u_2:GetScreenResolution()
		local v16 = v_u_32.FindAncestorOfType(p12, "SurfaceGui")
		if v16 then
			v15 = v16.CanvasSize
		end
		local v17 = p13 / p14
		if p14.y > 0 and v15.y > 0 then
			v17 = v17 * (p14.x / p14.y / (v15.x / v15.y))
			local v18 = p12.Parent
			if v18 then
				local v19 = 1 / (v18.AbsoluteSize / v15)
				if v_u_32.IsFinite(v19.x) and v_u_32.IsFinite(v19.y) then
					return UDim2.new(v19.x * v17.x, 0, v19.y * v17.y, 0)
				end
			end
		end
		return UDim2.new(v17.x, 0, v17.y, 0)
	end,
	["Enum"] = {
		["Anchor"] = {
			["TopLeft"] = 1,
			["TopMiddle"] = 2,
			["TopRight"] = 3,
			["CenterLeft"] = 4,
			["Center"] = 5,
			["CenterRight"] = 6,
			["BottomLeft"] = 7,
			["BottomMiddle"] = 8,
			["BottomRight"] = 9
		}
	},
	["CalculateFit"] = function(p20, p21) -- name: CalculateFit
		local v22 = p20.AbsoluteSize / p21
		local v23 = v22.X
		local v24 = v22.Y
		local v25 = p21 * math.min(v23, v24)
		return UDim2.new(0, v25.X, 0, v25.Y)
	end,
	["CalculateFill"] = function(p26, p27) -- name: CalculateFill
		local v28 = p26.AbsoluteSize / p27
		local v29 = v28.X
		local v30 = v28.Y
		local v31 = p27 * math.max(v29, v30)
		return UDim2.new(0, v31.X, 0, v31.Y)
	end
}
local v_u_33 = {}
function v_u_32.Linear(p34, p35, p36, p37) -- name: Linear
	if p37 <= p34 then
		return p35 + p36
	else
		return p36 * p34 / p37 + p35
	end
end
function v_u_32.EaseOutQuad(p38, p39, p40, p41) -- name: EaseOutQuad
	if p41 <= p38 then
		return p39 + p40
	end
	local v42 = p38 / p41
	return -p40 * v42 * (v42 - 2) + p39
end
function v_u_32.EaseInOutQuad(p43, p44, p45, p46) -- name: EaseInOutQuad
	if p46 <= p43 then
		return p44 + p45
	end
	local v47 = p43 / (p46 / 2)
	if v47 < 1 then
		return p45 / 2 * v47 * v47 + p44
	end
	local v48 = v47 - 1
	return -p45 / 2 * (v48 * (v48 - 2) - 1) + p44
end
function v_u_32.SCurveUDim2(p49, p50, p51, p52) -- name: SCurveUDim2
	if p52 <= p49 then
		return p50 + p51
	end
	local v53 = p49 / p52
	local v54 = v53 < 0 and 0 or v53
	local v55 = v54 > 1 and 1 or v54
	local v56 = 3 * v55 * v55 - 2 * v55 * v55 * v55
	return UDim2.new(v56 * p51.X.Scale, v56 * p51.X.Offset, v56 * p51.Y.Scale, v56 * p51.Y.Offset) + p50
end
function v_u_32.SCurveVector2(p57, p58, p59, p60) -- name: SCurveVector2
	if p60 <= p57 then
		return p58 + p59
	end
	local v61 = p57 / p60
	local v62 = v61 < 0 and 0 or v61
	local v63 = v62 > 1 and 1 or v62
	local v64 = 3 * v63 * v63 - 2 * v63 * v63 * v63
	return Vector2.new(v64 * p59.X, v64 * p59.Y) + p58
end
function v_u_32.PropertyTweener(p_u_65, p_u_66, p_u_67, p_u_68, p_u_69, p70, p71, p_u_72) -- name: PropertyTweener
	-- upvalues: (copy) v_u_32, (copy) v_u_33, (copy) v_u_1
	-- control flow flattened: this region could not be structured without a goto (unsupported in Luau), so it was lowered to the state-machine dispatch loop below to keep the output runnable.
	local v_u_73, v74, v75, v76, v77, v_u_78, v_u_79, v_u_80, v_u_81
	local v82 = 5
	while true do
		if v82 == 1 then
			v74 = v_u_33[p_u_66]
			if v74 then
				v74 = v_u_33[p_u_66][p_u_65]
			end
			if v74 then
				v82 = 3
			else
				v82 = 2
			end
		elseif v82 == 2 then
			v75 = v_u_33[p_u_66]
			if v75 then
				v75 = v_u_33[p_u_66][p_u_65]
			end
			if v75 then
				v76 = v_u_33[p_u_66]
				if v76 then
					v76 = v_u_33[p_u_66][p_u_65]
				end
				v76:Cancel()
			end
			if not v_u_33[p_u_66] then
				v_u_33[p_u_66] = {}
			end
			v_u_33[p_u_66][p_u_65] = v_u_80
			v77 = v_u_79(0, p_u_67, p_u_68 - p_u_67, p_u_69)
			if p_u_65 then
				p_u_65[p_u_66] = v77
			end
			spawn(function()
				-- upvalues: (copy) v_u_80, (copy) p_u_65, (ref) v_u_79, (copy) p_u_67, (copy) p_u_68, (copy) p_u_69, (copy) p_u_66, (ref) v_u_81, (ref) v_u_32, (ref) v_u_1, (copy) v_u_73, (ref) v_u_33
				local v83 = tick()
				while v83 < v_u_80.EndTime and (p_u_65 and not v_u_80.Cancelled) do
					local v84 = v_u_79(v83 - v_u_80.StartTime, p_u_67, p_u_68 - p_u_67, p_u_69)
					if p_u_65 then
						p_u_65[p_u_66] = v84
					end
					v_u_81 = v_u_32.Clamp(0, 1, (v83 - v_u_80.StartTime) / p_u_69)
					v_u_1.RenderStepped:wait()
					v83 = tick()
				end
				if v_u_80.Cancelled == false and p_u_65 then
					v_u_73()
				end
				local v85 = p_u_66
				local v86 = p_u_65
				local v87 = v_u_33[v85]
				if v87 then
					v87 = v_u_33[v85][v86]
				end
				if v87 == v_u_80 then
					local v88 = p_u_66
					local v89 = p_u_65
					if not v_u_33[v88] then
						v_u_33[v88] = {}
					end
					v_u_33[v88][v89] = nil
				end
			end)
			v82 = 4
		elseif v82 == 3 then
			v_u_78 = true
			v82 = 4
		elseif v82 == 4 then
			function v_u_80.GetFinal(_) -- name: GetFinal
				-- upvalues: (copy) p_u_68
				return p_u_68
			end
			function v_u_80.GetPercentComplete(_) -- name: GetPercentComplete
				-- upvalues: (ref) v_u_81
				return v_u_81
			end
			function v_u_80.IsFinished(_) -- name: IsFinished
				-- upvalues: (ref) v_u_78
				return v_u_78
			end
			function v_u_80.Finish(p90) -- name: Finish
				-- upvalues: (ref) v_u_78, (copy) v_u_73
				if not v_u_78 then
					p90:Cancel()
					v_u_73()
				end
			end
			function v_u_80.Cancel(_) -- name: Cancel
				-- upvalues: (copy) v_u_80, (ref) v_u_78, (copy) p_u_66, (copy) p_u_65, (ref) v_u_33
				v_u_80.Cancelled = true
				v_u_78 = true
				local v91 = p_u_66
				local v92 = p_u_65
				local v93 = v_u_33[v91]
				if v93 then
					v93 = v_u_33[v91][v92]
				end
				if v93 == v_u_80 then
					local v94 = p_u_66
					local v95 = p_u_65
					if not v_u_33[v94] then
						v_u_33[v94] = {}
					end
					v_u_33[v94][v95] = nil
				end
			end
			return v_u_80
		else
			v_u_79 = p70 or v_u_32.Linear
			v_u_80 = {
				["StartTime"] = tick()
			}
			v_u_80.EndTime = v_u_80.StartTime + p_u_69
			v_u_80.Cancelled = false
			v_u_78 = false
			v_u_81 = 0
			v_u_73 = function() -- name: finalize
				-- upvalues: (ref) v_u_79, (copy) p_u_67, (copy) p_u_68, (copy) p_u_65, (copy) p_u_66, (ref) v_u_78, (ref) v_u_81, (ref) v_u_33, (copy) v_u_80, (copy) p_u_72
				local v96 = v_u_79(1, p_u_67, p_u_68 - p_u_67, 1)
				if p_u_65 then
					p_u_65[p_u_66] = v96
				end
				v_u_78 = true
				v_u_81 = 1
				local v97 = p_u_66
				local v98 = p_u_65
				local v99 = v_u_33[v97]
				if v99 then
					v99 = v_u_33[v97][v98]
				end
				if v99 == v_u_80 then
					local v100 = p_u_66
					local v101 = p_u_65
					if not v_u_33[v100] then
						v_u_33[v100] = {}
					end
					v_u_33[v100][v101] = nil
				end
				if p_u_72 then
					p_u_72()
				end
			end
			if p71 or false then
				v82 = 2
			else
				v82 = 1
			end
		end
	end
end
function v_u_32.CancelTweens(p102) -- name: CancelTweens
	for v103, v104 in pairs(p102) do
		v104:Finish()
		p102[v103] = nil
	end
end
function v_u_32.Signal() -- name: Signal
	local v105 = {}
	local v_u_106 = Instance.new("BindableEvent")
	local v_u_107 = nil
	local v_u_108 = nil
	function v105.fire(_, ...) -- name: fire
		-- upvalues: (ref) v_u_107, (ref) v_u_108, (copy) v_u_106
		v_u_107 = { ... }
		v_u_108 = select("#", ...)
		v_u_106:Fire()
	end
	function v105.connect(_, p_u_109) -- name: connect
		-- upvalues: (copy) v_u_106, (ref) v_u_107, (ref) v_u_108
		if not p_u_109 then
			error("connect(nil)", 2)
		end
		return v_u_106.Event:connect(function()
			-- upvalues: (copy) p_u_109, (ref) v_u_107, (ref) v_u_108
			local v110 = v_u_107
			local v111 = v_u_108
			p_u_109(unpack(v110, 1, v111))
		end)
	end
	function v105.wait(_) -- name: wait
		-- upvalues: (copy) v_u_106, (ref) v_u_107, (ref) v_u_108
		v_u_106.Event:wait()
		local v112 = v_u_107
		assert(v112, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		local v113 = v_u_107
		local v114 = v_u_108
		return unpack(v113, 1, v114)
	end
	return v105
end
function v_u_32.DisconnectEvent(p115) -- name: DisconnectEvent
	if p115 then
		p115:disconnect()
	end
	return nil
end
function v_u_32.DisconnectEvents(p116) -- name: DisconnectEvents
	if p116 and type(p116) == "table" then
		for _, v117 in pairs(p116) do
			v117:disconnect()
		end
	end
end
function v_u_32.Clamp(p118, p119, p120) -- name: Clamp
	local v121 = math.min(p119, p120)
	return math.max(p118, v121)
end
function v_u_32.ClampVector2(p122, p123, p124) -- name: ClampVector2
	-- upvalues: (copy) v_u_32
	return Vector2.new(v_u_32.Clamp(p122.x, p123.x, p124.x), v_u_32.Clamp(p122.y, p123.y, p124.y))
end
function v_u_32.TweenPositionOrSet(p125, ...) -- name: TweenPositionOrSet
	if p125:IsDescendantOf(game) then
		p125:TweenPositionInternal(...)
	else
		p125.Position = select(1, ...)
	end
end
function v_u_32.ClampCanvasPosition(p126, p127) -- name: ClampCanvasPosition
	-- upvalues: (copy) v_u_32
	local v128 = p126.Parent and p126.Parent.AbsoluteSize or Vector2.new(0, 0)
	local v129 = Vector2.new(p126.CanvasSize.X.Scale * v128.X + p126.CanvasSize.X.Offset, p126.CanvasSize.Y.Scale * v128.Y + p126.CanvasSize.Y.Offset)
	local v130 = v_u_32.Clamp(0, v129.X - p126.AbsoluteWindowSize.X, p127.X)
	local v131 = v_u_32.Clamp(0, v129.Y - p126.AbsoluteWindowSize.Y, p127.Y)
	return Vector2.new(v130, v131)
end
function v_u_32.Round(p132, p133) -- name: Round
	local v134 = p133 or 1
	local v135 = (p132 + v134 / 2) / v134
	return math.floor(v135) * v134
end
function v_u_32.ChompString(p136) -- name: ChompString
	return tostring(p136):gsub("^%s+", ""):gsub("%s+$", "")
end
function v_u_32.SpaceNormalizeString(p137) -- name: SpaceNormalizeString
	return tostring(p137):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end
local function v_u_140() -- name: getDelimiterByLocale
	-- upvalues: (copy) v_u_5
	local v138 = v_u_5.RobloxLocaleId:lower()
	local v139 = {
		["en-us"] = ",",
		["zh-hk"] = "",
		["zh-tw"] = "",
		["nb-no"] = "\194\160",
		["es-es"] = " ",
		["nl-nl"] = ".",
		["it-it"] = ".",
		["tr-tr"] = ".",
		["ru-ru"] = " ",
		["fi-fi"] = "\194\160",
		["da-dk"] = ".",
		["de-de"] = ".",
		["fr-fr"] = "\194\160",
		["pt-br"] = ".",
		["pt-pt"] = ".",
		["pl-pl"] = " ",
		["sv-se"] = " "
	}
	return not v139[v138] and "," or v139[v138]
end
function v_u_32.FormatNumberString(p141) -- name: FormatNumberString
	-- upvalues: (copy) v_u_140, (copy) v_u_32
	local v142 = v_u_140()
	local v143 = v_u_32.ChompString(p141)
	local v144 = string.format("%%1%s%%2", v142)
	repeat
		local v145
		v143, v145 = string.gsub(v143, "^(-?%d+)(%d%d%d)", v144)
	until v145 == 0
	return v143
end
function v_u_32.PrettyPrint(p146) -- name: PrettyPrint
	-- upvalues: (copy) v_u_32
	if type(p146) == "table" then
		local v147 = "{"
		for v148, v149 in pairs(p146) do
			local v150 = v147 == "{" and v147 and v147 or v147 .. ", "
			if type(v148) == "string" then
				v150 = v150 .. v148 .. " = "
			elseif type(v148) ~= "number" then
				v150 = v150 .. "[" .. v148 .. "] = "
			end
			v147 = v150 .. v_u_32.PrettyPrint(v149)
		end
		return v147 .. "}"
	elseif type(p146) == "string" then
		return "\'" .. p146 .. "\'"
	else
		return tostring(p146)
	end
end
function v_u_32.GamepadLinearToCurve(p151, p_u_152, _, _) -- name: GamepadLinearToCurve
	-- upvalues: (copy) v_u_32
	local function v163(p153) -- name: onAxis
		-- upvalues: (copy) p_u_152, (ref) v_u_32
		local v154 = p153 < 0 and -1 or 1
		local v155 = math.abs(p153)
		local v156 = p_u_152 or 0.1
		local v157 = (1 + v156) * (math.abs(v155) * 2 - 1) - v156
		local v158 = nil or 0.35
		local v159 = nil or 0.8
		local v160 = v_u_32.Clamp(-1, 1, v157)
		local v161
		if v160 >= 0 then
			v161 = v158 * v160 / (v158 - v160 + 1)
		else
			v161 = -(v159 * -v160 / (v159 + v160 + 1))
		end
		local v162 = v161 / 2 + 0.5
		return v_u_32.Clamp(-1, 1, v162 * v154)
	end
	local v164 = Vector2.new
	local v165 = p151.x
	local v166 = v165 < 0 and -1 or 1
	local v167 = math.abs(v165)
	local v168 = p_u_152 or 0.1
	local v169 = (1 + v168) * (math.abs(v167) * 2 - 1) - v168
	local v170 = nil or 0.35
	local v171 = nil or 0.8
	local v172 = v_u_32.Clamp(-1, 1, v169)
	local v173
	if v172 >= 0 then
		v173 = v170 * v172 / (v170 - v172 + 1)
	else
		v173 = -(v171 * -v172 / (v171 + v172 + 1))
	end
	local v174 = v173 / 2 + 0.5
	return v164(v_u_32.Clamp(-1, 1, v174 * v166), v163(p151.y))
end
function v_u_32.IsFastFlagEnabled(p_u_175) -- name: IsFastFlagEnabled
	local v176, v177 = pcall(function()
		-- upvalues: (copy) p_u_175
		return settings():GetFFlag(p_u_175)
	end)
	return v176 and v177
end
function v_u_32.GetFastVariable(p_u_178) -- name: GetFastVariable
	local v179, v180 = pcall(function()
		-- upvalues: (copy) p_u_178
		return settings():GetFVariable(p_u_178)
	end)
	return v179 and v180
end
function v_u_32.IsFeatureNonZero(p181) -- name: IsFeatureNonZero
	-- upvalues: (copy) v_u_32
	local v182 = v_u_32.GetFastVariable
	return (tonumber(v182(p181)) or 0) ~= 0
end
function v_u_32.IsFeatureRolledOut(p183) -- name: IsFeatureRolledOut
	-- upvalues: (copy) v_u_4, (copy) v_u_32
	while v_u_4.LocalPlayer == nil do
		wait()
	end
	local v184 = v_u_4.LocalPlayer.UserId % 100
	local v185 = v_u_32.GetFastVariable
	local v186
	if v184 < (tonumber(v185(p183)) or 0) then
		v186 = true
	else
		v186 = false
	end
	return v186
end
function v_u_32.ExponentialRepeat(p187, p188, p189) -- name: ExponentialRepeat
	local v190 = 1
	local v191 = p189 or 6
	while v190 <= v191 and p187() do
		if p188() then
			return
		end
		wait(v190 ^ 2)
		v190 = v190 + 1
	end
end
function v_u_32.SplitString(p192, p193) -- name: SplitString
	local v194 = {}
	if p192 and p193 then
		for v195 in string.gmatch(p192, "([^" .. p193 .. "]+)") do
			table.insert(v194, v195)
		end
	end
	return v194
end
local function v_u_211(p196, p197, p198) -- name: findAssetsHelper
	-- upvalues: (copy) v_u_211
	if p196 then
		if p196:IsA("CharacterMesh") then
			if p196.MeshId > 0 then
				local v199 = p196.MeshId
				local v200 = p198 .. tostring(v199)
				table.insert(p197, v200)
			end
			if p196.BaseTextureId > 0 then
				local v201 = p196.BaseTextureId
				local v202 = p198 .. tostring(v201)
				table.insert(p197, v202)
			end
			if p196.OverlayTextureId > 0 then
				local v203 = p196.OverlayTextureId
				local v204 = p198 .. tostring(v203)
				table.insert(p197, v204)
			end
		elseif p196:IsA("FileMesh") then
			local v205 = p196.MeshId
			table.insert(p197, v205)
			local v206 = p196.TextureId
			table.insert(p197, v206)
		elseif p196:IsA("Decal") then
			local v207 = p196.Texture
			table.insert(p197, v207)
		elseif p196:IsA("Pants") then
			local v208 = p196.PantsTemplate
			table.insert(p197, v208)
		elseif p196:IsA("Shirt") then
			local v209 = p196.ShirtTemplate
			table.insert(p197, v209)
		end
		for _, v210 in pairs(p196:GetChildren()) do
			v_u_211(v210, p197, p198)
		end
	end
end
function v_u_32.FindAssetsInModel(p212, p213) -- name: FindAssetsInModel
	-- upvalues: (copy) v_u_211
	local v214 = {}
	v_u_211(p212, v214, p213 or "https://assetgame.roblox.com/asset/?id=")
	return v214
end
function v_u_32.ConvertFontSizeEnumToInt(p215) -- name: ConvertFontSizeEnumToInt
	local v216 = p215.Name
	return string.match(v216, "%d+") or 10
end
function v_u_32.Upper(p217) -- name: Upper
	-- upvalues: (ref) v_u_6
	if v_u_6 then
		return v_u_6:Upper(p217)
	else
		return string.upper(p217)
	end
end
function v_u_32.SetSelectedCoreObject(p218) -- name: SetSelectedCoreObject
	-- upvalues: (copy) v_u_2
	v_u_2.SelectedCoreObject = p218
end
function v_u_32.AddSelectionParent(p219, p220) -- name: AddSelectionParent
	-- upvalues: (copy) v_u_2
	v_u_2:AddSelectionParent(p219, p220)
end
function v_u_32.RemoveSelectionGroup(p221) -- name: RemoveSelectionGroup
	-- upvalues: (copy) v_u_2
	v_u_2:RemoveSelectionGroup(p221)
end
function v_u_32.GetTextBounds(p222) -- name: GetTextBounds
	-- upvalues: (copy) v_u_3
	local v223 = false
	local v224 = nil
	if p222 then
		if p222.TextFits then
			return true, p222.TextBounds
		end
		if not p222.TextWrapped then
			v224 = v_u_3:GetTextSize(p222.Text, p222.TextSize, p222.Font, Vector2.new(0, 0))
			v223 = true
		end
	end
	return v223, v224
end
function v_u_32.ResizeButtonWithText(p225, p226, p227, p228) -- name: ResizeButtonWithText
	-- upvalues: (copy) v_u_32
	local v229 = false
	local v230, v231 = v_u_32.GetTextBounds(p226)
	if v230 and (p225.Size.X.Scale == 0 and p225.Size.Y.Scale == 0) then
		local v232 = Vector2.new(p225.Size.X.Offset, p225.Size.Y.Offset)
		local v233 = v232.X
		local v234 = v232.Y
		if p227 and v232.X < v231.X + p227 * 2 then
			v233 = v231.X + p227 * 2
			v229 = true
		end
		if p228 and v232.Y < v231.Y + p228 * 2 then
			v234 = v231.Y + p228 * 2
			v229 = true
		end
		if v229 then
			p225.Size = UDim2.new(0, v233, 0, v234)
		end
	end
	return v229
end
function v_u_32.ResizeButtonWithDynamicText(p235, p236, p237, p238, p239) -- name: ResizeButtonWithDynamicText
	-- upvalues: (copy) v_u_32
	local v240 = v_u_32.ResizeButtonWithText(p235, p236, p238, p239) or false
	local v241 = p236.Text
	if p237 and #p237 > 0 then
		for v242 = 1, #p237 do
			p236.Text = p237[v242]
			v240 = v_u_32.ResizeButtonWithText(p235, p236, p238, p239) or v240
		end
	end
	p236.Text = v241
	return v240
end
return v_u_32