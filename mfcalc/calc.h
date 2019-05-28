/* calc.h */
/* Data type for links in the chain of symbols. */

struct symrec {
  char * name; /* name of symbol */
  int  type;   /* type of symbol: VAR or FNCT */
  union {
    double var;          /* value of a VAR  */
    double (*fnctptr)(double); /* value of a FNCT */
  } value;
  struct symrec * next;  /* link field      */
};

typedef struct symrec symrec;

/* The symbol table: a chain of 'struct symrec' */
extern symrec * sym_table;

symrec * putsym (char * sym_name, int sym_type);
symrec * getsym (char * sym_name);
