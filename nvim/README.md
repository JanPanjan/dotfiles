Useful links:
- <https://dev.to/iggredible/learning-vim-regex-26ep>
- <https://github.com/ms-jpq/coq_nvim>

todo/explore:
- [ ] anime colorthemes (e.g. hxh characters gon, killua, hisoka... samo poigras se s highlights z `nvim_set_hl`)

Powershell as the default shell:
- `vim.opt.shell = 'pwsh'` for PowerShell Core or 'powershell' for Windows PowerShell
- `vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'`:
    - `-ExecutionPolicy RemoteSigned`: Ensures scripts can run with the RemoteSigned policy.
    - `-NoProfile`: Does not load the user profile, making startup faster.
    - `-NoLogo`: Prevents PowerShell from displaying the startup banner.
- Correct handling of quotes in powershell
with `vim.opt.shellquote = ''` and `vim.opt.shellxquote = ''`