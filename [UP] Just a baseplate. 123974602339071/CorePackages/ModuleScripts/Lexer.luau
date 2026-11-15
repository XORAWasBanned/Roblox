-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Utils.Highlighter.Lexer
local v_u_1 = {}
local v2 = require(script.Language)
local v_u_3 = v2.keyword
local v_u_4 = v2.builtin
local v_u_5 = v2.libraries
v_u_1.language = v2
local v_u_6 = {}
local v_u_7 = {}
for v8, v9 in {
	{ "^[%c%s]*[%a_][%w_]*[%c%s]*", "var" },
	{ "^[%c%s]*0[xX][%da-fA-F_]+[%c%s]*", "number" },
	{ "^[%c%s]*0[bB][01_]+[%c%s]*", "number" },
	{ "^[%c%s]*%d+%.?%d*[eE][%+%-]?%d+[%c%s]*", "number" },
	{ "^[%c%s]*%d+[%._]?[%d_eE]*[%c%s]*", "number" },
	{ "^[%c%s]*([\'\"])%1[%c%s]*", "string" },
	{ "^[%c%s]*([\'\"])[^\n]-([^\\]%1)[%c%s]*", "string" },
	{ "^[%c%s]*([\'\"]).-\n[%c%s]*", "string" },
	{ "^[%c%s]*([\'\"])[^\n]*[%c%s]*", "string" },
	{ "^[%c%s]*%[(=*)%[.-%]%1%][%c%s]*", "string" },
	{ "^[%c%s]*%[=*%[.-.*[%c%s]*", "string" },
	{ "^[%c%s]*`[^\n]-`[%c%s]*", "string_inter" },
	{ "^[%c%s]*%-%-%[(=*)%[.-%]%1%][%c%s]*", "comment" },
	{ "^[%c%s]*%-%-%[=*%[.-.*[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.-\n[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.*[%c%s]*", "comment" },
	{ "^[%c%s]*[:;<>/~%*%(%)%-={},%.#%^%+%%]+[%c%s]*", "operator" },
	{ "^[%c%s]*[%[%]]+[%c%s]*", "operator" },
	{ "^[%c%s]*[%z\1-\127\194-\244][\128-\191]+[%c%s]*", "iden" },
	{ "^.", "iden" }
} do
	v_u_6[v8] = v9[1]
	v_u_7[v8] = v9[2]
end
function v_u_1.scan(p_u_10) -- name: scan
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_1
	local v_u_11 = 1
	local v_u_12 = #p_u_10
	local v_u_13 = ""
	local v_u_14 = ""
	local v_u_15 = ""
	local v_u_16 = ""
	local v_u_40 = coroutine.create(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_12, (ref) v_u_6, (copy) p_u_10, (ref) v_u_7, (ref) v_u_3, (ref) v_u_4, (ref) v_u_13, (ref) v_u_16, (ref) v_u_14, (ref) v_u_5, (ref) v_u_15, (ref) v_u_1
		-- block 38
		if v_u_11 > v_u_12 then
			return
		end
		local v17, v18, v19
		-- GenericForInit
v17, v18, v19 = ipairs(v_u_6)
[internal control] = v19
-- end GenericForInit
		local v20 = false
		local v21, v22
		-- GenericForNext
v21, v22 = v17(v18, [internal control])
if v21 ~= nil
[internal control] = v21
-- end GenericForNext
		::l3::
		local v23, v24 = string.find(p_u_10, v22, v_u_11)
		if v23 == nil then
			continue
		end
		v_u_11 = v24 + 1
		v20 = true
		local v25 = p_u_10
		local v26 = string.sub(v25, v23, v24)
		local v27 = v_u_7[v21]
		local v28
		if v27 == "var" then
			local v29 = string.gsub(v26, "[%c%s]+", "")
			if v_u_3[v29] then
				v28 = "keyword"
			elseif v_u_4[v29] then
				v28 = "builtin"
			elseif string.find(v_u_13, "%.[%s%c]*$") and v_u_16 ~= "comment" then
				local v30 = v_u_5[string.gsub(v_u_14, "[%c%s]+", "")]
				if v30 and (v30[v29] and not string.find(v_u_15, "%.[%s%c]*$")) then
					v28 = "builtin"
				else
					v28 = "iden"
				end
			else
				v28 = "iden"
			end
		elseif v27 == "string_inter" then
			if string.find(v26, "[^\\]{") then
				local v31 = #v26
				local v32 = 1
				local v33 = true
				v28 = nil
				while v32 <= v31 do
					local v34, v35 = string.find(v26, "^.-[^\\][{}]", v32)
					if v34 == nil then
						coroutine.yield("string", (string.sub(v26, v32)))
						break
					end
					if v33 then
						v32 = v35 + 1
						coroutine.yield("string", (string.sub(v26, v34, v35)))
						v33 = false
					else
						local v36 = v35 - 1
						local v37 = string.sub(v26, v34, v36)
						v32 = v35
						for v38, v39 in v_u_1.scan(v37) do
							coroutine.yield(v38, v39)
							v35 = v32
							v32 = v35
						end
						v33 = true
					end
				end
			else
				v28 = "string"
			end
		else
			v28 = v27
		end
		v_u_15 = v_u_14
		v_u_14 = v_u_13
		v_u_13 = v26
		v_u_16 = v28 or v27
		if v28 then
			coroutine.yield(v28, v26)
		end
		if v20 then
			break
		end
		return
		-- block 7
		goto l3
		::l10::
		if v20 then
			break
		end
		return
		-- block 34
		goto l10
	end)
	return function()
		-- upvalues: (copy) v_u_40
		if coroutine.status(v_u_40) ~= "dead" then
			local v41, v42, v43 = coroutine.resume(v_u_40)
			if v41 and v42 then
				return v42, v43
			end
		end
	end
