local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
    return
end

-- `fd`/`rg` don't descend into symlinked directories by default, so anything
-- reachable only through a symlink is invisible to <C-p> / <C-f> unless
-- `--follow` is set.
fzf_lua.setup({
    files = {
        fd_opts = "--color=never --type f --type l --follow --exclude .git",
    },
    grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case "
            .. "--max-columns=4096 --follow -e",
    },
})
