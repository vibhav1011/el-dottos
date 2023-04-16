Vim
===

## todos:
1. add lua code to make dap run a module instead of a file and get defualts from .env
2. LspRestart when save -- this is only a  problem  with new files and the lsp, LspRestart fixes this, still a problem tho
3. nvim dap / dap ui dies with the --reload flags
4. lsp get python binary from .venv


## discovering vim
* opposite of D -> d^
* when opening :files with fzf you can press ctrl + T to open it in a new tab \*_\*

  AND THEN YOU CAN DO A <tab number>gt to go to that tab number

* go back to previous buffer with ctrl + ^

* vim find and replace - :%s/find/replace/g (g for global)
* vim json pretty print - :%!python -m json.tool
* vim add stuff at the end of all lines :%s/$/>add stuff here>/
* vim bulk rename - ctrl + V > select code block and do string substitution

* zc - fold code block
* zo - open fold
