
%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
void decToBinary(int n);
%}

%token INTEGER

%%
program:
program expr '\n' { decToBinary($2); }
|
;
expr:
INTEGER { $$ = $1; }
;
%%

void decToBinary(int n) {
printf("Binary value: ");
int binaryNum[32];
int i = 0;
while (n > 0) {
binaryNum[i] = n%2;
n = n / 2;
i++;
}
for (int j = i-1; j >=0 ;j--)
printf("%d", binaryNum[j]);
printf("\n");
}

void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}

int main(void) {
yyparse();
return 0;
}
