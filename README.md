# shell_scripting

Different types of Shell
   -> CSH C Shell
   -> SH Bourne Shell
   -> KSH Korn Shell
   
   BASH (Born/Bourne again shell) = CSH + SH + KSH 
   
BASH Shell Scripting:

File extension of bash shell script can be either with `.sh`  or `.bash`.

It need not to be in that extention, Because in Linux OSs you dont have extensions. Those are only for user understanding.

In Linux SH is nothing but BASH and both are same.



1. She-Bang (#!)

She-Bang (#!) denotes the path of interpreter. 
She-bang is recomended to use as a standard industry practice. It should be in very first line.

```
#!/bin/bash
```

```
#!/usr/bin/python
```

2. Comments

We can make some comments inside the code and we need to get it ignored while executing. Any line starting with `#` is treated as command and such lines are ignored by all the interpreters.

