GameOverState = Class{__includes = BaseState}

function GameOverState:enter(params)
    self.player = params.player

    self.appleGraphic =  GameObject(GAME_OBJECT_DEFS['apple'],
   90, 72)

    self.appleGraphic.stateMachine = StateMachine {
    ['idle'] = function() return FruitIdleState(self.appleGraphic) end
}

self.appleGraphic:changeState('idle')
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
        gSounds['music']:play()
        gSounds['music']:setLooping(true)
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.appleGraphic:update(dt)

end

function GameOverState:render()
    
    
    

   love.graphics.draw(gTextures['background'], 0, 0, 0, 
    VIRTUAL_WIDTH / gTextures['background']:getWidth(),
    VIRTUAL_HEIGHT / gTextures['background']:getHeight())
   
    self.appleGraphic:render()

    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(172/255, 112/255, 136/255, 1)
    love.graphics.printf('GAME OVER', 0, 32, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts['medium'])
    local apple = tostring(gStateMachine.current.player.stats["apple"])
    love.graphics.printf((":  " .. apple), 120, 80, VIRTUAL_WIDTH)


    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to Play Again', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end