return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.cmd([[
      let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-svelte',
            \ 'coc-prettier',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-highlight',
            \ 'coc-yaml',
            \ 'coc-styled-components',
            \ 'coc-java',
            \ 'coc-git',
            \ 'coc-go',
            \ 'coc-deno',
            \ 'coc-sumneko-lua',
            \ ]

      nmap <silent><C-]> <Plug>(coc-definition)
      nmap <silent><Leader>r  <Plug>(coc-rename)
      nnoremap K :call <SID>show_documentation()<CR>
      nmap <C-p> <Plug>(coc-diagnostic-prev)
      nmap <C-n> <Plug>(coc-diagnostic-next)

      nnoremap [Coc] <Nop>
      nmap <Leader>c [Coc]
      nmap [Coc]d <Plug>(coc-definition)
      nmap [Coc]t <Plug>(coc-type-definition)
      nmap [Coc]i <Plug>(coc-implementation)
      nmap [Coc]r <Plug>(coc-references)
      nmap [Coc]f  <Plug>(coc-format-selected)
      vmap [Coc]f  <Plug>(coc-format-selected)
      nmap [Coc]p <Plug>(coc-diagnostic-prev)
      nmap [Coc]n <Plug>(coc-diagnostic-next)
      nnoremap [Coc]o  :<C-u>CocList outline<cr>
      nnoremap [Coc]s  :<C-u>CocList -I symbols<cr>
      nnoremap [Coc]k :call <SID>show_documentation()<CR>

      " Show documentation in preview window
      function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        else
          call CocActionAsync('doHover')
        endif
      endfunction

      " Highlight symbol and show documentation under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')

      " Select sugestion
      inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
      inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
      inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
      inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"
      inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(0) : "\<Tab>"
      inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(0) : "\<S-Tab>"
      inoremap <silent><expr> <ESC> coc#pum#visible() ? coc#pum#cancel() : "\<ESC>"
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

      " Scroll suggestion
      inoremap <silent><expr> <C-f> coc#pum#visible() ? coc#pum#scroll(1) : "\<C-e>"
      inoremap <silent><expr> <C-b> coc#pum#visible() ? coc#pum#scroll(0) : "\<C-y>"

      " Scroll help
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

      " Git
      nmap [g <Plug>(coc-git-prevchunk)
      nmap ]g <Plug>(coc-git-nextchunk)

      command! GitCopyUrl :CocCommand git.copyUrl
      command! GitOpenUrlInBrowser :CocCommand git.browserOpen
    ]])
  end,
}
