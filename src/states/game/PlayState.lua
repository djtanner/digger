PlayState = Class{__includes = BaseState}

function PlayState:init()

    self.enemies = {}
    self.level = LevelMaker.generate()
    self.tiles = self.level.tiles
    
    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        x = VIRTUAL_WIDTH / 2,
        y = VIRTUAL_HEIGHT / 2,
        width = ENTITY_DEFS['player'].width, 
        height = ENTITY_DEFS['player'].height,
        level = self.level,
        tiles = self.tiles,
        
        
    }

    self.player.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self.player, self.level) end,
        ['walking'] = function() return PlayerWalkState(self.player, self.level) end,
    }
    self.player:changeState('idle')

    self:spawnEnemies()

end

function PlayState:enter(params)
    self.enemies = {}
    self.level = LevelMaker.generate()
    self.tiles = self.level.tiles

    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        x = VIRTUAL_WIDTH / 2 - TILE_SIZE,
        y = VIRTUAL_HEIGHT / 2 - TILE_SIZE,
        width = ENTITY_DEFS['player'].width, 
        height = ENTITY_DEFS['player'].height,
        level = self.level,
        tiles = self.tiles,
 
    }

    self.player.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self.player, self.level) end,
        ['walking'] = function() return PlayerWalkState(self.player, self.level) end,
    }
    self.player:changeState('idle')

    self:spawnEnemies()

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
    self.player:update(dt)


    
    
end


function PlayState:render()
    love.graphics.setColor(175/255, 53/255, 42/255, 1)
    love.graphics.printf('Digger', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')
    
    self.level:render()
    self.player:render()

    for k, enemy in pairs(self.enemies) do
        enemy:render(self.adjacentOffsetX, self.adjacentOffsetY) 
    end
    




end


function PlayState:spawnEnemies()
   --[[  local types = {'skeleton', 'slime', 'bat', 'ghost', 'spider'}

    for i = 1, 10 do
        local type = types[math.random(#types)] ]]
        local cat
        cat =  Entity {
            animations = ENTITY_DEFS['pink-kitty'].animations,
            walkSpeed = MONSTER_WALK_SPEED,
            level = self.level,
            tiles = self.tiles,

            -- always spawn in top corner
            x = 360,
            y = 0,
            width = ENTITY_DEFS['pink-kitty'].width,
            height = ENTITY_DEFS['pink-kitty'].height,
           

        }

       cat.stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(cat, self.level) end,
            ['idle'] = function() return EntityIdleState(cat) end
        }

        cat:changeState('idle')
    
        table.insert(self.enemies, cat)

        
        
    end
