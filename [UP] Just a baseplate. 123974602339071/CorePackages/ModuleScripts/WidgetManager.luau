-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioWidgets.WidgetManager
local v_u_1 = game:GetService("HttpService")
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v4 = require(v3.Dash)
local v_u_5 = v4.filter
local v_u_6 = v4.values
local v_u_7 = require(v2.Utility.Flags)
local v_u_8 = require(v2.Utility.Plugin.StudioUri)
local v_u_9 = require(v2.Utility.Logger)
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11) -- name: new
	-- upvalues: (copy) v_u_10
	local v12 = v_u_10
	local v13 = setmetatable({}, v12)
	v13._widgetsApi = p11
	v13._pendingRegisters = {}
	v13._pendingDeregisters = {}
	v13._registeredWidgets = {}
	v13._signals = {}
	v13._deferredAncestrySignals = {}
	v13._running = false
	return v13
end
function v_u_10.nextId(_) -- name: nextId
	-- upvalues: (copy) v_u_1
	return v_u_1:GenerateGUID(false)
end
function v_u_10.flush(p14) -- name: flush
	-- upvalues: (copy) v_u_7
	if v_u_7.FoundationWidgetManagerSnapshotFlush then
		local v15 = p14._pendingDeregisters
		local v16 = p14._pendingRegisters
		p14._pendingDeregisters = {}
		p14._pendingRegisters = {}
		p14:_flushWith(v15, v16)
	else
		p14:_flushWith(p14._pendingDeregisters, p14._pendingRegisters)
		p14._pendingDeregisters = {}
		p14._pendingRegisters = {}
	end
end
function v_u_10._flushWith(p_u_17, p18, p19) -- name: _flushWith
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8
	local v_u_20 = {}
	for v21, v22 in p18 do
		table.insert(v_u_20, v22)
		p_u_17._registeredWidgets[v21] = nil
	end
	if #v_u_20 > 0 then
		pcall(function()
			-- upvalues: (copy) p_u_17, (copy) v_u_20
			p_u_17._widgetsApi:DeregisterAsync(v_u_20)
		end)
	end
	local v_u_23 = v_u_7.FoundationWidgetManagerSnapshotFlush and {} or nil
	local v27 = v_u_5(v_u_6(p19), function(p24)
		-- upvalues: (ref) v_u_7, (copy) v_u_23
		local v25 = p24.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
		if v_u_7.FoundationWidgetManagerSnapshotFlush and not v25 then
			local v26 = v_u_23
			table.insert(v26, p24)
		end
		return v25
	end)
	if v_u_7.FoundationWidgetManagerSnapshotFlush then
		for _, v_u_28 in v_u_23 do
			local v_u_29 = v_u_8.toString(v_u_28.Uri)
			if p_u_17._deferredAncestrySignals[v_u_29] then
				continue
			end
			p_u_17._deferredAncestrySignals[v_u_29] = v_u_28.Widget.AncestryChanged:Connect(function(_, p30)
				-- upvalues: (copy) p_u_17, (copy) v_u_29, (copy) v_u_28
				if p30 == nil then
					local v31 = p_u_17._deferredAncestrySignals[v_u_29]
					if v31 then
						v31:Disconnect()
						p_u_17._deferredAncestrySignals[v_u_29] = nil
					end
				elseif v_u_28.Widget:FindFirstAncestorWhichIsA("LayerCollector") then
					local v32 = p_u_17._deferredAncestrySignals[v_u_29]
					if v32 then
						v32:Disconnect()
						p_u_17._deferredAncestrySignals[v_u_29] = nil
					end
					p_u_17:register(v_u_28.Uri, v_u_28.Widget)
				end
			end)
		end
	end
	local v_u_33 = {}
	for _, v_u_34 in v27 do
		v_u_34.Position = v_u_34.Widget.AbsolutePosition
		v_u_34.Size = v_u_34.Widget.AbsoluteSize
		v_u_34.Visible = v_u_34.Widget:GetStyled("Visible")
		local v35 = v_u_8.toString(v_u_34.Uri)
		local v36 = v_u_34.DEPRECATED_PluginGui
		local v37 = p_u_17._signals[v35]
		if v37 then
			if v37.Widget ~= v_u_34.Widget then
				v37.PositionChanged:Disconnect()
				v37.SizeChanged:Disconnect()
				v37.VisibleChanged:Disconnect()
				v37.AncestryChanged:Disconnect()
				goto l18
			end
			if not v_u_7.FoundationPopoverPluginOverlayMeasurement or v37.Host == v36 then
				continue
			end
			v37.Host = v36
			local v38 = v_u_34.Uri
			table.insert(v_u_33, v38)
		else
			::l18::
			local v39 = p_u_17._signals
			local v40 = {
				["Widget"] = v_u_34.Widget
			}
			if not v_u_7.FoundationPopoverPluginOverlayMeasurement then
				v36 = nil
			end
			v40.Host = v36
			v40.PositionChanged = v_u_34.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: (copy) p_u_17, (copy) v_u_34
				p_u_17:register(v_u_34.Uri, v_u_34.Widget)
			end)
			v40.SizeChanged = v_u_34.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (copy) p_u_17, (copy) v_u_34
				p_u_17:register(v_u_34.Uri, v_u_34.Widget)
			end)
			v40.VisibleChanged = v_u_34.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: (copy) p_u_17, (copy) v_u_34
				p_u_17:register(v_u_34.Uri, v_u_34.Widget)
			end)
			v40.AncestryChanged = v_u_34.Widget.AncestryChanged:Connect(function(_, p41)
				-- upvalues: (copy) p_u_17, (copy) v_u_34
				if not p41 then
					p_u_17:deregister(v_u_34.Uri)
				end
			end)
			v39[v35] = v40
		end
	end
	if v_u_7.FoundationPopoverPluginOverlayMeasurement and #v_u_33 > 0 then
		pcall(function()
			-- upvalues: (copy) p_u_17, (copy) v_u_33
			p_u_17._widgetsApi:DeregisterAsync(v_u_33)
		end)
	end
	if #v27 > 0 then
		p_u_17._widgetsApi:RegisterAsync(v27)
	end
