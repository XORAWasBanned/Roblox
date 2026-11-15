-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Analytics
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("Stats")
local v_u_3 = {}
v_u_3.__index = v_u_3
v_u_3.EventName = {
	["MenuOpened"] = "emoteMenuOpened",
	["EmotePlayed"] = "emoteTriggered",
	["EmoteFailed"] = "emoteTriggerFailed"
}
function v_u_3.new() -- name: new
	-- upvalues: (copy) v_u_3
	local v4 = {
		["eventStreamImpl"] = nil
	}
	local v5 = v_u_3
	setmetatable(v4, v5)
	return v4
end
function v_u_3.withEventStream(p6, p7) -- name: withEventStream
	p6.eventStreamImpl = p7
	return p6
end
function v_u_3.onMenuOpened(p8) -- name: onMenuOpened
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v9 = p8.EventName.MenuOpened
	local v10 = {}
	local v11 = game.PlaceId
	v10.pid = tostring(v11)
	local v12 = v_u_1.LocalPlayer.UserId
	v10.uid = tostring(v12)
	v10.btid = v_u_2:GetBrowserTrackerId()
	p8:_getEventStream():setRBXEventStream("emoteMenu", v9, v10)
end
function v_u_3.onEmotePlayed(p13, p14, p15) -- name: onEmotePlayed
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v16 = p13.EventName.EmotePlayed
	local v17 = {}
	local v18 = game.PlaceId
	v17.pid = tostring(v18)
	local v19 = v_u_1.LocalPlayer.UserId
	v17.uid = tostring(v19)
	v17.btid = v_u_2:GetBrowserTrackerId()
	v17.slotNumber = p14
	v17.assetID = p15
	p13:_getEventStream():setRBXEventStream("emoteMenu", v16, v17)
end
function v_u_3.onEmoteFailed(p20, p21, p22, p23) -- name: onEmoteFailed
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v24 = p20.EventName.EmoteFailed
	local v25 = {
		["pid"] = nil,
		["uid"] = nil,
		["btid"] = nil,
		["slotNumber"] = nil,
		["assetID"] = nil,
		["errorType"] = nil,
		["invokedByCoreGui"] = true
	}
	local v26 = game.PlaceId
	v25.pid = tostring(v26)
	local v27 = v_u_1.LocalPlayer.UserId
	v25.uid = tostring(v27)
	v25.btid = v_u_2:GetBrowserTrackerId()
	v25.slotNumber = p21
	v25.assetID = p22
	v25.errorType = p23
	p20:_getEventStream():setRBXEventStream("emoteMenu", v24, v25)
end
function v_u_3._getEventStream(p28) -- name: _getEventStream
	local v29 = p28.eventStreamImpl
	assert(v29, "EventStream implementation not found. Did you forget to construct withEventStream?")
	return p28.eventStreamImpl
end
return v_u_3