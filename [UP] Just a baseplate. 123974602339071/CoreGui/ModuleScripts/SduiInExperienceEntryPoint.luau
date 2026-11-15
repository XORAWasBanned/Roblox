-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.SduiInExperienceEntryPoint
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(v1.Packages.React)
local v_u_5 = require(v1.Packages.Foundation)
local v_u_6 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_7 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_8 = require(v1.Workspace.Packages.SduiSharedUtilities).SduiFeatureEntryPoint
local v_u_9 = require(v1.Workspace.Packages.UniversalAppPolicy)
local v_u_10 = require(script.Parent.SduiInExperienceHost)
local v_u_11 = nil
local function v25(p12, p13) -- name: SduiInExperienceEntryPoint
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (ref) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_2
	local v14 = v_u_4.createElement(v_u_8, {
		["configKey"] = p12.configKey,
		["identifier"] = p12.identifier,
		["appPage"] = p12.surfaceKey,
		["routeName"] = p12.routeName,
		["additionalAnalyticsData"] = p12.additionalAnalyticsData,
		["loadTimer"] = p12.loadTimer,
		["onRetry"] = p12.onRetry,
		["errorSlot"] = p12.errorSlot,
		["loadingSlot"] = p12.loadingSlot,
		["shouldDisplayLoading"] = p12.shouldDisplayLoading,
		["shouldDisplayError"] = p12.shouldDisplayError,
		["onAbsoluteSizeChange"] = p12.onAbsoluteSizeChange,
		["extraLocalProps"] = p12.extraLocalProps,
		["LayoutOrder"] = p12.LayoutOrder,
		["Size"] = p12.Size,
		["AutomaticSize"] = p12.AutomaticSize,
		["Position"] = p12.Position,
		["ref"] = p13
	})
	if not p12.disableAppPolicyProvider then
		local v15 = v_u_9.RoactAppPolicy.Provider
		local v16 = {
			["policy"] = { v_u_9.AppFeaturePolicies }
		}
		v14 = v_u_4.createElement(v15, v16, {
			["Child"] = v14
		})
	end
	local v17 = v_u_10
	local v18 = {
		["surfaceKey"] = p12.surfaceKey
	}
	local v19 = v_u_4.createElement(v17, v18, {
		["Child"] = v14
	})
	if not p12.disableLocalizationProvider then
		local v20 = v_u_7
		local v21 = {}
		if v_u_11 == nil then
			v_u_11 = v_u_6.new(v_u_3.RobloxLocaleId)
		end
		v21.localization = v_u_11
		v19 = v_u_4.createElement(v20, v21, {
			["Child"] = v19
		})
	end
	if not p12.disableFoundationProvider then
		local v22 = v_u_5.FoundationProvider
		local v23 = {
			["colorMode"] = p12.colorMode or v_u_5.Enums.ColorMode.Dark
		}
		local v24 = p12.device
		if not v24 then
			if v_u_2:IsTenFootInterface() then
				v24 = v_u_5.Enums.Device.Console
			else
				v24 = v_u_5.Enums.Device.Desktop
			end
		end
		v23.device = v24
		v19 = v_u_4.createElement(v22, v23, {
			["Child"] = v19
		})
	end
	return v19
end
return v_u_4.memo(v_u_4.forwardRef(v25))