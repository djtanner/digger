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
                                    end
                                },

    }
