-- プラグインの設定
require('lazy').setup(function(use)
  use {'vim-denops/denops.vim'}
  use {'lambdalisue/kensaku-search.vim'}
  use {'lambdalisue/kensaku.vim'}
end)

-- キーマッピングの設定
vim.keymap.set('c', '<CR>', '<Plug>(kensaku-search-replace)<CR>')
vim.keymap.set('n', 'S', '<cmd>FuzzyMotion<CR>')

-- グローバル変数の設定
vim.cmd("let g:fuzzy_motion_matchers = ['kensaku', 'fzf']")
vim.cmd('let g:clever_f_across_no_line = 1')
vim.cmd('let g:clever_f_ignore_case = 1')
vim.cmd('let g:clever_f_smart_case = 1')
vim.cmd("let g:clever_f_chars_match_any_signs = ';'")
vim.cmd('let g:clever_f_use_migemo = 1')

-- mini.surroundの設定
require('mini.surround').setup({
  mappings = {
    highlight = 'sx',
  },
  custom_surroundings = {
    ['j'] = {
      input = function()
        local ok, val = pcall(vim.fn.getchar)
        if not ok then return end
        local char = vim.fn.nr2char(val)
        local dict = {
          ['('] = { left = '(', right = ')' },
          ['{'] = { left = '{', right = '}' },
          ['['] = { left = '[', right = ']' },
          [']'] = { left = ']', right = ']' },
          ['<'] = { left = '<', right = '>' },
          ['"'] = { left = '"', right = '"' },
          ['）'] = { left = '（', right = '）' },
          ['｝'] = { left = '｛', right = '｝' },
          ['」'] = { left = '「', right = '」' },
          ['』'] = { left = '『', right = '』' },
          ['＞'] = { left = '＜', right = '＞' },
          ['”'] = { left = '”', right = '”' },
        }
        return dict[char] or error(char .. ' is unsupported surroundings in Japanese')
      end,
      output = function(textobject)
        local char = textobject.char
        local dict = {
          ['('] = { left = '(', right = ')' },
          ['{'] = { left = '{', right = '}' },
          ['['] = { left = '[', right = ']' },
          [']'] = { left = ']', right = ']' },
          ['<'] = { left = '<', right = '>' },
          ['"'] = { left = '"', right = '"' },
          ['）'] = { left = '（', right = '）' },
          ['｝'] = { left = '｛', right = '｝' },
          ['」'] = { left = '「', right = '」' },
          ['』'] = { left = '『', right = '』' },
          ['＞'] = { left = '＜', right = '＞' },
          ['”'] = { left = '”', right = '”' },
        }
        return dict[char] or error(char .. ' is unsupported surroundings in Japanese')
      end
    }
  }
})

-- mini.aiの設定
require('mini.ai').setup({
  custom_textobjects = {
    ['j'] = function()
      local ok, val = pcall(vim.fn.getchar)
      if not ok then return end
      local char = vim.fn.nr2char(val)
      local dict = {
        ['('] = { left = '(', right = ')' },
        ['{'] = { left = '{', right = '}' },
        ['['] = { left = '[', right = ']' },
        [']'] = { left = ']', right = ']' },
        ['<'] = { left = '<', right = '>' },
        ['"'] = { left = '"', right = '"' },
        ['）'] = { left = '（', right = '）' },
        ['｝'] = { left = '｛', right = '｝' },
        ['」'] = { left = '「', right = '」' },
        ['』'] = { left = '『', right = '』' },
        ['＞'] = { left = '＜', right = '＞' },
        ['”'] = { left = '”', right = '”' },
      }
      return dict[char] or error(char .. ' is unsupported textobjects in Japanese')
    end
  }
})
