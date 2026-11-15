-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.MovementTooltipEvent
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
require(script.Parent.Parent.EventType)
local v_u_3 = require(v2.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips)
local v_u_5 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local v6 = {
	["Name"] = "MovementTooltipEvent"
}
local v_u_7 = nil
function v6.StartEvent() -- name: StartEvent
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (ref) v_u_7, (copy) v_u_1
	local v8 = v_u_3.createElement
	local v9 = v_u_4
	local v10 = {
		["tooltipButtons"] = {
			{
				["Text"] = "Turn",
				["Controller"] = nil,
				["ButtonKeycode"] = nil,
				["Controller"] = Enum.UserCFrame.RightHand,
				["ButtonKeycode"] = Enum.KeyCode.ButtonR3
			},
			{
				["Text"] = "Move",
				["Controller"] = nil,
				["ButtonKeycode"] = nil,
				["Controller"] = Enum.UserCFrame.LeftHand,
				["ButtonKeycode"] = Enum.KeyCode.ButtonL3
			},
			{
				["Text"] = "Jump",
				["Controller"] = nil,
				["ButtonKeycode"] = nil,
				["Controller"] = Enum.UserCFrame.RightHand,
				["ButtonKeycode"] = Enum.KeyCode.ButtonA
			}
		}
	}
	local v11 = v_u_5({ (v8(v9, v10)) })
	v_u_7 = v_u_3.mount(v11, v_u_1:FindFirstChild("FTUXMenu"), "MovementTooltip")
end
function v6.StopEvent() -- name: StopEvent
	-- upvalues: (ref) v_u_7, (copy) v_u_3
	if v_u_7 then
		v_u_3.unmount(v_u_7)
	end
end
return v6