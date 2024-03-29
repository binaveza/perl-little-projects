use strict;
use warnings;

print ("Countries Capitals Quiz\n");
my $count = 0;

sub question {
    print("What is the capital of England?\n");
    my $entry = <STDIN>;
    chomp($entry);
    if($entry eq "London") {
        print("Correct answer!\n");
        $count++;
        question2();
    }else{
        print("Wrong!\n");
        question2();
    }
}

sub question2 {
    print("What is the capital of France?\n");
    my $entry = <STDIN>;
    chomp($entry);
    if($entry eq "Paris") {
        print("Correct answer!\n");
        $count++;
        question3();
    }else{
        print("Wrong!\n");
        question3();
    }
}

sub question3 {
    print("What is the capital of Thailand?\n");
    my $entry = <STDIN>;
    chomp($entry);
    if($entry eq "Bangkok") {
        print("Correct answer!\n");
        $count++;
        score();
    }else{
        print("Wrong!\n");
        score();
    }
}

sub score {
    print ("You scored ", $count, " out of 3", "\n");
}

question();