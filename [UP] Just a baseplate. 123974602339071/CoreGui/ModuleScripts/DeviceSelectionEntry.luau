-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.DeviceSelectionEntry
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("SoundService")
local v4 = v1:WaitForChild("RobloxGui")
local v5 = require(v2.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.t
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Components.DropDownSelection)
local v_u_10 = require(v8.Components.ThemedTextLabel)
local v_u_11 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_12 = require(v2.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_13 = v_u_6.PureComponent:extend("DeviceSelectionEntry")
local v14 = v8.Flags
local v_u_15 = require(v14.GetFFlagTruncateDeviceSelection)
local v_u_16 = require(v4.Modules.Flags.GetFFlagVoiceChatUILogging)
v_u_13.DeviceType = {
	["Input"] = "Input",
	["Output"] = "Output"
}
v_u_13.validateProps = v7.strictInterface({
	["LayoutOrder"] = v7.integer,
	["deviceType"] = v7.string,
	["isMenuOpen"] = v7.boolean,
	["canOpen"] = v7.optional(v7.boolean),
	["canCaptureFocus"] = v7.optional(v7.boolean)
})
v_u_13.defaultProps = {
	["canOpen"] = true
}
function v_u_13.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_16, (copy) v_u_12
	p_u_17:setState({
		["deviceNames"] = nil,
		["deviceGuids"] = nil,
		["selectedIndex"] = 0,
		["ready"] = false,
		["deviceNames"] = {},
		["deviceGuids"] = {}
	})
	v_u_11:asyncInit():andThen(function()
		-- upvalues: (copy) p_u_17, (ref) v_u_11, (ref) v_u_3
		p_u_17:setState({
			["ready"] = true
		})
		v_u_11:SetupParticipantListeners()
		if v_u_3.DeviceListChanged then
			v_u_3.DeviceListChanged:Connect(function()
				-- upvalues: (ref) p_u_17
				if p_u_17.props.isMenuOpen then
					p_u_17:pollDevices(p_u_17.props.deviceType)
				end
			end)
		end
	end):catch(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_12
		if v_u_16() then
			v_u_12:warning("Failed to init VoiceChatServiceManager")
		end
	end)
end
function v_u_13.render(p_u_18) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_13, (copy) v_u_9, (copy) v_u_15, (copy) v_u_11
	if not p_u_18.state.ready or (p_u_18.state.deviceNames == nil or #p_u_18.state.deviceNames == 0) then
		return nil
	end
	local v19 = v_u_6.createElement
	local v20 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.new(1, 0, 0, 120),
		["LayoutOrder"] = p_u_18.props.LayoutOrder
	}
	local v22 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24)
		}),
		["InputLabel"] = v_u_6.createElement(v_u_10, {
			["fontKey"] = "Body",
			["themeKey"] = "TextDefault",
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 56),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0),
			["Text"] = p_u_18.props.deviceType == v_u_13.DeviceType.Input and "Input Device" or "Output Device",
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}),
		["Dropdown"] = v_u_6.createElement(v_u_9, {
			["Size"] = nil,
			["Position"] = nil,
			["truncate"] = nil,
			["selections"] = nil,
			["selectedIndex"] = nil,
			["placeHolderText"] = "",
			["enabled"] = true,
			["localize"] = false,
			["selectionParentName"] = nil,
			["canOpen"] = nil,
			["canCaptureFocus"] = nil,
			["selectionChanged"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 44),
			["Position"] = UDim2.new(0, 0, 0, 56),
			["truncate"] = v_u_15(),
			["selections"] = p_u_18.state.deviceNames,
			["selectedIndex"] = p_u_18.state.selectedIndex,
			["selectionParentName"] = p_u_18.props.deviceType .. "DeviceSelectionEntryDropdown",
			["canOpen"] = p_u_18.props.canOpen,
			["canCaptureFocus"] = p_u_18.props.canCaptureFocus,
			["selectionChanged"] = function(p21) -- name: selectionChanged
				-- upvalues: (ref) v_u_11, (copy) p_u_18
				v_u_11:SwitchDevice(p_u_18.props.deviceType, p_u_18.state.deviceNames[p21], p_u_18.state.deviceGuids[p21])
				p_u_18:setState({
					["selectedIndex"] = p21
				})
			end
		})
	}
	return v19("Frame", v20, v22)
end
function v_u_13.pollDevices(p_u_23, p_u_24) -- name: pollDevices
	-- upvalues: (copy) v_u_11, (copy) v_u_16, (copy) v_u_12
	spawn(function()
		-- upvalues: (ref) v_u_11, (copy) p_u_24, (copy) p_u_23, (ref) v_u_16, (ref) v_u_12
		local v25, v26, v27, v28 = v_u_11:GetDevices(p_u_24)
		if v25 then
			p_u_23:setState({
				["deviceNames"] = v26,
				["deviceGuids"] = v27,
				["selectedIndex"] = v28
			})
		else
			if v_u_16() then
				v_u_12:warning("Errors in get {} Device info", p_u_24)
			end
			p_u_23:setState({
				["deviceNames"] = nil,
				["deviceGuids"] = nil,
				["selectedIndex"] = 0,
				["deviceNames"] = {},
				["deviceGuids"] = {}
			})
		end
	end)
end
function v_u_13.willUpdate(p29, p30) -- name: willUpdate
	if not p29.props.isMenuOpen and p30.isMenuOpen then
		p29:pollDevices(p30.deviceType)
	end
end
return v_u_13