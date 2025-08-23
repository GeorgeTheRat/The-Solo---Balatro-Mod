SMODS.Joker{ --Figure 1
    key = "figure1",
    config = {
        extra = {
            handsplayedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Figure 1',
        ['text'] = {
            [1] = 'Cards {C:attention}held in hand{} on',
            [2] = '{C:attention}first hand{} of round',
            [3] = 'become {C:attention}Literature Cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if ((function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)() and 1 == G.GAME.current_round.hands_played) then
                return {
                    func = function()
                assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                context.other_card:set_ability(G.P_CENTERS.m_solo_literature)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}