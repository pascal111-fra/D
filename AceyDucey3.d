/* Acey Ducey game,
originally programmed in
BASIC */


// D programming language

import std.stdio;
import core.stdc.stdlib;
import std.ascii;
import core.stdc.string;
import core.stdc.stdio;
import core.time;
import std.conv;
import std.random;



/*
char* card_name(int); // turning cards valuse into strings function

void no_money_test(ref int); // money = 0 test
*/



// turning cards valuse into strings function
void card_name(int x, ref string c)
{

/* char* c=cast(char*) malloc((strlen("queen")+1)*(char.sizeof));

if(!c){
 writeln("A memory allocation failed!");
 exit(EXIT_FAILURE);} */

switch (x)
{

case 11:
	c="Jack";
	break;

case 12:
	c="Queen";
	break;

case 13:
	c="King";
	break;

case 14:
	c="Ace";
	break;

default:
        c=to!string(x);


}


}



// money = 0 test
void no_money_test(ref int your_money)
{

char q;

if (your_money == 0)

{


do
{
writeln("Oops! you have no money to bet with,");
write("do you want playing again (y/n)? ");

readf(" %c", &q);

} while ((toLower(q)!='y') &&
           (toLower(q)!='n'));

if (toLower(q)=='y') // nasted in 'if money = 0'
{

your_money = 100;

}

else
   exit(EXIT_SUCCESS);

} // if money = 0

}




int main()
{

int your_money=100;
int card_A,
    card_B, card_C;

string card_A_name,
	card_B_name,
	card_C_name;

char q;

int bet_much;

//srand(time(NULL));



do // 1st do
{


writeln("You've ", your_money, "$");


// Generating the two cards:

do
{

card_A = uniform(0, 13)+2; //(rand()%13)+2;
card_B = uniform(0, 13)+2;

} while (!((card_B - card_A) > 2) &&
           !((card_A==2)&&(card_B==14)));


card_name(card_A, card_A_name);
card_name(card_B, card_B_name);

writeln("Here are your two cards: ", card_A_name, " ", card_B_name);



// Betting query:


card_C = uniform(0, 13)+2;

do
{

write("Do you'll bet (y/n/e = (exit))? ");
readf(" %c", &q);

} while ((toLower(q)!='y') &&
           (toLower(q)!='n') &&
           (toLower(q)!='e'));


// agreeing betting

if (toLower(q)=='y')

{


do
{
write("With how much? ");
readf(" %d", &bet_much);

if (bet_much>your_money)
   {

     writeln("You don't have this much to bet with,");
     writeln("you have ", your_money, "$");

   }

} while (!(bet_much<=your_money));


if ((card_C>=card_A) && (card_C<=card_B)) // following agreeing betting 'if'
   {


    card_name(card_C, card_C_name);
    writeln("You are right! ");
    writeln("3rd card is: ", card_C_name);

    your_money+=bet_much;

   }

else
    {

     card_name(card_C, card_C_name);
     writeln("Oops! you are wrong!");
     writeln("3rd card is: ", card_C_name);
     your_money-=bet_much;

    }

}

else // 'else if' of agreeing betting 'if'
 if(toLower(q)=='e')
    exit(0);
else // considered final 'else' of agreeing betting 'if'
 writeln("CHICKEN!!!");



// Your money = 0 test

no_money_test(your_money);



} while (true); // 1st do




return 0;
}




