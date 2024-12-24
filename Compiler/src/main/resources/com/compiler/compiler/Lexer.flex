package com.compiler.compiler;
import static compilador.Tokens.*;

%%
%class Lexer
%type Tokens

letra=[a-zA-Z_]
Cadena = "\"" [^\"]* "\""
Caracter = "'" [^'\n\\'] "'"
digito=[0-9]
opAg=[\(,\),\[,\],{,}]
opAr=[*,\+,\-,/]
opRe=[<,>]
com=[\,]
comillas=[\"]+
comillasS=[']+
espacio=[ ,\t,\r]+
space2=[" ", \s, \t]+
simbolos=[\!,#,$,%,&,\(,\),*,\+,\,,\-,\.,/,:,;,<,=,>,?,@,\[,\],\^,_,`,{,|,},¿]+

%{
    public String lexeme;
%}
%%


Programa|float|int|char|String|if|else|for|read|print  {lexeme=yytext(); return reservada;}

(" "|"\t")+ { lexeme=yytext(); return espacio; }

{com} {lexeme=yytext();return coma;}
{opAg} {lexeme=yytext(); return agrupacion;}
{opAr} {lexeme=yytext(); return aritmetico;}
{opRe} {lexeme=yytext(); return relacional;}
{comillas}({letra}|{digito}|{espacio}|{simbolos})*{comillas} {lexeme=yytext(); return litCad;}
{comillasS}({letra}|{digito}){comillasS} {lexeme=yytext(); return litCar;}


"//".* {/*Ignore*/}
("/*")({comillas}|{letra}|{digito}|{espacio}|{simbolos}|{comillasS}|{opAg}|{opAr}|{opRe}|"\n")*("*/") {/*Ignore*/}

"\n" {lexeme=yytext(); return salto;}
"=" {lexeme=yytext(); return asignacion;}
";" {lexeme=yytext();return finSentencia;}
":" {lexeme=yytext();return puntos;}
{opAg} {lexeme=yytext(); return agrupacion;}
{opAr} {lexeme=yytext(); return aritmetico;}
{opRe} {lexeme=yytext(); return relacional;}
"<=" {lexeme=yytext(); return menIgual;}
">=" {lexeme=yytext(); return mayIgual;}
"==" {lexeme=yytext(); return igual;}
"!=" {lexeme=yytext(); return dif;}
"++" {lexeme=yytext(); return incr;}
"--" {lexeme=yytext(); return decr;}

{letra}({letra}|{digito})* {lexeme=yytext(); return id;}

{digito}+ {lexeme=yytext(); return num;}
{digito}+"."{digito}* {lexeme=yytext(); return num;}

{comillas}({letra}|{digito}|{espacio}|{simbolos})* { lexeme=yytext(); return ERRORLCAD; }
{comillasS}({letra}|{digito}) { lexeme=yytext(); return ERRORLCAR; }
 . {lexeme=yytext(); return ERROR;}