end
function v_u_10._run(p_u_42) -- name: _run
	if not p_u_42._running then
		p_u_42._running = true
		task.defer(function()
			-- upvalues: (copy) p_u_42
			p_u_42._running = false
			p_u_42:flush()
		end)
	end
end
function v_u_10.register(p43, p44, p45) -- name: register
	-- upvalues: (copy) v_u_8, (copy) v_u_7
	local v46 = p45:FindFirstAncestorWhichIsA("PluginGui") or p45:FindFirstAncestorWhichIsA("ScreenGui")
	if v46 then
		local v47 = v_u_8.toString(p44)
		local v48 = v_u_7.FoundationWidgetManagerSnapshotFlush and p43._deferredAncestrySignals[v47]
		if v48 then
			v48:Disconnect()
			p43._deferredAncestrySignals[v47] = nil
		end
		p43._registeredWidgets[v47] = p45
		p43._pendingRegisters[v47] = {
			["Uri"] = p44,
			["Widget"] = p45,
			["DEPRECATED_PluginGui"] = v46
		}
		p43._pendingDeregisters[v47] = nil
		p43:_run()
	end
end
function v_u_10.refreshAsync(p49, p50) -- name: refreshAsync
	-- upvalues: (copy) v_u_8
	local v51 = v_u_8.toString(p50)
	local v52 = p49._registeredWidgets[v51]
	if not v52 then
		return false
	end
	local v53 = v52:FindFirstAncestorWhichIsA("PluginGui") or v52:FindFirstAncestorWhichIsA("ScreenGui")
	if not v53 then
		return false
	end
	p49._widgetsApi:RegisterAsync({
		{
			["Uri"] = p50,
			["Widget"] = v52,
			["DEPRECATED_PluginGui"] = v53,
			["Position"] = v52.AbsolutePosition,
			["Size"] = v52.AbsoluteSize,
			["Visible"] = v52:GetStyled("Visible")
		}
	})
	return true
end
function v_u_10.deregister(p54, p55, p56) -- name: deregister
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_9
	local v57 = v_u_8.toString(p55)
	p54._pendingDeregisters[v57] = p55
	if v_u_7.FoundationWidgetManagerSnapshotFlush then
		p54._pendingRegisters[v57] = nil
		local v58 = p54._deferredAncestrySignals[v57]
		if v58 then
			v58:Disconnect()
			p54._deferredAncestrySignals[v57] = nil
		end
	end
	local v59 = p54._signals[v57]
	if v59 then
		if p56 == nil or v59.Widget == p56 then
			v59.PositionChanged:Disconnect()
			v59.SizeChanged:Disconnect()
			v59.VisibleChanged:Disconnect()
			v59.AncestryChanged:Disconnect()
			p54._signals[v57] = nil
		else
			v_u_9:warning((("WidgetManager:deregister called with mismatched widget for uri %*"):format(v57)))
		end
	end
	p54:_run()
end
function v_u_10.destroy(p60) -- name: destroy
	-- upvalues: (copy) v_u_7
	for _, v61 in p60._signals do
		v61.PositionChanged:Disconnect()
		v61.SizeChanged:Disconnect()
		v61.VisibleChanged:Disconnect()
		v61.AncestryChanged:Disconnect()
	end
	if v_u_7.FoundationWidgetManagerSnapshotFlush then
		for _, v62 in p60._deferredAncestrySignals do
			v62:Disconnect()
		end
		p60._deferredAncestrySignals = {}
	end
	p60._signals = {}
	p60._pendingRegisters = {}
	p60._pendingDeregisters = {}
	p60._registeredWidgets = {}
end
return v_u_10