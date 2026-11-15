-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactFiberComponentStack
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
require(v1.LuauPolyfill)
require(script.Parent.ReactInternalTypes)
local v3 = require(script.Parent.ReactWorkTags)
local v_u_4 = v3.HostComponent
local v_u_5 = v3.LazyComponent
local v_u_6 = v3.SuspenseComponent
local v_u_7 = v3.SuspenseListComponent
local v_u_8 = v3.FunctionComponent
local v_u_9 = v3.IndeterminateComponent
local v_u_10 = v3.ForwardRef
local v_u_11 = v3.SimpleMemoComponent
local v_u_12 = v3.ClassComponent
local v13 = require(v1.Shared).ReactComponentStackFrame
local v_u_14 = v13.describeBuiltInComponentFrame
local v_u_15 = v13.describeFunctionComponentFrame
local v_u_16 = v13.describeClassComponentFrame
local function v_u_21(p17) -- name: describeFiber
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_14, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_16
	local v18 = nil
	if v_u_2.__DEV__ then
		local v19 = p17._debugOwner
		if v19 then
			v18 = v19.type
		end
	end
	local v20
	if v_u_2.__DEV__ then
		v20 = p17._debugSource
	else
		v20 = nil
	end
	if p17.tag == v_u_4 then
		return v_u_14(p17.type, v20, v18)
	elseif p17.tag == v_u_5 then
		return v_u_14("Lazy", v20, v18)
	elseif p17.tag == v_u_6 then
		return v_u_14("Suspense", v20, v18)
	elseif p17.tag == v_u_7 then
		return v_u_14("SuspenseList", v20, v18)
	elseif p17.tag == v_u_8 or (p17.tag == v_u_9 or p17.tag == v_u_11) then
		return v_u_15(p17.type, v20, v18)
	elseif p17.tag == v_u_10 then
		return v_u_15(p17.type.render, v20, v18)
	else
		return p17.tag ~= v_u_12 and "" or v_u_16(p17.type, v20, v18)
	end
end
return {
	["getStackByFiberInDevAndProd"] = function(p_u_22) -- name: getStackByFiberInDevAndProd
		-- upvalues: (copy) v_u_21
		local function v25()
			-- upvalues: (copy) p_u_22, (ref) v_u_21
			local v23 = p_u_22
			local v24 = ""
			repeat
				v24 = v24 .. v_u_21(v23)
				v23 = v23.return_
			until v23 == nil
			return v24
		end
		local v26, v27 = pcall(v25)
		if v26 then
			return v27
		end
		if typeof(v27) ~= "table" or not (v27.message and v27.stack) then
			return "\nError generating stack: " .. tostring(v27)
		end
		local v28 = v27.message
		local v29 = v27.stack
		return "\nError generating stack: " .. v28 .. "\n" .. tostring(v29)
	end
}