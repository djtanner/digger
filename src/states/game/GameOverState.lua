GameOverState = Class{__includes = BaseState}

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function GameOverState:render()
    love.graphics.draw(gTextures['background'], 0, 0, 0, 
    VIRTUAL_WIDTH / gTextures['background']:getWidth(),
    VIRTUAL_HEIGHT / gTextures['background']:getHeight())

    

    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(172/255, 112/255, 136/255, 1)
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to Play Again', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end