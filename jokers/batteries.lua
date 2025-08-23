SMODS.Joker{ --Batteries
    key = "batteries",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Batteries',
        ['text'] = {
            [1] = 'Retrigger each played {C:attention}Ace',
            [2] = '3{} times if played hand contains',
            [3] = '{C:attention}Three of a Kind{}, but {C:red}not{}',
            [4] = 'the most played {C:attention}poker hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and next(context.poker_hands["Three of a Kind"])) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}