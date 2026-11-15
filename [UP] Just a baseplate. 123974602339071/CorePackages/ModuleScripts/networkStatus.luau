-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.networkStatus
-- https://lua.expert

return {
    NetworkStatus = {
        loading = 1,
        setVariables = 2,
        fetchMore = 3,
        refetch = 4,
        poll = 6,
        ready = 7,
        error = 8
    },
    isNetworkRequestInFlight = function(p1) -- isNetworkRequestInFlight | line: 65
        if p1 then
            return p1 < 7
        end

        return false
    end
}
