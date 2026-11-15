-- Path: CoreGui.RobloxGui.Modules.Common.GetHasGuiHidingPermission
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Promise)
local v4 = v1.RobloxGui
local v_u_5 = require(v4.Modules.Flags.GetFIntCanHideGuiGroupId)
return function(_, p_u_6, _)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	return v_u_3.new(function(p7, p8)
		-- upvalues: (copy) p_u_6, (ref) v_u_5
		if game:GetEngineFeature("GuiHidingApiSupport") then
			if p_u_6 then
				local v_u_9 = false
				local function v10()
					-- upvalues: (ref) v_u_5, (ref) v_u_9, (ref) p_u_6
					v_u_9 = p_u_6:IsInGroupAsync((v_u_5()))
				end
				local v11, v12 = pcall(v10)
				if v11 then
					p7(v_u_9)
				else
					p8(v12)
				end
			else
				p8("Invalid local player")
			end
		else
			p7(false)
			return
		end
	end)
end