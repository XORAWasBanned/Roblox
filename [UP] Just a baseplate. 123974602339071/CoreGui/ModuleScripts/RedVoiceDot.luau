-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.RedVoiceDot
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.React)
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("Players")
local v6 = script.Parent.Parent.ChromeShared
local v7 = require(v6.Utility.GetStyleTokens)
local v_u_8 = require(v4.Modules.VoiceChat.Hooks.useVoiceState)
local v_u_9 = require(v4.Modules.VoiceChat.Constants)
local v10 = v7()
local v_u_11 = Color3.new(0.918, 0.2, 0.137)
local v_u_12 = UDim2.new(0, v10.Size.Size_100, 0, v10.Size.Size_100)
return function(p13)
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_9, (copy) v_u_3, (copy) v_u_12, (copy) v_u_11
	local v14 = v_u_8(v_u_5.LocalPlayer and v_u_5.LocalPlayer.UserId or 0)
	local v15 = v14 == v_u_9.VOICE_STATE.INACTIVE and true or v14 == v_u_9.VOICE_STATE.TALKING
	return v_u_3.createElement("Frame", {
		["Name"] = "RedVoiceDot",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["Visible"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = p13.position,
		["Size"] = v_u_12,
		["BackgroundColor3"] = v_u_11,
		["Visible"] = v15
	}, {
		["UICorner"] = v_u_3.createElement("UICorner", {
			["CornerRadius"] = UDim.new(1, 0)
		})
	})
end