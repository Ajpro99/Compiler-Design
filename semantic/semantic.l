%{
    #include "y.tab.h"
    int countn=0;
%}
%option yylineno
%option noinput nounput
alphabet [a-zA-Z]
digit [0-9]

%%

"write"		{ strcpy(yylval.nd_obj.name,(yytext)); return PRINT; }
"get"		{ strcpy(yylval.nd_obj.name,(yytext)); return SCAN; }

"check"      { strcpy(yylval.nd_obj.name,(yytext)); return IF; }
"otherwise"		{ strcpy(yylval.nd_obj.name,(yytext)); return ELSE; }
"send" 		   { strcpy(yylval.nd_obj.name,(yytext)); return RETURN; }
"or"      { strcpy(yylval.nd_obj.name,(yytext)); return ELIF; }
"set"	      { strcpy(yylval.nd_obj.name,(yytext)); return DECLARE; }
"+"		      { strcpy(yylval.nd_obj.name,(yytext)); return ADD; }
"-"		      { strcpy(yylval.nd_obj.name,(yytext)); return SUB; }
"*"		      { strcpy(yylval.nd_obj.name,(yytext)); return MULT; }
"/"		      { strcpy(yylval.nd_obj.name,(yytext)); return DIV; }
"log"		      { strcpy(yylval.nd_obj.name,(yytext)); return LOG; }
"exp"		      { strcpy(yylval.nd_obj.name,(yytext)); return POW; }
"until"       { strcpy(yylval.nd_obj.name,(yytext)); return WHILE; }

">="		      { strcpy(yylval.nd_obj.name,(yytext)); return GE; }
"<="		      { strcpy(yylval.nd_obj.name,(yytext)); return LE; }
">"		      { strcpy(yylval.nd_obj.name,(yytext)); return GT; }
"<"		      { strcpy(yylval.nd_obj.name,(yytext)); return LT; }
"=="		      { strcpy(yylval.nd_obj.name,(yytext)); return EQ; }
"=!="		      { strcpy(yylval.nd_obj.name,(yytext)); return NE; }

"valid"		   { strcpy(yylval.nd_obj.name,(yytext)); return TRUE; }
"invalid"		      { strcpy(yylval.nd_obj.name,(yytext)); return FALSE; }
"&&"		      { strcpy(yylval.nd_obj.name,(yytext)); return AND; }
"||"		      { strcpy(yylval.nd_obj.name,(yytext)); return OR; }


"number"		      { strcpy(yylval.nd_obj.name,(yytext)); return INT; }
"decimal"		      { strcpy(yylval.nd_obj.name,(yytext)); return FLOAT; }
"string"		      { strcpy(yylval.nd_obj.name,(yytext)); return STR; }
"boolean"		   { strcpy(yylval.nd_obj.name,(yytext)); return BOOL; }
"letter"         { strcpy(yylval.nd_obj.name,(yytext)); return CHAR; }

\#.*			   { ; }
[ \t]*			{ ; }
[\n]			   { countn++; }


[-]?{digit}+                		{ strcpy(yylval.nd_obj.name,(yytext)); return NUM; }
[-]?{digit}+\.{digit}{1,6}  		{ strcpy(yylval.nd_obj.name,(yytext)); return FLOAT_NUM; }
{alphabet}({alphabet}|{digit})*  { strcpy(yylval.nd_obj.name,(yytext)); return ID; }



["].*["]                    { strcpy(yylval.nd_obj.name,(yytext)); return STR; }
['].[']                     { strcpy(yylval.nd_obj.name,(yytext)); return CHARACTER; }

";"|"="|","|"{"|"}"|"("|")"|"["|"]"|"*"|"+"|"-"|"/"|"?"|":"|"&"|"|"|"^"|"!"|"~"|"%"|"<"|">" { strcpy(yylval.nd_obj.name,(yytext));return yytext[0];}

%%

int yywrap() {
    return 1;
}
