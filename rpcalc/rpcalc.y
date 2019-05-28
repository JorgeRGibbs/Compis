/* Reverse Polish Notation calculator. */

%{
  #include <stdio.h>  
  #include <math.h>
  int 
  yylex (void);

  /* Called by yyparse on error. */
  void
  yyerror (char const *s)
  {
    fprintf (stderr, "%s\n", s);
  }


%}


%define api.value.type {double}
%token NUM

%% /* Grammar rules and actions follow. */
input:
  %empty
| input line
;


line:
  '\n'
| exp '\n'      { printf ("%.10g\n", $1); }
;


exp:
  NUM
| exp exp '+'   { $$ = $1 + $2;      }
| exp exp '-'   { $$ = $1 - $2;      }
| exp exp '*'   { $$ = $1 * $2;      }
| exp exp '/'   { $$ = $1 / $2;      }
| exp exp '^'   { $$ = pow ($1, $2); }  /* Exponentiation */
| exp 'n'       { $$ = -$1;          }  /* Unary minus   */
;

%%
int
main (void)
{
  return yyparse();
}
