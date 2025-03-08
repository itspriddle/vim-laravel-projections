" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:laravel_projections") && g:laravel_projections
  finish
else
  let g:laravel_projections = 1
endif

let s:json = readfile(resolve(expand('<sfile>:p:h') . '/laravel-projections.json'))
let s:projections = projectionist#json_parse(s:json)

if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

let g:projectionist_heuristics["artisan"] = s:projections

if !exists('g:projectionist_transformations')
  let g:projectionist_transformations = {}
endif

function! g:projectionist_transformations.to_namespace(input, o) abort
  if a:input == '.'
    return ''
  endif

  return '\' . join(split(a:input, '/'), '\')
endfunction
