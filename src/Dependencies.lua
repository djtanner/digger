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

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
}

gTextures = {
    ['grass'] = love.graphics.newImage('graphics/grasstiles.png')}


gFrames = {
    ['tiles'] = {1,2,3,4}
}