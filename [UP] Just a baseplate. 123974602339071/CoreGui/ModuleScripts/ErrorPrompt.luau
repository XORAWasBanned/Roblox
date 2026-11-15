-- Path: CoreGui.RobloxGui.Modules.ErrorPrompt
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v1:WaitForChild("RobloxGui")
local v_u_6 = game:GetService("TextService")
local v_u_7 = game:GetService("GuiService")
local v8 = game:GetService("LocalizationService")
local v_u_9 = game:GetService("VRService")
local v_u_10 = game:GetService("UserInputService")
local v_u_11 = game:GetService("RunService")
local v_u_12 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_13 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_14 = require(v2.Workspace.Packages.CoreScriptsCommon).Constants
local v_u_15 = require(v_u_5.Modules.Shimmer)
local v_u_16 = require(v_u_5.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)
local v_u_17 = require(v2.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local v18 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_19 = settings():GetFFlag("LocalizeErrorCodeString")
local v_u_20 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0)
local v_u_21 = v18.new(v8.RobloxLocaleId)
local v_u_22 = {
	["Default"] = function()
		-- upvalues: (copy) v_u_12, (copy) v_u_14
		return v_u_12("Frame")({
			["Name"] = "ErrorPrompt",
			["BackgroundTransparency"] = 0,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = v_u_14.COLORS.FLINT,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0, v_u_14.ERROR_PROMPT_MAX_WIDTH.Default, 0, v_u_14.ERROR_PROMPT_HEIGHT.Default),
			["Visible"] = false,
			["AutoLocalize"] = false,
			["ZIndex"] = 8,
			v_u_12("UIListLayout")({
				["Name"] = "PromptLayout",
				["SortOrder"] = nil,
				["HorizontalAlignment"] = nil,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			}),
			v_u_12("UIScale")({
				["Name"] = "PromptScale",
				["Scale"] = 0
			}),
			v_u_12("Frame")({
				["Name"] = "TitleFrame",
				["LayoutOrder"] = 1,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v_u_14.ERROR_TITLE_FRAME_HEIGHT.Default),
				["BorderSizePixel"] = 0,
				["ZIndex"] = 8,
				v_u_12("UIPadding")({
					["Name"] = "TitleFramePadding",
					["PaddingBottom"] = nil,
					["PaddingTop"] = nil,
					["PaddingBottom"] = UDim.new(0, 11),
					["PaddingTop"] = UDim.new(0, 11)
				}),
				v_u_12("TextLabel")({
					["Name"] = "ErrorTitle",
					["TextColor3"] = nil,
					["TextSize"] = 25,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Font"] = nil,
					["TextXAlignment"] = nil,
					["TextYAlignment"] = nil,
					["ZIndex"] = 8,
					["TextColor3"] = v_u_14.COLORS.WHITE,
					["Size"] = UDim2.new(1, 0, 0, 28),
					["Font"] = Enum.Font.SourceSansSemibold,
					["TextXAlignment"] = Enum.TextXAlignment.Center,
					["TextYAlignment"] = Enum.TextYAlignment.Center
				})
			}),
			v_u_12("Frame")({
				["Name"] = "SplitLine",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 8,
				["Size"] = UDim2.new(1, -2 * v_u_14.SIDE_PADDING, 0, v_u_14.SPLIT_LINE_THICKNESS),
				["BackgroundColor3"] = v_u_14.COLORS.PUMICE
			}),
			v_u_12("Frame")({
				["Name"] = "MessageArea",
				["LayoutOrder"] = 3,
				["Size"] = UDim2.new(1, 0, 1, -v_u_14.ERROR_TITLE_FRAME_HEIGHT.Default - v_u_14.SPLIT_LINE_THICKNESS),
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 8,
				v_u_12("UIPadding")({
					["Name"] = "MessageAreaPadding",
					["PaddingBottom"] = nil,
					["PaddingLeft"] = nil,
					["PaddingRight"] = nil,
					["PaddingTop"] = nil,
					["PaddingBottom"] = UDim.new(0, v_u_14.SIDE_PADDING),
					["PaddingLeft"] = UDim.new(0, v_u_14.SIDE_PADDING),
					["PaddingRight"] = UDim.new(0, v_u_14.SIDE_PADDING),
					["PaddingTop"] = UDim.new(0, v_u_14.SIDE_PADDING)
				}),
				v_u_12("Frame")({
					["Name"] = "ErrorFrame",
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["ZIndex"] = 8,
					v_u_12("UIListLayout")({
						["Name"] = "ErrorFrameLayout",
						["Padding"] = nil,
						["HorizontalAlignment"] = nil,
						["SortOrder"] = nil,
						["Padding"] = UDim.new(0, v_u_14.LAYOUT_PADDING),
						["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
						["SortOrder"] = Enum.SortOrder.LayoutOrder
					}),
					v_u_12("TextLabel")({
						["Name"] = "ErrorMessage",
						["LayoutOrder"] = 1,
						["Size"] = nil,
						["TextSize"] = 20,
						["TextColor3"] = nil,
						["ZIndex"] = 8,
						["BackgroundTransparency"] = 1,
						["TextWrapped"] = true,
						["Font"] = nil,
						["Size"] = UDim2.new(1, 0, 1, -v_u_14.BUTTON_HEIGHT - v_u_14.LAYOUT_PADDING),
						["TextColor3"] = v_u_14.COLORS.PUMICE,
						["Font"] = Enum.Font.SourceSans
					}),
					v_u_12("Frame")({
						["Name"] = "ButtonArea",
						["BackgroundTransparency"] = 1,
						["Size"] = UDim2.new(1, 0, 0, v_u_14.BUTTON_HEIGHT),
						["ZIndex"] = 8,
						["LayoutOrder"] = 2,
						["SelectionGroup"] = true,
						["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
						["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop,
						["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
						["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
						v_u_12("UIGridLayout")({
							["Name"] = "ButtonLayout",
							["CellPadding"] = nil,
							["CellSize"] = nil,
							["HorizontalAlignment"] = nil,
							["VerticalAlignment"] = nil,
							["SortOrder"] = nil,
							["CellPadding"] = UDim2.new(0, v_u_14.BUTTON_CELL_PADDING, 0, 0),
							["CellSize"] = UDim2.new(1, 0, 0, v_u_14.BUTTON_HEIGHT),
							["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
							["VerticalAlignment"] = Enum.VerticalAlignment.Center,
							["SortOrder"] = Enum.SortOrder.LayoutOrder
						})
					})
				})
			})
		})
	end
}
local v_u_26 = {
	["Default"] = function(p23, p24, p25)
		-- upvalues: (copy) v_u_12, (copy) v_u_14
		return v_u_12("ImageButton")({
			["Name"] = p23 .. "Button",
			["BackgroundTransparency"] = 1,
			["ImageColor3"] = p25 and v_u_14.COLORS.WHITE or v_u_14.COLORS.PUMICE,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Image"] = p25 and v_u_14.PRIMARY_BUTTON_TEXTURE or v_u_14.SECONDARY_BUTTON_TEXTURE,
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(8, 8, 9, 9),
			["LayoutOrder"] = p24,
			["ZIndex"] = 8,
			v_u_12("TextLabel")({
				["Name"] = "ButtonText",
				["Text"] = nil,
				["Size"] = nil,
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Font"] = nil,
				["TextSize"] = 20,
				["ZIndex"] = 8,
				["Text"] = p23,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["TextColor3"] = p25 and v_u_14.COLORS.SLATE or v_u_14.COLORS.PUMICE,
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Font"] = Enum.Font.SourceSans
			})
		})
	end
}
local v_u_27 = {}
v_u_27.__index = v_u_27
function v_u_27.new(p28, p29) -- name: new
	-- upvalues: (copy) v_u_27, (copy) v_u_22, (copy) v_u_4, (copy) v_u_20, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7
	local v30 = v_u_27
	local v_u_31 = setmetatable({}, v30)
	v_u_31._frame = p28 and v_u_22[p28]() or v_u_22.Default()
	v_u_31._isOpen = false
	v_u_31._openAnimation = v_u_4:Create(v_u_31._frame.PromptScale, v_u_20, {
		["Scale"] = 1
	})
	v_u_31._closeAnimation = v_u_4:Create(v_u_31._frame.PromptScale, v_u_20, {
		["Scale"] = 0
	})
	v_u_31._buttonCount = 0
	v_u_31._playAnimation = true
	v_u_31._hideErrorCode = false
	v_u_31._menuIsOpenKey = "ErrorPrompt"
	if p29 then
		if p29.PlayAnimation ~= nil then
			v_u_31._playAnimation = p29.PlayAnimation
		end
		if p29.HideErrorCode ~= nil then
			v_u_31._hideErrorCode = p29.HideErrorCode
		end
		if p29.MenuIsOpenKey ~= nil then
			v_u_31._menuIsOpenKey = p29.MenuIsOpenKey
		end
		v_u_31._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = p29.MessageTextScaled or false
	end
	if not v_u_9.VREnabled and v_u_10.GamepadEnabled then
		v_u_7:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: (copy) v_u_31, (ref) v_u_7
			if v_u_31._isOpen and v_u_7.SelectedCoreObject == nil then
				v_u_7:Select(v_u_31._frame.MessageArea.ErrorFrame.ButtonArea)
			end
		end)
	end
	return v_u_31
end
local function v_u_32(_, _, _) -- name: sinkInput
	return Enum.ContextActionResult.Sink
end
function v_u_27._open(p33, p34, p35, p36) -- name: _open
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_17, (copy) v_u_3, (copy) v_u_32
	p33:setErrorText(p34, p35, p36)
	p33:_resizeHeight(v_u_5.AbsoluteSize.Y)
	if not p33._isOpen then
		v_u_13.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		v_u_7:SetMenuIsOpen(true, p33._menuIsOpenKey)
		p33._frame.Visible = true
		p33._isOpen = true
		if p33._playAnimation then
			p33._openAnimation:Play()
			p33._openAnimation.Completed:wait()
			p33._frame.PromptScale.Scale = 1
		else
			p33._frame.PromptScale.Scale = 1
		end
	end
	if p33._isOpen and (v_u_9.VREnabled or (v_u_10.PreferredInput == Enum.PreferredInput.Gamepad or v_u_17 and v_u_10.PreferredInput == Enum.PreferredInput.MicroGamepad)) then
		v_u_7:Select(p33._frame.MessageArea.ErrorFrame.ButtonArea)
	end
	v_u_3:BindCoreAction("ErrorPromptAction", v_u_32, false, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonStart)
end
function v_u_27._close(p37) -- name: _close
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_3
	if p37._isOpen then
		v_u_13.pop("ErrorPromptOverride")
		v_u_7:SetMenuIsOpen(false, p37._menuIsOpenKey)
		p37._isOpen = false
		if p37._playAnimation then
			p37._closeAnimation:Play()
			p37._closeAnimation.Completed:wait()
		else
			p37._frame.PromptScale.Scale = 0
		end
		p37._frame.Visible = false
		v_u_3:UnbindCoreAction("ErrorPromptAction")
	end
end
function v_u_27.setParent(p38, p39) -- name: setParent
	p38._frame.Parent = p39
end
function v_u_27.setErrorText(p40, p41, p42, p43) -- name: setErrorText
	-- upvalues: (copy) v_u_11, (copy) v_u_19, (copy) v_u_21, (copy) v_u_16
	local v44 = p40._frame.MessageArea.ErrorFrame.ErrorMessage
	local v45 = v_u_11:GetRobloxClientChannel()
	if p40._hideErrorCode then
		v44.Text = p41
		return
	elseif v_u_19 then
		local v46 = not p42 and -1 or p42.Value
		local v47 = ("Error Code: %d"):format(v46)
		local v_u_48 = {
			["ERROR_CODE"] = tostring(v46)
		}
		local v_u_49 = "InGame.ConnectionError.Message.ErrorCode"
		local function v50()
			-- upvalues: (ref) v_u_21, (copy) v_u_49, (copy) v_u_48
			return v_u_21:Format(v_u_49, v_u_48)
		end
		local v51, v52 = pcall(v50)
		if v51 then
			v47 = v52 or v47
		end
		local v53
		if v_u_16() and (p43 and v45) then
			v53 = ("%s\n(%s, %s)"):format(p41, v47, v_u_21:Format("InGame.ConnectionError.Message.ChannelName", {
				["CHANNEL_NAME"] = v45
			}) or ("Channel: %s"):format(v45))
		else
			v53 = nil
		end
		v44.Text = v53 or ("%s\n(%s)"):format(p41, v47)
		return
	elseif p42 then
		v44.Text = ("%s\n(Error Code: %d)"):format(p41, p42.Value)
	else
		v44.Text = ("%s\n(Error Code: -1)"):format(p41)
	end
end
function v_u_27.setErrorTitle(p54, p55, p_u_56) -- name: setErrorTitle
	-- upvalues: (copy) v_u_21
	if p55 then
		local v57 = p54._frame.TitleFrame.ErrorTitle
		if p_u_56 then
			local v_u_58 = nil
			local function v59()
				-- upvalues: (ref) v_u_21, (copy) p_u_56, (copy) v_u_58
				return v_u_21:Format(p_u_56, v_u_58)
			end
			local v60, v61 = pcall(v59)
			if v60 then
				p55 = v61 or p55
			end
			v57.Text = p55
		else
			v57.Text = p55
		end
	else
		return
	end
end
function v_u_27.onErrorChanged(p62, p63, p64, p65) -- name: onErrorChanged
	if p63 == "" then
		p62:_close()
	elseif p63 ~= "" then
		p62:_open(p63, p64, p65)
	end
end
function v_u_27._relayout(p66) -- name: _relayout
	-- upvalues: (copy) v_u_14
	local v67 = p66._frame.MessageArea.ErrorFrame.ButtonArea
	if p66._buttonCount == 0 then
		v67.Visible = false
	else
		local v68 = (p66._frame.Size.X.Offset - (p66._buttonCount - 1) * v_u_14.BUTTON_CELL_PADDING - 2 * v_u_14.SIDE_PADDING) / p66._buttonCount
		v67.Visible = true
		v67.ButtonLayout.CellSize = UDim2.new(0, v68, 0, v_u_14.BUTTON_HEIGHT)
	end
end
function v_u_27.clearButtons(p69) -- name: clearButtons
	local v70 = p69._frame.MessageArea.ErrorFrame.ButtonArea
	if p69._primaryShimmer then
		p69._primaryShimmer = nil
	end
	local v71 = v70:GetChildren()
	for _, v72 in pairs(v71) do
		if v72.name == "ButtonLayout" then
			continue
		end
		v72:Destroy()
	end
end
function v_u_27.updateButtons(p73, p74, p75) -- name: updateButtons
	-- upvalues: (copy) v_u_21, (copy) v_u_26, (copy) v_u_15
	p73:clearButtons()
	local v76 = p73._frame.MessageArea.ErrorFrame.ButtonArea
	local v77 = p75 or "Default"
	local v78 = 0
	for _, v79 in pairs(p74 or {}) do
		local v80 = v79.Text
		if v79.LocalizationKey then
			local v_u_81 = v79.LocalizationKey
			v80 = v79.Text
			local v_u_82 = nil
			local function v83()
				-- upvalues: (ref) v_u_21, (copy) v_u_81, (copy) v_u_82
				return v_u_21:Format(v_u_81, v_u_82)
			end
			local v84, v85 = pcall(v83)
			if v84 then
				v80 = v85 or v80
			end
		end
		local v86 = v_u_26[v77](v80, v79.LayoutOrder, v79.Primary)
		if v79.Primary then
			p73._primaryShimmer = v_u_15.new(v86, "PrimaryButton")
		end
		v86.Parent = v76
		v86.Activated:connect(v79.Callback)
		v78 = v78 + 1
	end
	if p73._buttonCount ~= v78 then
		p73._buttonCount = v78
		p73:_relayout()
	end
end
function v_u_27.primaryShimmerPlay(p87) -- name: primaryShimmerPlay
	if p87._primaryShimmer then
		p87._primaryShimmer:play()
	end
end
function v_u_27.primaryShimmerStop(p88) -- name: primaryShimmerStop
	if p88._primaryShimmer then
		p88._primaryShimmer:stop()
	end
end
function v_u_27.resizeWidthAndHeight(p89, p90, p91) -- name: resizeWidthAndHeight
	p89:_resizeWidth(p90)
	p89:_resizeHeight(p91)
	p89:_relayout()
end
function v_u_27._resizeWidth(p92, p93) -- name: _resizeWidth
	-- upvalues: (copy) v_u_14
	local v94 = p92._frame.Size.X.Offset
	local v95 = p93 - 2 * v_u_14.SIDE_MARGIN
	if v_u_14.ERROR_PROMPT_MAX_WIDTH.Default < v95 then
		if v94 == v_u_14.ERROR_PROMPT_MAX_WIDTH.Default then
			return
		end
		v95 = v_u_14.ERROR_PROMPT_MAX_WIDTH.Default
	end
	if v95 < v_u_14.ERROR_PROMPT_MIN_WIDTH.Default then
		if v94 == v_u_14.ERROR_PROMPT_MIN_WIDTH.Default then
			return
		end
		v95 = v_u_14.ERROR_PROMPT_MIN_WIDTH.Default
	end
	p92._frame.Size = UDim2.new(0, v95, 0, p92._frame.Size.Y.Offset)
end
function v_u_27._resizeHeight(p96, p97) -- name: _resizeHeight
	-- upvalues: (copy) v_u_14, (copy) v_u_6
	local v98 = p96._frame.MessageArea.ErrorFrame.ErrorMessage
	local v99 = Vector2.new(p96._frame.Size.X.Offset - 2 * v_u_14.SIDE_PADDING, 1000)
	local v100 = v_u_6:GetTextSize(v98.Text, v98.TextSize, v98.Font, v99)
	local v101 = v_u_14.ERROR_TITLE_FRAME_HEIGHT.Default + v100.Y + v_u_14.SPLIT_LINE_THICKNESS + v_u_14.BUTTON_HEIGHT + v_u_14.LAYOUT_PADDING + 2 * v_u_14.SIDE_PADDING + 1
	local v102 = p97 - 2 * v_u_14.VERTICAL_MARGIN
	local v103 = math.min(v101, v102)
	local v104 = v_u_14.ERROR_PROMPT_MIN_HEIGHT.Default
	local v105 = math.max(v103, v104)
	p96._frame.Size = UDim2.new(0, p96._frame.Size.X.Offset, 0, v105)
end
return v_u_27