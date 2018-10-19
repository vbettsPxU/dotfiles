filetype plugin indent on
syntax on
set nowrap
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set list
set ruler
set listchars=tab:>-
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

map <F7> mzgg=G`z
map LN :ALENext<CR>
map LP :ALEPrevious<CR>

:command Ale ALEToggle
:command W w
:command Q q
:command Wq wq
:command WQ wq

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set cursor shape - tmux on iterm2
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Add plugin manager vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  " General config
  let g:ale_sign_column_always = 1
  let g:ale_change_sign_column_color = 1
  let g:ale_enabled = 0
  " Lint config
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_linters = {'javascript': ['eslint'], 'scss': ['sasslint'],}
  let g:ale_linters_explicit = 1
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_scss_eslint_options = '-c ~/.eslintrc'
  let g:ale_scss_sasslint_use_global = 1
  let g:ale_scss_sasslint_options = '-c ~/.sasslintrc'
  " Fixer config
  let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['sasslint'],}
call plug#end()

