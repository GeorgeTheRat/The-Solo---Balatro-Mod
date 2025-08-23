SMODS.Enhancement {
    key = 'literature',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            chip = 20
        }
    },
    loc_txt = {
        name = 'Literature',
        text = {
        [1] = 'No rank or suit',
        [2] = '{C:blue}+#1# {}Chips when {C:attention}held in hand{}',
        [3] = 'Increases by {C:attention}20{} when {C:attention}discarded{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            card.ability.extra.chip = (card.ability.extra.chip) + 20
        end
        if context.cardarea == G.hand and context.main_scoring then
            return { chips = card.ability.extra.chip }
        end
    end
}