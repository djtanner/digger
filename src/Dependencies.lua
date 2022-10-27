Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/GameObject'
require 'src/game_objects'
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/game/PlayState'
require 'src/Util'
require 'src/Tile'
require 'src/LevelMaker'
require 'src/GameLevel'


require 'src/states/object/FruitIdleState'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
}

gTextures = {
    ['grass'] = love.graphics.newImage('graphics/grasstiles.png'),
    ['apple'] = love.graphics.newImage('graphics/Apple.png'),
    ['banana'] = love.graphics.newImage('graphics/Bananas.png'),
    ['cherry'] = love.graphics.newImage('graphics/Cherries.png'),
    ['kiwi'] = love.graphics.newImage('graphics/Kiwi.png'),
    ['melon'] = love.graphics.newImage('graphics/Melon.png'),
    ['pineapple'] = love.graphics.newImage('graphics/Pineapple.png'),
    ['strawberry'] = love.graphics.newImage('graphics/Strawberry.png'),
    ['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
}


gFrames = {
    ['tiles'] = GenerateQuads(gTextures['grass'], TILE_SIZE, TILE_SIZE),
    ['apple'] = GenerateQuads(gTextures['apple'], 32, 32),
    ['banana'] = GenerateQuads(gTextures['banana'], 32, 32),
    ['cherry'] = GenerateQuads(gTextures['cherry'], 32, 32),
    ['kiwi'] = GenerateQuads(gTextures['kiwi'], 32, 32),
    ['melon'] = GenerateQuads(gTextures['melon'], 32, 32),
    ['pineapple'] = GenerateQuads(gTextures['pineapple'], 32, 32),
    ['strawberry'] = GenerateQuads(gTextures['strawberry'], 32, 32),
    ['character-walk'] = GenerateQuads(gTextures['character-walk'], 48, 48),
}