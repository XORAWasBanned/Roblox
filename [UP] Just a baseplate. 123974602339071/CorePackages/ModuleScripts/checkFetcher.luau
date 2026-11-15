-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.checkFetcher
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Boolean = require(ParentParent2.LuauPolyfill).Boolean
local InvariantError = require(ParentParent.jsutils.invariant).InvariantError

return {
    checkFetcher = function(p1) -- checkFetcher | line: 22
        -- upvalues: Boolean (copy), InvariantError (copy)
        if not Boolean.toJSBoolean(p1) and typeof(_G.fetch) == "nil" then
            error(InvariantError.new("\n\"fetch\" has not been found globally and no fetcher has been configured. To fix this, install a fetch package (like https://www.npmjs.com/package/cross-fetch), instantiate the fetcher, and pass it into your HttpLink constructor. For example:\n\nimport fetch from 'cross-fetch';\nimport { ApolloClient, HttpLink } from '@apollo/client';\nconst client = new ApolloClient({\n  link: new HttpLink({ uri: '/graphql', fetch })\n});\n    "))
        end
    end
}
