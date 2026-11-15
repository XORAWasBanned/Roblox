-- Path: CoreGui.RobloxGui.Modules.ChannelUpdatePrompt
local v_u_1 = game:GetService("CoreGui").RobloxGui
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("NotificationService")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = game:GetService("AppUpdateService")
local v_u_6 = require(v_u_1.Modules.ErrorPrompt)
local v_u_7 = require(v2.Workspace.Packages.RobloxTranslator)
local function v_u_8() -- name: performUpdate
	-- upvalues: (copy) v_u_5
	v_u_5:PerformManagedUpdate()
end
return {
	["init"] = function() -- name: init
		-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
		local v_u_9 = v_u_6.new("Default", {
			["MessageTextScaled"] = true,
			["HideErrorCode"] = true,
			["MenuIsOpenKey"] = "ChannelUpdatePrompt"
		})
		v_u_9:setParent(v_u_1)
		local function v_u_24(p10, p11) -- name: showUpdatePrompt
			-- upvalues: (ref) v_u_7, (copy) v_u_9
			local v12 = p11 or ""
			local v13
			if p10 == "BetaProgram" then
				v13 = "An update is required for the Beta Program you are in: \"" .. v12 .. "\"."
				local v_u_14 = {
					["RBX_NAME"] = v12
				}
				local v_u_15 = "InGame.ChannelUpdatePrompt.Message.BetaProgram"
				local function v16()
					-- upvalues: (ref) v_u_7, (copy) v_u_15, (copy) v_u_14
					return v_u_7:FormatByKey(v_u_15, v_u_14)
				end
				local v17, v18 = pcall(v16)
				if v17 then
					v13 = v18 or v13
				end
			else
				if p10 ~= "BoundChannel" then
					warn("ChannelUpdatePrompt: unknown updateType \'" .. tostring(p10) .. "\', skipping prompt")
					return
				end
				v13 = "An update is required for the channel you are bound to: \"" .. v12 .. "\"."
				local v_u_19 = {
					["RBX_NAME"] = v12
				}
				local v_u_20 = "InGame.ChannelUpdatePrompt.Message.BoundChannel"
				local function v21()
					-- upvalues: (ref) v_u_7, (copy) v_u_20, (copy) v_u_19
					return v_u_7:FormatByKey(v_u_20, v_u_19)
				end
				local v22, v23 = pcall(v21)
				if v22 then
					v13 = v23 or v13
				end
			end
			v_u_9:_open(v13)
		end
		v_u_9:updateButtons({
			{
				["Text"] = "Restart Now",
				["LocalizationKey"] = "InGame.CommonUI.Button.RestartNow",
				["LayoutOrder"] = 1,
				["Callback"] = nil,
				["Primary"] = true,
				["Callback"] = v_u_8
			}
		})
		v_u_9:setErrorTitle("Update Required", "InGame.CommonUI.Title.UpdateRequired")
		local v_u_25 = v_u_1.AbsoluteSize.X
		local v_u_26 = v_u_1.AbsoluteSize.Y
		local function v29() -- name: onScreenSizeChanged
			-- upvalues: (ref) v_u_1, (ref) v_u_25, (ref) v_u_26, (copy) v_u_9
			local v27 = v_u_1.AbsoluteSize.X
			local v28 = v_u_1.AbsoluteSize.Y
			if v_u_25 ~= v27 or v_u_26 ~= v28 then
				v_u_25 = v27
				v_u_26 = v28
				v_u_9:resizeWidthAndHeight(v_u_25, v_u_26)
			end
		end
		v_u_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(v29)
		local v30 = v_u_1.AbsoluteSize.X
		local v31 = v_u_1.AbsoluteSize.Y
		if v_u_25 ~= v30 or v_u_26 ~= v31 then
			v_u_25 = v30
			v_u_26 = v31
			v_u_9:resizeWidthAndHeight(v_u_25, v_u_26)
		end
		v_u_3.RobloxEventReceived:Connect(function(p32)
			-- upvalues: (ref) v_u_4, (copy) v_u_24
			if p32.namespace == "ChannelUpdateRequired" then
				local v33 = v_u_4:JSONDecode(p32.detail)
				local v34 = v33.updateType
				local v35
				if v34 == "BetaProgram" then
					v35 = v33.betaProgramName
				elseif v34 == "BoundChannel" then
					v35 = v33.channelName
				else
					v35 = nil
				end
				v_u_24(v33.updateType, v35)
			end
		end)
		local function v36()
			-- upvalues: (ref) v_u_5
			return v_u_5:GetProtocolLaunchUpdateType()
		end
		local v37, v38 = pcall(v36)
		local function v39()
			-- upvalues: (ref) v_u_5
			return v_u_5:GetProtocolLaunchUpdateName()
		end
		local v40, v41 = pcall(v39)
		if v37 and v38 ~= "" then
			v_u_24(v38, v40 and v41 and v41 or "")
		end
	end
}