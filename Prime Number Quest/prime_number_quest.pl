use strict;
use warnings;

print "Hello! Let's check for prime numbers.\n";
main(); 

sub main {

    print "Enter the step: ";
    my $step = <STDIN>;
    chomp ($step);

    print "Enter the beginning of the segment: ";
    my $start = <STDIN>;
    chomp ($start);

    print "Enter the end of the segment: ";
    my $end = <STDIN>;
    chomp ($end);

    my ($prime1, $prime2) = find_prime_pair($start, $end, $step);

    if ($prime1 && $prime2) {
        print "A pair of primes with a step of $step in the interval from $start to $end: ($prime1, $prime2)\n";
    } else {
        print "There is no pair of prime numbers with a given step on the specified segment.\n";
    }

    print "Do you want to check other set of numbers? [y/n]";
    my $new_try = <STDIN>;
    chomp($new_try);
    
    if ($new_try eq 'y') {
        main();
    } elsif($new_try ne 'n') {
        print "Uncorrect enter. The programm is ending.\n";
    }
}

sub is_prime {
    my $num = shift;
    return 0 if $num <= 1;
    for my $i (2..int(sqrt $num)) {
        return 0 if $num % $i == 0;
    }
    return 1;
}

sub find_prime_pair {
    my ($start, $end, $step) = @_;
    for my $i ($start..$end-$step) {
        if (is_prime($i) && is_prime($i + $step)) {
            return ($i, $i + $step);
        }
    }
    return;
}

