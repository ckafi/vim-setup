" A vim configuration file
" Written by Tobias Frilling (tobias@frilling-online.de)
" Any copyright is dedicated to the Public Domain.
" http://creativecommons.org/publicdomain/zero/1.0/
" So feel free to use any line you want.

" Prologue {{{
set nocompatible          " Don't make Vim vi-compatible
syntax enable             " Enable syntax highlighting
" }}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugins')
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ckafi/vim-template'
Plug 'fmoralesc/vim-pad'
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'joom/latex-unicoder.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses'}
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'rking/ag.vim'
Plug 'shougo/neocomplcache'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'shougo/unite-outline'
Plug 'shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
call plug#end()
" }}}

" Settings {{{
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set ignorecase            " Do case insensitive matching
set smartcase             " Do smart case matching
set incsearch             " Do an incremental search
set hlsearch              " Highlight matching strings when searching
set hidden                " Hide buffers when they are abandoned
set mouse=a               " Enable mouse usage (all modes)
set splitbelow            " For split: new window below old one
set splitright            " For vsplit: new window right of old one
set lazyredraw            " Do not redraw the screen during macros
set scrolloff=3           " Number of lines always above/below cursor
set wildmenu              " Use a menu in command completion
set wildmode=longest:full " Complete longest common string and start wildmenu
set wildmode+=full        " ... then go to next full match
set autoindent            " Use auto indenting
set smartindent           " ... and smart-indenting
set pastetoggle=<F8>      " Toggle (no)paste with F8
set undofile              " Save undo history
set undodir=~/.config/nvim/undo/  " Directory for undo files
set backup                " Save backups
set backupdir=~/.config/nvim/backup/ " Directory for backup files
set directory=~/.config/nvim/swap//  " Directory for swap files with complete path
set modeline              " Enable modelines
set visualbell            " Visual bell instead of beeping
set listchars=tab:·\      " List mode character for tab
set listchars+=eol:⌟      " ... end of line
set listchars+=trail:×    " ... trailing whitespace
set listchars+=precedes:… " ... start and
set listchars+=extends:…  " ... end of a truncated display line
set fillchars=vert:│      " Disable annoying chars for stl, diff, fold etc.
set fillchars+=diff:\     " ...
set relativenumber        " Show relative line numbers
set cursorline            " Highlight the screen line of the cursor
set foldcolumn=2          " Width of the fold column
set foldtext=MyFoldText() " Function for the text on closed folds
set spelllang=de          " Language for spell checking
set tabstop=2             " Number of spaces a Tab counts for in file
set shiftwidth=0          " Number of spaces for each (auto)indent
set softtabstop=-1        " Number of spaces a Tab counts for in insert
set expandtab             " Use appropriate number of spaces instead of a tab
set linebreak             " (Soft)wrap long lines
set showbreak=└\          " Char to show at beginning of wrapped lines
set textwidth=80          " Max. length of line for auto-formatting
set formatoptions=c       " Auto-wrap comments
set formatoptions+=r      " Inset comment leader after <Enter>
set formatoptions+=q      " Allow formatting of comments with 'gq'
set formatoptions+=n      " Recognize numbered lists
set formatoptions+=l      " Don't break already too long lines
set completeopt=menu      " Use a popup menu for completion
set completeopt+=menuone  " ... also when there is only one match
set completeopt+=longest  " Only insert the longest common text
set completeopt+=preview  " Show information about current item in preview
set complete=.,w,b,u,t,i  " Complete sources are all buffers, tags and includes
set laststatus=2          " Always show status line
set shortmess+=I          " Don't show intro message
set history=1000          " remember more commands and searches
set statusline=(%n)%f\ %m%<%r\ %c,%l\/%L(%P)%=%y%h%w%q[%{&fenc}][%{&ff}]
set dictionary=/usr/share/dict/ngerman " Dictionary for <C-X><C-K>
set backspace=indent,start,eol "allow backspace over those
set noshowmode            " Disable display of mode (-- INSERT --)
"}}}

" Autocmds {{{
autocmd BufEnter *.go    setfiletype go
autocmd BufEnter *.pde   setfiletype arduino
autocmd BufEnter *.scala setfiletype scala
autocmd BufEnter *.tex   setfiletype tex

