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
map <F7> mzgg=G`z
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Add plugin manager vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_linters = {'javascript': ['eslint'], 'scss': ['sasslint'],}
  let g:ale_linters_explicit = 1
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_scss_sasslint_use_global = 1
  let g:ale_scss_sasslint_options = '-c ~/.sasslintrc'
  let g:ale_sign_column_always = 1
  let g:ale_change_sign_column_color = 1
call plug#end()

