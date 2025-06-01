-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel" },
    branch = "main",
    lazy = true,
    init = function()
      vim.g["conjure#mapping#doc_word"] = "K"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defflow", "defspec", "describe"}
    end,
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        ft = "clojure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end
      }
    }
  },
  {
    "guns/vim-sexp",
    ft = "clojure",
    init = function()
      vim.g.sexp_mappings = {
        -- Element  -> e
        -- List     -> f
        -- Top list -> F
        -- string   -> s
        sexp_outer_list                = 'af',
        sexp_inner_list                = 'if',

        sexp_outer_top_list            = 'aF',
        sexp_inner_top_list            = 'iF',

        sexp_outer_string              = 'as',
        sexp_inner_string              = 'is',

        sexp_outer_element             = 'ae',
        sexp_inner_element             = 'ie',

        sexp_move_to_prev_bracket      = '(',
        sexp_move_to_next_bracket      = ')',

        sexp_move_to_prev_element_head = 'B',
        sexp_move_to_next_element_head = 'W',
        sexp_move_to_prev_element_tail = 'gE',
        sexp_move_to_next_element_tail = 'E',

        sexp_flow_to_prev_close        = 'g[',
        sexp_flow_to_next_open         = 'g]',

        sexp_flow_to_prev_open         = 'g{',
        sexp_flow_to_next_close        = 'g}',

        sexp_flow_to_prev_leaf_head    = '', --'g<S-b>',
        sexp_flow_to_next_leaf_head    = '', --'g<S-w>',

        sexp_flow_to_prev_leaf_tail    = '', --'g<S-g>',
        sexp_flow_to_next_leaf_tail    = '', --'g<S-e>',

        sexp_move_to_prev_top_element  = '[[',
        sexp_move_to_next_top_element  = ']]',
        sexp_select_prev_element       = '[e',
        sexp_select_next_element       = ']e',

        sexp_indent                    = '',
        sexp_indent_top                = '',

        sexp_round_head_wrap_list      = '<localleader>(',
        sexp_round_tail_wrap_list      = '<localleader>)',
        sexp_square_head_wrap_list     = '<localleader>[',
        sexp_square_tail_wrap_list     = '<localleader>]',
        sexp_curly_head_wrap_list      = '<localleader>{',
        sexp_curly_tail_wrap_list      = '<localleader>}',

        sexp_round_head_wrap_element   = '<localleader>e(',
        sexp_round_tail_wrap_element   = '<localleader>e)',
        sexp_square_head_wrap_element  = '<localleader>e[',
        sexp_square_tail_wrap_element  = '<localleader>e]',
        sexp_curly_head_wrap_element   = '<localleader>e{',
        sexp_curly_tail_wrap_element   = '<localleader>e}',

        sexp_insert_at_list_head       = '<localleader>h',
        sexp_insert_at_list_tail       = '<localleader>l',
        sexp_splice_list               = '<localleader>@',
        sexp_convolute                 = '<localleader>?',
        sexp_raise_list                = '<localleader>o',
        sexp_raise_element             = '<localleader>O',

        sexp_swap_list_backward        = '<f',
        sexp_swap_list_forward         = '>f',

        sexp_swap_element_backward     = '<e',
        sexp_swap_element_forward      = '>e',

        sexp_emit_head_element         = '>(',
        sexp_capture_prev_element      = '<(',

        sexp_emit_tail_element         = '<)',
        sexp_capture_next_element      = '>)',
      }
    end
  },
  { "clojure-vim/vim-jack-in", ft = "clojure" },
}
