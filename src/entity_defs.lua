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
    },
    ['pink-kitty'] = {
        walkSpeed = MONSTER_WALK_SPEED,
        type = "monster",
        width = 32,
        height = 32,
        animations = {
            ['walk-left'] = {
                frames = {25,26,27,28},
                interval = 0.15,
                texture = 'pink-cat'
            },
            ['walk-right'] = {
                frames = {37, 38,39,40},
                interval = 0.15,
                texture = 'pink-cat'
            },
            ['walk-down'] = {
                frames = {29,30,31,32},
                interval = 0.15,
                texture = 'pink-cat'
            },
            ['walk-up'] = {
                frames = {45,46,47,48},
                interval = 0.15,
                texture = 'pink-cat'
            },
            ['idle-left'] = {
                frames = {9},
                texture = 'pink-cat'
            },
            ['idle-right'] = {
                frames = {37},
                texture = 'pink-cat'
            },
            ['idle-down'] = {
                frames = {29},
                texture = 'pink-cat'
            },
            ['idle-up'] = {
                frames = {45},
                texture = 'pink-cat'
            }
        }
    }
}
