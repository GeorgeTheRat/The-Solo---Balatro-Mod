SMODS.Joker{ --Wonders
    key = "wonders",
    config = {
        extra = {
            Xmult_min = 1.1,
            Xmult_max = 1.7
        }
    },
    loc_txt = {
        ['name'] = 'Wonders',
        ['text'] = {
            [1] = 'Played {C:attention}7s{} give {X:red,C:white}X1.1{}',
            [2] = 'or {X:red,C:white}X2.1{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 7 then
                return {
                    Xmult = pseudorandom('Xmult_d4f4f876', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)
                }
            end
        end
    end
}