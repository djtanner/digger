Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'


require 'src/constants'
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/game/PlayState'
require 'src/Util'
require 'src/Tile'
require 'src/LevelMaker'
require 'src/GameLevel'
require 'src/GameObject'
require 'src/game_objects'
require 'src/Animation'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
}

gTextures = {
    ['grass'] = love.graphics.newImage('graphics/grasstiles.png'),
    ['apple'] = love.graphics.newImage('graphics/Apple.png')
}


gFrames = {
    ['tiles'] = GenerateQuads(gTextures['grass'], TILE_SIZE, TILE_SIZE),
    ['apple'] = GenerateQuads(gTextures['apple'], 32, 32)
}