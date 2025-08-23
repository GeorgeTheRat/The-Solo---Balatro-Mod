SMODS.Joker{ --Go Fish
    key = "gofish",
    config = {
        extra = {
            card_draw = 6
        }
    },
    loc_txt = {
        ['name'] = 'Go Fish',
        ['text'] = {
            [1] = 'If hand contains {C:attention}5{} cards',
            [2] = 'but not a(n) {C:attention}#1# {}',
            [3] = 'draw {C:attention}6{} cards to hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
        return {vars = {localize((G.GAME.current_round.rankvar_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.rankvar_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if ((function()
    local rankFound = true
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 14 then
            rankFound = false
            break
        end
    end
    
    return rankFound
end)() and #context.full_hand == 5) then
                if G.GAME.blind.in_blind then
    SMODS.draw_cards(card.ability.extra.card_draw)
  end
                return {
                    message = "+"..tostring(card.ability.extra.card_draw).." Cards Drawn"
                }
            end
        end
    end
}