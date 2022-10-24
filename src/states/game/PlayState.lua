PlayState = Class{__includes = BaseState}

function PlayState:init()
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    
end


function PlayState:render()
    love.graphics.setColor(175/255, 53/255, 42/255, 1)
    love.graphics.printf('Digger', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

end
