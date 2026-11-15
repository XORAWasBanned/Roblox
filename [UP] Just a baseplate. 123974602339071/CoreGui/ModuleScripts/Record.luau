-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.Record
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = v_u_2:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("TextService")
local v_u_7 = game:GetService("VRService")
v_u_4:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v8 = require(v3.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums
local v_u_9 = require(v3.Workspace.Packages.CapturesInExperience).Analytics.EventNames
local v_u_10 = require(v_u_4.Modules.Settings.Utility)
local v_u_11 = require(v_u_4.Modules.Settings.Theme)
local v_u_12 = require(v3.Workspace.Packages.AppCommonLib).Create
local v_u_13 = require(v3.Packages.BuilderIcons)
local v_u_14 = v_u_13.Migration.uiblox
local v_u_15 = v8.Contexts
local v_u_16 = v8.EventTypes
local v_u_55 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_13, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_6, (copy) v_u_10, (copy) v_u_1, (copy) v_u_15, (copy) v_u_16, (copy) v_u_9, (copy) v_u_2
	local v_u_17 = require(v_u_4.Modules.Settings.SettingsPageFactory):CreateNewPage()
	local v_u_18 = false
	local v_u_19 = Instance.new("BindableEvent")
	v_u_19.Name = "RecordingEvent"
	v_u_17.RecordingChanged = v_u_19.Event
	function v_u_17.IsRecording(_) -- name: IsRecording
		-- upvalues: (ref) v_u_18
		return v_u_18
	end
	local v20 = v_u_14["icons/controls/screenrecord"]
	v_u_17.TabHeader.TabLabel.Icon.Text = v20.name
	v_u_17.TabHeader.TabLabel.Icon.FontFace = v_u_13.Font[v20.variant]
	v_u_17.TabHeader.Name = "RecordTab"
	v_u_17.TabHeader.TabLabel.Title.Text = "Record"
	local function v21() -- name: onVREnabled
		-- upvalues: (copy) v_u_17, (ref) v_u_7
		v_u_17.TabHeader.Visible = not v_u_7.VREnabled
	end
	v_u_17.TabHeader.Visible = not v_u_7.VREnabled
	v_u_7:GetPropertyChangedSignal("VREnabled"):connect(v21)
	v_u_17.Page.Name = "Record"
	local function v_u_38(p22, p_u_23, p24, p_u_25, p26) -- name: makeTextLabel
		-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_6
		local v27 = v_u_11.textSize(24)
		local v28 = v_u_11.font(Enum.Font.SourceSans)
		local v_u_29, v_u_30, v_u_31
		if p24 then
			v27 = v_u_11.textSize(36)
			v28 = v_u_11.font(Enum.Font.SourceSansBold, "Bold")
			v_u_29 = 0
			v_u_30 = 0
			v_u_31 = 10
		else
			v_u_29 = 0
			v_u_30 = 10
			v_u_31 = 10
		end
		local v_u_32 = v_u_12("Frame")({
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Name"] = p22 .. "Container",
			["LayoutOrder"] = p26,
			["Parent"] = p_u_25
		})
		local v_u_33 = v_u_12("TextLabel")({
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextWrapped"] = true,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Name"] = p22,
			["Text"] = p_u_23,
			["Font"] = v28,
			["TextSize"] = v27,
			["TextColor3"] = Color3.new(1, 1, 1),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Position"] = UDim2.new(0, v_u_31, 0, 0),
			["Size"] = UDim2.new(1, -(v_u_31 + v_u_29), 1, 0),
			["Parent"] = v_u_32
		})
		local function v36(p34) -- name: onResized
			-- upvalues: (ref) v_u_6, (copy) p_u_23, (copy) v_u_33, (copy) p_u_25, (ref) v_u_31, (ref) v_u_29, (copy) v_u_32, (ref) v_u_30
			if p34 == "AbsoluteSize" then
				local v35 = v_u_6:GetTextSize(p_u_23, v_u_33.TextSize, v_u_33.Font, Vector2.new(p_u_25.AbsoluteSize.X - v_u_31 - v_u_29, 10000))
				v_u_32.Size = UDim2.new(1, 0, 0, v35.Y + v_u_30)
			end
		end
		local v37 = v_u_6:GetTextSize(p_u_23, v_u_33.TextSize, v_u_33.Font, Vector2.new(p_u_25.AbsoluteSize.X - v_u_31 - v_u_29, 10000))
		v_u_32.Size = UDim2.new(1, 0, 0, v37.Y + v_u_30)
		p_u_25.Changed:connect(v36)
		return v_u_33, v_u_32
	end
	function v_u_17.SetHub(_, p39) -- name: SetHub
		-- upvalues: (copy) v_u_17, (copy) v_u_38, (ref) v_u_10, (ref) v_u_1, (ref) v_u_15, (ref) v_u_16, (ref) v_u_18, (ref) v_u_9, (copy) v_u_19, (ref) v_u_2
		v_u_17.HubRef = p39
		local function v40()
			-- upvalues: (ref) v_u_17
			v_u_17.HubRef:SetVisibility(false, true)
		end
		v_u_38("ScreenshotTitle", "Screenshot", true, v_u_17.Page, 1)
		v_u_38("ScreenshotBody", "By clicking the \'Take Screenshot\' button, the menu will close and take a screenshot and save it to your computer.", false, v_u_17.Page, 2)
		local v41 = v_u_17
		local v42 = v_u_17
		local v43, v44 = v_u_10:AddButtonRow(v_u_17, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), v40)
		v41.ScreenshotButtonRow = v43
		v42.ScreenshotButton = v44
		v_u_17.ScreenshotButtonRow.LayoutOrder = 3
		v_u_38("VideoTitle", "Video", true, v_u_17.Page, 4)
		v_u_38("VideoBody", "By clicking the \'Record Video\' button, the menu will close and start recording your screen.", false, v_u_17.Page, 5)
		local v45, v_u_46 = v_u_10:AddButtonRow(v_u_17, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), v40)
		v45.LayoutOrder = 6
		v_u_46.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_16, (ref) v_u_18, (ref) v_u_9, (ref) v_u_19
			local v47 = v_u_1
			local v48 = "mobile"
			local v49 = v_u_15.Captures
			local v50 = v_u_16.ButtonClick
			local v51 = {}
			local v52
			if v_u_18 then
				v52 = v_u_9.CapturesLegacyVideoRecordDeactivated
			else
				v52 = v_u_9.CapturesLegacyVideoRecordActivated
			end
			v51.btn = v52
			v47:SendEventDeferred(v48, v49, v50, v51)
			v_u_19:Fire(not v_u_18)
		end)
		local v53 = settings():FindFirstChild("Game Options")
		if v53 then
			v53.VideoRecordingChangeRequest:connect(function(p54)
				-- upvalues: (ref) v_u_18, (copy) v_u_46
				v_u_18 = p54
				if p54 then
					v_u_46.RecordButtonTextLabel.Text = "Stop Recording"
				else
					v_u_46.RecordButtonTextLabel.Text = "Record Video"
				end
			end)
		end
		v_u_46.Activated:Connect(function()
			-- upvalues: (ref) v_u_2
			v_u_2:ToggleRecording()
		end)
		v_u_17.ScreenshotButton.Activated:Connect(function()
			-- upvalues: (ref) v_u_2
			v_u_2:TakeScreenshot()
		end)
		v_u_17.Page.Size = UDim2.new(1, 0, 0, 400)
	end
	return v_u_17
end)()
v_u_55.Displayed.Event:connect(function(p56)
	-- upvalues: (copy) v_u_5, (ref) v_u_55
	if p56 then
		v_u_5.SelectedCoreObject = v_u_55.ScreenshotButton
	end
end)
return v_u_55