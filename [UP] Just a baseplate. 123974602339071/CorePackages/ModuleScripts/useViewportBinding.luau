-- Path: CorePackages.Packages._Index.Graphing.Graphing.Util.useViewportBinding
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Signals)
local v_u_5 = require(v2.SignalsReact)
local v_u_6 = require(v1.CanvasContext)
require(v1.Types)
return {
	["useViewportBinding"] = function(p_u_7, p8) -- name: useViewportBinding
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
		local v_u_9 = v_u_3.useContext(v_u_6)
		local v_u_10 = v_u_9.viewportRectGetter
		local v11 = { v_u_10 }
		if p8 then
			for _, v12 in p8 do
				table.insert(v11, v12)
			end
		end
		local v14 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_4, (copy) v_u_10, (copy) p_u_7, (copy) v_u_9
			return v_u_4.createComputed(function(p13)
				-- upvalues: (ref) v_u_10, (ref) p_u_7, (ref) v_u_9
				v_u_10(p13)
				return p_u_7(v_u_9)
			end)
		end, v11)
		return v_u_5.useSignalBinding(v14)
	end,
	["useViewportVisibility"] = function(p_u_15, p16) -- name: useViewportVisibility
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
		local v_u_17 = v_u_3.useContext(v_u_6)
		local v_u_18 = v_u_17.viewportRectGetter
		local v19 = { v_u_18 }
		if p16 then
			for _, v20 in p16 do
				table.insert(v19, v20)
			end
		end
		local v22 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_4, (copy) v_u_18, (copy) p_u_15, (copy) v_u_17
			return v_u_4.createComputed(function(p21)
				-- upvalues: (ref) v_u_18, (ref) p_u_15, (ref) v_u_17
				v_u_18(p21)
				return p_u_15(v_u_17)
			end)
		end, v19)
		return v_u_5.useSignalState(v22)
	end
}