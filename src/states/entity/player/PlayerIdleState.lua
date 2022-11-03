PlayerIdleState = Class{__includes = EntityIdleState}


function PlayerIdleState:enter(params)
        
    self.entity.offsetY = 16
    self.entity.offsetX = 16
end

function PlayerIdleState:update(dt)


    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walking')
    end

 

end