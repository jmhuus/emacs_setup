#### Emacs Setup
Likely my setup is quite terrible but... here it is!

I refer to this file when setting up an Emacs environment on new machines.

Steps:
1. Place the emacs file contents into the ~/.emacs file or ~/.emacs.d/...
2. Install any missing packages
    * M-x list-packages > C-s dired-subtree > install this package
    * M-x list-packages > C-s smex > install this package
    * M-x list-packages > C-s ace-mc > install this package
    * M-x list-packages > C-s expand-region > install this package   (Melpa version)
    * M-x list-packages > C-s tide > install this package
    * M-x list-packages > C-s spacemacs-theme > install this package
3. Restart Emacs
    * C-x C-c
4. (Optional) For non-Mac OSs
    * Remove line [TODO] from .emacs file to skip the control key remapping


Troubleshooting During Set Up:
* If a package listed above, such as dired-subtree or others, isn't listed when using `M-x list-packages` try commenting out all lines in the .emacs file and keep `(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))`