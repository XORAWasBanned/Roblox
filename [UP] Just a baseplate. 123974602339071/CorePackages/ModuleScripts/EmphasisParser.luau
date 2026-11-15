-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.EmphasisParser
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = require(script.Parent.Utils)
local v_u_78 = {
	["collectDelimiterRun"] = function(p3, p4, p5) -- name: collectDelimiterRun
		-- upvalues: (copy) v_u_2
		local v6 = p4.length
		local v7 = p5 + 1
		while v7 <= #p3 do
			local v8 = v_u_2.getDelimiterInfo(p3[v7].name)
			if not v8 or v8.char ~= p4.char then
				break
			end
			v6 = v6 + v8.length
			v7 = v7 + 1
		end
		local v9 = nil
		local v10 = p3[p5]
		local v11
		if v10 and v10.context then
			v11 = v10.context.prevChar
		else
			v11 = nil
		end
		local v12 = p3[v7 - 1]
		if v12 and v12.context then
			v9 = v12.context.nextChar
		end
		return {
			["char"] = p4.char,
			["prevChar"] = v11,
			["nextChar"] = v9,
			["length"] = v6,
			["startIdx"] = p5,
			["endIdx"] = v7 - 1
		}
	end,
	["processEmphasisRun"] = function(p13, p14, p15) -- name: processEmphasisRun
		-- upvalues: (copy) v_u_2, (copy) v_u_78
		local v16 = 1
		local v17 = {}
		local v18 = {}
		local v19 = {}
		while p14 <= p15 do
			local v20 = p13[p14]
			local v21 = v_u_2.getDelimiterInfo(v20.name)
			if v21 then
				local v22 = v_u_78.collectDelimiterRun(p13, v21, p14)
				local v23 = v_u_2.canOpenEmphasis(v22)
				local v24 = v_u_2.canCloseEmphasis(v22)
				local v25 = {
					["char"] = v22.char,
					["runLength"] = v22.length,
					["origRunLength"] = v22.length,
					["canOpen"] = v23,
					["canClose"] = v24,
					["startIdx"] = v16,
					["tokenStart"] = v22.startIdx
				}
				table.insert(v17, v25)
				v18[v16] = {
					["name"] = "DELIMITER_RUN",
					["text"] = "",
					["delimiterIndex"] = nil,
					["offset"] = nil,
					["delimiterIndex"] = #v17,
					["offset"] = p13[v22.startIdx].offset
				}
				v16 = v16 + 1
				p14 = v22.endIdx + 1
			else
				v18[v16] = v20
				if v_u_2.causesLineBreak(v20) then
					table.insert(v19, p14)
				end
				v16 = v16 + 1
				p14 = p14 + 1
			end
		end
		local v26 = false
		for v27 = p15 + 1, #p13 do
			if not v_u_2.causesLineBreak(p13[v27]) then
				continue
			end
			v26 = true
		end
		local v28 = {}
		for v29, v30 in v17 do
			if v30.canClose and v30.runLength > 0 then
				local v31 = #v28
				while v31 >= 1 do
					local v32 = v17[v28[v31]]
					if v32.char == "`" and (v30.char ~= "`" and v32.canOpen) then
						break
					end
					if v32.char == v30.char and (v32.canOpen and v32.runLength > 0) then
						if v_u_2.canDelimitersMatch(v32, v30) then
							local v33 = v32.runLength
							local v34 = v30.runLength
							local v35 = math.min(2, v33, v34)
							v_u_2.addDelimiterMatch(v32, {
								["with"] = nil,
								["length"] = nil,
								["isOpener"] = true,
								["with"] = v30,
								["length"] = v35
							})
							v_u_2.addDelimiterMatch(v30, {
								["with"] = nil,
								["length"] = nil,
								["isOpener"] = false,
								["with"] = v32,
								["length"] = v35
							})
							v32.runLength = v32.runLength - v35
							v30.runLength = v30.runLength - v35
							for _ = #v28, v31 + 1, -1 do
								table.remove(v28)
							end
							if v32.runLength == 0 then
								table.remove(v28, v31)
							end
							if v30.runLength == 0 then
								break
							end
							v31 = #v28
						else
							v31 = v31 - 1
						end
					else
						v31 = v31 - 1
					end
				end
			end
			if not v30.canOpen or v30.runLength <= 0 then
				continue
			end
			table.insert(v28, v29)
		end
		local v36 = {}
		for v37, v38 in v18 do
			if v38.name == "DELIMITER_RUN" then
				local v39 = v17[v38.delimiterIndex]
				local v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55
				if v39.char == "`" and (v39.runLength > 0 and (v38.delimiterIndex == #v17 and (not v26 and v37 < #v18))) then
					local v56 = false
					for v57 = #v19, 1, -1 do
						local v58 = v19[v57]
						if v39.tokenStart < v58 then
							v56 = true
						elseif v58 > v39.tokenStart then
							continue
						end
					end
					if v56 then
						v40 = v39.matches
						if v40 and #v40 ~= 0 then
							if v40[1].isOpener then
								v41 = 0
								for v69, v70 in v40 do
									v41 = v41 + v70.length
								end
								v42 = v39.origRunLength - v41
								if v42 > 0 then
									v43 = {
										["name"] = "TEXT",
										["text"] = nil,
										["offset"] = nil,
										["text"] = string.rep(v39.char, v42),
										["offset"] = v38.offset
									}
									table.insert(v36, v43)
								end
								for v71, v72 in v40 do
									v44 = v72.length
									while v44 > 0 do
										v45 = math.min(v44, 2)
										v46 = {
											["name"] = "EMPHASIS_START",
											["text"] = nil,
											["offset"] = nil,
											["text"] = v_u_2.getTokenNameFromCharAndLength(v39.char, v45),
											["offset"] = v38.offset
										}
										table.insert(v36, v46)
										v44 = v44 - v45
									end
								end
							else
								v47 = {}
								for v73, v74 in v40 do
									v48 = v74.length
									while v48 > 0 do
										v49 = math.min(v48, 2)
										v50 = {
											["name"] = "EMPHASIS_END",
											["text"] = "",
											["offset"] = nil,
											["offset"] = v38.offset
										}
										table.insert(v47, v50)
										v48 = v48 - v49
									end
								end
								for v75 = #v47, 1, -1 do
									v51 = v47[v75]
									table.insert(v36, v51)
								end
								v52 = 0
								for v76, v77 in v40 do
									v52 = v52 + v77.length
								end
								v53 = v39.origRunLength - v52
								if v53 <= 0 then
									break
								end
								v54 = {
									["name"] = "TEXT",
									["text"] = nil,
									["offset"] = nil,
									["text"] = string.rep(v39.char, v53),
									["offset"] = v38.offset
								}
								table.insert(v36, v54)
							end
						else
							v55 = {
								["name"] = "TEXT",
								["text"] = nil,
								["offset"] = nil,
								["text"] = string.rep(v39.char, v39.origRunLength),
								["offset"] = v38.offset
							}
							table.insert(v36, v55)
						end
					else
						local v68 = {
							["name"] = "EMPHASIS_START",
							["text"] = "INLINE_CODE",
							["offset"] = nil,
							["offset"] = p13[v39.tokenStart].offset
						}
						table.insert(v36, v68)
					end
				else
					v40 = v39.matches
					if v40 and #v40 ~= 0 then
						if v40[1].isOpener then
							v41 = 0
							for v69, v70 in v40 do
								v41 = v41 + v70.length
							end
							v42 = v39.origRunLength - v41
							if v42 > 0 then
								v43 = {
									["name"] = "TEXT",
									["text"] = nil,
									["offset"] = nil,
									["text"] = string.rep(v39.char, v42),
									["offset"] = v38.offset
								}
								table.insert(v36, v43)
							end
							for v71, v72 in v40 do
								v44 = v72.length
								while v44 > 0 do
									v45 = math.min(v44, 2)
									v46 = {
										["name"] = "EMPHASIS_START",
										["text"] = nil,
										["offset"] = nil,
										["text"] = v_u_2.getTokenNameFromCharAndLength(v39.char, v45),
										["offset"] = v38.offset
									}
									table.insert(v36, v46)
									v44 = v44 - v45
								end
							end
						else
							v47 = {}
							for v73, v74 in v40 do
								v48 = v74.length
								while v48 > 0 do
									v49 = math.min(v48, 2)
									v50 = {
										["name"] = "EMPHASIS_END",
										["text"] = "",
										["offset"] = nil,
										["offset"] = v38.offset
									}
									table.insert(v47, v50)
									v48 = v48 - v49
								end
							end
							for v75 = #v47, 1, -1 do
								v51 = v47[v75]
								table.insert(v36, v51)
							end
							v52 = 0
							for v76, v77 in v40 do
								v52 = v52 + v77.length
							end
							v53 = v39.origRunLength - v52
							if v53 <= 0 then
								break
							end
							v54 = {
								["name"] = "TEXT",
								["text"] = nil,
								["offset"] = nil,
								["text"] = string.rep(v39.char, v53),
								["offset"] = v38.offset
							}
							table.insert(v36, v54)
						end
					else
						v55 = {
							["name"] = "TEXT",
							["text"] = nil,
							["offset"] = nil,
							["text"] = string.rep(v39.char, v39.origRunLength),
							["offset"] = v38.offset
						}
						table.insert(v36, v55)
					end
				end
			else
				table.insert(v36, v38)
			end
		end
		return v36
	end
}
return v_u_78