local M = {}

M.config = function()
  vim.fn["skkeleton#config"]({
    -- skkeleton の設定
    eggLikeNewline = true,
    globalJisyo = "~/.skk-jisyo",
    userJisyo = "~/.skk-jisyo-user",
    -- 他の設定...
  })
end

return M
