/* REXX */

/* Assume the program is called with: REXX program_name 'arg1',,'arg3'*/

say ARG()        /* Returns 3 (number of arguments) */
say ARG(1)       /* Returns 'arg1' */
say ARG(2)       /* Returns '' (empty string, as arg2 was omitted) */
say ARG(3)       /* Returns 'arg3' */
say ARG(4)       /* Returns '' (empty string, as arg4 does not exist) */

say ARG(1, 'E')  /* Returns 1 (arg1 exists) */
say ARG(2, 'E')  /* Returns 0 (arg2 does not exist) */
say ARG(2, 'O')  /* Returns 1 (arg2 was omitted) */
say ARG(4, 'O')  /* Returns 1 (arg4 was omitted) */

