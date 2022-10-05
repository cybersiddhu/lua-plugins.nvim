local stackoverflow = require("coding-assistant.stackoverflow")
vim.keymap.set("n", "<Leader>so", function() stackoverflow.so_search() end, { noremap = true })
