-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.CoreGuiEnabled
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.Rodux)
local v_u_4 = require(v1.Packages.Cryo)
local v5 = script.Parent.Parent
if require(v5.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
	return nil
end
local v6 = v5.Actions
local v7 = require(v6.UpdateCoreGuiEnabled)
local v8
if require(v2.Modules.Flags.FFlagMountCoreGuiBackpack) then
	v8 = {
		[Enum.CoreGuiType.PlayerList] = true,
		[Enum.CoreGuiType.Health] = true,
		[Enum.CoreGuiType.Chat] = true,
		[Enum.CoreGuiType.EmotesMenu] = true
	}
else
	v8 = {
		[Enum.CoreGuiType.PlayerList] = true,
		[Enum.CoreGuiType.Health] = true,
		[Enum.CoreGuiType.Backpack] = true,
		[Enum.CoreGuiType.Chat] = true,
		[Enum.CoreGuiType.EmotesMenu] = true
	}
end
return v3.createReducer(v8, {
	[v7.name] = function(p9, p10)
		-- upvalues: (copy) v_u_4
		if p10.coreGuiType ~= Enum.CoreGuiType.All then
			return v_u_4.Dictionary.join(p9, {
				[p10.coreGuiType] = p10.enabled
			})
		end
		local v11 = {}
		for v12, _ in pairs(p9) do
			v11[v12] = p10.enabled
		end
		return v11
	end
})