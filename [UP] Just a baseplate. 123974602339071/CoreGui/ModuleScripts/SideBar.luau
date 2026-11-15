-- Path: CoreGui.RobloxGui.Modules.Shell.SideBar
local v1 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v1:FindFirstChild("GlobalSettings"))
local v_u_6 = require(v1:FindFirstChild("Utility"))
local v_u_7 = require(v1:FindFirstChild("ScreenManager"))
local v_u_8 = require(v1:FindFirstChild("SoundManager"))
local v_u_9 = require(v1:FindFirstChild("Analytics"))
local v_u_10 = require(v4.Workspace.Packages.AppCommonLib).Create
return function()
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_2
	local v_u_11 = {}
	local v_u_12 = {}
	local v_u_13 = nil
	local v_u_14 = false
	local v_u_15 = v_u_10("Frame")({
		["Name"] = "ModalOverlay",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = 4,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundColor3"] = v_u_5.ModalBackgroundColor
	})
	local v_u_16 = v_u_10("Frame")({
		["Name"] = "SideBarContainer",
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["ZIndex"] = 5,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.3, 0, 1, 0),
		["Position"] = UDim2.new(1, 0, 0, 0),
		["BackgroundColor3"] = v_u_5.OverlayColor,
		["Parent"] = v_u_15
	})
	local v_u_17 = v_u_10("TextButton")({
		["Name"] = "DummySelectionImage",
		["Size"] = UDim2.new(0, 0, 0, 0),
		["Visible"] = false,
		v_u_8:CreateSound("MoveSelection")
	})
	local v_u_18 = v_u_10("TextLabel")({
		["Name"] = "Text",
		["Size"] = nil,
		["Position"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = 6,
		["Text"] = "",
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["TextColor3"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextWrapped"] = true,
		["Size"] = UDim2.new(1, -165, 1, -156),
		["Position"] = UDim2.new(0, 65, 0, 156),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextYAlignment"] = Enum.TextYAlignment.Top,
		["TextColor3"] = v_u_5.WhiteTextColor,
		["Font"] = v_u_5.RegularFont,
		["FontSize"] = v_u_5.DescriptionSize
	})
	local function v_u_20() -- name: recalcPositions
		-- upvalues: (copy) v_u_12
		for v19 = 1, #v_u_12 do
			v_u_12[v19].Position = UDim2.new(0, 0, 0, (v19 - 1) * 75 + 156)
		end
	end
	local v_u_21 = Instance.new("BindableEvent")
	v_u_21.Name = "ClosedEvent"
	v_u_11.Closed = v_u_21.Event
	function v_u_11.GetAnalyticsInfo(_) -- name: GetAnalyticsInfo
		-- upvalues: (ref) v_u_9
		return {
			[v_u_9.WidgetNames("WidgetId")] = v_u_9.WidgetNames("SideBarId")
		}
	end
	function v_u_11.AddItem(_, p22, p_u_23) -- name: AddItem
		-- upvalues: (ref) v_u_10, (ref) v_u_5, (copy) v_u_17, (copy) v_u_16, (ref) v_u_8, (ref) v_u_7, (copy) v_u_11, (copy) v_u_21, (copy) v_u_12, (copy) v_u_20
		local v_u_24 = v_u_10("TextButton")({
			["Name"] = "SortButton",
			["Size"] = UDim2.new(1, 0, 0, 75),
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = v_u_5.BlueButtonColor,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 6,
			["Text"] = "",
			["SelectionImageObject"] = v_u_17,
			["Parent"] = v_u_16,
			v_u_8:CreateSound("MoveSelection")
		})
		local v_u_25 = v_u_10("TextLabel")({
			["Name"] = "SortName",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["ZIndex"] = 7,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, -65, 1, 0),
			["Position"] = UDim2.new(0, 65, 0, 0),
			["Text"] = p22,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextColor3"] = v_u_5.WhiteTextColor,
			["Font"] = v_u_5.RegularFont,
			["FontSize"] = v_u_5.MediumFontSize,
			["Parent"] = v_u_24
		})
		v_u_24.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_7, (ref) v_u_11, (ref) v_u_21, (copy) p_u_23
			v_u_8:Play("ButtonPress")
			v_u_7:CloseCurrent(v_u_11)
			v_u_21:Fire()
			p_u_23()
		end)
		v_u_24.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_24, (copy) v_u_25, (ref) v_u_5
			v_u_24.BackgroundTransparency = 0
			v_u_25.TextColor3 = v_u_5.TextSelectedColor
		end)
		v_u_24.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_24, (copy) v_u_25, (ref) v_u_5
			v_u_24.BackgroundTransparency = 1
			v_u_25.TextColor3 = v_u_5.WhiteTextColor
		end)
		v_u_12[#v_u_12 + 1] = v_u_24
		v_u_20()
	end
	function v_u_11.SetText(_, p26) -- name: SetText
		-- upvalues: (copy) v_u_18, (copy) v_u_16
		v_u_18.Text = p26
		v_u_18.Parent = v_u_16
	end
	function v_u_11.ResetText(_) -- name: ResetText
		-- upvalues: (copy) v_u_18
		v_u_18.Text = ""
		v_u_18.Parent = nil
	end
	function v_u_11.RemoveAllItems(_) -- name: RemoveAllItems
		-- upvalues: (copy) v_u_11, (copy) v_u_12
		v_u_11:ResetText()
		for v27, v28 in pairs(v_u_12) do
			v28:Destroy()
			v_u_12[v27] = nil
		end
	end
	function v_u_11.SetSelectedObject(_, p29, p30) -- name: SetSelectedObject
		-- upvalues: (copy) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_3
		if #v_u_12 > 0 then
			v_u_13 = p29 and v_u_12[p29] or v_u_12[1]
			if p30 == true and (v_u_13 and v_u_14) then
				v_u_3.SelectedCoreObject = v_u_13
				return
			end
		else
			v_u_13 = nil
		end
	end
	function v_u_11.GetPriority(_) -- name: GetPriority
		-- upvalues: (ref) v_u_5
		return v_u_5.OverlayPriority
	end
	function v_u_11.Show(p31) -- name: Show
		-- upvalues: (copy) v_u_15, (ref) v_u_7, (ref) v_u_6, (ref) v_u_5, (copy) v_u_16, (ref) v_u_8
		v_u_15.Parent = v_u_7:GetScreenGuiByPriority(p31:GetPriority())
		v_u_6.PropertyTweener(v_u_15, "BackgroundTransparency", 1, v_u_5.ModalBackgroundTransparency, 0.25, v_u_6.EaseInOutQuad, true, nil)
		v_u_16:TweenPositionInternal(UDim2.new(1 - v_u_16.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil)
		v_u_8:Play("SideMenuSlideIn")
	end
	function v_u_11.Hide(_) -- name: Hide
		-- upvalues: (ref) v_u_6, (copy) v_u_15, (copy) v_u_16
		v_u_6.PropertyTweener(v_u_15, "BackgroundTransparency", 0.3, 1, 0.25, v_u_6.EaseInOutQuad, true, function()
			-- upvalues: (ref) v_u_15
			v_u_15.Parent = nil
		end)
		v_u_16:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true)
	end
	function v_u_11.IsFocused(_) -- name: IsFocused
		-- upvalues: (ref) v_u_14
		return v_u_14
	end
	function v_u_11.Focus(p32) -- name: Focus
		-- upvalues: (ref) v_u_14, (ref) v_u_3, (copy) v_u_16, (ref) v_u_13, (ref) v_u_6, (ref) v_u_2, (ref) v_u_7, (copy) v_u_11, (copy) v_u_21
		v_u_14 = true
		v_u_3:AddSelectionParent("SideBar", v_u_16)
		if v_u_13 then
			v_u_6.SetSelectedCoreObject(v_u_13)
		else
			p32:SetSelectedObject(1)
			v_u_6.SetSelectedCoreObject(v_u_13)
		end
		v_u_2:BindCoreAction("CloseSideBar", function(_, p33, _)
			-- upvalues: (ref) v_u_7, (ref) v_u_11, (ref) v_u_21
			if p33 == Enum.UserInputState.End then
				v_u_7:CloseCurrent(v_u_11)
				v_u_21:Fire()
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	function v_u_11.RemoveFocus(_) -- name: RemoveFocus
		-- upvalues: (ref) v_u_14, (ref) v_u_3, (ref) v_u_2, (ref) v_u_13
		v_u_14 = false
		v_u_3:RemoveSelectionGroup("SideBar")
		v_u_2:UnbindCoreAction("CloseSideBar")
		v_u_13 = nil
	end
	return v_u_11
end