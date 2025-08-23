SMODS.Enhancement {
    key = 'vine',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            freeconsumableslots = 0
        }
    },
    loc_txt = {
        name = 'Vine',
        text = {
        [1] = 'Retrigger this card {C:attention}once{} for',
        [2] = 'every free {C:attention}Consumable Slot{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.extra.retrigger_times = (G.consumeables and G.consumeables.config.card_limit or 0 - #(G.consumeables and G.consumeables.cards or {}))
        end
    end
}