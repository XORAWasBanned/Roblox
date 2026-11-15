-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeParsingUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(script.Parent.DateTimeEqualityUtilities)
local v_u_3 = require(v1.Enums.DateTimePickerVariant)
local v_u_4 = require(script.Parent.Parent.DateTimeUtilities)
local function v_u_17(p5) -- name: parseTimeFromText
	local v6 = p5:gsub("%s+", "")
	local v7 = string.match(v6, "^%d%d:%d%d$")
	local v8 = string.match(v6, "^%d%d?:%d%d[AP]M$")
	if v7 or v8 then
		if v8 then
			local v9, v10 = string.match(v6, "^(%d%d?):(%d%d)[AP]M$")
			local v11 = tonumber(v9)
			local v12 = tonumber(v10)
			if v11 and (v12 and (v11 >= 1 and (v11 <= 12 and (v12 >= 0 and v12 <= 59)))) then
				if string.sub(v6, -2) == "PM" and v11 ~= 12 then
					return v11 + 12, v12
				elseif string.sub(v6, -2) == "AM" and v11 == 12 then
					return 0, v12
				else
					return v11, v12
				end
			else
				return nil
			end
		else
			local v13, v14 = string.match(v6, "^(%d%d?):(%d%d)$")
			local v15 = tonumber(v13)
			local v16 = tonumber(v14)
			if v15 and (v16 and (v15 >= 0 and (v15 <= 23 and (v16 >= 0 and v16 <= 59)))) then
				return v15, v16
			else
				return nil
			end
		end
	else
		return nil
	end
end
local function v_u_20(p18) -- name: adjustForDaylightSaving
	local v19 = os.date("*t", p18.UnixTimestamp)
	if v19 and v19.isdst then
		return DateTime.fromUnixTimestamp(p18.UnixTimestamp - 3600)
	else
		return p18
	end
end
local function v_u_35(p21) -- name: parseDateTimeFromText
	-- upvalues: (copy) v_u_17, (copy) v_u_20
	local v22
	if string.find(p21, ",") then
		p21, v22 = p21:match("^([^,]+),%s*(.+)$")
	else
		v22 = "00:00"
	end
	if p21 and v22 then
		local v_u_23 = p21:gsub("%s+", "")
		local v_u_24, v_u_25 = v_u_17(v22)
		if v_u_24 == nil or v_u_25 == nil then
			return nil
		else
			local v_u_26 = v_u_23:find("[/%.%-]")
			local v33, v34 = pcall(function()
				-- upvalues: (copy) v_u_26, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25
				if v_u_26 == 3 then
					local v27, v28, v29 = v_u_23:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
					return DateTime.fromLocalTime(tonumber(v29), tonumber(v27), tonumber(v28), v_u_24, v_u_25, 0)
				end
				if v_u_26 == 5 then
					local v30, v31, v32 = v_u_23:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
					return DateTime.fromLocalTime(tonumber(v30), tonumber(v31), tonumber(v32), v_u_24, v_u_25, 0)
				end
				error("Invalid date format: " .. v_u_23)
			end)
			if v33 and v34 then
				return v_u_20(v34)
			else
				return nil
			end
		end
	else
		return nil
	end
end
return {
	["adjustForDaylightSaving"] = v_u_20,
	["formatInputText"] = function(p36) -- name: formatInputText
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v37 = p36.dates[1]
		if v37 then
			if p36.variant == v_u_3.Dual and true or p36.variant == v_u_3.DualWithPresets then
				local v38 = p36.dates[2]
				return ("%* - %*"):format(v_u_4.formatLocalTime(v37), not v38 and "" or v_u_4.formatLocalTime(v38))
			else
				local v39 = p36.variant == v_u_3.SingleWithTime
				return v_u_4.formatLocalTime(v37, v39)
			end
		else
			return ""
		end
	end,
	["parseDateTimeFromText"] = v_u_35,
	["parseDualInputEndpoints"] = function(p40) -- name: parseDualInputEndpoints
		-- upvalues: (copy) v_u_35
		local v41 = p40:split(" - ")
		local v42
		if v41[1] then
			v42 = v_u_35((v41[1]:gsub("^%s*(.-)%s*$", "%1")))
		else
			v42 = nil
		end
		if v41[2] then
			return v42, v_u_35((v41[2]:gsub("^%s*(.-)%s*$", "%1")))
		else
			return v42, nil
		end
	end,
	["parseInputToDraftDates"] = function(p43, p44) -- name: parseInputToDraftDates
		-- upvalues: (copy) v_u_35, (copy) v_u_4, (copy) v_u_2
		if #p43:split(" - ") ~= 2 then
			return nil
		end
		local v45 = p43:split(" - ")
		local v46
		if v45[1] then
			v46 = v_u_35((v45[1]:gsub("^%s*(.-)%s*$", "%1")))
		else
			v46 = nil
		end
		local v47
		if v45[2] then
			v47 = v_u_35((v45[2]:gsub("^%s*(.-)%s*$", "%1")))
		else
			v47 = nil
		end
		if not (v46 and v47) then
			return nil
		end
		if v_u_4.roundToStartOfDay(v46) <= v_u_4.roundToStartOfDay(v47) then
			local v48 = v46
			v46 = v47
			v47 = v48
		end
		return (not p44 or v_u_2.isRangeWithinSelectableRange({
			["startDate"] = v47,
			["endDate"] = v46
		}, p44)) and { v47, v46 } or nil
	end,
	["trimInputText"] = function(p49) -- name: trimInputText
		return p49:gsub("^%s*(.-)%s*$", "%1")
	end
}