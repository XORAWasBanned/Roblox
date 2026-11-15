-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider
local v_u_1 = game:GetService("GuiService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.InGameMenuDependencies).Roact
local v_u_4 = require(script.Parent.FocusHandlerContext)
local v5 = v_u_3.PureComponent:extend("FocusHandlerContextProvider")
function v5.init(p6) -- name: init
	p6.state = {
		["candidateHandlerId"] = nil,
		["currentHandlerId"] = nil
	}
	p6.previousSelections = {}
end
function v5.requestFocusForHandlerId(p7, p_u_8) -- name: requestFocusForHandlerId
	p7:setState(function(p9)
		-- upvalues: (copy) p_u_8
		return p9.currentHandlerId == nil and {
			["currentHandlerId"] = p_u_8
		} or (p_u_8 ~= p9.currentHandlerId and {
			["candidateHandlerId"] = p_u_8
		} or nil)
	end)
end
function v5.blurCurrentFocusHandler(p_u_10, p_u_11, p_u_12) -- name: blurCurrentFocusHandler
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	p_u_10:setState(function(p13)
		-- upvalues: (copy) p_u_11, (copy) p_u_12, (ref) v_u_1, (copy) p_u_10, (ref) v_u_3
		if p13.currentHandlerId ~= p_u_11 then
			return nil
		end
		local v14
		if p_u_12 then
			v14 = nil
		else
			v14 = v_u_1.SelectedCoreObject
		end
		p_u_10.previousSelections[p_u_11] = v14
		return p13.candidateHandlerId == nil and {
			["currentHandlerId"] = v_u_3.None
		} or {
			["currentHandlerId"] = p13.candidateHandlerId,
			["candidateHandlerId"] = v_u_3.None
		}
	end)
end
function v5.forgetLastSelectionForHandlerId(p15, p16) -- name: forgetLastSelectionForHandlerId
	p15.previousSelections[p16] = nil
end
function v5.render(p_u_17) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v18 = v_u_3.createElement
	local v19 = v_u_4.Provider
	local v24 = {
		["value"] = {
			["currentHandlerId"] = p_u_17.state.currentHandlerId,
			["candidateHandlerId"] = p_u_17.state.candidateHandlerId,
			["previousSelections"] = p_u_17.previousSelections,
			["requestFocusForHandlerId"] = function(p20) -- name: requestFocusForHandlerId
				-- upvalues: (copy) p_u_17
				p_u_17:requestFocusForHandlerId(p20)
			end,
			["forgetLastSelectionForHandlerId"] = function(p21) -- name: forgetLastSelectionForHandlerId
				-- upvalues: (copy) p_u_17
				p_u_17:forgetLastSelectionForHandlerId(p21)
			end,
			["blurCurrentFocusHandler"] = function(p22, p23) -- name: blurCurrentFocusHandler
				-- upvalues: (copy) p_u_17
				p_u_17:blurCurrentFocusHandler(p22, p23)
			end
		}
	}
	return v18(v19, v24, p_u_17.props[v_u_3.Children])
end
return v5