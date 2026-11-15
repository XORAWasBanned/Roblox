-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactCurrentFiber
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals).__DEV__
require(script.Parent.ReactInternalTypes)
local v3 = require(v1.Shared).ReactSharedInternals
local v_u_4 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd
local v_u_5 = require(v1.Shared).getComponentName
local v_u_6 = v3.ReactDebugCurrentFrame
local v_u_8 = {
	["current"] = nil,
	["isRendering"] = false,
	["getCurrentFiberOwnerNameInDevOrNull"] = function()
		-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_5
		if v_u_2 then
			if v_u_8.current == nil then
				return nil
			end
			local v7 = v_u_8.current._debugOwner
			if v7 then
				return v_u_5(v7.type)
			end
		end
		return nil
	end
}
local function v_u_9() -- name: getCurrentFiberStackInDev
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_4
	return not v_u_2 and "" or (v_u_8.current == nil and "" or v_u_4(v_u_8.current))
end
function v_u_8.resetCurrentFiber()
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_8
	if v_u_2 then
		v_u_6.getCurrentStack = nil
		v_u_8.current = nil
		v_u_8.isRendering = false
	end
end
function v_u_8.setCurrentFiber(p10)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8
	if v_u_2 then
		v_u_6.getCurrentStack = v_u_9
		v_u_8.current = p10
		v_u_8.isRendering = false
	end
end
function v_u_8.setIsRendering(p11)
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if v_u_2 then
		v_u_8.isRendering = p11
	end
end
function v_u_8.getIsRendering()
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if v_u_2 then
		return v_u_8.isRendering
	else
		return false
	end
end
return v_u_8