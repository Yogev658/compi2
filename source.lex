%{

#include <stdio.h>	
#include "output.hpp"      #CHECK IF CORRECT
#include "parser.tab.hpp"  #CHECK IF CORRECT

using output::errorLex;

%}

%option yylineno
%option noyywrap

whitespace        ([\t\n\r ])

%%

void									return VOID;
int										return INT;
byte									return BYTE;
b										return B;
bool									return BOOL;
auto 									return AUTO;
and										return AND;
or 										return OR;
not										return NOT;
true									return TRUE;
false									return FALSE;
return									return RETURN;
if										return IF;
else									return ELSE;
while									return WHILE;
break									return BREAK;
continue								return CONTINUE;
";"										return SC;
","										return COMMA;
"("										return LPAREN;
")"										return RPAREN;
"{"										return LBRACE;
"}"										return RBRACE;
"="										return ASSIGN;
"=="|"!="|"<"|">"|"<="|">="				return RELOP;
"+"|"-"|"*"|"/"							return BINOP;
[a-zA-Z][a-zA-Z0-9]*					return ID;
"0"|[1-9][0-9]*							return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\"           return STRING;

{whitespace}+                           ;
//[^\r\n]*[\r|\n|\r\n]?                 ;

.                       errorLex(yylineno);
%%
