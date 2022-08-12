module main;

// D programming language

import std.stdio;
import std.string;
import std.algorithm;
import dcollect;

int main(string[] args)
{

string s;
//char[] f;
string f1, f2, f3;

for(size_t i=0; args[1].strmid(i, 1)!="."; i++)
       f1~=args[1].strmid(i, 1);


for(size_t i=args[1].length-1; args[1].strmid(i, 1)!="."; i--)
       f2~=args[1].strmid(i, 1);

f3=f1~" (DUPLICATED)."~f2.strreverse;

try{
/*write("Enter file name and path: ");
readln(f);
f=strip(f);*/


File inputFile = File(args[1], "r");
File outputFile = File(f3, "w");

enum bufferSize = 8194;
inputFile.byChunk(bufferSize)	// read input in blocks of 8194 bytes
       .copy(outputFile.lockingBinaryWriter); // copy each block into output file


inputFile.close();
outputFile.close();
}


catch(Exception err){
stderr.writefln!"Warning! %s"(err.msg);
return 1;
}



return 0;

}
