" Copyright (C) 2024 Heitor Toledo Lassarote de Paula
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <https://www.gnu.org/licenses/>.

if exists("b:current_syntax")
    finish
endif

sy sync fromstart

" Strings
sy region string start=/"/ end=/"/ skip=/\\"/
hi def link string String

" Regular expressions
sy cluster regex contains=parentheses,many,genericSpecial,alternation,escape,characterSet,regexMacro,repeat,set

sy region parentheses start=/(/ end=/)/ contains=@regex

sy match many /[*+?]/
hi def link many Repeat
sy match alternation /|/
hi def link alternation Conditional
sy match genericSpecial /[.\$#~\/]/
hi def link genericSpecial Special

sy match escape /\\\([[:print:]]\|x[0-9a-fA-F]\+\|o[0-7]\+\|[0-9]\+\)/
hi def link escape Special

" Gets overriden by @Haskell, but it's fine, since it also contains a
" definition of number.
sy region repeat start=/{/ end=/}/ contains=number

" Sets
sy region set start=/\[/ end=/\]/ contains=set,char,characterSet,range,complement,escape

sy match char /[a-zA-Z0-9_'!&\-,.]\+/
hi def link char Special

sy match range /[a-zA-Z0-9]-[a-zA-Z0-9]/ contained
hi def link range Special

sy match complement /\^/ contained
hi def link complement Special

" Character sets
sy match characterSet /\$[a-zA-Z][a-zA-Z'_]*/
hi def link characterSet Identifier

" Regex macros
sy match regexMacro /@[a-zA-Z][a-zA-Z'_]*/
hi def link regexMacro Identifier

" Start codes
sy region startcodes start=/</ end=/>/ contains=startcode nextgroup=rules,@regex,semicolon skipwhite skipempty
sy match startcode /0\|[a-z_][a-zA-Z'_]*/ contained
hi def link startcode Label

" Numbers
sy match number /\<[0-9]\+\>/
hi def link number Number

" Keywords and punctuation
sy match directive /%\(wrapper\|encoding\|action\|token\|typeclass\)/
hi def link directive Keyword

sy match beginRules /\([a-z_][a-zA-Z'_]*\)\?\s*:-/
hi def link beginRules PreProc

sy match equals /=/
hi def link equals Operator

sy match semicolon /;/
hi def link semicolon Operator

" Inline Haskell within braces
sy include @Haskell syntax/haskell.vim
sy region haskellInline start=/{/ end=/}\@!/ skip=/\\\({\|\[\|(\)/ contains=@Haskell fold

" Rules
sy region rules start=/{/ end=/}\@!/ contained fold

" Comments
sy region lineComment start=/--/ end=/$/ contains=@Spell containedin=ALLBUT,string,blockComment
hi def link lineComment Comment

sy region blockComment start=/{-/ end=/-}/ contains=@Spell,blockComment containedin=ALLBUT,string,lineComment fold
hi def link blockComment Comment

let b:current_syntax = "alex"
