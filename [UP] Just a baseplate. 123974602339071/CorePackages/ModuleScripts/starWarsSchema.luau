-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.__tests__.starWarsSchema
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Error, Map = LuauPolyfill.Error, LuauPolyfill.Map
local _ = require(ParentParent.jsutils.invariant).invariant
local GraphQLSchema = require(ParentParent.type.schema).GraphQLSchema
local GraphQLString = require(ParentParent.type.scalars).GraphQLString
local definition = require(ParentParent.type.definition)
local GraphQLList, GraphQLNonNull, GraphQLEnumType, GraphQLInterfaceType = definition.GraphQLList, definition.GraphQLNonNull, definition.GraphQLEnumType, definition.GraphQLInterfaceType
local GraphQLObjectType = definition.GraphQLObjectType
local starWarsData = require(script.Parent.starWarsData)
local getFriends, getHero, getHuman, getDroid = starWarsData.getFriends, starWarsData.getHero, starWarsData.getHuman, starWarsData.getDroid
local v1, v2, v3
local v4 = GraphQLEnumType.new({
    name = "Episode",
    description = "One of the films in the Star Wars Trilogy",
    values = Map.new({
        {
            "NEW_HOPE",
            {
                value = 4,
                description = "Released in 1977."
            }
        },
        {
            "EMPIRE",
            {
                value = 5,
                description = "Released in 1980."
            }
        },
        {
            "JEDI",
            {
                value = 6,
                description = "Released in 1983."
            }
        }
    })
})

v1 = GraphQLInterfaceType.new({
    name = "Character",
    description = "A character in the Star Wars Trilogy",
    fields = function() -- fields | line: 127
        -- upvalues: Map (copy), GraphQLString (copy), GraphQLList (copy), GraphQLNonNull (copy), v1 (ref), v4 (copy)
        return Map.new({
            {
                "id",
                {
                    description = "The id of the character.",
                    type = GraphQLNonNull.new(GraphQLString)
                }
            },
            {
                "name",
                {
                    description = "The name of the character.",
                    type = GraphQLString
                }
            },
            {
                "friends",
                {
                    description = "The friends of the character, or an empty list if they have none.",
                    type = GraphQLList.new(v1)
                }
            },
            {
                "appearsIn",
                {
                    description = "Which movies they appear in.",
                    type = GraphQLList.new(v4)
                }
            },
            {
                "secretBackstory",
                {
                    description = "All secrets about their past.",
                    type = GraphQLString
                }
            }
        })
    end,
    resolveType = function(p1) -- resolveType | line: 166
        -- upvalues: v2 (ref), v3 (ref)
        if p1.type == "Human" then
            return v2.name
        end

        if p1.type == "Droid" then
            return v3.name
        end

        assert(false)
    end
})
v2 = GraphQLObjectType.new({
    name = "Human",
    description = "A humanoid creature in the Star Wars universe.",
    fields = function() -- fields | line: 195
        -- upvalues: Error (copy), Map (copy), GraphQLString (copy), GraphQLList (copy), GraphQLNonNull (copy), getFriends (copy), v1 (ref), v4 (copy)
        return Map.new({
            {
                "id",
                {
                    description = "The id of the human.",
                    type = GraphQLNonNull.new(GraphQLString)
                }
            },
            {
                "name",
                {
                    description = "The name of the human.",
                    type = GraphQLString
                }
            },
            {
                "friends",
                {
                    description = "The friends of the human, or an empty list if they have none.",
                    type = GraphQLList.new(v1),
                    resolve = function(p2) -- resolve | line: 216
                        -- upvalues: getFriends (copy)
                        return getFriends(p2)
                    end
                }
            },
            {
                "appearsIn",
                {
                    description = "Which movies they appear in.",
                    type = GraphQLList.new(v4)
                }
            },
            {
                "homePlanet",
                {
                    description = "The home planet of the human, or null if unknown.",
                    type = GraphQLString
                }
            },
            {
                "secretBackstory",
                {
                    description = "Where are they from and how they came to be who they are.",
                    type = GraphQLString,
                    resolve = function() -- resolve | line: 240
                        -- upvalues: Error (copy)
                        error(Error("secretBackstory is secret."))
                    end
                }
            }
        })
    end,
    interfaces = { v1 }
})
v3 = GraphQLObjectType.new({
    name = "Droid",
    description = "A mechanical creature in the Star Wars universe.",
    fields = function() -- fields | line: 266
        -- upvalues: Error (copy), Map (copy), GraphQLString (copy), GraphQLList (copy), GraphQLNonNull (copy), getFriends (copy), v1 (ref), v4 (copy)
        return Map.new({
            {
                "id",
                {
                    description = "The id of the droid.",
                    type = GraphQLNonNull.new(GraphQLString)
                }
            },
            {
                "name",
                {
                    description = "The name of the droid.",
                    type = GraphQLString
                }
            },
            {
                "friends",
                {
                    description = "The friends of the droid, or an empty list if they have none.",
                    type = GraphQLList.new(v1),
                    resolve = function(p3) -- resolve | line: 287
                        -- upvalues: getFriends (copy)
                        return getFriends(p3)
                    end
                }
            },
            {
                "appearsIn",
                {
                    description = "Which movies they appear in.",
                    type = GraphQLList.new(v4)
                }
            },
            {
                "secretBackstory",
                {
                    description = "Construction date and the name of the designer.",
                    type = GraphQLString,
                    resolve = function() -- resolve | line: 304
                        -- upvalues: Error (copy)
                        error(Error("secretBackstory is secret."))
                    end
                }
            },
            {
                "primaryFunction",
                {
                    description = "The primary function of the droid.",
                    type = GraphQLString
                }
            }
        })
    end,
    interfaces = { v1 }
})

local v5 = GraphQLObjectType.new({
    name = "Query",
    fields = function() -- fields | line: 337
        -- upvalues: Map (copy), GraphQLString (copy), GraphQLNonNull (copy), getHero (copy), getHuman (copy), getDroid (copy), v1 (ref), v2 (ref), v3 (ref), v4 (copy)
        return Map.new({
            {
                "hero",
                {
                    type = v1,
                    args = {
                        episode = {
                            description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.",
                            type = v4
                        }
                    },
                    resolve = function(_, p5) -- resolve | line: 349
                        -- upvalues: getHero (copy)
                        return getHero(p5.episode)
                    end
                }
            },
            {
                "human",
                {
                    type = v2,
                    args = {
                        id = {
                            description = "id of the human",
                            type = GraphQLNonNull.new(GraphQLString)
                        }
                    },
                    resolve = function(_, p7) -- resolve | line: 364
                        -- upvalues: getHuman (copy)
                        return getHuman(p7.id)
                    end
                }
            },
            {
                "droid",
                {
                    type = v3,
                    args = {
                        id = {
                            description = "id of the droid",
                            type = GraphQLNonNull.new(GraphQLString)
                        }
                    },
                    resolve = function(_, p9) -- resolve | line: 379
                        -- upvalues: getDroid (copy)
                        return getDroid(p9.id)
                    end
                }
            }
        })
    end
})

return {
    StarWarsSchema = GraphQLSchema.new({
        query = v5,
        types = { v2, v3 }
    })
}
