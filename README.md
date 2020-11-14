#### Emacs Setup
Likely my setup is quite terrible but... here it is!

I refer to this file when setting up an Emacs environment on new machines.

Steps:
1. Place the emacs file contents into the ~/.emacs file or ~/.emacs.d/...
2. Install any missing packages
    * M-x list-packages > C-s dired-subtree > install this package
    * M-x list-packages > C-s smex > install this package
    * M-x list-packages > C-s ace-mc > install this package
3. Restart Emacs
    * C-x C-c
4. (Optional) For non-Mac OSs
    * Remove line [TODO] from .emacs file to skip the control key remapping