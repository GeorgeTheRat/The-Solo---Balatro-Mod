SMODS.Joker{ --Rotten Joker
    key = "rottenjoker",
    config = {
        extra = {
            dollars = 5,
            Xmult = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Rotten Joker',
        ['text'] = {
            [1] = 'Played {C:attention}Rotten Cards{} give {C:money}$5{}',
            [2] = 'when scored, but also',
            [3] = 'give {X:red,C:white}X0.75{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_solo_rotten"] == true then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
            end
        end
    end
}