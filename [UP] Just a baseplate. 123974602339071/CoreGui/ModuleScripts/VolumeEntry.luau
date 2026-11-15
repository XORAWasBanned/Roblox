-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.VolumeEntry
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v_u_6 = UserSettings():GetService("UserGameSettings")
local v_u_7 = v_u_6:GetPropertyChangedSignal("MasterVolume")
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v1.RobloxGui.Modules.Flags.FFlagRenameVolumeToMainVolume)
local v_u_10 = require(v8.Utility.ExternalEventConnection)
local v_u_11 = require(script.Parent.SliderEntry)
local v_u_12 = require(v8.Utility.SendAnalytics)
local v_u_13 = require(v8.Resources.Constants)
if v1.RobloxGui:FindFirstChild("Sounds") == nil then
	local v14 = Instance.new("Folder")
	v14.Name = "Sounds"
	v14.Parent = v1.RobloxGui
end
local v_u_15 = Instance.new("Sound", v1.RobloxGui.Sounds)
v_u_15.Name = "VolumeChangeSound"
v_u_15.Volume = 1
v_u_15.SoundId = "rbxasset://sounds/uuhhh.mp3"
local v16 = v_u_4.PureComponent:extend("VolumeEntry")
v16.validateProps = v5.strictInterface({
	["LayoutOrder"] = v5.integer,
	["canCaptureFocus"] = v5.optional(v5.boolean),
	["isMenuOpen"] = v5.optional(v5.boolean),
	["buttonRef"] = v5.optional(v5.table)
})
function v16.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_6
	function p_u_17.onVolumeChanged()
		-- upvalues: (copy) p_u_17, (ref) v_u_6
		local v18 = p_u_17
		local v19 = {}
		local v20 = v_u_6.MasterVolume * 10 + 0.5
		v19.volume = math.floor(v20)
		v18:setState(v19)
	end
	p_u_17.onVolumeChanged()
end
function v16.render(p21) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_9, (copy) v_u_6, (copy) v_u_15, (copy) v_u_12, (copy) v_u_13, (copy) v_u_10, (copy) v_u_7
	local v22 = v_u_4.createFragment
	local v24 = {
		["VolumeSlider"] = v_u_4.createElement(v_u_11, {
			["labelKey"] = nil,
			["LayoutOrder"] = nil,
			["min"] = 0,
			["max"] = 10,
			["stepInterval"] = 1,
			["value"] = nil,
			["valueChanged"] = nil,
			["canCaptureFocus"] = nil,
			["isMenuOpen"] = nil,
			["buttonRef"] = nil,
			["labelKey"] = v_u_9 and "CoreScripts.InGameMenu.GameSettings.MainVolume" or "CoreScripts.InGameMenu.GameSettings.Volume",
			["LayoutOrder"] = p21.props.LayoutOrder,
			["value"] = p21.state.volume,
			["valueChanged"] = function(p23) -- name: valueChanged
				-- upvalues: (ref) v_u_6, (ref) v_u_15, (ref) v_u_12, (ref) v_u_13
				v_u_6.MasterVolume = p23 / 10
				v_u_15:Play()
				v_u_12(v_u_13.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			["canCaptureFocus"] = p21.props.canCaptureFocus,
			["isMenuOpen"] = p21.props.isMenuOpen,
			["buttonRef"] = p21.props.buttonRef
		}),
		["VolumeListener"] = v_u_4.createElement(v_u_10, {
			["event"] = v_u_7,
			["callback"] = p21.onVolumeChanged
		})
	}
	return v22(v24)
end
return v16