# vim_statax
Vim - Stata integration scripts for X11 in Linux

I modified this small script for sending do files from vim to Stata. The
original version comes from this link 

http://stackoverflow.com/questions/4226145/sending-code-from-vim-to-stata

In this version wmctrl and xsel were changed to xdotools and xclip, to make the
script compatible with a larger number of window managers. 

## Installation

Pretty straightforward: 

1. Install xdotool and xclip
2. Copy rundo.sh to your home directory (I leave it inside .vim/)
3. Insert the contents of vimrc to your .vimrc file and update the rundo.sh
   location . You can change the mappings there (default is F11 for sending
   selected lines, and F12 for sending the whole do file).

It is possible to automate the opening of Stata uncommenting some lines inside
rundo.sh and editing the Stata program file location.

## Development

In the future, I will try to transform these two scripts into a vim plugin.  Now
I am focused on developing a plugin similar to nvim-R, for Stata (without X).

## Alternatives

A very nice alternative is [vim-stata](https://github.com/zizhongyan/vim-stata).
It comes with syntax highlighting and many others functions.

