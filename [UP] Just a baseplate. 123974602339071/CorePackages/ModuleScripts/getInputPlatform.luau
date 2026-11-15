-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons.builderIconPlatformUtils.getInputPlatform
local v_u_1 = require(script.Parent.Parent.Services).UserInputService
local v_u_2 = require(script.Parent.Platform)
local v_u_3 = {
	["ps4"] = v_u_2.PS4,
	["ps5"] = v_u_2.PS5,
	["xbox"] = v_u_2.Xbox
}
return function() -- name: getInputPlatform
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	local v4 = v_u_1:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	for v5, v6 in v_u_3 do
		if not v4:find(v5) then
			continue
		end
		return v6
	end
	if v_u_1:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then
		return v_u_2.PS5
	else
		return v_u_2.Xbox
	end
end