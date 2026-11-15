-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.ShopIcon
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui").Modules.Chrome
local v_u_4 = require(v2.Packages.React)
local v5 = require(v2.Workspace.Packages.SharedFlags)
local v_u_6 = require(v2.Packages.SignalsReact)
local v_u_7 = require(v3.ChromeShared.Hooks.useObservableValue)
local v_u_8 = require(v2.Workspace.Packages.Chrome).Enabled()
local v_u_9
if v5.FFlagEnableConsoleExpControls and v_u_8 then
	v_u_9 = require(script.Parent.Parent.GamepadConnector)
else
	v_u_9 = nil
end
local v_u_10 = require(v3.ChromeShared.Service.ChromeUtils).ObservableValue.new(true)
local v_u_11 = require(v2.Workspace.Packages.InExperienceShop)
local v12 = v5.FFlagEnableInExperienceShop
local v13 = v_u_11.FFlagEnableExperienceShopGlobalIcon
if v13 then
	if not v12 then
		v_u_8 = v12
	end
else
	v_u_8 = v13
end
local v_u_14 = v_u_11.FFlagCenterInExperienceShopWindow
local v_u_15 = v_u_11.FFlagExperienceShopNewIconography
local v_u_16 = v_u_11.ShopGlobalIcon
local v_u_17
if v_u_8 then
	v_u_17 = require(v3.Integrations.CommonIcon)
else
	v_u_17 = nil
end
local v_u_18
if v_u_8 then
	v_u_18 = require(v3.Service)
else
	v_u_18 = nil
end
local v_u_19
if v_u_8 then
	v_u_19 = require(v3.ChromeShared.Unibar.Constants)
else
	v_u_19 = nil
end
local v_u_20
if v_u_8 then
	v_u_20 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
else
	v_u_20 = nil
end
local v_u_21
if v_u_8 and (v_u_18 and v_u_19) then
	v_u_21 = require(v3.ChromeShared.Service.ChromeUtils).MappedSignal.new(v_u_18:onIntegrationStatusChanged(), function()
		-- upvalues: (copy) v_u_18, (copy) v_u_19
		return v_u_18:isWindowOpen(v_u_19.IN_EXPERIENCE_SHOP_ID)
	end)
else
	v_u_21 = nil
end
local v_u_22
if v_u_8 then
	v_u_22 = require(v3.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow
else
	v_u_22 = nil
end
local function v_u_25(p23) -- name: getShopGlobalIconEnabled
	-- upvalues: (copy) v_u_8, (copy) v_u_11
	if v_u_8 then
		local v24 = v_u_11.GetShopGlobalIconStore
		if v24 then
			return v24(p23).getEnabled(p23)
		else
			return false
		end
	else
		return false
	end
end
local function v_u_28(p26) -- name: getShopGlobalStatusIndicatorEnabled
	-- upvalues: (copy) v_u_8, (copy) v_u_11
	if v_u_8 then
		local v27 = v_u_11.GetShopGlobalIconStore
		if v27 then
			return v27(p26).getStatusIndicatorEnabled(p26)
		else
			return false
		end
	else
		return false
	end
end
local function v_u_29() -- name: handleShopGlobalIconActivated
	-- upvalues: (copy) v_u_8, (copy) v_u_14, (copy) v_u_22, (copy) v_u_18, (copy) v_u_19
	if v_u_8 then
		if v_u_14 then
			if v_u_22 then
				v_u_22()
				return
			end
		elseif v_u_18 and v_u_19 then
			v_u_18:toggleWindow(v_u_19.IN_EXPERIENCE_SHOP_ID)
		end
	end
end
return function(p30) -- name: ShopIcon
	-- upvalues: (copy) v_u_6, (copy) v_u_25, (copy) v_u_28, (copy) v_u_4, (copy) v_u_8, (copy) v_u_11, (copy) v_u_20, (copy) v_u_21, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_16, (copy) v_u_29, (copy) v_u_15, (copy) v_u_17
	local v31 = v_u_6.useSignalState(v_u_25)
	local v32 = v_u_6.useSignalState(v_u_28)
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_11
		if v_u_8 then
			local v33 = v_u_11.initShopGlobalIcon
			if v33 then
				v33 = v_u_11.initShopGlobalIcon()
			end
			return v33 or function() end
		end
	end, {})
	local v34 = v_u_20 or function()
		return nil
	end
	local v35
	if v31 then
		v35 = v_u_21
	else
		v35 = nil
	end
	local v36 = v34(v35)
	local v37 = v_u_7
	local v38
	if v_u_9 == nil then
		v38 = v_u_10
	else
		v38 = v_u_9:getShowTopBar()
	end
	local v39 = v37(v38)
	if not (v_u_8 and (v31 and v_u_16)) then
		return nil
	end
	local v40 = v_u_4.createElement
	local v41 = "Frame"
	local v42 = {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.fromOffset(0, p30.buttonSize),
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["LayoutOrder"] = p30.layoutOrder
	}
	local v43 = {}
	local v44 = v_u_4.createElement
	local v45 = v_u_16
	local v46 = {
		["buttonSize"] = p30.buttonSize,
		["leftGap"] = p30.leftGap,
		["hidden"] = v39 == false,
		["showStatusIndicator"] = v32,
		["onActivated"] = v_u_29,
		["onAreaChanged"] = p30.onAreaChanged,
		["isActive"] = v36
	}
	local v47
	if v_u_15 or not (v_u_17 and v_u_21) then
		v47 = nil
	else
		v47 = v_u_17("BuildingStore", nil, v_u_21)
	end
	v46.icon = v47
	v43.Icon = v44(v45, v46)
	return v40(v41, v42, v43)
end