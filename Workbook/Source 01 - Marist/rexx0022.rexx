/* rexx */
/**************************** REXX *********************************/
/* This program adds two numbers and produces their sum.           */
/*******************************************************************/
say 'Enter first number.'
PULL number1                                /* Assigns: number1=42 */
say 'Enter second number.'
PULL number2                                /* Assigns: number2=21 */
sum = number1 + number2
SAY 'The sum of the two numbers is' sum'.'
