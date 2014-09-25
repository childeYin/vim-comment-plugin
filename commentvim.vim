if !exists("g:commentvim_loaded")
function! Comment()
python << EOF
import vim
filename = vim.current.buffer.name
f = open(filename, 'r')
lines = f.readlines()
f.close()
lines[0] = "<?php\n /**\n * PHP version 5.5 \n * \n *  @category  PHP\n * @package   Dopool_Platform\n * @author    zhangjun <zhangjun516@126.com>\n * @copyright 2014 zhangjun\n * @license   http://www.dopool.com starchina\n * @link      http://www.dopool.com \n */\n"
f = open(filename, 'w')
f.writelines(lines)
f.close()
EOF
endfunc

endif


command!  FC :call Comment()
command!  CF :call ConComment()
