-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons.builderIconPlatformUtils.KeycodeMappings
local v1 = require(script.Parent.Platform)
local v2 = require(script.Parent.Parent.Icon)
local v3 = {
	["ButtonA"] = v2.PsX,
	["ButtonB"] = v2.PsCircle,
	["ButtonX"] = v2.PsSquare,
	["ButtonY"] = v2.PsTriagle,
	["ButtonL1"] = v2.PsL1,
	["ButtonL2"] = v2.PsL2,
	["ButtonL3"] = v2.PsL3,
	["ButtonR1"] = v2.PsR1,
	["ButtonR2"] = v2.PsR2,
	["ButtonR3"] = v2.PsR3,
	["Thumbstick1"] = v2.PsStickLeft,
	["Thumbstick2"] = v2.PsStickRight,
	["DPadDown"] = v2.PsDpadDown,
	["DPadUp"] = v2.PsDpadUp,
	["DPadLeft"] = v2.PsDpadLeft,
	["DPadRight"] = v2.PsDpadRight
}
local v4 = v1.PS4
local v5 = {}
for v6, v7 in {
	["ButtonStart"] = v2.Ps4Options,
	["ButtonSelect"] = v2.Ps4Share
} do
	v3[v6] = v7
end
v5[v4] = v3
local v8 = v1.PS5
for v9, v10 in {
	["ButtonStart"] = v2.Ps5Options,
	["ButtonSelect"] = v2.Ps5Share
} do
	v3[v9] = v10
end
v5[v8] = v3
v5[v1.Xbox] = {
	["ButtonA"] = v2.XboxA,
	["ButtonB"] = v2.XboxB,
	["ButtonX"] = v2.XboxX,
	["ButtonY"] = v2.XboxY,
	["ButtonL1"] = v2.XboxLb,
	["ButtonL2"] = v2.XboxLt,
	["ButtonL3"] = v2.XboxStickLeft,
	["ButtonR1"] = v2.XboxRb,
	["ButtonR2"] = v2.XboxRt,
	["ButtonR3"] = v2.XboxStickRight,
	["ButtonStart"] = v2.XboxMenu,
	["ButtonSelect"] = v2.XboxView,
	["Thumbstick1"] = v2.XboxStickLeftDirectional,
	["Thumbstick2"] = v2.XboxStickRightDirectional,
	["DPadDown"] = v2.XboxDpadDown,
	["DPadUp"] = v2.XboxDpadUp,
	["DPadLeft"] = v2.XboxDpadLeft,
	["DPadRight"] = v2.XboxDpadRight
}
v5[v1.Default] = {
	["LeftAlt"] = v2.KeyAlt,
	["RightAlt"] = v2.KeyAlt,
	["Down"] = v2.KeyArrowDown,
	["Up"] = v2.KeyArrowUp,
	["Left"] = v2.KeyArrowLeft,
	["Right"] = v2.KeyArrowRight,
	["Asterisk"] = v2.KeyAsterisk,
	["Backspace"] = v2.KeyBackspace,
	["CapsLock"] = v2.KeyCapsLock,
	["Caret"] = v2.KeyCaret,
	["Comma"] = v2.KeyComma,
	["LeftControl"] = v2.KeyControl,
	["RightControl"] = v2.KeyControl,
	["Backquote"] = v2.KeyGraveAccent,
	["Period"] = v2.KeyPeriod,
	["Return"] = v2.KeyReturn,
	["LeftShift"] = v2.KeyShift,
	["RightShift"] = v2.KeyShift,
	["Space"] = v2.KeySpace,
	["Tab"] = v2.KeyTab,
	["Thumbstick1Down"] = v2.GenericStickLDown,
	["Thumbstick1Left"] = v2.GenericStickLLeft,
	["Thumbstick1Right"] = v2.GenericStickLRight,
	["Thumbstick1Up"] = v2.GenericStickLUp,
	["Thumbstick2Down"] = v2.GenericStickRDown,
	["Thumbstick2Left"] = v2.GenericStickRLeft,
	["Thumbstick2Right"] = v2.GenericStickRRight,
	["Thumbstick2Up"] = v2.GenericStickRUp
}
return v5