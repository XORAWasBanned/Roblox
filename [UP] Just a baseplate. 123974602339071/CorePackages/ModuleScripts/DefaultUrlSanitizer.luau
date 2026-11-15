-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.renderer.html.DefaultUrlSanitizer
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.renderer.html.UrlSanitizer)
local v_u_2 = string.byte
local v_u_3 = string.gsub
local v_u_4 = string.lower
local v_u_5 = string.sub
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	return v_u_6.newCollection({
		"http",
		"https",
		"mailto",
		"data"
	})
end
function v_u_6.newCollection(p7) -- name: newCollection
	-- upvalues: (copy) v_u_6
	local v8 = {}
	for _, v9 in ipairs(p7) do
		v8[v9] = true
	end
	local v10 = v_u_6
	return setmetatable({
		["_protocols"] = v8
	}, v10)
end
function v_u_6.sanitizeLinkUrl(p11, p12) -- name: sanitizeLinkUrl
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v13 = p11:stripHtmlSpaces(p12)
	for v14 = 0, #v13 - 1 do
		local v15 = v_u_2(v13, v14 + 1)
		if v15 ~= 47 and v15 ~= 35 then
			if v15 == 63 then
				return v13
			end
			if v15 ~= 58 then
				continue
			end
			local v16 = v_u_3(v_u_4((v_u_5(v13, 1, v14))), "\226\132\170", "k")
			if not p11._protocols[v16] then
				return ""
			end
		end
	end
	return v13
end
function v_u_6.sanitizeImageUrl(p17, p18) -- name: sanitizeImageUrl
	return p17:sanitizeLinkUrl(p18)
end
function v_u_6.stripHtmlSpaces(p19, p20) -- name: stripHtmlSpaces
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v21 = #p20
	local v22 = 0
	while v22 < v21 and p19:isHtmlSpace(v_u_2(p20, v21 - 1 + 1)) do
		v21 = v21 - 1
	end
	while v22 < v21 and p19:isHtmlSpace(v_u_2(p20, v22 + 1)) do
		v22 = v22 + 1
	end
	if v22 == 0 and v21 == #p20 then
		return p20
	else
		return v_u_5(p20, v22 + 1, v21)
	end
end
function v_u_6.isHtmlSpace(_, p23) -- name: isHtmlSpace
	return (p23 == 32 or (p23 == 9 or (p23 == 10 or p23 == 12))) and true or p23 == 13
end
return v_u_6