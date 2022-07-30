module dcollect;

import std.stdio;
import std.conv;
import std.ascii;
import std.algorithm;
import std.range;
import std.functional;
import std.array;
import std.string;


/****************************************/

string strleft(const string ch, uint n)
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

string strright(const string ch, uint n)
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
        ch_cpy~=std.ascii.toLower(ch[i]);

    return ch_cpy;

}

/*********************************************/

string strtoupper(const string ch)
{

    string ch_cpy;

    for(int i=0; i<ch.length; i++)
        ch_cpy~=std.ascii.toUpper(ch[i]);

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

/*********************************************/

auto d_strstr (const string ch, const string substr)
{

    return ch.indexOf(substr);

}

/*********************************************/

string strdel(const string ch, uint x, uint l )
{

    string l_ch=ch.strleft(x);
    string r_ch=ch.strright(to!uint(ch.length-(x+l)));

    return (l_ch~=r_ch);

}

/*********************************************/

string strdel(const string ch, const string substr)
{

    string ch_cpy=ch;
    auto substr_index=ch_cpy.d_strstr(substr);

    ch_cpy=ch_cpy.strdel(to!uint(substr_index), to!uint(substr.length));

    return ch_cpy;

}

/*********************************************/

string strinsert(const string ch, const string substr, uint x)
{

    string l_ch=ch.strleft(x);
    string r_ch=ch.strdel(0, x);
    string merge_ch=l_ch~substr~r_ch;

    return merge_ch;

}

/*********************************************/

string strltrim(const string ch)
{

    string ch_cpy=ch;

    while(ch_cpy.strleft(1)==" ")
        ch_cpy=ch_cpy.strdel(0,1);

    return ch_cpy;

}

/*********************************************/

string strrtrim(const string ch)
{

    string ch_cpy=ch.strreverse;

    while(ch_cpy.strleft(1)==" ")
        ch_cpy=ch_cpy.strdel(0,1);

    return ch_cpy.strreverse;

}

/*********************************************/

string strreplace(const string ch, const string old_str, const string new_str)
{

    string ch_cpy=ch;
    auto old_index = to!uint(ch_cpy.d_strstr(old_str));

    ch_cpy=ch_cpy.strdel(old_index, to!uint(old_str.length));
    ch_cpy=ch_cpy.strinsert(new_str, old_index);

    return ch_cpy;


}

/*********************************************/

string strreplaceall(const string ch, const string old_str, const string new_str)
{

    string ch_cpy=ch;

    while(ch_cpy.d_strstr(old_str)>=0)
        ch_cpy=ch_cpy.strreplace(old_str, new_str);

    return ch_cpy;
}

/*********************************************/

string strdelall(const string ch, const string substr)
{

    string ch_cpy=ch;

    while(ch_cpy.d_strstr(substr)>=0)
        ch_cpy=ch_cpy.strdel(substr);

    return ch_cpy;

}

/*********************************************/

string strstring(uint x, const string c)
{

    string ch;

    for(int i=1; i<=x; i++)
        ch~=c;

    return ch;
}

/*********************************************/

string strspace(uint x)
{

    return strstring(x, " ");

}

