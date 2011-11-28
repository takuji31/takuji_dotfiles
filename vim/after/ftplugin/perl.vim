set dictionary+=~/.vim/dict/perl.dict

" for container
iabbrev ct, container('')<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev ctc, container('conf')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdb, container('db')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdm, container('db_master')-><C-R>=Eatchar('\s')<CR>
iabbrev ctds, container('db_slave')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmo, container('mogile')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmk, container('mogile_key')-><C-R>=Eatchar('\s')<CR>
iabbrev ctca, container('cache')-><C-R>=Eatchar('\s')<CR>
iabbrev ctck, container('cache_key')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdt, container('dt')-><C-R>=Eatchar('\s')<CR>

