GAME_OBJECT_DEFS = {
    ['apple'] = {
        type = 'fruit',
        width = 32,
        height = 32,
        isConsumable = true,
        solid = false,
        animations = {
            ['pulse'] = {
                frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                interval = 0.155,
                texture = 'apple',
                looping = true
            }},
            onConsume = function()
                gStateMachine.current.player.score = gStateMachine.current.player.score + 20 
                gStateMachine.current.player.stats["apple"] = gStateMachine.current.player.stats["apple"] + 1
                
            end
        },
        ['banana'] = {
            type = 'fruit',
            width = 32,
            height = 32,
            isConsumable = true,
            solid = false,
            animations = {
                ['pulse'] = {
                    frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                    interval = 0.155,
                    texture = 'banana',
                    looping = true
                }},
                onConsume = function()
                    gStateMachine.current.player.score = gStateMachine.current.player.score + 30 
                    gStateMachine.current.player.stats["banana"] = gStateMachine.current.player.stats["banana"] + 1
                end
            },
            ['cherry'] = {
                type = 'fruit',
                width = 32,
                height = 32,
                isConsumable = true,
                solid = false,
                animations = {
                    ['pulse'] = {
                        frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                        interval = 0.155,
                        texture = 'cherry',
                        looping = true
                    }},
                    onConsume = function()
                        gStateMachine.current.player.score = gStateMachine.current.player.score + 40 
                        gStateMachine.current.player.stats["cherry"] = gStateMachine.current.player.stats["cherry"] + 1
                    end
                },
                ['kiwi'] = {
                    type = 'fruit',
                    width = 32,
                    height = 32,
                    isConsumable = true,
                    solid = false,
                    animations = {
                        ['pulse'] = {
                            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                            interval = 0.155,
                            texture = 'kiwi',
                            looping = true
                        }},
                        onConsume = function()
                            gStateMachine.current.player.score = gStateMachine.current.player.score + 50
                            gStateMachine.current.player.stats["kiwi"] = gStateMachine.current.player.stats["kiwi"] + 1 
                        end
                    },
                    ['melon'] = {
                        type = 'fruit',
                        width = 32,
                        height = 32,
                        isConsumable = true,
                        solid = false,
                        animations = {
                            ['pulse'] = {
                                frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                                interval = 0.155,
                                texture = 'melon',
                                looping = true
                            }},
                            onConsume = function()
                                gStateMachine.current.player.score = gStateMachine.current.player.score + 20
                                gStateMachine.current.player.stats["melon"] = gStateMachine.current.player.stats["melon"] + 1 
                            end
                        },
                        ['pineapple'] = {
                            type = 'fruit',
                            width = 32,
                            height = 32,
                            isConsumable = true,
                            solid = false,
                            animations = {
                                ['pulse'] = {
                                    frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                                    interval = 0.155,
                                    texture = 'pineapple',
                                    looping = true
                                }},
                                onConsume = function()
                                    gStateMachine.current.player.score = gStateMachine.current.player.score + 20
                                    gStateMachine.current.player.stats["pineapple"] = gStateMachine.current.player.stats["pineapple"] + 1 
                                end
                            },
                            ['strawberry'] = {
                                type = 'fruit',
                                width = 32,
                                height = 32,
                                isConsumable = true,
                                solid = false,
                                animations = {
                                    ['pulse'] = {
                                        frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17},
                                        interval = 0.155,
                                        texture = 'strawberry',
                                        looping = true
                                    }},
                                    onConsume = function()
                                        gStateMachine.current.player.score = gStateMachine.current.player.score + 30
                                        gStateMachine.current.player.stats["strawberry"] = gStateMachine.current.player.stats["strawberry"] + 1 
                                    end
                                },

    }
