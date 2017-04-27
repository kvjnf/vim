augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.swift setfiletype swift
  au BufRead,BufNewFile *.js setfiletype js
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  au BufRead,BufNewFile *.scss set filetype sass
augroup END
