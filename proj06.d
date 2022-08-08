module proj06;

import std.stdio;
import std.algorithm;
import std.array;
import dcollect;
import std.conv;



int main()
{

    int[] mixed_num;
    int[] filtered_num;
    string result_line;
    int x;

    do{
    write("Enter a number (0 => input done): ");
    readf(" %s\n", &x);
    if(x==0)
        break;
    //mixed_num.insertInPlace(mixed_num.length,x);
     mixed_num~=x;}while(true);
    
    filtered_num=mixed_num.filter!(a=>a<0).array;

    writeln;
    write("Negatives are:(");
    foreach(i; filtered_num)
        result_line~=i.to!string~", ";


    result_line=result_line.strdel(result_line.length-1,1);
    result_line=result_line.strdel(result_line.length-1,1);
    result_line~=")";
    
    result_line.writeln;
  

    return 0;
}
