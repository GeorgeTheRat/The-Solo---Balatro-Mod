SMODS.Joker{ --Walled Joker
    key = "walledjoker",
    config = {
        extra = {
            freeconsumableslots = 0,
            consumable_slots = 2,
            consumable_slots2 = 2,
            consumable_slots3 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Walled Joker',
        ['text'] = {
            [1] = '{C:attention}+2{} {C:attention}Conumable Slots{} while in {C:attention}Blind{},',
            [2] = '{C:red}destroyed{} whenever',
            [3] = '{C:attention}Conumable Slots{} are full',
            [4] = 'and {C:attention}Blind{} is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
            if 0 == (G.consumeables and G.consumeables.config.card_limit or 0 - #(G.consumeables and G.consumeables.cards or {})) then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            else
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slots
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.consumable_slots).." Consumable Slot", colour = G.C.GREEN})
                return true
            end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = math.max(0, G.consumeables.config.card_limit - card.ability.extra.consumable_slots2)
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.consumable_slots2).." Consumable Slot", colour = G.C.RED})
                return true
            end
                }
        end
        if context.selling_self  then
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = math.max(0, G.consumeables.config.card_limit - card.ability.extra.consumable_slots3)
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.consumable_slots3).." Consumable Slot", colour = G.C.RED})
                return true
            end
                }
        end
    end
}