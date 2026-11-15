-- Path: CoreGui.RobloxGui.Modules.Settings.onBlockButtonActivated
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = v2:WaitForChild("RobloxGui")
local v_u_6 = require(v3.Packages.Roact)
local v_u_7 = require(v3.Packages.Promise)
local v_u_8 = require(v3.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v9 = require(v3.Workspace.Packages.PlayerList)
local v_u_10 = require(script.Parent.Analytics.BlockingAnalytics)
local v_u_11 = require(script.Parent.Components.Blocking.BlockingModalScreen)
local v_u_12 = v9.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_13 = nil
return function(p_u_14, p_u_15, p_u_16, p_u_17)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (ref) v_u_13, (copy) v_u_6, (copy) v_u_1, (copy) v_u_12, (copy) v_u_4, (copy) v_u_11, (copy) v_u_8, (copy) v_u_5
	return v_u_7.new(function(p_u_18)
		-- upvalues: (copy) p_u_15, (ref) v_u_10, (copy) p_u_14, (copy) p_u_16, (ref) v_u_13, (ref) v_u_6, (ref) v_u_1, (ref) v_u_12, (copy) p_u_17, (ref) v_u_4, (ref) v_u_11, (ref) v_u_8, (ref) v_u_5
		local v19 = p_u_15 or v_u_10.new()
		v19:action("SettingsHub", "blockUserButtonClick", {
			["blockeeUserId"] = p_u_14.UserId,
			["source"] = p_u_16
		})
		if v_u_13 ~= nil then
			v_u_6.unmount(v_u_13)
			v_u_13 = nil
			v_u_1:UnbindCoreAction("BlockingModalScreen")
		end
		local function v20()
			-- upvalues: (ref) v_u_13, (ref) v_u_6, (ref) v_u_1, (copy) p_u_18, (ref) v_u_12, (ref) p_u_17, (ref) v_u_4
			if v_u_13 ~= nil then
				v_u_6.unmount(v_u_13)
				v_u_13 = nil
				v_u_1:UnbindCoreAction("BlockingModalScreen")
			end
			p_u_18()
			if v_u_12 then
				if p_u_17 and p_u_17.onBlockingModalClose then
					p_u_17.onBlockingModalClose()
					return
				end
			elseif v_u_12 then
				v_u_4.SelectedCoreObject = nil
			end
		end
		local v21 = {
			["BlockingModalScreen"] = v_u_6.createElement(v_u_11, {
				["player"] = p_u_14,
				["closeModal"] = v20,
				["analytics"] = v19,
				["source"] = p_u_16,
				["onBlockingSuccess"] = p_u_17 and p_u_17.onBlockingSuccess or nil
			})
		}
		local v22 = v_u_6.createElement(v_u_8, {}, v21)
		v_u_13 = v_u_6.mount(v22, v_u_5, "BlockingContainer")
		v_u_1:BindCoreAction("BlockingModalScreen", v20, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end)
end