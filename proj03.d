module main;

import std.stdio;
import std.string;
import dcollect;
import std.algorithm;

int main(string[] args)
{
    string temp_x;
    string[] name_a,
    name_b;

    write("Enter a 1st and 2nd name: ");
    temp_x=readln();
    temp_x=strip(temp_x);

    name_a=d_strtok(temp_x, " ");

    write("Enter a 1st and 2nd name: ");
    temp_x=readln();
    temp_x=strip(temp_x);

    name_b=d_strtok(temp_x, " ");

    swap(name_a[0], name_b[0]);

    writeln;
    writeln(name_a[0], " ",name_a[1]);
    writeln(name_b[0], " ",name_b[1]);

	return 0;
}
