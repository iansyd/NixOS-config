Cursor Movement
---------------

h   left
l   right
j   down
k   up
w   forward to start of next word
b   backwards to start of prior work
0   to start of the line
$   to end of  the line
gg  to start of file
G   to end of file
<#> G   goto to line #
gg      goto start of file


motions and actions
-------------------

<operator> [number] <motion> 
with:

<action>
<esc>   normal mode
d   delete
c   change
i   insert before cursor location
r   replace a character then revert to normal mode
R   replace until <esc>
P   put (before)
p   put (after)
a   append after the cursor location
A   append at the end of the line
y   yank text

<motion>
<#>w   until the start of the next word, EXCLUDING its first character.
<#>e   to the end of the current word, INCLUDING the last character.
<#>$   to the end of the line, INCLUDING the last character.
with <#> as the number of tiems to repeat

<#>x    deleted character(s)

u   undo the last command
U   undo commands on the whole line
<C-r>   to redo an undone command (<C-r> is Ctrl & r)


Work on a line
--------------
yy  yank a line
dd  delete a line
p   put a yanked or deleted line after the cursor
P   put the text before the cursor

<C-g>   show location


Searching
---------
/ phrase # to find phrase searching forwards
? phrase # to find phrase searching backwards
<C-o>   go back to origin
<C-i>   go forward
%       move to matching (){}[]


Search and Replace
------------------
:s/find/replace/g   # adding g makes it global for this line, otherwise only replace once
:#,#s/old/new/g     # replaces all between lines # and #
:%s/old/new/g       # replace every occurance in the file
:%s/old/new/gc      # as above but prompt at each occurance
# before using search commands
:set ic             # Ignore Case
:set hls            # highlight search
:set is:            # show partial matches too
:set nohlsearch     # don't highlight
# prepend with inv to invert set
# prepend with no to turn off a set command


run external command
-------------------
:!<command><enter>


Windows when using Kitty
------------------------
<Ctrl-Shift-Enter>  create new window
<Ctrl-Shift-l>      change layout
<Ctrl-Shift-[>      move to prev window
<Ctrl-Shift-]>      move to next window


Handling Files
--------------
:Ex         show a file explorer view to select a file
:w <name>   write a file called name into the current directory
:!ls        use external ls to show contents of current directory
:!rm <name> delete file called name from the currnet directory
:r test     read a file test and insert into the current location of cursor
:wq         write and quit
:q!         quit and abandon changes


Visual mode
-----------
v           to enter visual mode. Use keys to move around and change what is highlighted
:w <name>   to then write the selected info into a file called name in the current folder


New lines
---------
#O           Begin new line above in insert mode, when finished then repeat # times
#o           Begin new line below in insert mode, when finished then repeat # times
#]<space>    Insert empty line below cursor and stay in Normal mode, repeat # times


Command line search and completion
----------------------------------
In the command line press <C-d> to search for commands, tab to move through them,
and space to select.
Can also use <tab> to select a matching filename from starting chars.

