-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.BubbleChatBillboards
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
game:GetService("Players")
local v3 = v1:WaitForChild("RobloxGui")
local v_u_4 = require(v2.Packages.Roact)
local v5 = require(v2.Packages.RoactRodux)
local v6 = require(v2.Packages.t)
local v_u_7 = require(v2.Packages.Cryo)
local v_u_8 = require(script.Parent.Parent.Constants)
local v_u_9 = require(script.Parent.Parent.Logger)(script.Name)
local v_u_10 = require(script.Parent.BubbleChatBillboard)
local v_u_11 = require(v3.Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting)
local v12 = v_u_4.Component:extend("ChatBillboards")
v12.validateProps = v6.strictInterface({
	["userMessages"] = v6.map(v6.string, v6.array(v6.string)),
	["bubbleChatEnabled"] = v6.boolean,
	["voiceEnabled"] = v6.boolean,
	["participants"] = v6.map(v6.string, v6.string)
})
function v12.getDerivedStateFromProps(p13, p14) -- name: getDerivedStateFromProps
	-- upvalues: (copy) v_u_7
	return {
		["userMessages"] = v_u_7.Dictionary.join(p14.userMessages or {}, p13.userMessages)
	}
end
function v12.init(p_u_15) -- name: init
	-- upvalues: (copy) v_u_9, (copy) v_u_7
	v_u_9:debug("Initializing")
	p_u_15:setState({
		["userMessages"] = {}
	})
	function p_u_15.onBillboardFadeOut(p16)
		-- upvalues: (copy) p_u_15, (ref) v_u_7
		local v17 = p_u_15
		local v18 = {
			["userMessages"] = v_u_7.Dictionary.join(p_u_15.state.userMessages, {
				[p16] = v_u_7.None
			})
		}
		v17:setState(v18)
	end
end
function v12.render(p19) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_4, (copy) v_u_10
	if p19.props.voiceEnabled or p19.props.bubbleChatEnabled then
		local v20 = {}
		for v21, _ in pairs(p19.state.userMessages) do
			v20[v21] = false
		end
		for v22, v23 in pairs(p19.props.participants) do
			if v23 == v_u_8.VOICE_STATE.HIDDEN then
				continue
			end
			v20[v22] = true
		end
		local v24 = {}
		for v25, v26 in pairs(v20) do
			local v27 = v_u_9
			local v28 = tostring(v25)
			v27:trace("Rendering billboard for ...{}", (string.sub(v28, -4)))
			v24["BubbleChat_" .. v25] = v_u_4.createElement(v_u_10, {
				["userId"] = v25,
				["onFadeOut"] = p19.onBillboardFadeOut,
				["voiceEnabled"] = p19.props.voiceEnabled and v26,
				["bubbleChatEnabled"] = p19.props.bubbleChatEnabled
			})
		end
		return v_u_4.createElement("ScreenGui", {
			["ResetOnSpawn"] = false
		}, v24)
	end
end
return v5.connect(function(p29) -- name: mapStateToProps
	-- upvalues: (copy) v_u_11
	local v30 = p29.components.voiceEnabled
	if v_u_11() then
		v30 = p29.components.voiceEnabled
		if v30 then
			v30 = p29.chatSettings.Voice.ShowIndicator
		end
	end
	return {
		["userMessages"] = p29.userMessages,
		["voiceEnabled"] = v30,
		["bubbleChatEnabled"] = p29.components.bubbleChatEnabled,
		["participants"] = p29.voiceState
	}
end)(v12)