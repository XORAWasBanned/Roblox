-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioPanels.usePanel
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v_u_5 = require(v1.Utility.Flags)
require(v1.Utility.Plugin.StudioUri)
require(script.Parent.Types)
return function(p_u_6) -- name: usePanel
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v_u_7 = v_u_3.useRef(nil)
	local v8 = v_u_4.useRefToState
	local v9 = {
		["anchorUri"] = p_u_6.anchorUri,
		["position"] = p_u_6.position,
		["depth"] = p_u_6.depth,
		["parentPopoverId"] = p_u_6.parentPopoverId
	}
	local v10
	if v_u_5.FoundationPopoverPluginFocusable then
		v10 = p_u_6.isFocusable
	else
		v10 = nil
	end
	v9.isFocusable = v10
	local v_u_11 = v8(v9)
	local v_u_12 = v_u_3.useRef(p_u_6.onClose)
	v_u_12.current = p_u_6.onClose
	local v_u_13 = v_u_3.useRef(p_u_6.registerPanelAsync)
	v_u_13.current = p_u_6.registerPanelAsync
	local v_u_14
	if v_u_5.FoundationPopoverPluginOverlayMeasurement then
		local v_u_15, v_u_16 = v_u_3.useState(false)
		local v_u_17 = v_u_3.useCallback(function()
			-- upvalues: (copy) v_u_16, (copy) v_u_12
			v_u_16(true)
			v_u_12.current()
		end, {})
		local v27 = v_u_4.useAsync(function()
			-- upvalues: (copy) p_u_6, (copy) v_u_15, (copy) v_u_13, (copy) v_u_11, (copy) v_u_17, (ref) v_u_5, (copy) v_u_7
			if not p_u_6.isOpen or v_u_15 then
				if v_u_7.current then
					v_u_7.current()
					v_u_7.current = nil
				end
				return nil
			end
			local v18 = v_u_13.current
			local v19 = v_u_11.current.anchorUri
			local v20 = v_u_11.current.position
			local v21 = v_u_17
			local v22 = v_u_11.current.depth
			local v23 = v_u_11.current.parentPopoverId
			local v24
			if v_u_5.FoundationPopoverPluginFocusable then
				v24 = v_u_11.current.isFocusable
			else
				v24 = nil
			end
			local v25, v26 = v18(v19, v20, v21, v22, v23, v24)
			v_u_7.current = v26
			return v25
		end, { p_u_6.isOpen, v_u_11, v_u_15 })
		if v_u_15 or v27.status ~= "ok" then
			v_u_14 = nil
		else
			v_u_14 = v27.value
		end
		v_u_3.useEffect(function()
			-- upvalues: (copy) p_u_6, (copy) v_u_16
			if not p_u_6.isOpen then
				v_u_16(false)
			end
		end, { p_u_6.isOpen })
	else
		local v37 = v_u_4.useAsync(function()
			-- upvalues: (copy) p_u_6, (copy) v_u_13, (copy) v_u_11, (copy) v_u_12, (ref) v_u_5, (copy) v_u_7
			if not p_u_6.isOpen then
				if v_u_7.current then
					v_u_7.current()
					v_u_7.current = nil
				end
				return nil
			end
			local v28 = v_u_13.current
			local v29 = v_u_11.current.anchorUri
			local v30 = v_u_11.current.position
			local v31 = v_u_12.current
			local v32 = v_u_11.current.depth
			local v33 = v_u_11.current.parentPopoverId
			local v34
			if v_u_5.FoundationPopoverPluginFocusable then
				v34 = v_u_11.current.isFocusable
			else
				v34 = nil
			end
			local v35, v36 = v28(v29, v30, v31, v32, v33, v34)
			v_u_7.current = v36
			return v35
		end, { p_u_6.isOpen, v_u_11 })
		if v37.status == "ok" then
			v_u_14 = v37.value
		else
			v_u_14 = nil
		end
	end
	v_u_4.useAsync(function()
		-- upvalues: (ref) v_u_14, (copy) p_u_6
		if not v_u_14 then
			return nil
		end
		v_u_14.updateAsync({
			["targetWidgetUri"] = p_u_6.anchorUri,
			["targetAnchorPoint"] = p_u_6.position.targetAnchorPoint,
			["subjectAnchorPoint"] = p_u_6.position.subjectAnchorPoint,
			["offset"] = p_u_6.position.offset
		})
		return nil
	end, { v_u_14, p_u_6.anchorUri, p_u_6.position })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_7
		return function()
			-- upvalues: (ref) v_u_7
			if v_u_7.current then
				v_u_7.current()
			end
		end
	end, {})
	return v_u_14
end