module main;

import std.stdio;
import std.string;


int main(string[] args)
{

    char[] s1, s2, s3;
    int x_times;

    write("Enter a string: ");
    readln(s1);
    s1=strip(s1);

    write("Enter another string: ");
    readln(s2);
    s2=strip(s2);

    write("Enter number of repeating of lengthy one: ");
    readf(" %s", &x_times);

    writeln;

    if (s1.length>s2.length)
        s3=s1;
    else
        if (s1.length<s2.length)
            s3=s2;
    else
        s3="\0".dup;


    if (s3!="\0")
        for(int i=1; i<=x_times; i++)
            writeln(i," ",s3);
    else
        for(int i=1; i<=x_times; i++){
            writeln(i," ",s1);
            writeln(i," ",s2);}


	return 0;
}
