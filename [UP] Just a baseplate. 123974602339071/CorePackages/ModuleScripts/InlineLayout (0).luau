-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout
local v1 = script:FindFirstAncestor("Components").Parent
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v_u_4 = require(v2.React)
local v_u_5 = v_u_4.useCallback
local v_u_6 = v_u_4.useRef
local v_u_7 = v_u_4.useState
local v_u_8 = v_u_4.useEffect
local v_u_9 = require(v2.Dash).map
require(v1.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local v_u_10 = require(v1.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local v_u_11 = require(v1.Components.InlineLayout.InlineLayoutElements.HoverContext)
local v_u_12 = require(v1.Utils.renderInMeasuredFrame)
local v13 = require(v2.MarkdownCore)
local v_u_14 = v_u_3.View
local v_u_15 = v13.Flags
local v_u_16 = game:DefineFastFlag("FFlagDebugInlineLayout", false)
local function v_u_43(p17, p18) -- name: layoutElements
	-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_16, (copy) v_u_9, (copy) v_u_4, (copy) v_u_14
	if #p17 == 0 then
		return {}
	end
	local v19 = not v_u_15.FFlagMarkdownAssistantParity and 100 or #p17 * 4 + 100
	local v20 = {}
	local v21 = {}
	local v22 = p18
	local v23 = v21
	local v24 = v22
	local v25 = 1
	local v26 = false
	local v27 = 0
	local v28 = nil
	while true do
		local v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39
		while true do
			while true do
				if v25 > #p17 and not v28 or v27 >= v19 then
					if v27 == v19 and v_u_16 then
						warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect", ("Desired width: %*, elements: %*"):format(p18, #p17), debug.traceback())
					end
					if #v23 > 0 then
						table.insert(v20, v23)
					end
					return v_u_9(v20, function(p40, p41)
						-- upvalues: (ref) v_u_4, (ref) v_u_14
						return v_u_4.createElement(v_u_14, {
							["tag"] = "auto-xy row align-x-left",
							["key"] = nil,
							["LayoutOrder"] = nil,
							["key"] = tostring(p41),
							["LayoutOrder"] = p41
						}, p40)
					end)
				end
				v42 = v28 or p17[v25]
				if v42 ~= v_u_10 then
					break
				end
				v25 = v25 + 1
				table.insert(v20, v23)
				v21 = {}
				v22 = p18
				v23 = v21
				v24 = v22
				v26 = false
			end
			if #v23 == 0 and (v26 and v42.trimStart) then
				break
			end
			v29 = v42:getWidth()
			v30 = #v23
			if v29 <= v24 then
				v31 = v_u_12
				v32 = v42:render(v25, v30)
				table.insert(v23, v31(v32, v29, v30))
				v22 = v24 - v29
				v25 = v25 + 1
				v24 = v22
				v28 = nil
			else
				v33, v28 = v42:split(v24)
				if v33:getWidth() <= v24 then
					v34 = v_u_12
					v35 = v33:render(v25, v30)
					v36 = v33:getWidth()
					table.insert(v23, v34(v35, v36, v30))
				elseif #v23 == 0 then
					if v42.canForceSplit then
						v33, v28 = v42:split(v24, true)
					end
					v37 = v_u_12
					v38 = v33:render(v25, v30)
					v39 = v33:getWidth()
					table.insert(v23, v37(v38, v39, v30))
				else
					v28 = v42
				end
				if v_u_15.FFlagMarkdownAssistantParity and v28 == nil then
					v25 = v25 + 1
				end
				table.insert(v20, v23)
				v21 = {}
				v22 = p18
				v23 = v21
				v24 = v22
				v26 = true
			end
			v27 = v27 + 1
		end
		local v42 = v42:trimStart()
		if v42 == nil then
			v25 = v25 + 1
			v27 = v27 + 1
			v28 = nil
		else
			v29 = v42:getWidth()
			v30 = #v23
			if v29 <= v24 then
				v31 = v_u_12
				v32 = v42:render(v25, v30)
				table.insert(v23, v31(v32, v29, v30))
				v22 = v24 - v29
				v25 = v25 + 1
				v24 = v22
				v28 = nil
			else
				v33, v28 = v42:split(v24)
				if v33:getWidth() <= v24 then
					v34 = v_u_12
					v35 = v33:render(v25, v30)
					v36 = v33:getWidth()
					table.insert(v23, v34(v35, v36, v30))
				elseif #v23 == 0 then
					if v42.canForceSplit then
						v33, v28 = v42:split(v24, true)
					end
					v37 = v_u_12
					v38 = v33:render(v25, v30)
					v39 = v33:getWidth()
					table.insert(v23, v37(v38, v39, v30))
				else
					v28 = v42
				end
				if v_u_15.FFlagMarkdownAssistantParity and v28 == nil then
					v25 = v25 + 1
				end
				table.insert(v20, v23)
				v21 = {}
				v22 = p18
				v23 = v21
				v24 = v22
				v26 = true
			end
			v27 = v27 + 1
		end
	end
end
return function(p_u_44) -- name: InlineLayout
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_43, (copy) v_u_8, (copy) v_u_4, (copy) v_u_11, (copy) v_u_14
	local v_u_45 = v_u_6(nil)
	local v46 = v_u_3.Hooks.useTokens()
	local v47, v_u_48 = v_u_7({})
	local v49 = v_u_5(function()
		-- upvalues: (copy) v_u_45, (copy) v_u_48, (ref) v_u_43, (copy) p_u_44
		if v_u_45.current == nil then
			return
		elseif v_u_45.current.AbsoluteSize.X ~= 0 then
			v_u_48(v_u_43(p_u_44.Elements, v_u_45.current.AbsoluteSize.X))
		end
	end, { p_u_44.Elements })
	v_u_8(v49, { v49 })
	local v50 = v_u_4.createElement
	local v51 = v_u_11.Provider
	local v52 = v_u_4.createElement
	local v53 = v_u_14
	local v54 = {
		["onAbsoluteSizeChanged"] = nil,
		["ref"] = nil,
		["tag"] = "size-full-0 auto-y",
		["layout"] = nil,
		["onAbsoluteSizeChanged"] = v49,
		["ref"] = v_u_45,
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = p_u_44.HorizontalAlignment or Enum.HorizontalAlignment.Left,
			["Padding"] = p_u_44.VerticalPadding or UDim.new(0, v46.Gap.Small)
		}
	}
	return v50(v51, nil, v52(v53, v54, v47))
end