use strict;
use warnings;

my $count = 0;

my $filename = "countries_capitals.txt"; 
my @random_countries = get_random_countries($filename, 3);

sub get_random_countries {
    my ($filename, $num_countries) = @_;

    open(my $fh, '<', $filename) or die "Cannot open file: $!";
    my @countries;

    while (my $line = <$fh>) {
        chomp($line);
        my ($country, $capital) = split(',', $line);
        push @countries, { country => $country, capital => $capital };
    }

    close($fh);

    my @random_indices = (0..$#countries);
    my @shuffled_indices = shuffle(\@random_indices);
    
    my @random_countries;
    foreach my $index (@shuffled_indices[0..$num_countries-1]) {
        push @random_countries, $countries[$index];
    }

    return @random_countries;
}

sub shuffle {
    my $array = shift;
    my $i = @$array;
    while ($i) {
        my $j = int(rand($i--));
        @$array[$i, $j] = @$array[$j, $i];
    }
    return @$array;
}

sub question {
    my ($country, $capital) = @_;
    print("What is the capital of $country?\n");
    my $entry = <STDIN>;
    chomp($entry);
    if ($entry eq $capital) {
        print("Correct answer!\n\n");
        $count++;
    } else {
        print("Wrong! The correct answer is $capital\n\n");
    }
}

sub score {
    print("It's all! You scored $count out of 3\n");
}

print("Hello,friend!\n");
print("It Is Countries Capitals Quiz\n");
print("This quiz has only 3 questions to test your knowledge about the countries of our planet!\n");
print("Be ready! Go!\n\n");

foreach my $country_data (@random_countries) {
    question($country_data->{country}, $country_data->{capital});
}

score();
