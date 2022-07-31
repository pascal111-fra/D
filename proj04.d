module main;

import std.stdio;
import dcollect;
import std.string;
import std.conv;
import std.algorithm;


int main(string[] args)
{

    string sentence_x,
    sent_result, temp;
    const string[] fixed=["is", "has", "was"];
    const string[] delim=[".", "?","'",";","\"",":",";","!",","];
    string[] sentence_tokens;

    writeln(strstring(5,"*")," No tail \"s\" ",strstring(5,"*"));
    writeln;

    write("Compose a line: ");
    sentence_x=strip(readln());

    sentence_tokens=sentence_x.d_strtok(" ");

    foreach(token; sentence_tokens){

        token=token.strrtrim;
        temp="";

        if(token.canFind("s")){


            while(delim.canFind(to!string(token[token.length-1]))){
                temp~=token[token.length-1];
                token=token.strdel(token.length-1,1);}

            if(token[token.length-1]=='s' &&
            !fixed.canFind(token))
                token=token.strdel(token.length-1,1);}


            sent_result~=token~temp~" ";}

    //sent_result~=".";

    sent_result.writeln;

	return 0;
}
