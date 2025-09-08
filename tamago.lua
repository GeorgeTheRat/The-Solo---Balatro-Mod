SMODS.Joker{ --Tamago
    key = "tamago",
    config = {
        extra = {
            ten = 10,
            sell_value = 2,
            all_jokers = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tamago',
        ['text'] = {
            [1] = 'Sell this card to gain {C:money}$10{}',
            [2] = 'Decrease by {C:attention}2{} and increase',
            [3] = '{C:attention}sell value{} of all {C:attention}Jokers{} by {C:money}$2{}',
            [4] = 'whenever a {C:attention}Blind{} is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["solo_sushi"] = true },

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    dollars = card.ability.extra.ten
                }
        end
        if context.skip_blind  then
            if (card.ability.extra.ten or 0) == 0 then
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
            for i, other_card in ipairs(G.jokers.cards) do
                if other_card.set_cost then
                    other_card.ability.extra_value = (other_card.ability.extra_value or 0) + card.ability.extra.sell_value
                    other_card:set_cost()
                end
            end
                    return true
                end,
                    message = "All Jokers +"..tostring(card.ability.extra.sell_value).." Sell Value",
                    extra = {
                        func = function()
                    card.ability.extra.var1 = (card.ability.extra.var1) + 1
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}