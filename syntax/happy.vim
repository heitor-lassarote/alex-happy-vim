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

" Identifiers
sy region string start=/"/ end=/"/ skip=/\\\@<!\\"/
hi def link string String

sy region string2 start=/'/ end=/'/ skip=/\\\@<!\\'/
hi def link string2 String

sy match identifier /[a-zA-Z_][a-zA-Z0-9_']*/
hi def link identifier Identifier

sy cluster identifiers contains=identifier,string,string2

" Error
sy keyword error error
hi def link error Exception

" Parameterized productions
sy match parameterized /[a-zA-Z_][a-zA-Z0-9_']*\s*(\@=/ nextgroup=args skipwhite skipempty
hi def link parameterized Function

sy region args start=/(/ end=/)/ contains=@identifiers contained

" Non-terminals
sy match nonTerminalDef /[:|]/
hi def link nonTerminalDef Conditional

" Type definition
sy match typeDefinition /::/

" Numbers
sy match number /\<[0-9]\+\>/
hi def link number Number

" Keywords and punctuation
sy match directive /%\(tokentype\|token\|name\|partial\|monad\|lexer\|left\|nonassoc\|right\|expect\|error\|errorhandlertype\|attributetype\|attribute\|shift\|prec\)\>/
hi def link directive Keyword

sy keyword errorHandlerType explist default
hi def link errorHandlerType Keyword

sy match beginRules /%%/
hi def link beginRules PreProc

" Inline Haskell within braces
sy include @Haskell syntax/haskell.vim
sy region haskellInline start=/{@\?/ end=/}\@!/ skip=/\\\({\|\[\|(\)/ contains=@Haskell fold

" Variables
sy match variable /\$\(\$\|\d\+\)/ containedin=@Haskell contained
hi def link variable Identifier

" Comments
sy region lineComment start=/--/ end=/$/ contains=@Spell containedin=ALLBUT,string,string2,blockComment
hi def link lineComment Comment

sy region blockComment start=/{-/ end=/-}/ contains=@Spell,blockComment containedin=ALLBUT,string,string2,lineComment fold
hi def link blockComment Comment

let b:current_syntax = "happy"
