-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getIconForKeyCode.KeyCodeIconMappings
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v1.Enums.InputPlatform)
local v5 = {
	["ButtonA"] = "PsX",
	["ButtonB"] = "PsCircle",
	["ButtonX"] = "PsSquare",
	["ButtonY"] = "PsTriagle",
	["ButtonL1"] = "PsL1",
	["ButtonL2"] = "PsL2",
	["ButtonL3"] = "PsL3",
	["ButtonR1"] = "PsR1",
	["ButtonR2"] = "PsR2",
	["ButtonR3"] = "PsR3",
	["Thumbstick1"] = "PsStickLeft",
	["Thumbstick2"] = "PsStickRight",
	["DPadDown"] = "PsDpadDown",
	["DPadUp"] = "PsDpadUp",
	["DPadLeft"] = "PsDpadLeft",
	["DPadRight"] = "PsDpadRight",
	["ButtonDown"] = "PsDpadDown",
	["ButtonUp"] = "PsDpadUp",
	["ButtonLeft"] = "PsDpadLeft",
	["ButtonRight"] = "PsDpadRight"
}
local v6 = v_u_4.PS4
local v7 = table.clone(v5)
local v8 = {}
for v9, v10 in {
	["ButtonStart"] = "Ps4Options",
	["ButtonSelect"] = "Ps4Share",
	["ButtonBack"] = "Ps4Share"
} do
	v7[v9] = v10
end
v8[v6] = v7
local v11 = v_u_4.PS5
local v12 = table.clone(v5)
for v13, v14 in {
	["ButtonStart"] = "Ps5Options",
	["ButtonSelect"] = "Ps5Share",
	["ButtonBack"] = "Ps5Share"
} do
	v12[v13] = v14
end
v8[v11] = v12
v8[v_u_4.Xbox] = {
	["ButtonA"] = "XboxA",
	["ButtonB"] = "XboxB",
	["ButtonX"] = "XboxX",
	["ButtonY"] = "XboxY",
	["ButtonL1"] = "XboxLb",
	["ButtonL2"] = "XboxLt",
	["ButtonL3"] = "XboxStickLeft",
	["ButtonR1"] = "XboxRb",
	["ButtonR2"] = "XboxRt",
	["ButtonR3"] = "XboxStickRight",
	["ButtonStart"] = "XboxMenu",
	["ButtonSelect"] = "XboxView",
	["ButtonBack"] = "XboxView",
	["Thumbstick1"] = "XboxStickLeftDirectional",
	["Thumbstick2"] = "XboxStickRightDirectional",
	["DPadDown"] = "XboxDpadDown",
	["DPadUp"] = "XboxDpadUp",
	["DPadLeft"] = "XboxDpadLeft",
	["DPadRight"] = "XboxDpadRight",
	["ButtonDown"] = "XboxDpadDown",
	["ButtonUp"] = "XboxDpadUp",
	["ButtonLeft"] = "XboxDpadLeft",
	["ButtonRight"] = "XboxDpadRight"
}
v8[v_u_4.Default] = {
	["Backspace"] = "KeyBackspace",
	["CapsLock"] = "KeyCapsLock",
	["Escape"] = "SquareTextEsc",
	["Return"] = "KeyReturn",
	["KeypadEnter"] = "KeyReturn",
	["Space"] = "KeySpace",
	["Tab"] = "KeyTab",
	["Down"] = "KeyArrowDown",
	["Left"] = "KeyArrowLeft",
	["Right"] = "KeyArrowRight",
	["Up"] = "KeyArrowUp",
	["LeftAlt"] = "KeyAlt",
	["RightAlt"] = "KeyAlt",
	["LeftControl"] = "KeyControl",
	["RightControl"] = "KeyControl",
	["LeftMeta"] = "KeyCommand",
	["RightMeta"] = "KeyCommand",
	["LeftSuper"] = "KeyCommand",
	["RightSuper"] = "KeyCommand",
	["LeftShift"] = "KeyShift",
	["RightShift"] = "KeyShift",
	["Asterisk"] = "KeyAsterisk",
	["KeypadMultiply"] = "KeyAsterisk",
	["Backquote"] = "KeyGraveAccent",
	["Caret"] = "KeyCaret",
	["Comma"] = "KeyComma",
	["Period"] = "KeyPeriod",
	["KeypadPeriod"] = "KeyPeriod",
	["Quote"] = "KeyApostrophe",
	["MouseLeftButton"] = "MouseButtonLeft",
	["MouseMiddleButton"] = "MouseButtonCenter",
	["MouseRightButton"] = "MouseButtonRight",
	["MouseWheel"] = "MouseScrollwheel"
}
local v_u_15 = {}
for v16, v17 in v8 do
	local v18 = {}
	for v19, v20 in v17 do
		local v21 = v3.Icon[v20]
		if typeof(v21) ~= "string" or v21 == "" then
			v21 = nil
		end
		if not v21 then
			continue
		end
		v18[v19] = v21
	end
	v_u_15[v16] = v18
end
return {
	["getIconForKeyName"] = function(p22, p23) -- name: getIconForKeyName
		-- upvalues: (copy) v_u_15, (copy) v_u_4
		local v24 = v_u_15[p23][p22]
		if v24 then
			return v24
		end
		local v25 = v_u_15
		local v26
		if p23 == v_u_4.Default then
			v26 = v_u_4.Xbox
		else
			v26 = v_u_4.Default
		end
		return v25[v26][p22]
	end,
	["iconKeysByPlatform"] = v8
}