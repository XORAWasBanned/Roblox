-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.FocusHandler
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v_u_5 = v2.Cryo
local v6 = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local v_u_7 = require(script.Parent.FocusHandlerUtils.FocusHandlerContext)
local v_u_8 = 1
local v_u_9 = v_u_4.PureComponent:extend("FocusHandler")
local v10 = v3.strictInterface
local v11 = {
	["isFocused"] = v3.boolean,
	["didFocus"] = v3.optional(v3.callback),
	["didBlur"] = v3.optional(v3.callback)
}
local v12
if v6() then
	v12 = v3.optional(v3.boolean) or nil
else
	v12 = nil
end
v11.shouldForgetPreviousSelection = v12
local v13
if v6() then
	v13 = v3.optional(v3.number) or nil
else
	v13 = nil
end
v11.currentHandlerId = v13
local v14
if v6() then
	v14 = v3.optional(v3.number) or nil
else
	v14 = nil
end
v11.candidateHandlerId = v14
local v15
if v6() then
	v15 = v3.table or nil
else
	v15 = nil
end
v11.previousSelections = v15
local v16
if v6() then
	v16 = v3.callback or nil
else
	v16 = nil
end
v11.requestFocusForHandlerId = v16
local v17
if v6() then
	v17 = v3.callback or nil
else
	v17 = nil
end
v11.forgetLastSelectionForHandlerId = v17
local v18
if v6() then
	v18 = v3.callback or nil
else
	v18 = nil
end
v11.blurCurrentFocusHandler = v18
v11[v_u_4.Children] = v3.optional(v3.table)
v_u_9.validateProps = v10(v11)
if v6() then
	function v_u_9.init(p19) -- name: init
		-- upvalues: (ref) v_u_8
		p19.id = v_u_8
		v_u_8 = v_u_8 + 1
	end
end
function v_u_9.render(p20) -- name: render
	-- upvalues: (copy) v_u_4
	return v_u_4.createFragment(p20.props[v_u_4.Children])
end
if v6() then
	function v_u_9.didMount(p21) -- name: didMount
		if p21.props.isFocused then
			p21.props.requestFocusForHandlerId(p21.id)
		end
	end
else
	function v_u_9.didMount(p22) -- name: didMount
		if p22.props.isFocused then
			p22.props.didFocus()
		end
	end
end
if v6() then
	function v_u_9.didUpdate(p23, p24) -- name: didUpdate
		local v25 = p23.props.shouldForgetPreviousSelection
		if v25 then
			v25 = not p24.shouldForgetPreviousSelection
		end
		local v26 = p23.props.previousSelections[p23.id]
		if v25 or v26 ~= nil and not v26:IsDescendantOf(game) then
			p23.props.forgetLastSelectionForHandlerId(p23.id)
			v26 = nil
		end
		local v27
		if p23.props.candidateHandlerId == p23.id then
			v27 = false
		else
			v27 = p23.props.candidateHandlerId ~= nil
		end
		local v28
		if p24.candidateHandlerId == p23.id then
			v28 = false
		else
			v28 = p24.candidateHandlerId ~= nil
		end
		local v29
		if p23.props.currentHandlerId == p23.id then
			v29 = p24.currentHandlerId ~= p23.id
		else
			v29 = false
		end
		local v30
		if p23.props.currentHandlerId == nil and p24.currentHandlerId ~= nil then
			v30 = p24.currentHandlerId ~= p23.id
		else
			v30 = false
		end
		local v31 = v30 and not v27
		if v31 then
			v31 = p23.props.isFocused
		end
		local v32 = not p24.isFocused
		if v32 then
			v32 = p23.props.isFocused
		end
		local v33 = p24.isFocused and not p23.props.isFocused
		if v33 then
			v27 = v33
		elseif v27 then
			v27 = not v28
		end
		local v34
		if p24.currentHandlerId == p23.id then
			v34 = p23.props.currentHandlerId ~= p23.id
		else
			v34 = false
		end
		if v32 or v31 then
			p23.props.requestFocusForHandlerId(p23.id)
		elseif v29 and p23.props.didFocus then
			p23.props.didFocus(v26)
		end
		if v27 and p23.props.currentHandlerId == p23.id then
			p23.props.blurCurrentFocusHandler(p23.id, p23.props.shouldForgetPreviousSelection)
		end
		if v34 and p23.props.didBlur then
			p23.props.didBlur()
		end
	end
else
	function v_u_9.didUpdate(p35, p36) -- name: didUpdate
		if p35.props.isFocused and (not p36.isFocused and p35.props.didFocus) then
			p35.props.didFocus()
		elseif not p35.props.isFocused and (p36.isFocused and p35.props.didBlur) then
			p35.props.didBlur()
		end
	end
end
if v6() then
	function v_u_9.willUnmount(p37) -- name: willUnmount
		if p37.props.isFocused then
			p37.props.blurCurrentFocusHandler(p37.id, true)
			if p37.props.didBlur then
				p37.props.didBlur()
				return
			end
		else
			p37.props.forgetLastSelectionForHandlerId(p37.id)
		end
	end
else
	function v_u_9.willUnmount(p38) -- name: willUnmount
		if p38.props.isFocused and p38.props.didBlur then
			p38.props.didBlur()
		end
	end
end
return v6() and function(p_u_39) -- name: FocusHandlerWithContext
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_9, (copy) v_u_5
	local v41 = {
		["render"] = function(p40) -- name: render
			-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_5, (copy) p_u_39
			return v_u_4.createElement(v_u_9, v_u_5.Dictionary.join(p_u_39, {
				["currentHandlerId"] = p40.currentHandlerId,
				["previousSelections"] = p40.previousSelections,
				["requestFocusForHandlerId"] = p40.requestFocusForHandlerId,
				["forgetLastSelectionForHandlerId"] = p40.forgetLastSelectionForHandlerId,
				["blurCurrentFocusHandler"] = p40.blurCurrentFocusHandler,
				["candidateHandlerId"] = p40.candidateHandlerId
			}))
		end
	}
	return v_u_4.createElement(v_u_7.Consumer, v41)
end or v_u_9