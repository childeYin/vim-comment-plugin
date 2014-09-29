if !exists("g:commentvim_loaded")
function! Comment()
python << EOF
import vim
docComment = []
cVersion = "    *PHP version 5.5"
cCategory = "    * @category   e路相扶"
cCategory = "    * @package e路相扶"
cAuthor = "    * @author     e路相扶<zhangjun516@126.com>"
cCopyright = "    * @copyright 2014 zhangjun"
cLicense = "    * @license   http://www.wownepiece.com zhangjun"
cLink = "    * @link      http://www.wownepiece.com"
docComment.append('    /**')
docComment.append(cVersion)
docComment.append(cCategory)
docComment.append(cAuthor)
docComment.append(cCopyright)
docComment.append(cLicense)
docComment.append(cLink)
docComment.append('    *')
docComment.append('    */')
length = len(docComment)
    
vim.current.buffer[1:length] = docComment

EOF
endfunc


function! FuncComment()
python << EOF
import vim,re,string
(row, col) = vim.current.window.cursor
filename = vim.current.buffer.name
f = open(filename, 'r')
global lines 
lines = f.readlines()

line = vim.current.buffer[row-1]
p = re.search('\(.*.\)', line)
if p :
    line = p.group(0)
    line = line.replace('(', '')
    line = line.replace(')', '')
    params = line.split(',')
    parmas = list(params);
    strs = "    /**"
    paramList = []
    paramList.append(strs)
    strs = "    *"
    paramList.append(strs)
    for param in params:
        param.strip()
        parString = "    * @param mixed "+param+' '+param
        paramList.append(parString)

    endString ="    * @return mixed"
    paramList.append(endString)
    endString = "    */"
    paramList.append(endString)
    length = len(paramList)
    
    vim.current.buffer[row-1:length] = paramList
else :
    paramList = []
    paramList.append("    /**")
    paramList.append("    *")
    paramList.append("    * @return mixed")
    paramList.append("    */")
    length = len(paramList)
    
    vim.current.buffer[row-1:length] = paramList
EOF
endfunc


endif


command!  DC  :call Comment()

command!  FC :call FuncComment()
