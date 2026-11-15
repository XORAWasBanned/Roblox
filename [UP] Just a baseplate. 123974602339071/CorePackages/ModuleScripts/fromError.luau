-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.utils.fromError
-- https://lua.expert

local Observable = require(script.Parent.Parent.Parent.utilities).Observable

return {
    fromError = function(p1) -- fromError | line: 17
        -- upvalues: Observable (copy)
        return Observable.new(function(p2) -- line: 18
            -- upvalues: p1 (copy)
            p2:error(p1)
        end)
    end
}
