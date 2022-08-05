module proj05;

import std.stdio;
import dcollect;
import arsd.terminal;

int main(string[] args)
{

    auto terminal = Terminal(ConsoleOutputType.linear);

    int x=30,
    y=3, c=1;

    for(auto i=1; i<=10; i++){

        terminal.moveTo(x,y);
        terminal.writeln(strstring(c,"*"));
        x-=2;
        y++;
        c+=4;}

	return 0;
}

