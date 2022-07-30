module main;

import std.stdio;
import dcollect;
import std.string;
import std.conv;


int main(string[] args)
{

    string sentence_x,
    sent_result, token2;
    string[] sentence_tokens;

    writeln(strstring(5,"*")," No tail \"s\" ",strstring(5,"*"));
    writeln;

    write("Compose a line: ");
    sentence_x=strip(readln());

    sentence_tokens=sentence_x.d_strtok(" ,;.:!?\"'");

    foreach(token; sentence_tokens){
        token2=token.strrtrim;
        if(token2[token2.length-1]=='s')
            token2=strdel(token2, token2.length-1,1);
            sent_result~=token2~" ";}

    sent_result.writeln;

	return 0;
}
