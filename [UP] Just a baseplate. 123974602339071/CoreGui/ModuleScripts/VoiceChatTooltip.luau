-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatTooltip
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
require(v2.Workspace.Packages.SharedFlags)
local v4 = v_u_1:WaitForChild("RobloxGui")
local v_u_5 = require(v2.Packages.React)
local v_u_6 = require(v2.Packages.Roact)
local v7 = require(v2.Packages.UIBlox)
local v_u_8 = require(v4.Modules.Settings.Utility)
local v_u_9 = v7.App.Dialog.TooltipV2.withTooltip
local v_u_10 = v7.App.Dialog.Enum.TooltipOrientation
local v_u_11 = v7.App.Text.StyledTextLabel
local v_u_12 = v7.Core.Style.useStyle
local v_u_13 = require(v4.Modules.Flags.FIntVoiceChatTooltipDelay)
local v_u_14 = require(v4.Modules.TopBar.Constants)
local v_u_15 = v_u_14.TopBarHeight
return function(p_u_16) -- name: VoiceChatTooltip
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_3, (copy) v_u_13, (copy) v_u_8, (copy) v_u_15, (copy) v_u_14, (copy) v_u_6, (copy) v_u_11, (copy) v_u_1, (copy) v_u_10, (copy) v_u_9
	local v_u_17 = v_u_12()
	local v_u_18 = v_u_5.useRef(nil)
	local v_u_19 = p_u_16.onClose
	v_u_5.useEffect(function()
		-- upvalues: (copy) p_u_16, (copy) v_u_18, (ref) v_u_3, (copy) v_u_19, (ref) v_u_13
		if p_u_16.showPrompt then
			v_u_18.current = v_u_3.MenuOpened:Connect(function()
				-- upvalues: (ref) v_u_18, (ref) v_u_19
				if v_u_18.current then
					v_u_18.current:Disconnect()
					v_u_18.current = nil
					v_u_19()
				end
			end)
			task.delay(v_u_13, function()
				-- upvalues: (ref) v_u_18, (ref) p_u_16, (ref) v_u_19
				if v_u_18.current then
					v_u_18.current:Disconnect()
					v_u_18.current = nil
				end
				if p_u_16.showPrompt then
					v_u_19()
				end
			end)
		end
		return function()
			-- upvalues: (ref) v_u_18
			if v_u_18.current then
				v_u_18.current:Disconnect()
				v_u_18.current = nil
			end
		end
	end, { p_u_16.showPrompt })
	v_u_8:IsSmallTouchScreen()
	local v_u_20 = 64
	local v_u_21 = v_u_14.useDisplayScaleState(v_u_15)
	return v_u_9({
		["headerText"] = nil,
		["minContentWidth"] = 240,
		["renderCustomComponents"] = nil,
		["onClose"] = nil,
		["backgroundColor"] = nil,
		["backgroundTransparency"] = nil,
		["headerText"] = p_u_16.titleText,
		["renderCustomComponents"] = function(_) -- name: renderCustomComponents
			-- upvalues: (ref) v_u_6, (ref) v_u_11, (copy) p_u_16, (copy) v_u_17
			return v_u_6.createElement(v_u_11, {
				["text"] = nil,
				["textTruncate"] = nil,
				["textXAlignment"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 0,
				["automaticSize"] = nil,
				["text"] = p_u_16.subtitleText,
				["textTruncate"] = Enum.TextTruncate.None,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["fontStyle"] = v_u_17.Font.CaptionSmall,
				["colorStyle"] = v_u_17.Theme.TextDefault,
				["automaticSize"] = Enum.AutomaticSize.XY
			})
		end,
		["onClose"] = v_u_19,
		["backgroundColor"] = v_u_17.Theme.BackgroundUIDefault.Color,
		["backgroundTransparency"] = v_u_17.Theme.BackgroundUIDefault.Transparency
	}, {
		["guiTarget"] = nil,
		["active"] = nil,
		["DisplayOrder"] = 10,
		["preferredOrientation"] = nil,
		["guiTarget"] = v_u_1,
		["active"] = p_u_16.showPrompt,
		["preferredOrientation"] = v_u_10.Bottom
	}, function(p22)
		-- upvalues: (ref) v_u_6, (copy) v_u_20, (ref) v_u_21, (ref) v_u_5
		return v_u_6.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0, v_u_20, 0, v_u_21),
			[v_u_5.Change.AbsoluteSize] = p22,
			[v_u_5.Change.AbsolutePosition] = p22
		})
	end)
end