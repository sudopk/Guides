# Motion
*Motions generally can take a count before them*
* h j k l
* ^d ^u (page up and page down)
* gg (start of page)
* G (end of page)
* b w
* 0 (start of line, even if starts with space)
* ^ (start of line at first non-space char)
* $ (end of line)

# Edit
* i (edit before cursor)
* a (append, edit after cursor)
* A (edit at end of line)

# Escape
* ^[
* esc

# Delete
* x
* d\<motion\>
* c\<motion\> (Replace)
* for d or c
  * dt\<character\> (*delete* or cut *till* character)
  
*Difference between d and c is that c puts in edit mode while d doesn't*

# Copy
* y\<motion\>
* yy (yank whole line)
* p (paste)

# File related
* :w \[file name\] (file name optional)
* :e \[file name\] (file name optional)
* :e! (reload the file)

# Search
* set hlsearch (highlights the search)
* set nohlsearch (no highlight)
* /\<search term\> (search *down* in the document)
* ?\<search term/> (search *up* in the document)
* \* (search next word under cursor)
* \# (search previous word under cursor)
* n shift-n (next and previous search result)
  * Depend upon if you used /,\* or ?,\# to search
* f\<character\> (find after cursor)
  * ; (go to next find result)
  * , (go to previous find result)
  * *n and shift-n won't work here*
  
*Search is also a motion, so you can do d/foo i.e. delete until foo*
> You can also do d\* under a word to delete till next occurance
  
# Replace/Substitute
* :\<range\>s/\<search pattern\>/\<replace pattern\>/\<what to replace\>
* \<range\>
  * % is entire page
* s means substitute
* \<what to replace\>
  * g means replace-all (i.e. global)
  . if left blank, that will replace the first occurance
