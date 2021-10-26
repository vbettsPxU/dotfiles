filetype plugin indent on
syntax on
set background=dark
set nowrap
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set list
set ruler
set title
set listchars=tab:>-
set laststatus=2
set t_Co=16

" set statusline="%F%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

set nocompatible
filetype plugin on
runtime macros/matchit.vim

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Green ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor


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
  let g:ale_enabled = 1
  " Lint config
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_linters = {'javascript': ['eslint'], 'scss': ['stylelint'],}
  let g:ale_linters_explicit = 1
  let g:ale_javascript_eslint_use_global = 0
  let g:ale_scss_stylelint_use_global = 0
  " Fixer config
  let g:ale_fixers = {'javascript': ['eslint'], 'scss': ['stylelint'],}
  Plug 'vim-scripts/matchit.zip'
  Plug 'vim-scripts/tComment'
  Plug 'mustache/vim-mustache-handlebars', { 'for': ['mustache', 'handlebars'] }
  Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=4
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
call plug#end()


highlight ColorColumn ctermbg=4
call matchadd('ColorColumn', '\%81v', 100)
