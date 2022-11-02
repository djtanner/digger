ENTITY_DEFS = {
    ['player'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        type = "player",
        width = 16,
        height = 16,
        offsetX = 16,
        offsetY = 16,
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
        width = 16,
        height = 16,
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
    },
    ['green-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {13,14,15},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {25,26,27},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {37,38,39},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {1,2,3},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {1,2},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {25,26},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {37,38},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {1,2},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },
    ['blue-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {16,17,18},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {28,29,30},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {40,41,42},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {4,5,6},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {4,5},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {28,29},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {40,41},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {4,5},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },
    ['orange-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {19,20,21},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {31,32,33},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {43,44,45},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {7,8,9},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {7,8},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {31,32},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {43,44},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {7,8},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },
    ['pink-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {22,23,24},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {34,35,36},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {46,47,48},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {10,11,12},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {10,11},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {34,35},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {46,47},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {10,11},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },

    ['yellow-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {61,62,63},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {73,74,75},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {49,50,51},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {49,50,51},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {61,62},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {73,74},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {49,50},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {49,50},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },
    ['silver-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {64,65,66},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {76,77,78},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {52,53,54},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {52,53,54},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {64,65},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {76,77},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {52,53},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {52,53},
                interval = 0.15,
                texture = 'slime'
            }
        }
    },
    ['grey-slime'] = {
        walkSpeed = SLIME_WALK_SPEED,
        type = "monster",
        width = 16,
        height = 16,
        animations = {
            ['walk-left'] = {
                frames = {67,68,69},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-right'] = {
                frames = {79,80,81},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-down'] = {
                frames = {55,56,57},
                interval = 0.15,
                texture = 'slime'
            },
            ['walk-up'] = {
                frames = {55,56,57},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-left'] = {
                frames = {67,68},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-right'] = {
                frames = {79,80},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-down'] = {
                frames = {55,56},
                interval = 0.15,
                texture = 'slime'
            },
            ['idle-up'] = {
                frames = {55,56},
                interval = 0.15,
                texture = 'slime'
            }
        }
    }



}
