-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.MusicUtility.MusicEntrypoint
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v2.Workspace.Packages.Chrome)
local v5 = v_u_4.Enums.SideSheetPlacement
local v_u_6 = require(v2.Packages.Foundation)
local v_u_7 = require(v2.Packages.React)
local v_u_8 = require(v2.Workspace.Packages.Songbird)
local v_u_9 = require(v1.Service)
local v10 = require(v1.Integrations.MusicUtility.Constants)
local v_u_11 = require(v1.Integrations.CommonIcon)
local v12 = require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_13 = require(v2.Workspace.Packages.Responsive)
local v14 = require(v2.Packages.Signals)
local v15 = require(v2.Packages.SignalsReact)
local v16 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
local v17 = v10.MUSIC_WINDOW_MAX_SIZE
local v_u_18 = v15.useSignalState
local v_u_19 = v12.new(v17.X, v17.Y)
local v_u_20 = v16.new(v_u_9:onIntegrationStatusChanged(), function()
	-- upvalues: (copy) v_u_9
	return v_u_9:isWindowOpen("music_entrypoint")
end)
local v_u_21, v_u_22 = v14.createSignal(false)
local function v_u_23() -- name: focusMusicWindow
	-- upvalues: (copy) v_u_3, (copy) v_u_22
	v_u_3:SetMenuIsOpen(true, "music_entrypoint")
	v_u_22(true)
end
local function v_u_24() -- name: unfocusMusicWindow
	-- upvalues: (copy) v_u_22, (copy) v_u_3
	v_u_22(false)
	v_u_3:SetMenuIsOpen(false, "music_entrypoint")
end
local v32 = {
	["initialAvailability"] = nil,
	["id"] = "music_entrypoint",
	["sideSheetPlacement"] = nil,
	["draggable"] = true,
	["cachePosition"] = true,
	["windowSize"] = nil,
	["label"] = "CoreScripts.TopBar.Music",
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v_u_9.AvailabilitySignal.Available,
	["sideSheetPlacement"] = v5.BelowFold,
	["windowSize"] = v_u_19,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_23, (copy) v_u_20, (copy) v_u_9
		if v_u_13.GetInputModeStore(false).getLastInputType(false) == v_u_13.Input.Directional then
			v_u_4.FocusUtils.FocusOffChrome(v_u_23)
			if not v_u_20:get() then
				v_u_9:toggleWindow("music_entrypoint")
				return
			end
		else
			v_u_9:toggleWindow("music_entrypoint")
		end
	end,
	["isActivated"] = v_u_20,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_11, (copy) v_u_20
			return v_u_11("icons/common/music", "icons/common/musicFilled_medium", v_u_20)
		end,
		["Window"] = function() -- name: Window
			-- upvalues: (copy) v_u_18, (copy) v_u_21, (copy) v_u_7, (copy) v_u_6, (copy) v_u_19, (copy) v_u_8, (copy) v_u_22, (copy) v_u_3, (copy) v_u_9, (copy) v_u_24
			local v25 = v_u_18(v_u_21)
			local v26 = v_u_7.createElement
			local v27 = v_u_6.View
			local v29 = {
				["tag"] = "auto-xy",
				["onAbsoluteSizeChanged"] = nil,
				["onAbsoluteSizeChanged"] = function(p28) -- name: onAbsoluteSizeChanged
					-- upvalues: (ref) v_u_19
					v_u_19:requestSize(p28.AbsoluteSize.X, p28.AbsoluteSize.Y)
				end
			}
			local v30 = {}
			local v31 = {
				["isFocused"] = v25,
				["onClose"] = function() -- name: onClose
					-- upvalues: (ref) v_u_22, (ref) v_u_3, (ref) v_u_9
					v_u_22(false)
					v_u_3:SetMenuIsOpen(false, "music_entrypoint")
					v_u_9:toggleWindow("music_entrypoint")
				end,
				["onUnfocus"] = v_u_24
			}
			v30.ChromeWindowWrapper = v_u_7.createElement(v_u_8.ChromeWindowWrapper, v31)
			return v26(v27, v29, v30)
		end
	}
}
return v_u_9:register(v32)