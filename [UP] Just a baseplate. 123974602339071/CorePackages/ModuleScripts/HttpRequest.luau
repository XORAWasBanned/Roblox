-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest
return {
	["config"] = require(script.httpRequestCreator),
	["requestFunctions"] = require(script.RequestFunctions),
	["startNewSession"] = require(script.HttpSession).startNewSession
}