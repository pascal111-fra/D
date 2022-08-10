module proj07;

import std.stdio;
import std.algorithm;
import std.range;

int main()
{

    double x, y;
    int choice;

new_again:
    
    x=0;
    y=0;

    write("Enter a number: ");
    readf(" %s\n", &x);
    y=x;
    writeln;

choice_again:

    writeln("1) addition 2) subtraction 3) 
    multiplication 4) division 0) exit -1) new");
    ": ".write;

    readf(" %s\n", &choice);

    if(!only(1,2,3,4,0,-1).canFind(choice))
        goto choice_again;
    else if(choice==0)
        return 0;
    else if(choice==-1)
        goto new_again;

    write("Enter a number: ");
    readf(" %s\n", &x);

    switch(choice){

        case 1: y+=x; break;
        case 2: y-=x; break;
        case 3: y*=x; break;
        case 4: y/=x; break;
        default: break;}

    y.writeln;

    goto choice_again;

}