-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ErrorToaster
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v6 = v5.Modules.Settings.Pages.ShareGame
local v_u_7 = require(v6.Constants)
local v_u_8 = require(v6.Actions.StoppedToastTimer)
local v_u_9 = require(v5.Modules.Settings.Theme)
local v_u_10 = v_u_7.InviteStatus
local v_u_11 = require(v6.getTranslator)()
local v12 = v_u_3.PureComponent:extend("ErrorToaster")
function v12.restartTimer(p_u_13) -- name: restartTimer
	-- upvalues: (copy) v_u_2
	if not p_u_13.timerConnection then
		p_u_13.timerConnection = v_u_2.RenderStepped:Connect(function()
			-- upvalues: (copy) p_u_13
			local v14 = p_u_13.props.failedInvites
			if #v14 == 0 then
				p_u_13:stopTimer()
			elseif v14[#v14].timeStamp + 4 < tick() then
				p_u_13:stopTimer()
			end
		end)
	end
end
function v12.stopTimer(p15) -- name: stopTimer
	if p15.timerConnection then
		p15.timerConnection:Disconnect()
		p15.timerConnection = nil
	end
	p15.props.stoppedTimerDispatch()
end
function v12.didUpdate(p16) -- name: didUpdate
	if #p16.props.failedInvites ~= 0 then
		p16:restartTimer()
	end
end
function v12.render(p17) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_11
	local v18 = p17.props.deviceLayout
	local v19 = p17.props.failedInvites
	local v20 = v_u_7.LayoutSpecific[v18].TOAST_HEIGHT
	if #v19 ~= 0 then
		local v21 = v19[#v19].status
		local v22
		if v21 == v_u_10.Moderated then
			v22 = "Feature.SettingsHub.Label.ModeratedInviteError"
		else
			if v21 ~= v_u_10.Failed then
				return
			end
			v22 = "Feature.SettingsHub.Label.GameInviteError"
		end
		local v23 = v_u_3.createElement
		local v24 = {
			["DisplayOrder"] = 2,
			["ZIndexBehavior"] = nil,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
		local v25 = {
			["ToastFrame"] = v_u_3.createElement("Frame", {
				["AnchorPoint"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["BackgroundColor3"] = v_u_7.Color.RED,
				["Position"] = UDim2.new(0.5, 0, 0, 0),
				["Size"] = UDim2.new(0.5, 0, 0, v20)
			}, {
				["InnerTextPadding"] = v_u_3.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 6),
					["PaddingRight"] = UDim.new(0, 6)
				}),
				["ToastText"] = v_u_3.createElement("TextLabel", {
					["BackgroundTransparency"] = 1,
					["Font"] = nil,
					["Size"] = nil,
					["Text"] = nil,
					["TextColor3"] = nil,
					["TextSize"] = nil,
					["TextWrapped"] = true,
					["Font"] = v_u_9.font(Enum.Font.SourceSansSemibold, "Semibold"),
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Text"] = v_u_11:FormatByKey(v22),
					["TextColor3"] = v_u_7.Color.WHITE,
					["TextSize"] = v_u_9.textSize(16)
				})
			})
		}
		return v23("ScreenGui", v24, v25)
	end
end
return v4.UNSTABLE_connect2(function(p26) -- name: mapStateToProps
	return {
		["deviceLayout"] = p26.DeviceInfo.DeviceLayout,
		["failedInvites"] = p26.Toasts.failedInvites
	}
end, function(p_u_27) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8
	return {
		["stoppedTimerDispatch"] = function() -- name: stoppedTimerDispatch
			-- upvalues: (copy) p_u_27, (ref) v_u_8
			p_u_27(v_u_8())
		end
	}
end)(v12)