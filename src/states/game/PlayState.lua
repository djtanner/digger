PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = LevelMaker.generate()
    self.tiles = self.level.tiles
    

end

function PlayState:enter(params)
    self.level = LevelMaker.generate()
end
    

function PlayState:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('space') then
        self.level = LevelMaker.generate()
    end

    self.level:update(dt)
    
    
end


function PlayState:render()
    love.graphics.setColor(175/255, 53/255, 42/255, 1)
    love.graphics.printf('Digger', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')
    
    self.level:render()


end
