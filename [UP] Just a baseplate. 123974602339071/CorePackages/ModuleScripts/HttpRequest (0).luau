-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.HttpRequest
local v1 = script:FindFirstAncestor("HttpRequest").Parent
local v_u_2 = require(v1.Cryo)
local v_u_3 = game:GetService("HttpService")
local v_u_4 = require(script.Parent.StatusCode)
local v_u_5 = require(script.Parent.HttpSession)
local v_u_6 = require(script.Parent.HttpResponse)
local v_u_7 = {
	[v_u_4.REQUEST_TIMEOUT] = true,
	[v_u_4.SERVICE_UNAVAILABLE] = true,
	[v_u_4.GATEWAY_TIMEOUT] = true
}
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10, p11, p12) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_8
	local v13 = p9 or {}
	local v14 = {
		["resolve"] = nil,
		["reject"] = nil,
		["retryCount"] = 0,
		["httpRequest"] = nil,
		["canceled"] = false,
		["requestFunction"] = nil,
		["postRequestFunction"] = nil,
		["url"] = nil,
		["requestMethod"] = nil,
		["options"] = nil,
		["waitImpl"] = nil,
		["maxRetryCount"] = nil,
		["maxWaitTime"] = nil,
		["session"] = nil,
		["requestFunction"] = v13.requestFunction,
		["postRequestFunction"] = v13.postRequestFunction,
		["url"] = p10,
		["requestMethod"] = p11,
		["options"] = v_u_2.Dictionary.join(v13.defaultOptions or {}, p12 or {}),
		["waitImpl"] = v13.waitImpl or delay,
		["maxRetryCount"] = v13.maxRetryCount or 4,
		["maxWaitTime"] = v13.maxWaitTime or 16,
		["session"] = v_u_5.currentSession()
	}
	local v15 = v_u_8
	setmetatable(v14, v15)
	return v14
end
function v_u_8.start(p16, p17, p18) -- name: start
	p16.resolve = p17
	p16.reject = p18
	p16:makeRequest()
end
function v_u_8.processResponse(p19, p20) -- name: processResponse
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v21 = v_u_3.JSONDecode
	local v22 = v_u_3
	local v23 = p20.Body
	local v24, v25 = pcall(v21, v22, v23)
	if v24 then
		if p19.postRequestFunction then
			local v26 = p19.postRequestFunction
			local v27 = {
				["url"] = p19.url,
				["requestMethod"] = p19.requestMethod,
				["options"] = p19.options,
				["retryCount"] = p19.retryCount
			}
			pcall(v26, p20, v27)
		end
		p19.resolve(v_u_6.success(p20.StatusCode, v25))
	else
		p19.reject(v_u_6.error(Enum.HttpError.OK))
	end
end
function v_u_8.retry(p28, p29, p30) -- name: retry
	p28.retryCount = p28.retryCount + 1
	if p28.retryCount > p28.maxRetryCount then
		p28.reject(p29)
	else
		if not p30 then
			local v31 = p28.retryCount
			p30 = math.pow(2, v31)
		end
		p28:wait(p30)
	end
end
function v_u_8.wait(p_u_32, p33) -- name: wait
	p_u_32.waitImpl(p33, function()
		-- upvalues: (copy) p_u_32
		p_u_32:makeRequest()
	end)
end
function v_u_8.makeRequest(p_u_34) -- name: makeRequest
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	if not p_u_34.canceled then
		p_u_34.httpRequest = p_u_34.requestFunction(p_u_34.url, p_u_34.requestMethod, p_u_34.options)
		p_u_34.httpRequest:Start(function(p35, p36)
			-- upvalues: (copy) p_u_34, (ref) v_u_5, (ref) v_u_7, (ref) v_u_4, (ref) v_u_6
			if p_u_34.session == v_u_5.currentSession() then
				if p35 then
					if p36.StatusCode >= 200 and p36.StatusCode < 400 then
						p_u_34:processResponse(p36)
						return
					elseif v_u_7[p36.StatusCode] then
						p_u_34:retry(p36)
						return
					elseif p36.StatusCode == v_u_4.TOO_MANY_REQUESTS and p36.Headers["Retry-After"] then
						local v37 = p36.Headers["Retry-After"]
						local v38 = tonumber(v37)
						if v38 == nil or v38 > p_u_34.maxWaitTime then
							p_u_34.reject(p36)
						else
							p_u_34:retry(p36, v38)
						end
					else
						p_u_34.reject(p36)
						return
					end
				else
					if not p_u_34.canceled then
						p_u_34:retry(v_u_6.error(p36.HttpError))
					end
					return
				end
			else
				warn("Http request aborted", p_u_34.url)
				return
			end
		end)
	end
end
function v_u_8.cancel(p39) -- name: cancel
	-- upvalues: (copy) v_u_6
	p39.canceled = true
	p39.reject(v_u_6.error(Enum.HttpError.Aborted))
	if p39.httpRequest then
		p39.httpRequest:Cancel()
	end
end
return v_u_8