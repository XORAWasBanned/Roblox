-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioPanels.Managers.PopoverManager
local v_u_1 = game:GetService("HttpService")
local v2 = script:FindFirstAncestor("Foundation")
local v_u_3 = require(v2.Utility.Flags)
local v_u_4 = require(v2.Utility.Plugin.StudioUri)
require(script.Parent.Parent.Types)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6, p7) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v8 = v_u_5
	local v9 = setmetatable({}, v8)
	v9._uriScope = p7
	v9._plugin = p6
	v9._panels = p6:GetPluginComponent("Panels")
	v9._pluginUri = v_u_4.wrap(p6:GetUri())
	v9._active = {}
	v9._pool = {}
	v9._didPrewarm = false
	return v9
end
function v_u_5.openAtAsync(p_u_10, p11, p12, p13, p14, p15) -- name: openAtAsync
	-- upvalues: (copy) v_u_3
	local v16 = p13 == nil and 0 or p13
	local v17
	if v_u_3.FoundationPopoverPluginFocusable then
		v17 = p15 == true
	else
		v17 = false
	end
	local v_u_18 = p_u_10:_acquirePanelAsync(p12, v16, p14, v17)
	v_u_18.panel.Enabled = false
	p_u_10._panels:SetAttachmentAsync(v_u_18.uri, {
		["TargetWidgetUri"] = p11.targetWidgetUri,
		["TargetAnchorPoint"] = p11.targetAnchorPoint,
		["SubjectAnchorPoint"] = p11.subjectAnchorPoint,
		["Offset"] = p11.offset
	})
	p_u_10._panels:SetSizeAsync(v_u_18.uri, Vector2.new(0, 0))
	v_u_18.panel.Enabled = true
	v_u_18.open = true
	if not v_u_3.FoundationPopoverPluginOverlayMeasurement then
		return {
			["container"] = v_u_18.panel,
			["popoverId"] = v_u_18.id,
			["setSizeAsync"] = function(p19) -- name: setSizeAsync
				-- upvalues: (copy) p_u_10, (copy) v_u_18
				local v20 = p19.X
				local v21 = math.min(3000, v20)
				local v22 = math.ceil(v21)
				local v23 = p19.Y
				local v24 = math.min(3000, v23)
				local v25 = math.ceil(v24)
				p_u_10._panels:SetSizeAsync(v_u_18.uri, Vector2.new(v22, v25))
			end,
			["updateAsync"] = function(p26) -- name: updateAsync
				-- upvalues: (copy) v_u_18, (copy) p_u_10
				if v_u_18.uri then
					p_u_10._panels:SetAttachmentAsync(v_u_18.uri, {
						["TargetWidgetUri"] = p26.targetWidgetUri,
						["TargetAnchorPoint"] = p26.targetAnchorPoint,
						["SubjectAnchorPoint"] = p26.subjectAnchorPoint,
						["Offset"] = p26.offset
					})
				end
			end,
			["close"] = function() -- name: close
				-- upvalues: (copy) p_u_10, (copy) v_u_18
				p_u_10:_closePopover(v_u_18, true)
			end
		}
	end
	local v_u_27 = v_u_18.generation
	return {
		["container"] = v_u_18.panel,
		["popoverId"] = v_u_18.id,
		["setSizeAsync"] = function(p28) -- name: setSizeAsync
			-- upvalues: (copy) v_u_18, (copy) v_u_27, (copy) p_u_10
			if v_u_18.generation == v_u_27 and v_u_18.open then
				local v29 = p28.X
				local v30 = math.min(3000, v29)
				local v31 = math.ceil(v30)
				local v32 = p28.Y
				local v33 = math.min(3000, v32)
				local v34 = math.ceil(v33)
				p_u_10._panels:SetSizeAsync(v_u_18.uri, Vector2.new(v31, v34))
			end
		end,
		["updateAsync"] = function(p35) -- name: updateAsync
			-- upvalues: (copy) v_u_18, (copy) v_u_27, (copy) p_u_10
			if v_u_18.generation == v_u_27 and (v_u_18.open and v_u_18.uri) then
				p_u_10._panels:SetAttachmentAsync(v_u_18.uri, {
					["TargetWidgetUri"] = p35.targetWidgetUri,
					["TargetAnchorPoint"] = p35.targetAnchorPoint,
					["SubjectAnchorPoint"] = p35.subjectAnchorPoint,
					["Offset"] = p35.offset
				})
			end
		end,
		["close"] = function() -- name: close
			-- upvalues: (copy) p_u_10, (copy) v_u_18, (copy) v_u_27
			p_u_10:_closePopover(v_u_18, true, v_u_27)
		end
	}
end
function v_u_5._createPanelAsync(p36, p37, p38, p39) -- name: _createPanelAsync
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v40 = p36._plugin
	local v41 = {
		["Id"] = nil,
		["InitialEnabled"] = true,
		["Tooltip"] = true,
		["Focusable"] = nil,
		["Transparent"] = true,
		["Resizable"] = true,
		["Title"] = nil,
		["ZIndex"] = nil,
		["Id"] = p37
	}
	if not v_u_3.FoundationPopoverPluginFocusable then
		p39 = nil
	end
	v41.Focusable = p39
	v41.Title = p37
	v41.ZIndex = p38 + 200
	local v42 = v40:CreateQWidgetPluginGui(p37, v41)
	v42.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	return v42, v_u_4.join(p36._pluginUri, {
		["Category"] = "Panels",
		["ItemId"] = nil,
		["ItemId"] = p37
	})