" Enable Limelight in Goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
"}}}

" Color-Settings {{{
" enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Use colors for a dark background
set background=dark
" Force some text decorations
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
" Load color scheme
colorscheme gruvbox
" Highlight the 81st column if there is a character
" highlight col81 ctermbg=red guibg=red
" match col81 /\%<82v.\%>81v/
"}}}

" Variable Settings {{{
" Disable fold column in taglist
let showmarks_enable = 0
" Set comma as leader
let mapleader = ","
" Remove airline seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
" Set airline color theme
let g:airline_theme = 'gruvbox'
" Enable neocompl at startup
let g:neocomplcache_enable_at_startup = 1
" Press s for next sneak match
let g:sneak#s_next = 1
" Enable easymotion-like behaviour
let g:sneak#streak = 1
" Make neomake open clist/llist automatically
let g:neomake_open_list = 1
" Let unite track yank history
let g:unite_source_history_yank_enable = 1
" Use a fuzzy matcher for unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Rank results by matching length
call unite#filters#sorter_default#use(['sorter_rank'])
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
endif
call unite#custom#profile('default', 'context', {
  \ 'start_insert': 1,
  \ 'split': 0,
  \ })
"}}}

" Keymaps and Abbrevs {{{
" Scroll down half a screen
nnoremap <Space> <C-D>

" Toggle graphical undo window
nmap <F4>  :UndotreeToggle<CR>
nmap <F5>  :nohls<CR>
nmap <F6>  :TagbarToggle<CR>
" <F8> reserved for pastetoggle
nmap <C-PageUp> :bnext<CR>
nmap <C-PageDown> :bprevious<CR>
nmap <C-Right> :cnext<CR>
nmap <C-Left> :cprevious<CR>
" Move up and down in the changelist
nnoremap <C-Up> g;
nnoremap <C-Down> g,
" 'Focus' the current fold by folding all the others
nnoremap <leader>z zMzv<esc>
" sudo and write (if you forgot to sudo first)
cmap w!! w <esc>!sudo tee % >/dev/null
" indent more or less in visual mode with < and >
vnoremap < <gv
vnoremap > >gv
" center matching line from n and N
nnoremap n nzz
nnoremap N Nzz
" make file and open/close quickfix window accordingly
nnoremap <silent> <leader>m :silent! :write \| :Neomake<CR>
nnoremap <leader>p :Unite -buffer-name=yank history/yank<cr>
nnoremap <leader>b :Unite -buffer-name=buffer buffer<cr>
nnoremap <leader>f :Unite -buffer-name=files file_rec<cr>
nnoremap <leader>o :Unite -buffer-name=outline outline<cr>
nnoremap <leader>l :Unite -buffer-name=line line<cr>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

inoremap <expr><Tab> neocomplcache#start_manual_complete()
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-h> neocomplcache#complete_common_string()
" }}}

" Functions {{{
" get the text for 'foldtext'
function! MyFoldText ()
  let ftextmarker = '+> '
  " number of lines of the fold
  let flength = 1 + v:foldend - v:foldstart
  let flstring = '(' . flength . ' lines)'
  " get the first folded line
  let fname = getline(v:foldstart)
  " delete fold markers
  let fname = substitute(fname, '{\{3}\d\?', '', 'g')
  " delete leading comment marker
  let fname = substitute(fname, '^\s*[#"%!;]\|\/\/\|--', '', '')
  " delete leading whitespace
  let fname = substitute(fname, '^\s*', '', '')
  " append ftextmarker and indentation
  " this uses the correct amount of spaces even if you use tabs
  let fname = repeat(' ', indent(v:foldstart)) . ftextmarker . fname
  " the length of a windowline
  let lwidth = winwidth(0) - &foldcolumn
    \ - (&number || &relativenumber ? &numberwidth : 0)
  " calculate number of spaces for filling (flstring right aligned)
  let fillwidth = lwidth - strdisplaywidth(fname)
    \ - strdisplaywidth(flstring)

  let ftext = fname . repeat(' ',fillwidth) . flstring
  return ftext
endfunction

" from vimcast.org
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
" }}}

" vim: foldmethod=marker