ENTITY_DEFS = {
    ['player'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        type = "player",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {5,6},
                interval = 0.155,
                texture = 'character-walk'
            },
            ['walk-right'] = {
                frames = {7, 8},
                interval = 0.15,
                texture = 'character-walk'
            },
            ['walk-down'] = {
                frames = {1, 2},
                interval = 0.15,
                texture = 'character-walk'
            },
            ['walk-up'] = {
                frames = {3,4},
                interval = 0.15,
                texture = 'character-walk'
            },
            ['idle-left'] = {
                frames = {9},
                texture = 'character-idle'
            },
            ['idle-right'] = {
                frames = {13},
                texture = 'character-idle'
            },
            ['idle-down'] = {
                frames = {1},
                texture = 'character-idle'
            },
            ['idle-up'] = {
                frames = {5},
                texture = 'character-idle'
            }
        }
    }
}