end
function v_u_1.navigator() -- name: navigator
	-- upvalues: (copy) v_u_1
	local v_u_61 = {
		["Source"] = "",
		["TokenCache"] = nil,
		["_RealIndex"] = 0,
		["_UserIndex"] = 0,
		["_ScanThread"] = nil,
		["TokenCache"] = table.create(50),
		["Destroy"] = function(p44) -- name: Destroy
			p44.Source = nil
			p44._RealIndex = nil
			p44._UserIndex = nil
			p44.TokenCache = nil
			p44._ScanThread = nil
		end,
		["SetSource"] = function(p_u_45, p46) -- name: SetSource
			-- upvalues: (ref) v_u_1
			p_u_45.Source = p46
			p_u_45._RealIndex = 0
			p_u_45._UserIndex = 0
			table.clear(p_u_45.TokenCache)
			p_u_45._ScanThread = coroutine.create(function()
				-- upvalues: (ref) v_u_1, (copy) p_u_45
				for v47, v48 in v_u_1.scan(p_u_45.Source) do
					local v49 = p_u_45
					v49._RealIndex = v49._RealIndex + 1
					p_u_45.TokenCache[p_u_45._RealIndex] = { v47, v48 }
					coroutine.yield(v47, v48)
				end
			end)
		end,
		["Next"] = function() -- name: Next
			-- upvalues: (copy) v_u_61
			local v50 = v_u_61
			v50._UserIndex = v50._UserIndex + 1
			if v_u_61._RealIndex >= v_u_61._UserIndex then
				local v51 = v_u_61.TokenCache[v_u_61._UserIndex]
				return table.unpack(v51)
			elseif coroutine.status(v_u_61._ScanThread) ~= "dead" then
				local v52, v53, v54 = coroutine.resume(v_u_61._ScanThread)
				if v52 and v53 then
					return v53, v54
				end
			end
		end,
		["Peek"] = function(p55) -- name: Peek
			-- upvalues: (copy) v_u_61
			local v56 = v_u_61._UserIndex + p55
			if v56 <= v_u_61._RealIndex then
				if v56 > 0 then
					local v57 = v_u_61.TokenCache[v56]
					return table.unpack(v57)
				end
			elseif coroutine.status(v_u_61._ScanThread) ~= "dead" then
				local v58 = nil
				local v59 = nil
				for _ = 1, v56 - v_u_61._RealIndex do
					local v60
					v60, v58, v59 = coroutine.resume(v_u_61._ScanThread)
					if v60 or v58 then
						continue
					end
				end
				return v58, v59
			end
		end
	}
	return v_u_61
end
return v_u_1