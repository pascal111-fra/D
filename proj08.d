module main;

import std.stdio;
import std.uni;
import std.string;
import std.algorithm;
import std.ascii;
import dcollect;
import std.range;


int main(string[] args)
{

    string user_word,
    sep_symbol;

again:

    write("Enter a word (\"none\" = exit): ");
    user_word=strip(readln());
    if(user_word=="none")
        return 0;

    write("Enter a seperator: ");
    sep_symbol=strip(readln());

    writeln;

    user_word.strtoupper.filter!(a=>!isNonCharacter(a)).
    map!only.joiner(sep_symbol).writeln;

    goto again;

}
