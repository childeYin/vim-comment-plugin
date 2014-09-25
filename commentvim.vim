if !exists("g:commentvim_loaded")
function! Comment()
python << EOF
import vim
filename = vim.current.buffer.name
f = open(filename, 'r')
lines = f.readlines()
f.close()
lines[0] = "<?php\n /**\n * PHP version 5.5\n   * @category PHP\n * @package \n * @author zhangjun516@126.com\n  * @copyright zhangjun\n * @license \n * @link \n */\n"
f = open(filename, 'w')
f.writelines(lines)
f.close()

EOF
endfunc
endif

command!  FC :call Comment()
