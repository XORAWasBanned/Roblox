-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.ShortcutService
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = require(v1.Service.ChromeUtils)
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = game:GetService("UserInputService")
local v6 = game:GetService("LocalizationService")
local v_u_7 = require(v3.Workspace.Packages.InExperienceLocales).Localization.new(v6.RobloxLocaleId)
local v8 = require(v3.Workspace.Packages.AppCommonLib)
require(v3.Workspace.Packages.Chrome)
local v_u_9 = v8.Signal
local v_u_10 = v2.AvailabilitySignal
local v_u_11 = v2.AvailabilitySignalState
local v_u_12 = require(v3.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_13.new() -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_13
	local v14 = {
		["_shortcuts"] = {},
		["_shortcutBarList"] = {},
		["_shortcutBarHiddenOverrides"] = {},
		["onShortcutBarChanged"] = v_u_9.new(),
		["_boundShortcuts"] = {}
	}
	local v15 = v_u_13
	return setmetatable(v14, v15)
end
function v_u_13.registerShortcut(p_u_16, p_u_17) -- name: registerShortcut
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_5
	if p_u_16._shortcuts[p_u_17.id] then
		warn(string.format("shortcut " .. p_u_17.id .. " already registered", debug.traceback()))
	end
	if p_u_17.label then
		p_u_17.label = v_u_7:Format(p_u_17.label)
	end
	p_u_17.displayPriority = p_u_17.displayPriority or 0
	if p_u_17.availability == nil then
		p_u_17.availability = v_u_10.new(v_u_11.Available)
	end
	p_u_17.availability:connect(function()
		-- upvalues: (copy) p_u_16, (copy) p_u_17
		p_u_16:shortcutChanged(p_u_17)
	end)
	p_u_17.icon = v_u_5:GetImageForKeyCode(p_u_17.keyCode)
	p_u_16._shortcuts[p_u_17.id] = p_u_17
end
function v_u_13.activateShortcut(p18, p19) -- name: activateShortcut
	if p18._shortcuts[p19] then
		local v20 = p18._shortcuts[p19]
		if v20.activated then
			return v20.activated()
		end
	end
	return nil
end
function v_u_13.shortcutChanged(p21, _) -- name: shortcutChanged
	p21:updateShortcutBar(p21:getCurrentShortcutBar())
end
function v_u_13.updateShortcutBar(p22, p23) -- name: updateShortcutBar
	p22:_unbindAllShortcuts()
	p22._currentShortcutBar = p23
	if p22._shortcutBarHidden then
		p22.onShortcutBarChanged:fire(nil)
	else
		p22.onShortcutBarChanged:fire(p23)
		if p23 and p22._shortcutBarList[p23] then
			p22:_bindShortcutBar(p23)
		end
	end
end
function v_u_13.configureShortcutBar(p24, p25, p26) -- name: configureShortcutBar
	p24._shortcutBarList[p25] = p26
end
function v_u_13.setShortcutBar(p27, p28) -- name: setShortcutBar
	if p27._currentShortcutBar ~= p28 then
		p27:updateShortcutBar(p28)
	end
end
function v_u_13.setHideShortcutBar(p29, p30, p31) -- name: setHideShortcutBar
	if p29._shortcutBarHiddenOverrides[p30] ~= p31 then
		if p31 then
			p29._shortcutBarHiddenOverrides[p30] = p31
		else
			p29._shortcutBarHiddenOverrides[p30] = nil
		end
		local v32 = false
		for _, v33 in pairs(p29._shortcutBarHiddenOverrides) do
			if not v33 then
				continue
			end
			v32 = true
		end
		p29._shortcutBarHidden = v32
		p29:updateShortcutBar(p29._currentShortcutBar)
	end
end
function v_u_13.getHideShortcutBar(p34) -- name: getHideShortcutBar
	return p34._shortcutBarHidden
end
function v_u_13.getShortcut(p35, p36) -- name: getShortcut
	return p35._shortcuts[p36]
end
function v_u_13.getShortcutsFromBar(p37, p38, _) -- name: getShortcutsFromBar
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_5
	if not p38 then
		return {}
	end
	local v39 = {}
	for _, v40 in p37._shortcutBarList[p38] do
		if p37._shortcuts[v40] then
			local v41 = p37._shortcuts[v40]
			if v41.availability:get() == v_u_11.Unavailable or v_u_12 and not v_u_5:GamepadSupports(v_u_5:GetLastInputType(), v41.keyCode) then
				continue
			end
			table.insert(v39, v41)
		else
			warn(string.format("shortcut " .. v40 .. " not found", debug.traceback()))
		end
	end
	return v39
end
function v_u_13.getCurrentShortcutBar(p42) -- name: getCurrentShortcutBar
	return p42._currentShortcutBar
end
function v_u_13._bindShortcutBar(p43, p44) -- name: _bindShortcutBar
	-- upvalues: (copy) v_u_11
	for _, v45 in p43._shortcutBarList[p44] do
		local v46 = p43._shortcuts[v45]
		if not (v46 and v46.actionName) then
			continue
		end
		p43:_unbindShortcut(v45)
		if v46.availability:get() == v_u_11.Unavailable then
			continue
		end
		p43:_bindShortcut(v45)
	end
end
function v_u_13._unbindShortcutBar(p47, p48) -- name: _unbindShortcutBar
	if p48 then
		for _, v49 in p47._shortcutBarList[p48] do
			local v50 = p47._shortcuts[v49]
			if not (v50 and v50.actionName) then
				continue
			end
			p47:_unbindShortcut(v49)
		end
	end
end
function v_u_13._bindShortcut(p_u_51, p52) -- name: _bindShortcut
	-- upvalues: (copy) v_u_4
	local v53 = p_u_51._shortcuts[p52]
	if v53 and v53.actionName then
		v_u_4:BindCoreAction(v53.actionName, function(p54, p55, _)
			-- upvalues: (copy) p_u_51
			if p55 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			for v56, v57 in p_u_51._shortcuts do
				if not v57.actionName or v57.actionName ~= p54 then
					continue
				end
				return p_u_51:activateShortcut(v56) or Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, v53.keyCode)
		p_u_51._boundShortcuts[v53.actionName] = true
	end
end
function v_u_13._unbindShortcut(p58, p59) -- name: _unbindShortcut
	-- upvalues: (copy) v_u_4
	local v60 = p58._shortcuts[p59]
	if v60 and v60.actionName then
		v_u_4:UnbindCoreAction(v60.actionName)
		p58._boundShortcuts[v60.actionName] = false
	end
end
function v_u_13._unbindAllShortcuts(p61) -- name: _unbindAllShortcuts
	-- upvalues: (copy) v_u_4
	for v62, v63 in p61._boundShortcuts do
		if not v63 then
			continue
		end
		v_u_4:UnbindCoreAction(v62)
		p61._boundShortcuts[v62] = false
	end
end
return v_u_13