module main;

import std.stdio;
import std.array;
import std.random;
import std.algorithm;
import core.stdc.stdlib;



int main(string[] args)
{
    const bool FACE=true;
    const bool TAIL=false;

    size_t c_num,
    lucky, agreed_faces;

    int your_score;

    bool[] coin;
    bool[] faces_test;

    do{

    write("Enter coin number to play with (n <= 0 => exit): ");
    readf(" %s\n", &c_num);
    if(c_num<=0)
        exit(0);

    for(size_t i=1; i<=c_num; i++){
        lucky=uniform(0,2);
        if(lucky==0)
            coin.insertInPlace(coin.length,TAIL);
        else
            coin.insertInPlace(coin.length,FACE);}

    write("How many faces agree each other : ");
    readf(" %s\n", &agreed_faces);

    faces_test=coin.filter!(a=>a==FACE).array;

    if(agreed_faces==faces_test.length){

        writeln("Right! you win 10 points.");
        your_score+=10;
        writeln("Your score: ", your_score);}

    else{

        writeln("Wrong! you lose 10 points.");
        your_score-=10;
        writeln("Your score: ", your_score);}

    foreach(x; coin)
        if(x==FACE)
            write("Face! ");
        else
            write("Tail! ");

    writeln;
    coin.length=0;

    }while(true);

	return 0;
}
