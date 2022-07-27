module main;

import std.stdio;
import std.string;
import std.conv;
import core.stdc.stdlib;


const string [] week_days = ["sat", "thurs", "sun",
"fri", "wed", "mon","tues"];
string [3] picked_days;

void days_show();
void picked_days_input();
void user_commands();

int main(string[] args)
{

    for(int i=0; i<picked_days.length; i++)
        picked_days[i]=to!string(i);

    days_show();

    picked_days_input();

    writeln;

    user_commands();

	return 0;
}


void days_show()
{

    for(int i=0; i<week_days.length; i++)
        write(week_days[i], ", ");

    writeln(week_days[week_days.length-1], ".\n");

}

void picked_days_input()
{

    bool exist_tester;

    for(int i=0; i<picked_days.length; i++){

        pick_again:

        exist_tester=false;

        write("Pick three days: ");
        picked_days[i]=readln();
        picked_days[i]=strip(picked_days[i]);

        for(int j=0; j<week_days.length; j++){
            if (picked_days[i]==week_days[j]){
                exist_tester=true;
                break;}}


        if(!exist_tester){
            writeln("Err: out of range! pick again:");
            goto pick_again;}

        if(picked_days[0]==picked_days[1] ||
        picked_days[0]==picked_days[2] ||
        picked_days[1]==picked_days[2]){
            writeln("Err: repeated! pick again:");
            goto pick_again;}}

}

void user_commands()
{

    string x_what,
    x_command;
    bool exist_tester;

    do{

    days_show();

    write("What (e = exit)? ");
    x_what = readln();
    x_what=strip(x_what);

    if(x_what=="e")
        exit(0);

    writeln("Commands: (in, ord).");
    write("Command: ");
    x_command = readln();
    x_command = strip(x_command);

    if (x_command=="in"){

        exist_tester=false;

        for(int j=0; j<picked_days.length; j++)
            if (x_what==picked_days[j]){
                writeln("true!");
                exist_tester=true;
                break;}

        if (!exist_tester)
            writeln("false!");}


    if (x_command=="ord")

        for(int j=0; j<picked_days.length; j++)
            if (x_what==picked_days[j]){
                writeln(j+1);
                break;}

    }while(true);
}