end
function v_u_5._makePopoverId(p43) -- name: _makePopoverId
	-- upvalues: (copy) v_u_1
	return ("Popovers%*/%*"):format(not p43._uriScope and "" or ("/%*"):format(p43._uriScope), (v_u_1:GenerateGUID(false)))
end
function v_u_5._createPopoverAsync(p_u_44, p45, p46, p47) -- name: _createPopoverAsync
	-- upvalues: (copy) v_u_3
	local v48, v49 = p_u_44:_createPanelAsync(p45, p46, p47)
	local v_u_50 = {
		["id"] = nil,
		["uri"] = nil,
		["panel"] = nil,
		["open"] = false,
		["depth"] = nil,
		["isFocusable"] = nil,
		["generation"] = 0,
		["parentPopoverId"] = nil,
		["onClose"] = nil,
		["id"] = p45,
		["uri"] = v49,
		["panel"] = v48,
		["depth"] = p46,
		["isFocusable"] = p47
	}
	local function v51()
		-- upvalues: (ref) v_u_3, (copy) p_u_44, (copy) v_u_50
		if v_u_3.FoundationPopoverPluginOverlayMeasurement then
			p_u_44:_closePopover(v_u_50, false, v_u_50.generation)
		else
			p_u_44:_closePopover(v_u_50)
		end
	end
	if v48:IsA("PluginGui") then
		v48:BindToClose(v51)
	end
	if v48:IsA("PluginGui") then
		v48.InputBegan:Connect(function(p52)
			-- upvalues: (copy) v_u_50, (copy) p_u_44
			if p52.UserInputType == Enum.UserInputType.MouseButton1 and v_u_50.open then
				p_u_44:_closeChildPopovers(v_u_50)
			end
		end)
	end
	return v_u_50
end
function v_u_5._activatePopover(p53, p54, p55, p56) -- name: _activatePopover
	-- upvalues: (copy) v_u_3
	if v_u_3.FoundationPopoverPluginOverlayMeasurement then
		p54.generation = p54.generation + 1
	end
	p54.onClose = p55
	p54.parentPopoverId = p56
	p54.open = false
	p53._active[p54.id] = p54
end
function v_u_5._tryAcquireFromPool(p57, p58, p59, p60, p61) -- name: _tryAcquireFromPool
	-- upvalues: (copy) v_u_3
	local v62 = p57._pool[p59]
	local v63 = nil
	if v_u_3.FoundationPopoverPluginFocusable then
		if v62 then
			for v64 = #v62, 1, -1 do
				if v62[v64].isFocusable ~= p61 then
					continue
				end
				v63 = table.remove(v62, v64)
			end
		end
	elseif v62 then
		v63 = table.remove(v62)
	else
		v63 = nil
	end
	if not v63 then
		return nil
	end
	p57:_activatePopover(v63, p58, p60)
	return v63
end
function v_u_5._acquirePanelAsync(p65, p66, p67, p68, p69) -- name: _acquirePanelAsync
	local v70 = p65:_tryAcquireFromPool(p66, p67, p68, p69)
	if v70 then
		return v70
	end
	local v71 = p65:_createPopoverAsync(p65:_makePopoverId(), p67, p69)
	p65:_activatePopover(v71, p66, p68)
	return v71
end
function v_u_5.prewarmPoolAsync(p72, p73) -- name: prewarmPoolAsync
	if not p72._didPrewarm then
		for v74 = 0, math.max(0, p73) do
			if p72._pool[v74] == nil then
				p72._pool[v74] = {}
			end
			local v75 = p72._pool[v74]
			if #v75 ~= 0 then
				continue
			end
			local v76 = p72:_createPopoverAsync(p72:_makePopoverId(), v74, false)
			v76.panel.Enabled = false
			table.insert(v75, v76)
		end
		p72._didPrewarm = true
	end
end
function v_u_5._closeChildPopovers(p77, p78) -- name: _closeChildPopovers
	local v79 = {}
	for _, v80 in p77._active do
		if not v80.open or v80.id == p78.id then
			continue
		end
		local v81 = p77._active
		local v82 = v80.parentPopoverId
		while true do
			local v83
			if not v82 then
				v83 = false
				break
			end
			if v82 == p78.id then
				v83 = true
				break
			end
			local v84 = v81[v82]
			if not v84 then
				v83 = false
				break
			end
			v82 = v84.parentPopoverId
		end
		if not v83 then
			break
		end
		table.insert(v79, v80)
	end
	for _, v85 in v79 do
		p77:_closePopover(v85)
	end
end
function v_u_5._closePopover(p86, p87, p88, p89) -- name: _closePopover
	-- upvalues: (copy) v_u_3
	if v_u_3.FoundationPopoverPluginOverlayMeasurement and (p89 ~= nil and p87.generation ~= p89) then
		return
	elseif p87.open then
		p87.open = false
		p87.panel.Enabled = false
		if not p88 and p87.onClose then
			p87.onClose()
		end
		p86._active[p87.id] = nil
		local v90 = p87.depth
		if not p86._pool[v90] then
			p86._pool[v90] = {}
		end
		local v91 = p86._pool[v90]
		table.insert(v91, p87)
	end
end
function v_u_5.closeAll(p92) -- name: closeAll
	local v93 = {}
	for _, v94 in p92._active do
		table.insert(v93, v94)
	end
	for _, v95 in v93 do
		p92:_closePopover(v95)
	end
end
function v_u_5.destroy(p96) -- name: destroy
	p96:closeAll()
	for _, v97 in p96._pool do
		for _, v98 in v97 do
			if not v98.panel then
				continue
			end
			v98.panel:Destroy()
		end
	end
	p96._pool = {}
end
return v_u_5