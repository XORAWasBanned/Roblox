-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceChatBanDurationUseServerTime)
local v_u_5 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local v_u_6 = require(script.Parent.VoiceChatPromptFrame)
local v7 = v_u_2.PureComponent:extend("VoiceChatPrompt")
local v8 = v3.strictInterface
local v9 = {
	["promptSignal"] = v3.optional(v3.RBXScriptSignal),
	["errorText"] = v3.optional(v3.string)
}
local v10 = v3.optional
local v11
if v4 then
	v11 = v3.interface({
		["minutes"] = v3.number,
		["absoluteSeconds"] = v3.number
	})
else
	v11 = v3.string
end
v9.bannedUntil = v10(v11)
v9.onContinueFunc = v3.optional(v3.callback)
v9.onPrimaryActivated = v3.optional(v3.callback)
v9.onSecondaryActivated = v3.optional(v3.callback)
v9.onReadyForSignal = v3.optional(v3.callback)
v9.Analytics = v3.optional(v3.table)
v9.VoiceChatServiceManager = v3.optional(v3.table)
v9.policyMapper = v3.optional(v3.callback)
v9.settingsAppAvailable = v3.optional(v3.boolean)
v7.validateProps = v8(v9)
function v7.render(p12) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	local v13 = v_u_2.createElement
	local v14 = {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 9,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v15 = {
		["PolicyProvider"] = v_u_2.createElement(v_u_5.Provider, {
			["policy"] = { p12.props.policyMapper or v_u_5.Mapper }
		}, {
			["Content"] = v_u_2.createElement(v_u_6, p12.props)
		})
	}
	return v13("ScreenGui", v14, v15)
end
return v7