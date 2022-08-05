/* This is a BASIC language game
from a book called "BASIC COMPUTER
GAMES", edited by David H. Ahl,
Microsoft Edition. */

/******************* BAGELS *********************************/

import std.stdio;
import std.random;
import std.conv;
import core.stdc.stdlib;
import std.string;

int main()
{

//const NUMBERMAX=(sizeof(char)*3+1);

int pico,
fermi, my_number;
string my_number_str,
your_number, temp;
int i;

again:

writeln("Computer will generate an unsigned integer");
writeln("consisting of 3 digits, and you'll try to know");
writeln("the exact number computer keeps.\n");
writeln("Help hints are as following:");
writeln("PICO ==> one digit correct but in wrong position.");
writeln("FERMI ==> one digit correct and in right position.");
writeln("BAGELS ==> none of digits correct.\n");

generate_again:

my_number_str="0";

while(my_number_str.length!=3){
my_number=uniform(0,1000);
my_number_str=to!string(my_number);}

for(i=0; i<=1; i++)
if(my_number_str[i]==my_number_str[i+1])
goto generate_again;

if(my_number_str[0]==my_number_str[2])
goto generate_again;

do{

enter_again:

pico=0;
fermi=0;

write("Enter a 3 digits unsigned integer (n < 0 => exit): ");

/*if(!scanf("%d", &my_number)){
fflush(stdin);
goto enter_again;}
fflush(stdin);*/

readf(" %s\n", &my_number);

if(my_number<0){
//free(my_number_str);
//free(your_number);
exit(0);}

temp=to!string(my_number);

if(temp.length!=3)
goto enter_again;

your_number=temp;

for(i=0; i<=1; i++)
if(your_number[i]==your_number[i+1])
goto enter_again;

if(your_number[0]==your_number[2])
goto enter_again;

// PICO counting

if(your_number[0]==my_number_str[1] ||
your_number[0]==my_number_str[2])
++pico;

if(your_number[1]==my_number_str[2] ||
your_number[1]==my_number_str[0])
++pico;

if(your_number[2]==my_number_str[1] ||
your_number[2]==my_number_str[0])
++pico;


// FERMI counting

for(i=0; i<=2; i++)
if(your_number[i]==my_number_str[i])
++fermi;

if(pico)
for(i=1; i<=pico; i++)
write("PICO ");

if(fermi)
for(i=1; i<=fermi; i++)
write("FERMI ");

if(!pico && !fermi)
write("BAGELS");

writeln;

}while(fermi!=3);

writeln("You WON!");
write("Do you like to play again(y/n): ");
if(strip(readln())=="y")
goto again;

return 0;
}
