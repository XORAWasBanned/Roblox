-- Path: CoreGui.RobloxGui.Modules.BackpackScript
local v_u_1 = UserSettings():GetService("UserGameSettings")
local v_u_2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = game:GetService("CorePackages")
local v4 = v_u_2.Modules
local v5 = require(v3.Packages.Signals)
local v_u_6 = require(v3.Workspace.Packages.InExperienceTopBar)
local v7 = require(v3.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v8 = require(v3.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_9 = require(v4.Flags.FFlagMountCoreGuiBackpack)
local v_u_10 = require(v3.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_11 = require(v3.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local v12 = v_u_6.Flags.FFlagTopBarSignalizeSetCores
local v_u_13 = require(v3.Workspace.Packages.RobloxTranslator)
local v14 = require(v3.Workspace.Packages.Responsive)
local v15 = require(v3.Workspace.Packages.SharedFlags).FFlagBackpackResponsiveUnits
local v_u_16 = game:DefineFastFlag("EnableHotbarHide", false)
local v_u_17 = require(v3.Workspace.Packages.SharedFlags).FFlagStudioDeviceSimVRSwitchFixes
local v_u_18 = game:DefineFastFlag("SAToolEquipLuauFlag", false)
local v_u_19 = {
	["OpenClose"] = nil,
	["IsHotbarVisible"] = false,
	["IsOpen"] = false,
	["StateChanged"] = Instance.new("BindableEvent"),
	["ModuleName"] = "Backpack",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = true
}
local v_u_20 = 60
local v_u_21 = Enum.FontSize.Size14
local v_u_22 = 0.5 * v_u_1.PreferredTransparency
local v_u_23 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039)
local v_u_24 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local v_u_25 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784)
local v_u_26 = 0.5 * v_u_1.PreferredTransparency
local v_u_27 = Color3.new(1, 1, 1)
UDim2.new(0, 14, 0, 9)
local v28 = Enum.KeyCode.Backquote.Value
local v_u_29 = Color3.new(0, 0.6352941176470588, 1)
local v_u_30 = "   Search"
local v31 = Color3.new(0.37, 0.37, 0.37)
local v_u_32 = 0.15 * v_u_1.PreferredTransparency
local v_u_33 = Enum.KeyCode.Zero.Value
local v_u_34 = Enum.KeyCode.Backspace.Value
local v_u_35 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local v36 = game:GetService("Players")
local v_u_37 = game:GetService("UserInputService")
local v_u_38 = game:GetService("StarterGui")
local v_u_39 = game:GetService("GuiService")
local v_u_40 = game:GetService("ContextActionService")
local v_u_41 = game:GetService("VRService")
local v_u_42 = game:GetService("GamepadService")
v_u_2:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v43 = require(v3.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v_u_44 = require(v_u_2.Modules.TenFootInterface):IsEnabled()
if v_u_44 then
	v_u_44 = not v43
end
local v_u_45 = require(v3.Workspace.Packages.AppCommonLib).Create
local v_u_46 = require(v4.GameTranslator)
pcall(function()
	-- upvalues: (ref) v_u_30, (copy) v_u_13
	v_u_30 = v_u_13:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local v_u_47 = true
if v_u_44 then
	v_u_21 = Enum.FontSize.Size24
	v_u_20 = 100
end
local v_u_48 = false
local v49
if v15 then
	if v14.GetInputModeStore().getPreferredInputType() == v14.Input.Touch then
		v49 = v_u_39:GetScreenResolution().X < 1024
	else
		v49 = false
	end
else
	v49 = v_u_37.TouchEnabled
	if v49 then
		v49 = v_u_39:GetScreenResolution().X < 1024
	end
end
local v_u_50 = v36.LocalPlayer
local v_u_51 = nil
local v_u_52 = nil
local v_u_53 = nil
local v_u_54 = nil
local v_u_55 = nil
local v_u_56 = nil
local v_u_57 = nil
local v_u_58 = nil
local v_u_59 = nil
local v_u_60 = nil
local v_u_61 = {}
local v_u_62 = nil
local v_u_63 = {}
local v_u_64 = {}
local v_u_65 = {}
local v_u_66 = 0
local v_u_67 = nil
local v_u_68 = false
local v_u_69 = false
local v_u_70 = false
local v_u_71 = false
local v_u_72 = {}
local v_u_73 = {}
local v_u_74 = false
local v_u_75 = 0
local v_u_76 = v49 and 3 or 10
local v_u_77 = v49 and 2 or 4
local v_u_78 = nil
v_u_19.BackpackEmpty = v_u_45("BindableEvent")({
	["Name"] = "BackpackEmpty"
})
v_u_19.BackpackItemAdded = v_u_45("BindableEvent")({
	["Name"] = "BackpackAdded"
})
v_u_19.BackpackItemRemoved = v_u_45("BindableEvent")({
	["Name"] = "BackpackRemoved"
})
local function v_u_82(p79, p80) -- name: NewGui
	-- upvalues: (ref) v_u_21
	local v81 = Instance.new(p79)
	v81.Name = p80
	v81.BackgroundColor3 = Color3.new(0, 0, 0)
	v81.BackgroundTransparency = 1
	v81.BorderColor3 = Color3.new(0, 0, 0)
	v81.BorderSizePixel = 0
	v81.Size = UDim2.new(1, 0, 1, 0)
	if p79:match("Text") then
		v81.TextColor3 = Color3.new(1, 1, 1)
		v81.Text = ""
		v81.Font = Enum.Font.SourceSans
		v81.FontSize = v_u_21
		v81.TextWrapped = true
		if p79 == "TextButton" then
			v81.Font = Enum.Font.SourceSansBold
			v81.BorderSizePixel = 1
		end
	end
	return v81
end
function v_u_19.IsInventoryEmpty() -- name: isInventoryEmpty
	-- upvalues: (ref) v_u_76, (copy) v_u_61
	for v83 = v_u_76 + 1, #v_u_61 do
		local v84 = v_u_61[v83]
		if not (v84 and v84.Tool) then
			continue
		end
		return false
	end
	return true
end
local function v_u_98(p85) -- name: AdjustHotbarFrames
	-- upvalues: (ref) v_u_54, (ref) v_u_76, (ref) v_u_66, (copy) v_u_16, (copy) v_u_61, (ref) v_u_53, (copy) v_u_19
	local v86 = v_u_54.Visible
	local v87 = v86 and v_u_76 or v_u_66
	local v88 = 0
	local v89
	if v_u_16 then
		if v87 >= 1 then
			v89 = not p85
		else
			v89 = false
		end
	else
		v89 = v87 >= 1
	end
	for v90 = 1, v_u_76 do
		local v91 = v_u_61[v90]
		local v92
		if v_u_16 then
			v92 = v91.Tool
			if v92 then
				v92 = not p85
			end
		else
			v92 = v91.Tool
		end
		if v92 or v86 then
			v88 = v88 + 1
			v91:Readjust(v88, v87)
			v91.Frame.Visible = true
		else
			v91.Frame.Visible = false
		end
	end
	local v93 = v_u_53
	local v94 = not v86
	if v94 then
		if v89 then
			v94 = v89
		else
			for v95 = v_u_76 + 1, #v_u_61 do
				local v96 = v_u_61[v95]
				if not (v96 and v96.Tool) then
					continue
				end
				v97 = false
			end
			local v97 = true
			v94 = not v97
		end
	end
	v93.Visible = v94
	v_u_53.Position = UDim2.new(0.5, -15, 1, v89 and -110 or -50)
	v_u_19.IsHotbarVisible = v89
end
local function v_u_103() -- name: UpdateScrollingFrameCanvasSize
	-- upvalues: (ref) v_u_56, (ref) v_u_20, (ref) v_u_57
	local v99 = v_u_56.AbsoluteSize.X / (v_u_20 + 5)
	local v100 = math.floor(v99)
	local v101 = (#v_u_57:GetChildren() - 1) / v100
	local v102 = math.ceil(v101) * (v_u_20 + 5) + 5
	v_u_56.CanvasSize = UDim2.new(0, 0, 0, v102)
end
local function v_u_106() -- name: AdjustInventoryFrames
	-- upvalues: (ref) v_u_76, (copy) v_u_61, (copy) v_u_103
	for v104 = v_u_76 + 1, #v_u_61 do
		local v105 = v_u_61[v104]
		v105.Frame.LayoutOrder = v105.Index
		v105.Frame.Visible = v105.Tool ~= nil
	end
	v_u_103()
end
local function v107() -- name: UpdateBackpackLayout
	-- upvalues: (ref) v_u_52, (ref) v_u_76, (ref) v_u_20, (ref) v_u_54, (copy) v_u_77, (ref) v_u_56, (copy) v_u_98, (copy) v_u_106
	v_u_52.Size = UDim2.new(0, 5 + v_u_76 * (v_u_20 + 5), 0, v_u_20 + 5 + 5)
	v_u_52.Position = UDim2.new(0.5, -v_u_52.Size.X.Offset / 2, 1, -v_u_52.Size.Y.Offset)
	v_u_54.Size = UDim2.new(0, v_u_52.Size.X.Offset, 0, v_u_52.Size.Y.Offset * v_u_77 + 40)
	v_u_54.Position = UDim2.new(0.5, -v_u_54.Size.X.Offset / 2, 1, v_u_52.Position.Y.Offset - v_u_54.Size.Y.Offset)
	v_u_56.Size = UDim2.new(1, v_u_56.ScrollBarThickness + 1, 1, -40)
	v_u_56.Position = UDim2.new(0, 0, 0, 40)
	v_u_98()
	v_u_106()
end
local function v_u_110(p108) -- name: EquipNewTool
	-- upvalues: (ref) v_u_59, (ref) v_u_67, (copy) v_u_63, (copy) v_u_18, (ref) v_u_50, (ref) v_u_58
	if v_u_59 then
		v_u_59:UnequipTools()
		if v_u_67 then
			v_u_67:ToggleSelect()
			v_u_63[v_u_67]:UpdateEquipView()
			v_u_67 = nil
		end
	end
	if p108:IsA("HopperBin") then
		p108:ToggleSelect()
		v_u_63[p108]:UpdateEquipView()
		v_u_67 = p108
	else
		local v109
		if v_u_18 and game:GetEngineFeature("SAToolEquipEngineFeature") then
			v109 = workspace.AuthorityMode == Enum.AuthorityMode.Server
		else
			v109 = false
		end
		if v109 then
			v_u_50:RequestTool(p108)
		end
		p108.Parent = v_u_58
	end
end
local function v_u_205(p111, p112) -- name: MakeSlot
	-- upvalues: (copy) v_u_61, (ref) v_u_26, (copy) v_u_24, (copy) v_u_23, (ref) v_u_52, (ref) v_u_20, (copy) v_u_46, (ref) v_u_76, (ref) v_u_54, (ref) v_u_66, (ref) v_u_69, (ref) v_u_48, (copy) v_u_40, (copy) v_u_63, (ref) v_u_62, (ref) v_u_58, (ref) v_u_78, (copy) v_u_82, (copy) v_u_25, (copy) v_u_65, (copy) v_u_103, (copy) v_u_18, (ref) v_u_50, (ref) v_u_59, (ref) v_u_67, (ref) v_u_60, (copy) v_u_110, (copy) v_u_27, (copy) v_u_205, (ref) v_u_57, (ref) v_u_71, (copy) v_u_64, (copy) v_u_33, (ref) v_u_56
	local v113 = p112 or #v_u_61 + 1
	local v_u_114 = {
		["Tool"] = nil,
		["Index"] = v113,
		["Frame"] = nil
	}
	local v_u_115 = nil
	local v_u_116 = nil
	local v_u_117 = nil
	local v_u_118 = nil
	local v_u_119 = nil
	local v_u_120 = nil
	local v_u_121 = nil
	local v_u_122 = nil
	function v_u_114.Readjust(_, p123, p124) -- name: Readjust
		-- upvalues: (ref) v_u_52, (ref) v_u_20, (ref) v_u_115
		local v125 = v_u_52.Size.X.Offset / 2
		local v126 = v_u_20 + 5
		local v127 = p123 - (p124 / 2 + 0.5)
		v_u_115.Position = UDim2.new(0, v125 - v_u_20 / 2 + v126 * v127, 0, 5)
	end
	function v_u_114.Fill(p128, p_u_129) -- name: Fill
		-- upvalues: (ref) v_u_117, (ref) v_u_118, (ref) v_u_46, (ref) v_u_121, (ref) v_u_119, (ref) v_u_76, (ref) v_u_54, (ref) v_u_115, (ref) v_u_66, (ref) v_u_69, (ref) v_u_48, (ref) v_u_40, (ref) v_u_63, (ref) v_u_62, (ref) v_u_61
		if not p_u_129 then
			return p128:Clear()
		end
		p128.Tool = p_u_129
		local function v_u_132() -- name: assignToolData
			-- upvalues: (copy) p_u_129, (ref) v_u_117, (ref) v_u_118, (ref) v_u_46, (ref) v_u_121
			local v130 = p_u_129.TextureId
			v_u_117.Image = v130
			if v130 == "" then
				v_u_118.Visible = true
			else
				v_u_118.Visible = false
			end
			v_u_46:TranslateAndRegister(v_u_118, p_u_129, p_u_129.Name)
			if v_u_121 and p_u_129:IsA("Tool") then
				v_u_46:TranslateAndRegister(v_u_121, p_u_129, p_u_129.ToolTip)
				local v131 = v_u_121.TextBounds.X + 6
				v_u_121.Size = UDim2.new(0, v131, 0, 16)
				v_u_121.Position = UDim2.new(0.5, -v131 / 2, 0, -25)
			end
		end
		v_u_132()
		if v_u_119 then
			v_u_119:disconnect()
			v_u_119 = nil
		end
		v_u_119 = p_u_129.Changed:connect(function(p133)
			-- upvalues: (copy) v_u_132
			if p133 == "TextureId" or (p133 == "Name" or p133 == "ToolTip") then
				v_u_132()
			end
		end)
		local v134 = p128.Index <= v_u_76
		if not v134 or v_u_54.Visible then
			v_u_115.Draggable = true
		end
		p128:UpdateEquipView()
		if v134 then
			v_u_66 = v_u_66 + 1
			if v_u_69 and (v_u_66 >= 1 and not v_u_48) then
				v_u_48 = true
				v_u_40:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		v_u_63[p_u_129] = p128
		for v135 = 1, v_u_76 do
			v136 = v_u_61[v135]
			if v136.Tool then
				continue
			end
		end
		local v136 = nil
		v_u_62 = v136
	end
	function v_u_114.Clear(p137) -- name: Clear
		-- upvalues: (ref) v_u_119, (ref) v_u_117, (ref) v_u_118, (ref) v_u_121, (ref) v_u_115, (ref) v_u_76, (ref) v_u_66, (ref) v_u_48, (ref) v_u_40, (ref) v_u_63, (ref) v_u_62, (ref) v_u_61
		if p137.Tool then
			if v_u_119 then
				v_u_119:disconnect()
				v_u_119 = nil
			end
			v_u_117.Image = ""
			v_u_118.Text = ""
			if v_u_121 then
				v_u_121.Text = ""
				v_u_121.Visible = false
			end
			v_u_115.Draggable = false
			p137:UpdateEquipView(true)
			if p137.Index <= v_u_76 then
				v_u_66 = v_u_66 - 1
				if v_u_66 < 1 then
					v_u_48 = false
					v_u_40:UnbindAction("RBXHotbarEquip")
				end
			end
			v_u_63[p137.Tool] = nil
			p137.Tool = nil
			for v138 = 1, v_u_76 do
				v139 = v_u_61[v138]
				if v139.Tool then
					continue
				end
			end
			local v139 = nil
			v_u_62 = v139
		end
	end
	function v_u_114.UpdateEquipView(p140, p141) -- name: UpdateEquipView
		-- upvalues: (ref) v_u_58, (ref) v_u_78, (copy) v_u_114, (ref) v_u_120, (ref) v_u_82, (ref) v_u_115, (ref) v_u_25, (ref) v_u_26, (ref) v_u_24, (ref) v_u_23
		if p141 then
			if v_u_120 then
				v_u_120.Parent = nil
			end
			v_u_115.SelectionImageObject = nil
			v_u_115.BackgroundTransparency = v_u_115.Draggable and 0 or v_u_26
			v_u_115.BackgroundColor3 = v_u_115.Draggable and v_u_24 or v_u_23
			return
		else
			local v142 = p140.Tool
			if not v142 or v142:IsA("HopperBin") and v142.Active or v142.Parent == v_u_58 then
				v_u_78 = v_u_114
				if not v_u_120 then
					v_u_120 = v_u_82("Frame", "Equipped")
					v_u_120.ZIndex = v_u_115.ZIndex
					for _, v143 in pairs({
						{
							0.1,
							1,
							0,
							0
						},
						{
							0.8,
							0.1,
							0.1,
							0
						},
						{
							0.1,
							1,
							0.9,
							0
						},
						{
							0.8,
							0.1,
							0.1,
							0.9
						}
					}) do
						local v144 = v_u_82("Frame", "Edge")
						v144.BackgroundTransparency = 0
						v144.BackgroundColor3 = v_u_25
						v144.Size = UDim2.new(v143[1], 0, v143[2], 0)
						v144.Position = UDim2.new(v143[3], 0, v143[4], 0)
						v144.ZIndex = v_u_120.ZIndex
						v144.Parent = v_u_120
					end
				end
				v_u_120.Parent = v_u_115
				v_u_115.SelectionImageObject = nil
				v_u_115.BackgroundTransparency = v_u_115.Draggable and 0 or v_u_26
				v_u_115.BackgroundColor3 = v_u_115.Draggable and v_u_24 or v_u_23
			else
				if v_u_120 then
					v_u_120.Parent = nil
				end
				v_u_115.SelectionImageObject = nil
				v_u_115.BackgroundTransparency = v_u_115.Draggable and 0 or v_u_26
				v_u_115.BackgroundColor3 = v_u_115.Draggable and v_u_24 or v_u_23
			end
		end
	end
	function v_u_114.IsEquipped(p145) -- name: IsEquipped
		-- upvalues: (ref) v_u_58
		local v146 = p145.Tool
		return not v146 or v146:IsA("HopperBin") and v146.Active or v146.Parent == v_u_58
	end
	function v_u_114.Delete(p147) -- name: Delete
		-- upvalues: (ref) v_u_65, (ref) v_u_115, (ref) v_u_61, (ref) v_u_103
		v_u_65[v_u_115] = nil
		v_u_115:Destroy()
		table.remove(v_u_61, p147.Index)
		local v148 = #v_u_61
		for v149 = p147.Index, v148 do
			v_u_61[v149]:SlideBack()
		end
		v_u_103()
	end
	function v_u_114.Swap(p150, p151) -- name: Swap
		local v152 = p150.Tool
		local v153 = p151.Tool
		p150:Clear()
		if v153 then
			p151:Clear()
			p150:Fill(v153)
		end
		if v152 then
			p151:Fill(v152)
		else
			p151:Clear()
		end
	end
	function v_u_114.SlideBack(p154) -- name: SlideBack
		-- upvalues: (ref) v_u_115
		p154.Index = p154.Index - 1
		v_u_115.Name = p154.Index
		v_u_115.LayoutOrder = p154.Index
	end
	function v_u_114.TurnNumber(_, p155) -- name: TurnNumber
		-- upvalues: (ref) v_u_122
		if v_u_122 then
			v_u_122.Visible = p155
		end
	end
	function v_u_114.SetClickability(p156, p157) -- name: SetClickability
		-- upvalues: (ref) v_u_115, (ref) v_u_26, (ref) v_u_24, (ref) v_u_23
		if p156.Tool then
			v_u_115.Draggable = not p157
			v_u_115.SelectionImageObject = nil
			v_u_115.BackgroundTransparency = v_u_115.Draggable and 0 or v_u_26
			v_u_115.BackgroundColor3 = v_u_115.Draggable and v_u_24 or v_u_23
		end
	end
	function v_u_114.CheckTerms(p158, p159) -- name: CheckTerms
		-- upvalues: (ref) v_u_118, (ref) v_u_121
		local v160 = 0
		local v161 = p158.Tool
		local v162
		if v161 then
			v162 = v160
			for v163 in pairs(p159) do
				local _, v164 = v_u_118.Text:lower():gsub(v163, "")
				v160 = v162 + v164
				if v161:IsA("Tool") then
					local _, v165 = (v_u_121 and v_u_121.Text or ""):lower():gsub(v163, "")
					v160 = v160 + v165
					v162 = v160
				else
					v162 = v160
				end
			end
		else
			v162 = v160
		end
		return v162
	end
	function v_u_114.Select(_, p166) -- name: Select
		-- upvalues: (copy) v_u_114, (ref) v_u_58, (ref) v_u_18, (ref) v_u_50, (ref) v_u_59, (ref) v_u_67, (ref) v_u_63, (ref) v_u_60, (ref) v_u_110
		if not p166 then
			local v167 = v_u_114.Tool
			if v167 then
				local v168
				if v167 then
					v168 = v167:IsA("HopperBin") and v167.Active or v167.Parent == v_u_58
				else
					v168 = v167
				end
				if v168 then
					local v169
					if v_u_18 and game:GetEngineFeature("SAToolEquipEngineFeature") then
						v169 = workspace.AuthorityMode == Enum.AuthorityMode.Server
					else
						v169 = false
					end
					if v169 and not v167:IsA("HopperBin") then
						v_u_50:RequestTool(nil)
					end
					if v_u_59 then
						v_u_59:UnequipTools()
						if v_u_67 then
							v_u_67:ToggleSelect()
							v_u_63[v_u_67]:UpdateEquipView()
							v_u_67 = nil
							return
						end
					end
				elseif v167.Parent == v_u_60 then
					v_u_110(v167)
				end
			end
		end
	end
	v_u_115 = v_u_82("TextButton", v113)
	v_u_115.BackgroundColor3 = v_u_23
	v_u_115.BorderColor3 = v_u_27
	v_u_115.Text = ""
	v_u_115.AutoButtonColor = false
	v_u_115.BorderSizePixel = 0
	v_u_115.Size = UDim2.new(0, v_u_20, 0, v_u_20)
	v_u_115.Active = true
	v_u_115.Draggable = false
	v_u_115.BackgroundTransparency = v_u_26
	v_u_115.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_114
		changeSlot(v_u_114)
	end)
	v_u_114.Frame = v_u_115
	local v170 = v_u_82("Frame", "SelectionObjectClipper")
	v170.Visible = false
	v170.Parent = v_u_115
	local v171 = v_u_82("ImageLabel", "Selector")
	v171.Size = UDim2.new(1, 0, 1, 0)
	v171.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	v171.ScaleType = Enum.ScaleType.Slice
	v171.SliceCenter = Rect.new(12, 12, 52, 52)
	v171.Parent = v170
	v_u_117 = v_u_82("ImageLabel", "Icon")
	v_u_117.Size = UDim2.new(0.8, 0, 0.8, 0)
	v_u_117.Position = UDim2.new(0.1, 0, 0.1, 0)
	v_u_117.Parent = v_u_115
	v_u_118 = v_u_82("TextLabel", "ToolName")
	v_u_118.Size = UDim2.new(1, -2, 1, -2)
	v_u_118.Position = UDim2.new(0, 1, 0, 1)
	v_u_118.Parent = v_u_115
	v_u_114.Frame.LayoutOrder = v_u_114.Index
	if v113 <= v_u_76 then
		v_u_121 = v_u_82("TextLabel", "ToolTip")
		v_u_121.TextWrapped = false
		v_u_121.TextYAlignment = Enum.TextYAlignment.Top
		v_u_121.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		v_u_121.BackgroundTransparency = 0
		v_u_121.Visible = false
		v_u_121.Parent = v_u_115
		v_u_115.MouseEnter:connect(function()
			-- upvalues: (ref) v_u_121
			if v_u_121.Text ~= "" then
				v_u_121.Visible = true
			end
		end)
		v_u_115.MouseLeave:connect(function()
			-- upvalues: (ref) v_u_121
			v_u_121.Visible = false
		end)
		function v_u_114.MoveToInventory(p172) -- name: MoveToInventory
			-- upvalues: (copy) v_u_114, (ref) v_u_76, (ref) v_u_205, (ref) v_u_57, (ref) v_u_58, (ref) v_u_59, (ref) v_u_67, (ref) v_u_63, (ref) v_u_71, (ref) v_u_54
			if v_u_114.Index <= v_u_76 then
				local v173 = v_u_114.Tool
				p172:Clear()
				local v174 = v_u_205(v_u_57)
				v174:Fill(v173)
				if (not v173 or v173:IsA("HopperBin") and v173.Active or v173.Parent == v_u_58) and v_u_59 then
					v_u_59:UnequipTools()
					if v_u_67 then
						v_u_67:ToggleSelect()
						v_u_63[v_u_67]:UpdateEquipView()
						v_u_67 = nil
					end
				end
				if v_u_71 then
					v174.Frame.Visible = false
					v174.Parent = v_u_54
				end
			end
		end
		if v113 < 10 or v113 == v_u_76 then
			local v175 = v113 < 10 and (v113 or 0) or 0
			v_u_122 = v_u_82("TextLabel", "Number")
			v_u_122.Text = v175
			v_u_122.Size = UDim2.new(0.15, 0, 0.15, 0)
			v_u_122.Visible = false
			v_u_122.Parent = v_u_115
			v_u_64[v_u_33 + v175] = function(p176)
				-- upvalues: (copy) v_u_114
				v_u_114:Select(p176)
			end
		end
	end
	local v_u_177 = v_u_115.Position
	local v_u_178 = 0
	local v_u_179 = nil
	v_u_115.DragBegin:connect(function(p180)
		-- upvalues: (ref) v_u_65, (ref) v_u_115, (ref) v_u_177, (ref) v_u_117, (ref) v_u_118, (ref) v_u_122, (ref) v_u_120, (ref) v_u_179, (ref) v_u_57, (ref) v_u_54, (ref) v_u_116, (ref) v_u_82
		v_u_65[v_u_115] = true
		v_u_177 = p180
		v_u_115.BorderSizePixel = 2
		v_u_115.ZIndex = 2
		v_u_117.ZIndex = 2
		v_u_118.ZIndex = 2
		v_u_115.Parent.ZIndex = 2
		if v_u_122 then
			v_u_122.ZIndex = 2
		end
		if v_u_120 then
			v_u_120.ZIndex = 2
			for _, v181 in pairs(v_u_120:GetChildren()) do
				v181.ZIndex = 2
			end
		end
		v_u_179 = v_u_115.Parent
		if v_u_179 == v_u_57 then
			local _ = v_u_115.AbsolutePosition
			local v182 = UDim2.new(0, v_u_115.AbsolutePosition.X - v_u_54.AbsolutePosition.X, 0, v_u_115.AbsolutePosition.Y - v_u_54.AbsolutePosition.Y)
			v_u_115.Parent = v_u_54
			v_u_115.Position = v182
			v_u_116 = v_u_82("Frame", "FakeSlot")
			v_u_116.LayoutOrder = v_u_115.LayoutOrder
			v_u_116.Size = v_u_115.Size
			v_u_116.BackgroundTransparency = 1
			v_u_116.Parent = v_u_57
		end
	end)
	v_u_115.DragStopped:connect(function(p183, p184)
		-- upvalues: (ref) v_u_116, (ref) v_u_115, (ref) v_u_177, (ref) v_u_179, (ref) v_u_117, (ref) v_u_118, (ref) v_u_122, (ref) v_u_120, (ref) v_u_65, (copy) v_u_114, (ref) v_u_54, (ref) v_u_76, (ref) v_u_178, (ref) v_u_62, (ref) v_u_52, (ref) v_u_61, (ref) v_u_58, (ref) v_u_59, (ref) v_u_67, (ref) v_u_63, (ref) v_u_71
		if v_u_116 then
			v_u_116:Destroy()
		end
		local v185 = tick()
		v_u_115.Position = v_u_177
		v_u_115.Parent = v_u_179
		v_u_115.BorderSizePixel = 0
		v_u_115.ZIndex = 1
		v_u_117.ZIndex = 1
		v_u_118.ZIndex = 1
		v_u_179.ZIndex = 1
		if v_u_122 then
			v_u_122.ZIndex = 1
		end
		if v_u_120 then
			v_u_120.ZIndex = 1
			for _, v186 in pairs(v_u_120:GetChildren()) do
				v186.ZIndex = 1
			end
		end
		v_u_65[v_u_115] = nil
		if v_u_114.Tool then
			local v187 = v_u_54
			local v188 = v187.AbsolutePosition
			local v189 = v187.AbsoluteSize
			local v190
			if v188.X < p183 and (p183 <= v188.X + v189.X and v188.Y < p184) then
				v190 = p184 <= v188.Y + v189.Y
			else
				v190 = false
			end
			if v190 then
				if v_u_114.Index <= v_u_76 then
					v_u_114:MoveToInventory()
				end
				if v_u_76 < v_u_114.Index and v185 - v_u_178 < 0.5 then
					if v_u_62 then
						local v191 = v_u_114.Tool
						v_u_114:Clear()
						v_u_62:Fill(v191)
						v_u_114:Delete()
						v185 = 0
					else
						v185 = 0
					end
				end
			else
				local v192 = v_u_52
				local v193 = v192.AbsolutePosition
				local v194 = v192.AbsoluteSize
				local v195
				if v193.X < p183 and (p183 <= v193.X + v194.X and v193.Y < p184) then
					v195 = p184 <= v193.Y + v194.Y
				else
					v195 = false
				end
				if v195 then
					local v196 = { (1 / 0), nil }
					for v197 = 1, v_u_76 do
						local v198 = v_u_61[v197]
						local v199 = v198.Frame
						local v200 = Vector2.new(p183, p184)
						local v201 = (v199.AbsolutePosition + v199.AbsoluteSize / 2 - v200).magnitude
						if v201 >= v196[1] then
							continue
						end
						v196 = { v201, v198 }
					end
					local v202 = v196[2]
					if v202 ~= v_u_114 then
						v_u_114:Swap(v202)
						if v_u_76 < v_u_114.Index then
							local v203 = v_u_114.Tool
							if v203 then
								if (not v203 or v203:IsA("HopperBin") and v203.Active or v203.Parent == v_u_58) and v_u_59 then
									v_u_59:UnequipTools()
									if v_u_67 then
										v_u_67:ToggleSelect()
										v_u_63[v_u_67]:UpdateEquipView()
										v_u_67 = nil
									end
								end
								if v_u_71 then
									v_u_114.Frame.Visible = false
									v_u_114.Frame.Parent = v_u_54
								end
							else
								v_u_114:Delete()
							end
						end
					end
				elseif v_u_114.Index <= v_u_76 then
					v_u_114:MoveToInventory()
				end
			end
			v_u_178 = v185
		end
	end)
	v_u_115.Parent = p111
	v_u_61[v113] = v_u_114
	if v_u_76 < v113 then
		v_u_103()
		if v_u_54.Visible and not v_u_71 then
			local v204 = v_u_56.CanvasSize.Y.Offset - v_u_56.AbsoluteSize.Y
			v_u_56.CanvasPosition = Vector2.new(0, (math.max(0, v204)))
		end
	end
	return v_u_114
end
local function v_u_214(p206) -- name: OnChildAdded
	-- upvalues: (ref) v_u_58, (ref) v_u_59, (ref) v_u_75, (ref) v_u_67, (copy) v_u_63, (ref) v_u_68, (ref) v_u_50, (ref) v_u_62, (copy) v_u_205, (ref) v_u_57, (copy) v_u_61, (ref) v_u_60, (copy) v_u_98, (ref) v_u_76, (ref) v_u_54, (copy) v_u_19
	if p206:IsA("Tool") or p206:IsA("HopperBin") then
		if p206.Parent == v_u_58 then
			v_u_75 = tick()
		end
		if v_u_67 and p206.Parent == v_u_58 then
			v_u_67:ToggleSelect()
			v_u_63[v_u_67]:UpdateEquipView()
			v_u_67 = nil
		end
		if not v_u_68 and (p206.Parent == v_u_58 and not v_u_63[p206]) then
			local v207 = v_u_50:FindFirstChild("StarterGear")
			if v207 and v207:FindFirstChild(p206.Name) then
				v_u_68 = true
				for v208 = (v_u_62 or v_u_205(v_u_57)).Index, 1, -1 do
					local v209 = v_u_61[v208]
					local v210 = v208 - 1
					if v210 > 0 then
						v_u_61[v210]:Swap(v209)
					else
						v209:Fill(p206)
					end
				end
				for _, v211 in pairs(v_u_58:GetChildren()) do
					if not v211:IsA("Tool") or v211 == p206 then
						continue
					end
					v211.Parent = v_u_60
				end
				v_u_98()
				return
			end
		end
		local v212 = v_u_63[p206]
		if v212 then
			v212:UpdateEquipView()
		else
			local v213 = v_u_62 or v_u_205(v_u_57)
			v213:Fill(p206)
			if v213.Index <= v_u_76 and not v_u_54.Visible then
				v_u_98()
			end
			if p206:IsA("HopperBin") and p206.Active then
				if v_u_59 then
					v_u_59:UnequipTools()
					if v_u_67 then
						v_u_67:ToggleSelect()
						v_u_63[v_u_67]:UpdateEquipView()
						v_u_67 = nil
					end
				end
				v_u_67 = p206
			end
		end
		v_u_19.BackpackItemAdded:Fire()
	elseif p206:IsA("Humanoid") and p206.Parent == v_u_58 then
		v_u_59 = p206
	end
end
local function v_u_221(p215) -- name: OnChildRemoved
	-- upvalues: (ref) v_u_75, (ref) v_u_58, (ref) v_u_60, (copy) v_u_63, (ref) v_u_76, (ref) v_u_54, (copy) v_u_98, (ref) v_u_67, (copy) v_u_19, (copy) v_u_61
	if p215:IsA("Tool") or p215:IsA("HopperBin") then
		v_u_75 = tick()
		local v216 = p215.Parent
		if v216 ~= v_u_58 and v216 ~= v_u_60 then
			local v217 = v_u_63[p215]
			if v217 then
				v217:Clear()
				if v_u_76 < v217.Index then
					v217:Delete()
				elseif not v_u_54.Visible then
					v_u_98()
				end
			end
			if p215 == v_u_67 then
				v_u_67 = nil
			end
			v_u_19.BackpackItemRemoved:Fire()
			for v218 = v_u_76 + 1, #v_u_61 do
				local v219 = v_u_61[v218]
				if not (v219 and v219.Tool) then
					continue
				end
				v220 = false
			end
			local v220 = true
			if v220 then
				v_u_19.BackpackEmpty:Fire()
			end
		end
	else
		return
	end
end
local function v240(p222) -- name: OnCharacterAdded
	-- upvalues: (copy) v_u_61, (ref) v_u_76, (ref) v_u_67, (ref) v_u_73, (ref) v_u_58, (copy) v_u_221, (copy) v_u_214, (ref) v_u_60, (ref) v_u_50, (copy) v_u_98
	for v223 = #v_u_61, 1, -1 do
		local v224 = v_u_61[v223]
		if v224.Tool then
			v224:Clear()
		end
		if v_u_76 >= v223 then
			continue
		end
		v224:Delete()
	end
	v_u_67 = nil
	for _, v225 in pairs(v_u_73) do
		v225:disconnect()
	end
	v_u_73 = {}
	v_u_58 = p222
	local v226 = v_u_73
	local v227 = p222.ChildRemoved
	local v228 = v_u_221
	table.insert(v226, v227:connect(v228))
	local v229 = v_u_73
	local v230 = p222.ChildAdded
	local v231 = v_u_214
	table.insert(v229, v230:connect(v231))
	for _, v232 in pairs(p222:GetChildren()) do
		v_u_214(v232)
	end
	v_u_60 = v_u_50:WaitForChild("Backpack")
	local v233 = v_u_73
	local v234 = v_u_60.ChildRemoved
	local v235 = v_u_221
	table.insert(v233, v234:connect(v235))
	local v236 = v_u_73
	local v237 = v_u_60.ChildAdded
	local v238 = v_u_214
	table.insert(v236, v237:connect(v238))
	for _, v239 in pairs(v_u_60:GetChildren()) do
		v_u_214(v239)
	end
	v_u_98()
end
local function v245(p241, p242) -- name: OnInputBegan
	-- upvalues: (ref) v_u_70, (ref) v_u_69, (copy) v_u_34, (copy) v_u_64, (ref) v_u_54, (copy) v_u_19
	local v243 = p241.UserInputType == Enum.UserInputType.Keyboard and (not v_u_70 and (v_u_69 or p241.KeyCode.Value == v_u_34)) and v_u_64[p241.KeyCode.Value]
	if v243 then
		v243(p242)
	end
	local v244 = p241.UserInputType
	if not p242 and (v244 == Enum.UserInputType.MouseButton1 or v244 == Enum.UserInputType.Touch) and v_u_54.Visible then
		v_u_19.OpenClose()
	end
end
local function v249(p246) -- name: OnUISChanged
	-- upvalues: (copy) v_u_37, (copy) v_u_41, (ref) v_u_76, (copy) v_u_61
	if p246 == "KeyboardEnabled" or p246 == "VREnabled" then
		local v247 = v_u_37.KeyboardEnabled
		if v247 then
			v247 = not v_u_41.VREnabled
		end
		for v248 = 1, v_u_76 do
			v_u_61[v248]:TurnNumber(v247)
		end
	end
end
local v_u_250 = nil
local v_u_251 = nil
local function v_u_252() end
local _ = Vector2.new(0, 0)
function unbindAllGamepadEquipActions() -- name: unbindAllGamepadEquipActions
	-- upvalues: (copy) v_u_40
	v_u_40:UnbindAction("RBXBackpackHasGamepadFocus")
	v_u_40:UnbindAction("RBXCloseInventory")
end
function changeToolFunc(_, p253, p_u_254)
	-- upvalues: (ref) v_u_250, (ref) v_u_251, (ref) v_u_59, (ref) v_u_67, (copy) v_u_63, (ref) v_u_76, (copy) v_u_61, (ref) v_u_78
	if p253 == Enum.UserInputState.Begin then
		if v_u_250 and (v_u_250.KeyCode == Enum.KeyCode.ButtonR1 and p_u_254.KeyCode == Enum.KeyCode.ButtonL1 or v_u_250.KeyCode == Enum.KeyCode.ButtonL1 and p_u_254.KeyCode == Enum.KeyCode.ButtonR1) and tick() - v_u_251 <= 0.06 then
			if v_u_59 then
				v_u_59:UnequipTools()
				if v_u_67 then
					v_u_67:ToggleSelect()
					v_u_63[v_u_67]:UpdateEquipView()
					v_u_67 = nil
				end
			end
			v_u_250 = p_u_254
			v_u_251 = tick()
		else
			v_u_250 = p_u_254
			v_u_251 = tick()
			delay(0.06, function()
				-- upvalues: (ref) v_u_250, (copy) p_u_254, (ref) v_u_76, (ref) v_u_61, (ref) v_u_59, (ref) v_u_67, (ref) v_u_63, (ref) v_u_78
				if v_u_250 == p_u_254 then
					local v255 = p_u_254.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1
					for v256 = 1, v_u_76 do
						if not v_u_61[v256]:IsEquipped() then
							continue
						end
						local v257 = v255 + v256
						local v258 = false
						if v_u_76 < v257 then
							v257 = 1
							v258 = true
						elseif v257 < 1 then
							v257 = v_u_76
							v258 = true
						end
						local v259 = v257
						while not v_u_61[v257].Tool do
							v257 = v257 + v255
							if v257 == v259 then
								return
							end
							if v_u_76 < v257 then
								v257 = 1
								v258 = true
							else
								if v257 >= 1 then
									continue
								end
								v257 = v_u_76
								v258 = true
							end
						end
						if v258 then
							if v_u_59 then
								v_u_59:UnequipTools()
								if v_u_67 then
									v_u_67:ToggleSelect()
									v_u_63[v_u_67]:UpdateEquipView()
									v_u_67 = nil
								end
							end
							v_u_78 = nil
						else
							v_u_61[v257]:Select()
						end
					end
					if v_u_78 and v_u_78.Tool then
						v_u_78:Select()
					else
						for v260 = v255 == -1 and (v_u_76 or 1) or 1, v255 == -1 and 1 or v_u_76, v255 do
							if not v_u_61[v260].Tool then
								continue
							end
							v_u_61[v260]:Select()
							return
						end
					end
				else
					return
				end
			end)
		end
	else
		return
	end
end
function getGamepadSwapSlot() -- name: getGamepadSwapSlot
	-- upvalues: (copy) v_u_61
	for v261 = 1, #v_u_61 do
		if v_u_61[v261].Frame.BorderSizePixel <= 0 then
			continue
		end
		return v_u_61[v261]
	end
end
function changeSlot(p_u_262) -- name: changeSlot
	-- upvalues: (copy) v_u_42, (copy) v_u_39, (ref) v_u_55, (ref) v_u_76
	local v263 = v_u_42.GamepadCursorEnabled
	if p_u_262.Frame == v_u_39.SelectedCoreObject and not v263 then
		local v264 = getGamepadSwapSlot()
		if not v264 then
			local v_u_265 = p_u_262.Frame.Size
			local v_u_266 = p_u_262.Frame.Position
			p_u_262.Frame:TweenSizeAndPositionInternal(v_u_265 + UDim2.new(0, 10, 0, 10), v_u_266 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
				-- upvalues: (copy) p_u_262, (copy) v_u_265, (copy) v_u_266
				p_u_262.Frame:TweenSizeAndPositionInternal(v_u_265, v_u_266, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p_u_262.Frame.BorderSizePixel = 3
			v_u_55.SelectionImageObject.Visible = true
			return
		end
		v264.Frame.BorderSizePixel = 0
		if v264 ~= p_u_262 then
			p_u_262:Swap(v264)
			v_u_55.SelectionImageObject.Visible = false
			if v_u_76 < p_u_262.Index and not p_u_262.Tool then
				if v_u_39.SelectedCoreObject == p_u_262.Frame then
					v_u_39.SelectedCoreObject = v264.Frame
				end
				p_u_262:Delete()
			end
			if v_u_76 < v264.Index and not v264.Tool then
				if v_u_39.SelectedCoreObject == v264.Frame then
					v_u_39.SelectedCoreObject = p_u_262.Frame
				end
				v264:Delete()
				return
			end
		end
	else
		p_u_262:Select()
		v_u_55.SelectionImageObject.Visible = false
	end
end
function enableGamepadInventoryControl() -- name: enableGamepadInventoryControl
	-- upvalues: (ref) v_u_54, (copy) v_u_19, (copy) v_u_40, (copy) v_u_252, (copy) v_u_39, (ref) v_u_52
	local function v269(_, p267, _)
		-- upvalues: (ref) v_u_54, (ref) v_u_19
		if p267 == Enum.UserInputState.Begin then
			if getGamepadSwapSlot() then
				local v268 = getGamepadSwapSlot()
				if v268 then
					v268.Frame.BorderSizePixel = 0
					return
				end
			elseif v_u_54.Visible then
				v_u_19.OpenClose()
			end
		end
	end
	v_u_40:BindAction("RBXBackpackHasGamepadFocus", v_u_252, false, Enum.UserInputType.Gamepad1)
	v_u_40:BindAction("RBXCloseInventory", v269, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	if true then
		v_u_39.SelectedCoreObject = v_u_52:FindFirstChild("1")
	end
end
function disableGamepadInventoryControl() -- name: disableGamepadInventoryControl
	-- upvalues: (ref) v_u_76, (copy) v_u_61, (copy) v_u_39, (ref) v_u_51
	unbindAllGamepadEquipActions()
	for v270 = 1, v_u_76 do
		local v271 = v_u_61[v270]
		if not (v271 and v271.Frame) then
			continue
		end
		v271.Frame.BorderSizePixel = 0
	end
	if v_u_39.SelectedCoreObject and v_u_39.SelectedCoreObject:IsDescendantOf(v_u_51) then
		v_u_39.SelectedCoreObject = nil
	end
end
function gamepadDisconnected() -- name: gamepadDisconnected
	-- upvalues: (copy) v_u_41, (ref) v_u_74
	if not v_u_41.VREnabled then
		v_u_74 = false
		disableGamepadInventoryControl()
	end
end
function gamepadConnected() -- name: gamepadConnected
	-- upvalues: (copy) v_u_41, (ref) v_u_74, (copy) v_u_17, (copy) v_u_39, (ref) v_u_51, (ref) v_u_66, (ref) v_u_69, (ref) v_u_48, (copy) v_u_40, (ref) v_u_54
	if not v_u_41.VREnabled then
		v_u_74 = true
		if v_u_17 then
			v_u_39:RemoveSelectionGroup("RBXBackpackSelection")
		end
		v_u_39:AddSelectionParent("RBXBackpackSelection", v_u_51)
		if v_u_66 >= 1 and (v_u_69 and not v_u_48) then
			v_u_48 = true
			v_u_40:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if v_u_54.Visible then
			enableGamepadInventoryControl()
		end
	end
end
local function v_u_275(p272, p273) -- name: OnCoreGuiChanged
	-- upvalues: (ref) v_u_47, (ref) v_u_69, (copy) v_u_9, (ref) v_u_51, (copy) v_u_2, (copy) v_u_72, (copy) v_u_39, (ref) v_u_66, (ref) v_u_48, (copy) v_u_40
	if p272 == Enum.CoreGuiType.Backpack or p272 == Enum.CoreGuiType.All then
		if p273 then
			p273 = v_u_47
		end
		v_u_69 = p273
		if v_u_9 then
			if p273 then
				v_u_51.Parent = v_u_2
			else
				v_u_51.Parent = nil
			end
		else
			v_u_51.Visible = p273
		end
		for _, v274 in pairs(v_u_72) do
			if p273 then
				v_u_39:AddKey(v274)
			else
				v_u_39:RemoveKey(v274)
			end
		end
		if p273 then
			if v_u_66 >= 1 and (v_u_69 and not v_u_48) then
				v_u_48 = true
				v_u_40:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				return
			end
		else
			disableGamepadInventoryControl()
			v_u_48 = false
			v_u_40:UnbindAction("RBXHotbarEquip")
		end
	end
end
local function v281(p276, p277) -- name: MakeVRRoundButton
	-- upvalues: (copy) v_u_82
	local v278 = v_u_82("ImageButton", p276)
	v278.Size = UDim2.new(0, 40, 0, 40)
	v278.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local v279 = v_u_82("ImageLabel", "Icon")
	v279.Size = UDim2.new(0.5, 0, 0.5, 0)
	v279.Position = UDim2.new(0.25, 0, 0.25, 0)
	v279.Image = p277
	v279.Parent = v278
	local v280 = v_u_82("ImageLabel", "Selection")
	v280.Size = UDim2.new(0.9, 0, 0.9, 0)
	v280.Position = UDim2.new(0.05, 0, 0.05, 0)
	v280.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	v278.SelectionImageObject = v280
	return v278, v279, v280
end
local v282 = v_u_82("Frame", "Backpack")
if v_u_9 then
	if v_u_38:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
		v282.Parent = v_u_2
	end
else
	v282.Visible = false
	v282.Parent = v_u_2
end
local v283 = v_u_82("Frame", "Hotbar")
v283.Parent = v282
local v284 = v282
local v_u_285 = v283
for v286 = 1, v_u_76 do
	local v287 = v_u_205(v_u_285, v286)
	v287.Frame.Visible = false
	if v_u_62 then
		continue
	end
	local v288 = v287
	v_u_62 = v288
end
local v_u_289 = v_u_82("ImageButton", "OpenInventory")
v_u_289.Size = UDim2.new(0, 30, 0, 30)
v_u_289.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
v_u_289.MouseButton1Click:connect(function()
	-- upvalues: (copy) v_u_19
	v_u_19.OpenClose()
end)
v_u_289.SelectionGained:connect(function()
	-- upvalues: (ref) v_u_289, (copy) v_u_29
	v_u_289.ImageColor3 = v_u_29
end)
v_u_289.SelectionLost:connect(function()
	-- upvalues: (ref) v_u_289
	v_u_289.ImageColor3 = Color3.new(1, 1, 1)
end)
local v290 = v_u_82("Frame", "Selection")
v290.Visible = false
v_u_289.SelectionImageObject = v290
local v291 = v281("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
v291.Position = UDim2.new(0, 0, 0, -50)
v291.MouseButton1Click:connect(function()
	-- upvalues: (ref) v_u_54, (copy) v_u_19
	if v_u_54.Visible then
		v_u_19.OpenClose()
	end
end)
LeftBumperButton = v_u_82("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = v_u_82("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
local v_u_292 = v_u_82("Frame", "Inventory")
v_u_292.BackgroundTransparency = v_u_22
v_u_292.BackgroundColor3 = v_u_23
v_u_292.Active = true
v_u_292.Visible = false
v_u_292.Parent = v284
local v293 = v_u_82("TextButton", "VRInventorySelector")
v293.Position = UDim2.new(0, 0, 0, 0)
v293.Size = UDim2.new(1, 0, 1, 0)
v293.BackgroundTransparency = 1
v293.Text = ""
v293.Parent = v_u_292
local v294 = v_u_82("ImageLabel", "Selector")
v294.Size = UDim2.new(1, 0, 1, 0)
v294.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
v294.ScaleType = Enum.ScaleType.Slice
v294.SliceCenter = Rect.new(12, 12, 52, 52)
v294.Visible = false
v293.SelectionImageObject = v294
local v_u_295 = v_u_82("ScrollingFrame", "ScrollingFrame")
v_u_295.Selectable = false
v_u_295.CanvasSize = UDim2.new(0, 0, 0, 0)
v_u_295.Parent = v_u_292
local v_u_296 = v_u_82("Frame", "UIGridFrame")
v_u_296.Selectable = false
v_u_296.Size = UDim2.new(1, -10, 1, 0)
v_u_296.Position = UDim2.new(0, 5, 0, 0)
v_u_296.Parent = v_u_295
local v297 = Instance.new("UIGridLayout")
v297.SortOrder = Enum.SortOrder.LayoutOrder
v297.CellSize = UDim2.new(0, v_u_20, 0, v_u_20)
v297.CellPadding = UDim2.new(0, 5, 0, 5)
v297.Parent = v_u_296
local v_u_298 = v281("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_298.Size = UDim2.new(0, 34, 0, 34)
v_u_298.Position = UDim2.new(0.5, -v_u_298.Size.X.Offset / 2, 0, 43)
v_u_298.Icon.Position = v_u_298.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_298.MouseButton1Click:connect(function()
	-- upvalues: (ref) v_u_295, (ref) v_u_20
	local v299 = v_u_295
	local v300 = Vector2.new
	local v301 = v_u_295.CanvasPosition.X
	local v302 = v_u_295.CanvasSize.Y.Offset - v_u_295.AbsoluteWindowSize.Y
	local v303 = v_u_295.CanvasPosition.Y - (v_u_20 + 5)
	local v304 = math.max(0, v303)
	v299.CanvasPosition = v300(v301, (math.min(v302, v304)))
end)
local v_u_305 = v281("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_305.Rotation = 180
v_u_305.Icon.Position = v_u_305.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_305.Size = UDim2.new(0, 34, 0, 34)
v_u_305.Position = UDim2.new(0.5, -v_u_305.Size.X.Offset / 2, 1, -v_u_305.Size.Y.Offset - 3)
v_u_305.MouseButton1Click:connect(function()
	-- upvalues: (ref) v_u_295, (ref) v_u_20
	local v306 = v_u_295
	local v307 = Vector2.new
	local v308 = v_u_295.CanvasPosition.X
	local v309 = v_u_295.CanvasSize.Y.Offset - v_u_295.AbsoluteWindowSize.Y
	local v310 = v_u_295.CanvasPosition.Y + (v_u_20 + 5)
	local v311 = math.max(0, v310)
	v306.CanvasPosition = v307(v308, (math.min(v309, v311)))
end)
v_u_295.Changed:connect(function(p312)
	-- upvalues: (ref) v_u_295, (ref) v_u_298, (ref) v_u_305
	if p312 == "AbsoluteWindowSize" or (p312 == "CanvasPosition" or p312 == "CanvasSize") then
		local v313 = v_u_295.CanvasPosition.Y ~= 0
		local v314 = v_u_295.CanvasPosition.Y < v_u_295.CanvasSize.Y.Offset - v_u_295.AbsoluteWindowSize.Y
		v_u_298.Visible = v313
		v_u_305.Visible = v314
	end
end)
v107()
local v_u_315 = v_u_45("Frame")({
	["Name"] = "GamepadHintsFrame",
	["Size"] = nil,
	["BackgroundTransparency"] = 1,
	["Visible"] = false,
	["Parent"] = nil,
	["Size"] = UDim2.new(0, v_u_285.Size.X.Offset, 0, v_u_44 and 95 or 60),
	["Parent"] = v284
})
local function v323(p316, p317, p318) -- name: addGamepadHint
	-- upvalues: (copy) v_u_45, (copy) v_u_315, (copy) v_u_44
	local v319 = v_u_45("Frame")({
		["Name"] = "HintFrame",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 1, -5),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Parent"] = v_u_315
	})
	local v320 = v_u_45("ImageLabel")
	local v321 = {
		["Name"] = "HintImage",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["Parent"] = nil,
		["Size"] = v_u_44 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60)
	}
	if v_u_44 then
		p316 = p317 or p316
	end
	v321.Image = p316
	v321.Parent = v319
	v320(v321)
	local v322 = v_u_45("TextLabel")({
		["Name"] = "HintText",
		["Position"] = nil,
		["Size"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextWrapped"] = true,
		["Parent"] = nil,
		["Position"] = UDim2.new(0, v_u_44 and 100 or 70, 0, 0),
		["Size"] = UDim2.new(1, -(v_u_44 and 100 or 70), 1, 0),
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = v_u_44 and Enum.FontSize.Size36 or Enum.FontSize.Size24,
		["Text"] = p318,
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Parent"] = v319
	})
	Instance.new("UITextSizeConstraint", v322).MaxTextSize = v322.TextSize
end
local function v_u_329() -- name: resizeGamepadHintsFrame
	-- upvalues: (copy) v_u_315, (ref) v_u_285, (copy) v_u_44, (ref) v_u_292
	v_u_315.Size = UDim2.new(v_u_285.Size.X.Scale, v_u_285.Size.X.Offset, 0, v_u_44 and 95 or 60)
	v_u_315.Position = UDim2.new(v_u_285.Position.X.Scale, v_u_285.Position.X.Offset, v_u_292.Position.Y.Scale, v_u_292.Position.Y.Offset - v_u_315.Size.Y.Offset)
	local v324 = v_u_315:GetChildren()
	local v325 = 0
	for v326 = 1, #v324 do
		v324[v326].Size = UDim2.new(1, 0, 1, -5)
		v324[v326].Position = UDim2.new(0, 0, 0, 0)
		v325 = v325 + (v324[v326].HintText.Position.X.Offset + v324[v326].HintText.TextBounds.X)
	end
	local v327 = (v_u_315.AbsoluteSize.X - v325) / (#v324 - 1)
	for v328 = 1, #v324 do
		v324[v328].Position = v328 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, v324[v328 - 1].Position.X.Offset + v324[v328 - 1].Size.X.Offset + v327, 0, 0)
		v324[v328].Size = UDim2.new(0, v324[v328].HintText.Position.X.Offset + v324[v328].HintText.TextBounds.X, 1, -5)
	end
end
v323("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
v323("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
v323("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
local v_u_330 = v_u_82("Frame", "Search")
v_u_330.BackgroundColor3 = v31
v_u_330.BackgroundTransparency = v_u_32
v_u_330.Size = UDim2.new(0, 190, 0, 30)
v_u_330.Position = UDim2.new(1, -v_u_330.Size.X.Offset - 5, 0, 5)
v_u_330.Parent = v_u_292
local v_u_331 = v_u_82("TextBox", "TextBox")
v_u_331.Text = v_u_30
v_u_331.ClearTextOnFocus = false
v_u_331.FontSize = Enum.FontSize.Size24
v_u_331.TextXAlignment = Enum.TextXAlignment.Left
v_u_331.Size = v_u_330.Size - UDim2.new(0, 0, 0, 0)
v_u_331.Position = UDim2.new(0, 0, 0, 0)
v_u_331.Parent = v_u_330
local v_u_332 = v_u_82("TextButton", "X")
v_u_332.Text = "x"
v_u_332.TextColor3 = v_u_25
v_u_332.FontSize = Enum.FontSize.Size24
v_u_332.TextYAlignment = Enum.TextYAlignment.Bottom
v_u_332.BackgroundColor3 = v31
v_u_332.BackgroundTransparency = 0
v_u_332.Size = UDim2.new(0, v_u_330.Size.Y.Offset - 10, 0, v_u_330.Size.Y.Offset - 10)
v_u_332.Position = UDim2.new(1, -v_u_332.Size.X.Offset - 10, 0.5, -v_u_332.Size.Y.Offset / 2)
v_u_332.ZIndex = 0
v_u_332.Visible = false
v_u_332.BorderSizePixel = 0
v_u_332.Parent = v_u_330
local function v_u_344() -- name: search
	-- upvalues: (copy) v_u_331, (ref) v_u_76, (copy) v_u_61, (ref) v_u_292, (ref) v_u_71, (ref) v_u_296, (ref) v_u_295, (copy) v_u_103, (copy) v_u_332
	local v333 = {}
	for v334 in v_u_331.Text:gmatch("%S+") do
		v333[v334:lower()] = true
	end
	local v335 = {}
	for v336 = v_u_76 + 1, #v_u_61 do
		local v337 = v_u_61[v336]
		local v338 = { v337, (v337:CheckTerms(v333)) }
		table.insert(v335, v338)
		v337.Frame.Visible = false
		v337.Frame.Parent = v_u_292
	end
	table.sort(v335, function(p339, p340)
		return p339[2] > p340[2]
	end)
	v_u_71 = true
	local v341 = 0
	for _, v342 in ipairs(v335) do
		local v343 = v342[1]
		if v342[2] <= 0 then
			continue
		end
		v343.Frame.Visible = true
		v343.Frame.Parent = v_u_296
		v343.Frame.LayoutOrder = v_u_76 + v341
		v341 = v341 + 1
	end
	v_u_295.CanvasPosition = Vector2.new(0, 0)
	v_u_103()
	v_u_332.ZIndex = 3
end
local function v_u_347() -- name: clearResults
	-- upvalues: (copy) v_u_332, (ref) v_u_71, (ref) v_u_76, (copy) v_u_61, (ref) v_u_296, (copy) v_u_103
	if v_u_332.ZIndex > 0 then
		v_u_71 = false
		for v345 = v_u_76 + 1, #v_u_61 do
			local v346 = v_u_61[v345]
			v346.Frame.LayoutOrder = v346.Index
			v346.Frame.Parent = v_u_296
			v346.Frame.Visible = true
		end
		v_u_332.ZIndex = 0
	end
	v_u_103()
end
v_u_331.Focused:connect(function() -- name: onFocused
	-- upvalues: (copy) v_u_331, (ref) v_u_30
	if v_u_331.Text == v_u_30 then
		v_u_331.Text = ""
	end
end)
v_u_332.MouseButton1Click:connect(function() -- name: reset
	-- upvalues: (copy) v_u_347, (copy) v_u_331, (ref) v_u_30
	v_u_347()
	v_u_331.Text = v_u_30
end)
v_u_331.Changed:connect(function(p348) -- name: onChanged
	-- upvalues: (copy) v_u_331, (copy) v_u_347, (ref) v_u_30, (copy) v_u_344, (copy) v_u_332
	if p348 == "Text" then
		local v349 = v_u_331.Text
		if v349 == "" then
			v_u_347()
		elseif v349 ~= v_u_30 then
			v_u_344()
		end
		local v350 = v_u_332
		local v351
		if v349 == "" then
			v351 = false
		else
			v351 = v349 ~= v_u_30
		end
		v350.Visible = v351
	end
end)
v_u_331.FocusLost:connect(function(p352) -- name: focusLost
	-- upvalues: (copy) v_u_344, (copy) v_u_331, (ref) v_u_30
	if p352 then
		v_u_344()
	elseif v_u_331.Text == "" then
		v_u_331.Text = v_u_30
	end
end)
v_u_19.StateChanged.Event:connect(function(p353)
	-- upvalues: (copy) v_u_332, (copy) v_u_347, (copy) v_u_331, (ref) v_u_30
	v_u_332.Modal = p353
	if not p353 then
		v_u_347()
		v_u_331.Text = v_u_30
	end
end)
v_u_64[Enum.KeyCode.Escape.Value] = function(p354)
	-- upvalues: (copy) v_u_347, (copy) v_u_331, (ref) v_u_30, (ref) v_u_292, (copy) v_u_19
	if p354 then
		v_u_347()
		v_u_331.Text = v_u_30
	elseif v_u_292.Visible then
		v_u_19.OpenClose()
	end
end
v_u_37.LastInputTypeChanged:connect(function(p355) -- name: detectGamepad
	-- upvalues: (copy) v_u_41, (copy) v_u_330
	if p355 == Enum.UserInputType.Gamepad1 and not v_u_41.VREnabled then
		v_u_330.Visible = false
	else
		v_u_330.Visible = true
	end
end)
local function v_u_358(_, p356, _)
	-- upvalues: (copy) v_u_39, (ref) v_u_76, (copy) v_u_61
	if p356 == Enum.UserInputState.Begin then
		if v_u_39.SelectedCoreObject then
			for v357 = 1, v_u_76 do
				if v_u_61[v357].Frame ~= v_u_39.SelectedCoreObject or not v_u_61[v357].Tool then
					continue
				end
				v_u_61[v357]:MoveToInventory()
				return
			end
		end
	else
		return
	end
end
local function v_u_361() -- name: openClose
	-- upvalues: (copy) v_u_65, (ref) v_u_292, (copy) v_u_98, (ref) v_u_285, (ref) v_u_76, (copy) v_u_61, (ref) v_u_74, (copy) v_u_35, (copy) v_u_37, (copy) v_u_329, (copy) v_u_315, (copy) v_u_40, (copy) v_u_358, (copy) v_u_19
	if not next(v_u_65) then
		v_u_292.Visible = not v_u_292.Visible
		local v359 = v_u_292.Visible
		v_u_98()
		v_u_285.Active = not v_u_285.Active
		for v360 = 1, v_u_76 do
			v_u_61[v360]:SetClickability(not v359)
		end
	end
	if v_u_292.Visible then
		if v_u_74 then
			if v_u_35[v_u_37:GetLastInputType()] then
				v_u_329()
				v_u_315.Visible = true
			end
			enableGamepadInventoryControl()
		end
	else
		if v_u_74 then
			v_u_315.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if v_u_292.Visible then
		v_u_40:BindAction("RBXRemoveSlot", v_u_358, false, Enum.KeyCode.ButtonX)
	else
		v_u_40:UnbindAction("RBXRemoveSlot")
	end
	v_u_19.IsOpen = v_u_292.Visible
	v_u_19.StateChanged:Fire(v_u_292.Visible)
end
v_u_64[v28] = function()
	-- upvalues: (copy) v_u_39, (copy) v_u_361
	if not v_u_39.MenuIsOpen then
		v_u_361()
	end
end
v_u_19.OpenClose = v_u_361
local v_u_362 = v_u_292
while not v_u_50 do
	wait()
	v_u_50 = v36.LocalPlayer
end
v_u_50.CharacterAdded:connect(v240)
if v_u_50.Character then
	v240(v_u_50.Character)
end
for v363 = 0, 9 do
	local v364 = tostring(v363)
	table.insert(v_u_72, v364)
end
table.insert(v_u_72, "`")
v_u_37.InputBegan:connect(v245)
v_u_37.TextBoxFocused:connect(function()
	-- upvalues: (ref) v_u_70
	v_u_70 = true
end)
v_u_37.TextBoxFocusReleased:connect(function()
	-- upvalues: (ref) v_u_70
	v_u_70 = false
end)
v_u_64[v_u_34] = function()
	-- upvalues: (ref) v_u_67, (ref) v_u_59, (copy) v_u_63
	if v_u_67 and v_u_59 then
		v_u_59:UnequipTools()
		if v_u_67 then
			v_u_67:ToggleSelect()
			v_u_63[v_u_67]:UpdateEquipView()
			v_u_67 = nil
		end
	end
end
v_u_37.Changed:connect(v249)
local v365 = v_u_37.KeyboardEnabled
if v365 then
	v365 = not v_u_41.VREnabled
end
for v366 = 1, v_u_76 do
	v_u_61[v366]:TurnNumber(v365)
end
if v_u_37:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
v_u_37.GamepadConnected:connect(function(p367)
	if p367 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
v_u_37.GamepadDisconnected:connect(function(p368)
	if p368 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)
function v_u_19.TopbarEnabledChanged(_, p369) -- name: TopbarEnabledChanged
	-- upvalues: (ref) v_u_47, (copy) v_u_275, (copy) v_u_38
	v_u_47 = p369
	v_u_275(Enum.CoreGuiType.Backpack, v_u_38:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end
if v12 then
	v_u_19.disposeEffect = v5.createEffect(function(p370)
		-- upvalues: (copy) v_u_6, (copy) v_u_19
		local v371 = v_u_6.Stores.GetTopBarStore
		if v371 then
			v_u_19:TopbarEnabledChanged(v371(p370).getTopBarCoreGuiEnabled(p370))
		end
	end)
end
v_u_38.CoreGuiChangedSignal:connect(v_u_275)
local v372 = Enum.CoreGuiType.Backpack
local v373 = Enum.CoreGuiType.Health
v_u_275(v372, v_u_38:GetCoreGuiEnabled(v372))
v_u_275(v373, v_u_38:GetCoreGuiEnabled(v373))
if v_u_16 then
	v7:connect(function(p374)
		-- upvalues: (copy) v_u_19, (copy) v_u_98
		if p374 then
			if v_u_19.IsHotbarVisible then
				v_u_98(true)
				return
			end
		else
			v_u_98(false)
		end
	end)
end
v_u_39.MenuOpened:Connect(function()
	-- upvalues: (copy) v_u_19, (copy) v_u_10, (copy) v_u_11, (copy) v_u_41
	if v_u_19.IsOpen and (not v_u_10 or v_u_11:isMovePanelToCenter() or not v_u_41.VREnabled) then
		v_u_19.OpenClose()
	end
end)
v8.default.visibilitySignal.Event:Connect(function(p375)
	-- upvalues: (copy) v_u_19
	if p375 and v_u_19.IsOpen then
		v_u_19.OpenClose()
	end
end)
v_u_1:GetPropertyChangedSignal("PreferredTransparency"):connect(function() -- name: OnPreferredTransparencyChanged
	-- upvalues: (copy) v_u_1, (ref) v_u_22, (ref) v_u_362, (ref) v_u_26, (copy) v_u_61, (ref) v_u_32, (copy) v_u_330
	local v376 = v_u_1.PreferredTransparency
	v_u_22 = 0.5 * v_u_1.PreferredTransparency
	v_u_362.BackgroundTransparency = v_u_22
	v_u_26 = 0.5 * v376
	for _, v377 in ipairs(v_u_61) do
		v377.Frame.BackgroundTransparency = v_u_26
	end
	v_u_32 = 0.15 * v_u_1.PreferredTransparency
	v_u_330.BackgroundTransparency = v_u_32
end)
return v_u_19