### Installation

```
Plug 'smbache/vim-consolelog'
```

### Usage

Default mapping is `cl<motion>` in normal mode, or simply `cl` in visual mode.

Currently only these filetypes have useful implementations, however custom
setup is easy. Feel free to add more in a pull request.

* javascript
* ruby

### Customization
To add behaviour for a filetype that is not implemented, here's a simple 
example of `ftplugin/ruby.vim`:

```ruby
" Define a function that takes the content to console log:
function! CLRuby(msg)
  return 'puts({ ''' . a:msg . ''' => '. a:msg .' })'
endfunction

" define the formatter for the buffer:
let b:cl_formatter = 'CLRuby'
```

### Mappings
To change the mappings of the plugin, you can do so like this

```
" Normal mode mapping
nmap cl <Plug>(ConsoleLog)

" Visual mode mapping
vmap cl <Plug>(VConsoleLog)
```

When mappings are defined in you `.vimrc` or `init.vim` the default
mappings are not set.
