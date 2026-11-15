-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons.builderIconPlatformUtils.getBuilderIconForCurrentPlatform
local v1 = require(script.Parent.Platform)
local v_u_2 = require(script.Parent.getInputPlatform)
local v_u_3 = require(script.Parent.PlatformIconMap)
local v_u_4 = require(script.Parent.Parent.Services).UserInputService
local v_u_5 = require(script.Parent.Parent.Services).GuiService
local v_u_6 = {
	[v1.PS4] = Enum.Platform.PS4,
	[v1.PS5] = Enum.Platform.PS5,
	[v1.Xbox] = Enum.Platform.XBoxOne
}
return function() -- name: getBuilderIconForCurrentPlatform
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_3
	local v7 = v_u_4.GetPlatform
	local v8 = v_u_4
	local v9, v10 = pcall(v7, v8)
	if not v9 then
		local v11 = v_u_5:IsTenFootInterface()
		local v12 = v_u_2()
		if v11 then
			v10 = v_u_6[v12]
		else
			v10 = nil
		end
	end
	return v_u_3[v10]
end