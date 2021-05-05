" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc

syntax on
set smartindent
set smartcase
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set incsearch
set hlsearch
set laststatus=2
set wildmenu
set scrolloff=8
set sidescrolloff=5
set autoread
set history=1000
set tabpagemax=50
set ruler
set sessionoptions-=options
set viewoptions-=options
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set nu
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set exrc
set hid
set signcolumn=yes
set termguicolors
set cmdheight=2
set colorcolumn=80

hi ColorColumn ctermbg=0 guibg=lightgrey

if !empty(&viminfo)
  set viminfo^=!
endif

" recover from accidental <C-u>
" if empty(mapcheck(‘<C-U>’, ‘i’))
"   inoremap <C-U> <C-G>u<C-U>
" endif
" if empty(mapcheck(‘<C-W>’, ‘i’))
"  inoremap <C-W> <C-G>u<C-W>
" endif

" use <C-l> to clear the highlighting of :set hlsearch.
" if maparg(‘<C-L>’, ’n’) ==# ‘’
"  nnoremap <silent> <C-L> :nohlsearch<C-R>=has(‘diff’)?’<Bar>diffupdate’:’’<CR><CR><C-L>
" endif

call plug#begin('~/.vim/plugged')

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'psliwka/vim-smoothie'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()

colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" nvim-tree.lua
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the ast window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (an be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFilec
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" dashboard-nvim
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>ff <cmd>Telescope find_files find_command=rg,--files<CR>
nnoremap <silent> <Leader>fw :DashboardFindWord<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>fd :lua require('telescope.builtin').find_files({ cwd = "$HOME/.dotfiles", hidden = true })<CR>
" nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
" nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" let g:dashboard_custom_shortcut={
" \ 'last_session'       : '<leader> s l',
" \ 'find_history'       : '<leader> f h',
" \ 'find_file'          : '<leader> f f',
" \ 'new_file'           : '<leader> c n',
" \ 'change_colorscheme' : '<leader> t c',
" \ 'find_word'          : '<leader> f a',
" \ 'book_marks'         : '<leader> f b',
" \ }

" let g:dashboard_custom_section={
" \ 'buffer_list': {
"   \ 'description': [' Recently lase session                 SPC b b'],
"   \ 'command': '' }
"   \ }

lua << EOF
vim.g.dashboard_custom_section = {
    custom_1_find_file  = {
      description = {'  find files                              SPC f f'},
      command = 'Telescope find_files find_command=rg,--hidden,--files'},
    custom_2_ripgrep = {
      description = {'  use ripgrep                             SPC f w'},
      command = 'DashboardFindWord'},
    custom_3_find_history = {
      description = {'  open recent                             SPC f h'},
      command =  'DashboardFindHistory'},
    custom_4_find_dotfiles= {
      description = {'﬒  find dotfiles                           SPC f d'},
      command =  'lua require("telescope.builtin").find_files({ cwd = "$HOME/.dotfiles", hidden = true })'},
  }
EOF


" vim-smoothie
let g:smoothie_experimental_mappings=1

if executable('rg')
  let g:rg_derive_root='true'
endif

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let mapleader = " "
" let g:netrw_browse_split=2
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

" let g:ctrlp_use_caching = 0

" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader>u :UndotreeShow<CR>
" nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" nnoremap <Leader>ps :Rg<SPACE>
" nnoremap <silent> <Leader>+ :vertical resize +5<CR>
" nnoremap <silent> <Leader>- :vertical resize -5<CR>

" augroup RestoreCursorShapeOnExit
"     autocmd!
"     autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
" augroup END

set guicursor=n:hor20,i:ver30

" augroup RestoreCursorShapeOnExit
"     autocmd!
"     autocmd VimLeave * set guicursor=a:hor20
" augroup END

augroup AutoReloadVimrc 
  autocmd! BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" EoB cannot set to be transparent, thus changed to black for alternative
hi! EndOfBuffer guifg=black
