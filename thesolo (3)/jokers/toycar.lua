SMODS.Joker{ --Toy Car
    key = "toycar",
    config = {
        extra = {
            moneyvar = 1,
            basehandsperround = -1
        }
    },
    loc_txt = {
        ['name'] = 'Toy Car',
        ['text'] = {
            [1] = 'Earn {C:attention}$#1# {}when {C:attention}Blind{} is skipped',
            [2] = 'Increases by {C:attention}$3{} when a',
            [3] = '{C:attention}Blind{} is beaten in {C:attention}1{} {C:blue}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.moneyvar}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.GAME.current_round.hands_left == card.ability.extra.basehandsperround + (G.GAME.round_resets.hands) then
                return {
                    func = function()
                    card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + 3
                    return true
                end
                }
            end
        end
        if context.skip_blind  then
                return {
                    dollars = card.ability.extra.moneyvar
                }
        end
    end
}