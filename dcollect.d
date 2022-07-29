module dcollect;

import std.stdio;
import std.conv;
import std.ascii;
import std.algorithm;
import std.range;
import std.functional;
import std.array;


/****************************************/

string strleft(const string ch, int n)
{

    string ch_sub;

    ch_sub=ch[0..n];

    return ch_sub;

}

/************************************/

string strreverse(const string ch)
{

    string ch_rev;

    for(int i=to!int(ch.length-1); i>=0; i--)
        ch_rev~=ch[i];


    return ch_rev;


}

/*********************************************/

string strright(const string ch, int n)
{

    string ch_sub1,
    ch_sub2;

    ch_sub1=strreverse(ch);

    ch_sub2=strleft(ch_sub1, n);

    ch_sub1=strreverse(ch_sub2);

    return ch_sub1;

}

/*********************************************/

string strmid(const string ch, int x, int l)
{

    string ch_sub;

    ch_sub=ch[x..(x+l)];

    return ch_sub;

}

/*********************************************/

string strtolower(const string ch)
{

    string ch_cpy;

    for(int i=0; i<ch.length; i++)
        ch_cpy~=toLower(ch[i]);

    return ch_cpy;

}

/*********************************************/

string strtoupper(const string ch)
{

    string ch_cpy;

    for(int i=0; i<ch.length; i++)
        ch_cpy~=toUpper(ch[i]);

    return ch_cpy;

}

/*********************************************/

string[] d_strtok(const string ch, const string delim)
{

    string[] tokens = ch.
    splitter!(c => delim.canFind(c)).
    filter!(not!empty).array;

    return tokens;
}
