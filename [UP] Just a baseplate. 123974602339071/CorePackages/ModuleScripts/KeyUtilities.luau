-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.KeyUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ColorNamespace)
local v_u_3 = require(v1.Enums.CursorType)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
return {
	["encodeKey"] = function(p4, p5, p6, p7, p8) -- name: encodeKey
		-- upvalues: (copy) v_u_2
		local v9 = p5 or UDim.new(0, 0)
		local v10 = p7 or p4.Stroke.Thicker
		local v11 = (p6 or p4.Size.Size_150) - v10
		local v12 = p8 or v_u_2.Color
		return v9.Scale .. " " .. v9.Offset .. " " .. v11 .. " " .. v10 .. " " .. v12
	end,
	["decodeKey"] = function(p13)
		if typeof(p13) == "string" then
			p13 = string.split(p13, " ")
		end
		local v14 = p13[1]
		local v15 = tonumber(v14)
		local v16 = p13[2]
		local v17 = tonumber(v16)
		local v18 = p13[3]
		local v19 = tonumber(v18)
		local v20 = p13[4]
		local v21 = tonumber(v20)
		local v22 = p13[5]
		local v23 = UDim.new
		local v24 = v17 + v19
		return v23(v15, (math.max(0, v24))), v19, v21, v22
	end,
	["encodeCursorTypeKey"] = function(p25, p26) -- name: encodeCursorTypeKey
		-- upvalues: (copy) v_u_2
		return p25 .. " " .. (p26 or v_u_2.Color)
	end,
	["decodeCursorTypeKey"] = function(p27) -- name: decodeCursorTypeKey
		if typeof(p27) == "string" then
			p27 = string.split(p27, " ")
		end
		return p27[1], p27[2]
	end,
	["migrateCursorType"] = function(p28) -- name: migrateCursorType
		-- upvalues: (copy) v_u_3
		local v29 = tostring(p28)
		return v_u_3[string.gsub(v29, v29:find("Kind") and "CursorKind%." or "CursorType%.", "")]
	end,
	["mapCursorToKey"] = function(p30, p31) -- name: mapCursorToKey
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		if typeof(p30) ~= "table" then
			if p30 ~= nil then
				if typeof(p30) ~= "userdata" then
					return p30 .. " " .. v_u_2.Color
				end
				local v32 = tostring(p30)
				return v_u_3[string.gsub(v32, v32:find("Kind") and "CursorKind%." or "CursorType%.", "")] .. " " .. v_u_2.Color
			end
			local v33 = UDim.new(0, 0)
			local v34 = p31.Stroke.Thicker
			local v35 = p31.Size.Size_150 - v34
			local v36 = v_u_2.Color
			return v33.Scale .. " " .. v33.Offset .. " " .. v35 .. " " .. v34 .. " " .. v36
		end
		local v37 = p30.radius
		local v38 = p30.offset
		local v39 = p30.borderWidth
		local v40 = v37 or UDim.new(0, 0)
		local v41 = v39 or p31.Stroke.Thicker
		local v42 = (v38 or p31.Size.Size_150) - v41
		local v43 = v_u_2.Color
		return v40.Scale .. " " .. v40.Offset .. " " .. v42 .. " " .. v41 .. " " .. v43
	end
}