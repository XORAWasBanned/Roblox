-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Input.getInputMode
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Utility.Input.InputMode)
local v_u_3 = {
	[Enum.UserInputType.MouseButton1] = v2.Pointer,
	[Enum.UserInputType.MouseButton2] = v2.Pointer,
	[Enum.UserInputType.MouseButton3] = v2.Pointer,
	[Enum.UserInputType.MouseMovement] = v2.Pointer,
	[Enum.UserInputType.MouseWheel] = v2.Pointer,
	[Enum.UserInputType.None] = v2.Pointer,
	[Enum.UserInputType.TextInput] = v2.Pointer,
	[Enum.UserInputType.Gamepad1] = v2.Directional,
	[Enum.UserInputType.Gamepad2] = v2.Directional,
	[Enum.UserInputType.Gamepad3] = v2.Directional,
	[Enum.UserInputType.Gamepad4] = v2.Directional,
	[Enum.UserInputType.Gamepad5] = v2.Directional,
	[Enum.UserInputType.Gamepad6] = v2.Directional,
	[Enum.UserInputType.Gamepad7] = v2.Directional,
	[Enum.UserInputType.Gamepad8] = v2.Directional,
	[Enum.UserInputType.Keyboard] = v2.Directional,
	[Enum.UserInputType.Touch] = v2.Touch
}
return function(p4) -- name: getInputMode
	-- upvalues: (copy) v_u_3
	return v_u_3[p4]
end