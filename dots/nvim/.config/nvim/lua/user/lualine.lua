local function get_git_root_name()
    local git_dir = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null')
    git_dir = vim.trim(git_dir)
    if git_dir ~= '' and vim.v.shell_error == 0 then
        return vim.fn.fnamemodify(git_dir, ':t')
    end
    return ''
end

require('lualine').setup({
    options = { theme = 'gruvbox' },
    sections = {
        lualine_a = { get_git_root_name },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'lsp_status' },
        lualine_z = { 'location' }
    },
})
