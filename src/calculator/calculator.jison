/* description: Parses and executes mathematical expressions. */

/* lexical grammar */

%lex
%%

\s+ /* skip whitespace */
[0-9]+("."[0-9]+)?\b return 'NUMBER'
"*" return '*'
"/" return '/'
"-" return '-'
"+" return '+'
"(" return '('
")" return ')'
<<EOF>> return 'EOF'
. return 'INVALID'

/lex

%{
var parse = require("./calculatorParseTree.js").parse;
%}

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'

%start expressions

%% /* language grammar */

expressions
: e EOF
{
console.log(parse($$));
}
;
e
: e '+' e
{$$ = {op: $2, left: $1, right: $3}}
| e '-' e
{$$ = {op: $2, left: $1, right: $3}}
| e '/' e
{$$ = {op: $2, left: $1, right: $3}}
| e '*' e
{$$ = {op: $2, left: $1, right: $3}}
| '(' e ')'
{$$ = $2;}
| NUMBER
{$$ = Number(yytext);}
;