package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int |
print |
if |
else |
for {lexeme=yytext(); return Reservada;}


"=" |
"+" |
"-" | 
"*" |
"/" |
":="| 
">="| 
"<="| 
">"|  
"<"| 
"<>"|
"{"|
"}"|
"["|
"]" {lexeme=yytext(); return Simbolo;}


","|  
";" 
{lexeme=yytext(); return Separador;}



"(",")"  {return Cadena;}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}


{L}({L}|{D})*{0,10} {lexeme=yytext(); return Identificador;}
("{D}")|({D}) {lexeme=yytext(); return Numero;}
 . {return ERROR;}

