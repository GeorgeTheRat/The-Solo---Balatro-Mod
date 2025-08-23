SMODS.Consumable {
    key = 'cross',
    set = 'lenormand',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'Cross',
        text = {
        [1] = 'Create a random {C:green}Uncommon{} {C:attention}Joker{}',
        [2] = '{C:inactive}(Does not need room){}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}