StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play', {levelNumber = 1, score = 0, stats = {["apple"] = 0, ["banana"] = 0, ["cherry"] = 0, ["melon"] = 0, ["kiwi"] = 0, ["pineapple"] = 0, ["strawberry"] = 0}})
    end
end

function StartState:render()
    love.graphics.draw(gTextures['background'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['background']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['background']:getHeight())



    love.graphics.setFont(gFonts['title'])
   
    love.graphics.setColor(172/255, 112/255, 136/255, 1)
    love.graphics.printf('Mochi the Digger', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to Start', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end