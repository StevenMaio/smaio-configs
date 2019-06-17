# smaio-vim

This repository contains my vim settings. This is just for me.

## Plugins and Plugin Manager

I'm using Pathogen as my plugin manager, and I'm using NERDTree and Emmitt.

## Powershell Config

# Line Movement
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Alt+b -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BackwardChar
Set-PSReadLineKeyHandler -Chord Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar

# Delete Motion
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function ForwardDeleteLine
#Set-PSReadLineKeyHandler -Chord Alt+h -Function BackwardDeleteWord
#Set-PSReadLineKeyHandler -Chord Ctrl+h -Function BackwardDeleteChar
Set-PSReadLineKeyHandler -Chord Alt+d -Function DeleteWord
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteChar
