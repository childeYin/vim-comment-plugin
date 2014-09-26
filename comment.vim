if !exists("g:comment_loaded")
function! Comment()
python << EOF
import vim
fileInfo = vim.current.buffer
b[0:1] = "<?php\n /**\n * PHP version 5.5 \n * \n *  @category  PHP\n * @package   Dopool_Platform\n * @author    zhangjun <zhangjun516@126.com>\n * @copyright 2014 zhangjun\n * @license   http://www.dopool.com starchina\n * @link      http://www.dopool.com \n */\n"
EOF
endfunc

endif


command!  CF :call Comment()
