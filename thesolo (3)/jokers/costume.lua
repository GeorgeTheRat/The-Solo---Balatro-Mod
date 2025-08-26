SMODS.Joker{ --Costume
    key = "costume",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Costume',
        ['text'] = {
            [1] = 'Scored cards have a',
            [2] = '{C:green}#1# in #2# {}chance of',
            [3] = 'being {C:red}destroyed{}',
            [4] = 'and a {C:green}#1# in #2# {} chance',
            [5] = 'of being completely {C:attention}randomized{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_solo_costume') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a256d3a2', 1, card.ability.extra.odds, 'j_solo_costume') then
                      assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                local enhancement_pool = {}
                for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                    if enhancement.key ~= 'm_stone' then
                        enhancement_pool[#enhancement_pool + 1] = enhancement
                    end
                end
                local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                context.other_card:set_ability(random_enhancement)
                local random_seal = SMODS.poll_seal({mod = 10})
                if random_seal then
                    context.other_card:set_seal(random_seal, true)
                end
                local random_edition = poll_edition('edit_card_edition', nil, true, true)
                if random_edition then
                    context.other_card:set_edition(random_edition, true)
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_c2b209a3', 1, card.ability.extra.odds, 'j_solo_costume') then
                      context.other_card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
            end
        end
    end
}