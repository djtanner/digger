--[[
    Code reused from :
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}


function PlayerIdleState:enter(params)
        
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 16
    self.entity.offsetX = 16
end

function PlayerIdleState:update(dt)


    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walking')
    end

 

end