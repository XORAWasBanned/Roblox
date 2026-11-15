-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Models.CollectibleInstance
return {
	["new"] = function() -- name: new
		return {}
	end,
	["fromGetCollectibleItemInstances"] = function(p1) -- name: fromGetCollectibleItemInstances
		return {
			["collectibleInstanceId"] = p1.collectibleInstanceId,
			["collectibleItemId"] = p1.collectibleItemId,
			["collectibleProductId"] = p1.collectibleProductId,
			["serialNumber"] = p1.serialNumber,
			["instanceState"] = p1.instanceState,
			["saleState"] = p1.saleState,
			["price"] = p1.price
		}
	end
}