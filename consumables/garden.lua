SMODS.Consumable {
    key = 'garden',
    set = 'lenormand',
    pos = { x = 0, y = 1 },
    config = { extra = {
        blindsskipped = 0
    } },
    loc_txt = {
        name = 'Garden',
        text = {
        [1] = 'Gain {C:money}$10{} for every {C:attention}Blind{} skipped this run'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((G.GAME.skips) * 10).." $", colour = G.C.MONEY})
                    ease_dollars((G.GAME.skips) * 10, true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}