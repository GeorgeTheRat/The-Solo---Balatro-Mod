SMODS.Joker{ --Topiary
    key = "topiary",
    config = {
        extra = {
            odds = 10,
            Planet = 0
        }
    },
    loc_txt = {
        ['name'] = 'Topiary',
        ['text'] = {
            [1] = 'Each {C:clubs}Club{} card held in hand',
            [2] = 'has a {C:green}1 in 10 {}chance to create',
            [3] = 'a {C:attention}2{} random {C:planet}Planet{} cards with {C:dark_edition}Negative{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Clubs") then
                if SMODS.pseudorandom_probability(card, 'group_0_9630fc7a', 1, card.ability.extra.odds, 'j_solo_topiary') then
                      SMODS.calculate_effect({func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Planet', key = nil, edition = 'e_negative', key_append = 'joker_forge_planet'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                    end
                    return true
                end}, card)
                        SMODS.calculate_effect({func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Planet', key = nil, edition = 'e_negative', key_append = 'joker_forge_planet'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                    end
                    return true
                end}, card)
                  end
            end
        end
    end
}