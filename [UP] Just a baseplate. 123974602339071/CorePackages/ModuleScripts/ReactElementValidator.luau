-- Path: CorePackages.Packages._Index.React.React.ReactElementValidator
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v3 = require(v1.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Boolean
local v_u_6 = v3.Object
local v_u_7 = require(v1.Shared).console
local v_u_8 = v3.util.inspect
require(v1.Shared)
local v_u_9 = require(v1.Shared).isValidElementType
local v_u_10 = require(v1.Shared).getComponentName
local v11 = require(v1.Shared).ReactSymbols
local v_u_12 = v11.getIteratorFn
local _ = v11.REACT_FORWARD_REF_TYPE
local _ = v11.REACT_MEMO_TYPE
local v_u_13 = v11.REACT_FRAGMENT_TYPE
local v_u_14 = v11.REACT_ELEMENT_TYPE
local v_u_15 = require(v1.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local v_u_16 = require(v1.Shared).checkPropTypes
local v_u_17 = require(v1.Shared).ReactSharedInternals.ReactCurrentOwner
local v18 = require(script.Parent.ReactElement)
local v_u_19 = v18.isValidElement
local v_u_20 = v18.createElement
local v_u_21 = v18.cloneElement
local v_u_22 = v18.jsxDEV
local v_u_23 = require(v1.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local v_u_24 = require(v1.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV
local v25 = {}
local v_u_26
if v_u_2.__DEV__ then
	v_u_26 = false
else
	v_u_26 = nil
end
local v_u_27 = {}
local function v_u_32(p28) -- name: getCurrentComponentErrorInfo
	-- upvalues: (copy) v_u_17, (copy) v_u_10, (copy) v_u_5
	local v29 = v_u_17.current and v_u_10(v_u_17.current.type)
	local v30 = not v29 and "" or "\n\nCheck the render method of `" .. v29 .. "`."
	if not v_u_5.toJSBoolean(v30) then
		local v31
		if typeof(p28) == "string" then
			v31 = p28
		elseif typeof(p28) == "table" then
			v31 = p28.displayName or p28.name
		else
			v31 = nil
		end
		if not v31 and typeof(p28) == "function" then
			v31 = debug.info(p28, "n")
			if v31 == "" then
				v31 = nil
			end
		end
		if v31 then
			v30 = string.format("\n\nCheck the top-level render call using <%s>.", v31)
		end
	end
	return v30
end
local function v_u_45(p33, p34, p35) -- name: validateExplicitKey
	-- upvalues: (copy) v_u_32, (copy) v_u_27, (copy) v_u_17, (copy) v_u_10, (copy) v_u_2, (copy) v_u_24, (copy) v_u_23, (copy) v_u_7
	if p33._store == nil or p33._store.validated then
		return
	else
		p33._store.validated = true
		if p33.key ~= nil == (p35 ~= nil) then
			local v36 = v_u_32(p34)
			if not v_u_27[v36] then
				v_u_27[v36] = true
				local v37
				if p33 and (p33._owner and p33._owner ~= v_u_17.current) then
					local v38 = string.format
					local v39 = v_u_10
					local v40 = p33._owner.type
					v37 = v38(" It was passed a child from %s.", (tostring(v39(v40))))
				else
					v37 = ""
				end
				if v_u_2.__DEV__ then
					if v_u_2.__DEV__ then
						if p33 then
							local v41 = p33._owner
							local v42
							if v41 then
								v42 = v41.type
							else
								v42 = nil
							end
							v_u_23((v_u_24(p33.type, p33._source, v42)))
						else
							v_u_23(nil)
						end
					end
					if p33.key == nil or p35 == nil then
						v_u_7.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v36, v37)
					else
						local v43 = v_u_7.error
						local v44 = p33.key
						v43("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v44), tostring(p35), v36, v37)
					end
					if v_u_2.__DEV__ then
						v_u_23(nil)
					end
				end
			end
		else
			return
		end
	end
end
local function v_u_53(p46, p47) -- name: validateChildKeys
	-- upvalues: (copy) v_u_4, (copy) v_u_19, (copy) v_u_45, (copy) v_u_12
	if typeof(p46) == "table" then
		if v_u_4.isArray(p46) then
			for v48 = 1, #p46 do
				local v49 = p46[v48]
				if not v_u_19(v49) then
					continue
				end
				v_u_45(v49, p47)
			end
		elseif v_u_19(p46) then
			if p46._store then
				p46._store.validated = true
				return
			end
		elseif p46 then
			local v50 = v_u_12(p46)
			if typeof(v50) == "function" and v50 ~= p46.entries then
				local v51 = v50(p46)
				local v52 = v51.next()
				while not v52.done do
					if v_u_19(v52.value) then
						v_u_45(v52.value, p47, v52.key)
					end
					v52 = v51.next()
				end
			end
		end
	else
		return
	end
end
local function v_u_60(p54) -- name: validatePropTypes
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_16, (ref) v_u_26, (copy) v_u_7
	if v_u_2.__DEV__ or v_u_2.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local v55 = p54.type
		if v55 == nil or typeof(v55) == "string" then
			return
		end
		if typeof(v55) == "function" then
			return
		end
		if typeof(v55) ~= "table" then
			return
		end
		local v56 = v55.propTypes
		local v57 = v55.validateProps
		if v56 or v57 then
			local v58 = v_u_10(v55)
			v_u_16(v56, v57, p54.props, "prop", v58, p54)
		elseif v55.PropTypes ~= nil and not v_u_26 then
			v_u_26 = true
			local v59 = v_u_10(v55)
			v_u_7.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v59 or "Unknown")
		end
		if v55.getDefaultProps ~= nil then
			v_u_7.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
		end
	end
end
local function v_u_69(p61) -- name: validateFragmentProps
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_24, (copy) v_u_23, (copy) v_u_7
	if v_u_2.__DEV__ then
		local v62 = v_u_6.keys(p61.props)
		for v63 = 1, #v62 do
			local v64 = v62[v63]
			if v64 == "children" or v64 == "key" then
				continue
			end
			if v_u_2.__DEV__ then
				if p61 then
					local v65 = p61._owner
					local v66
					if v65 then
						v66 = v65.type
					else
						v66 = nil
					end
					v_u_23((v_u_24(p61.type, p61._source, v66)))
				else
					v_u_23(nil)
				end
			end
			v_u_7.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", v64)
			if v_u_2.__DEV__ then
				v_u_23(nil)
			end
		end
		if p61.ref ~= nil then
			if v_u_2.__DEV__ then
				if p61 then
					local v67 = p61._owner
					local v68
					if v67 then
						v68 = v67.type
					else
						v68 = nil
					end
					v_u_23((v_u_24(p61.type, p61._source, v68)))
				else
					v_u_23(nil)
				end
			end
			v_u_7.error("Invalid attribute `ref` supplied to `React.Fragment`.")
			if v_u_2.__DEV__ then
				v_u_23(nil)
			end
		end
	end
end
local function v_u_85(p70, p71, p72, p73, p74, p75) -- name: jsxWithValidation
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_17, (copy) v_u_10, (copy) v_u_4, (copy) v_u_14, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_22, (copy) v_u_53, (copy) v_u_15, (copy) v_u_13, (copy) v_u_69, (copy) v_u_60
	local v76 = v_u_9(p70)
	if not v76 then
		local v77 = ""
		if p70 == nil or typeof(p70) == "table" and #v_u_6.keys(p70) == 0 then
			v77 = v77 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
		end
		local v78 = p74 == nil and "" or "\n\nCheck your code at " .. string.gsub(p74.fileName, "^.*[\\/]", "") .. ":" .. p74.lineNumber .. "."
		local v79
		if v78 then
			v79 = v77 .. v78
		else
			local v80 = v_u_17.current and v_u_10(v_u_17.current.type)
			v79 = v77 .. (not v80 and "" or "\n\nCheck the render method of `" .. v80 .. "`.")
		end
		local v81
		if p70 == nil then
			v81 = "nil"
		elseif v_u_4.isArray(p70) then
			v81 = "array"
		elseif typeof(p70) == "table" and p70["$$typeof"] == v_u_14 then
			v81 = string.format("<%s />", v_u_10(p70.type) or "Unknown")
			v79 = v79 .. " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			v81 = typeof(p70)
			v79 = v79 .. "\n" .. v_u_8(p70)
		end
		if v_u_2.__DEV__ then
			v_u_7.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v81, v79)
		end
	end
	local v82 = v_u_22(p70, p71, p72, p74, p75)
	if v82 == nil then
		return v82
	else
		if v76 then
			local v83 = p71.children
			if v83 ~= nil then
				if p73 then
					if v_u_4.isArray(v83) then
						for v84 = 1, #v83 do
							v_u_53(v83[v84], p70)
						end
						v_u_6.freeze(v83)
					elseif v_u_2.__DEV__ then
						v_u_7.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
					end
				else
					v_u_53(v83, p70)
				end
			end
		end
		if v_u_2.__DEV__ and v_u_15 and p71.key ~= nil then
			v_u_7.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", v_u_10(p70) or "ComponentName")
		end
		if p70 == v_u_13 then
			v_u_69(v82)
			return v82
		else
			v_u_60(v82)
			return v82
		end
	end
end
v25.jsxWithValidation = v_u_85
function v25.jsxWithValidationStatic(p86, p87, p88)
	-- upvalues: (copy) v_u_85
	return v_u_85(p86, p87, p88, true)
end
function v25.jsxWithValidationDynamic(p89, p90, p91)
	-- upvalues: (copy) v_u_85
	return v_u_85(p89, p90, p91, false)
end
function v25.createElementWithValidation(p92, p93, ...) -- name: createElementWithValidation
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_17, (copy) v_u_10, (copy) v_u_4, (copy) v_u_14, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_20, (copy) v_u_53, (copy) v_u_13, (copy) v_u_69, (copy) v_u_60
	local v94 = v_u_9(p92)
	if not v94 then
		local v95 = ""
		if p92 == nil or typeof(p92) == "table" and #v_u_6.keys(p92) == 0 then
			v95 = v95 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
		end
		local v96
		if p93 == nil then
			v96 = ""
		else
			local v97 = p93.__source
			v96 = v97 == nil and "" or "\n\nCheck your code at " .. string.gsub(v97.fileName, "^.*[\\/]", "") .. ":" .. v97.lineNumber .. "."
		end
		local v98
		if v96 then
			v98 = v95 .. v96
		else
			local v99 = v_u_17.current and v_u_10(v_u_17.current.type)
			v98 = v95 .. (not v99 and "" or "\n\nCheck the render method of `" .. v99 .. "`.")
		end
		local v100
		if p92 == nil then
			v100 = "nil"
		elseif v_u_4.isArray(p92) then
			v100 = "array"
		elseif p92 == nil or (typeof(p92) ~= "table" or p92["$$typeof"] ~= v_u_14) then
			v100 = typeof(p92)
			if p92 ~= nil then
				v98 = v98 .. "\n" .. v_u_8(p92)
			end
		else
			v100 = string.format("<%s />", v_u_10(p92.type) or "Unknown")
			v98 = v98 .. " Did you accidentally export a JSX literal or Element instead of a component?"
		end
		if v_u_2.__DEV__ then
			v_u_7.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v100, v98)
		end
	end
	local v101 = v_u_20(p92, p93, ...)
	if v101 == nil then
		return v101
	else
		if v94 then
			for v102 = 1, select("#", ...) do
				v_u_53(select(v102, ...), p92)
			end
		end
		if p92 == v_u_13 then
			v_u_69(v101)
			return v101
		else
			v_u_60(v101)
			return v101
		end
	end
end
function v25.cloneElementWithValidation(p103, p104, ...)
	-- upvalues: (copy) v_u_21, (copy) v_u_53, (copy) v_u_60
	local v105 = { p103, p104, ... }
	local v106 = v_u_21(p103, p104, ...)
	for v107 = 3, #v105 do
		v_u_53(v105[v107], v106.type)
	end
	v_u_60(v106)
	return v106
end
return v25