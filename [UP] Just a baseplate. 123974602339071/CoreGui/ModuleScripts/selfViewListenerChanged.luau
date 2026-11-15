-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.selfViewListenerChanged
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
return {
	["selfViewVisibilityUpdatedSignal"] = require(v1.Modules.SelfView.selfViewVisibilityUpdatedSignal),
	["getSelfViewVisibility"] = require(v1.Modules.SelfView.publicApi).getSelfViewIsOpenAndVisible
}