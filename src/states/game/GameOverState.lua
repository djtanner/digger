GameOverState = Class{__includes = BaseState}

function GameOverState:enter(params)
    self.player = params.player

    -- Place apple animation for score
    self.appleGraphic =  GameObject(GAME_OBJECT_DEFS['apple'],
   90, 72)

    self.appleGraphic.stateMachine = StateMachine {
    ['idle'] = function() return FruitIdleState(self.appleGraphic) end
    }

    self.appleGraphic:changeState('idle')

    -- Place banana animation for score
    self.bananaGraphic =  GameObject(GAME_OBJECT_DEFS['banana'],
    90, 102)
 
     self.bananaGraphic.stateMachine = StateMachine {
     ['idle'] = function() return FruitIdleState(self.bananaGraphic) end
     }
 
     self.bananaGraphic:changeState('idle')

     --Place cherry animation for score
     self.cherryGraphic =  GameObject(GAME_OBJECT_DEFS['cherry'],
     90, 132)
  
      self.cherryGraphic.stateMachine = StateMachine {
      ['idle'] = function() return FruitIdleState(self.cherryGraphic) end
      }
  
      self.cherryGraphic:changeState('idle')

      --Place kiwi animation for score
      self.kiwiGraphic =  GameObject(GAME_OBJECT_DEFS['kiwi'],
      220, 72)
   
       self.kiwiGraphic.stateMachine = StateMachine {
       ['idle'] = function() return FruitIdleState(self.kiwiGraphic) end
       }
   
       self.kiwiGraphic:changeState('idle')

        --Place melon animation for score
      self.melonGraphic =  GameObject(GAME_OBJECT_DEFS['melon'],
      220, 102)
   
       self.melonGraphic.stateMachine = StateMachine {
       ['idle'] = function() return FruitIdleState(self.melonGraphic) end
       }
   
       self.melonGraphic:changeState('idle')

           --Place pineapple animation for score
      self.pineappleGraphic =  GameObject(GAME_OBJECT_DEFS['pineapple'],
      220, 132)
   
       self.pineappleGraphic.stateMachine = StateMachine {
       ['idle'] = function() return FruitIdleState(self.pineappleGraphic) end
       }
   
       self.pineappleGraphic:changeState('idle')

    --Place strawberry animation for score
      self.strawberryGraphic =  GameObject(GAME_OBJECT_DEFS['strawberry'],
      90, 162)
   
       self.strawberryGraphic.stateMachine = StateMachine {
       ['idle'] = function() return FruitIdleState(self.strawberryGraphic) end
       }
   
       self.strawberryGraphic:changeState('idle')

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
    self.bananaGraphic:update(dt)
    self.cherryGraphic:update(dt)
    self.kiwiGraphic:update(dt)
    self.melonGraphic:update(dt)
    self.pineappleGraphic:update(dt)
    self.strawberryGraphic:update(dt)

end

function GameOverState:render()

   love.graphics.draw(gTextures['background'], 0, 0, 0, 
    VIRTUAL_WIDTH / gTextures['background']:getWidth(),
    VIRTUAL_HEIGHT / gTextures['background']:getHeight())
   
    self.appleGraphic:render()
    self.bananaGraphic:render()
    self.cherryGraphic:render()
    self.kiwiGraphic:render()
    self.melonGraphic:render()
    self.pineappleGraphic:render()
    self.strawberryGraphic:render()

    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(0/255, 0/255, 0/255, 1)
    love.graphics.printf('GAME OVER', 0, 16, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Mochi Stats', 0, 60, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts['medium'])
    local apple = tostring(gStateMachine.current.player.stats["apple"])
    love.graphics.printf((":  " .. apple), 120, 80, VIRTUAL_WIDTH)
    local banana = tostring(gStateMachine.current.player.stats["banana"])
    love.graphics.printf((":  " .. banana), 120, 110, VIRTUAL_WIDTH)
    local cherry = tostring(gStateMachine.current.player.stats["cherry"])
    love.graphics.printf((":  " .. cherry), 120, 140, VIRTUAL_WIDTH)
    local kiwi = tostring(gStateMachine.current.player.stats["kiwi"])
    love.graphics.printf((":  " .. kiwi), 250, 80, VIRTUAL_WIDTH)
    local melon = tostring(gStateMachine.current.player.stats["melon"])
    love.graphics.printf((":  " .. melon), 250, 110, VIRTUAL_WIDTH)
    local pineapple = tostring(gStateMachine.current.player.stats["pineapple"])
    love.graphics.printf((":  " .. pineapple), 250, 140, VIRTUAL_WIDTH)
    local strawberry = tostring(gStateMachine.current.player.stats["strawberry"])
    love.graphics.printf((":  " .. strawberry), 120, 170, VIRTUAL_WIDTH)




    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to Play Again', 0, VIRTUAL_HEIGHT / 2 + 80, VIRTUAL_WIDTH, 'center')
end