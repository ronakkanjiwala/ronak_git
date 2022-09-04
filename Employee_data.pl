#!/usr/bin/perl
use Data::Dumper;
use DBI;
use DateTime;

my $datetime = DateTime->now;

my $driver = "mysql";
my $database = 'emplpyee';
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = 'Dha-Roy@18';

my $dbh = DBI->connect($dsn, $userid, $password) or die $DBI::errstr;

my $file = 'C:\Users\ronny\ronak.csv'; 

open(my $data, '<', $file) or die "Could not open '$file' $!\n";

while (my $line = <$data>) {
    chomp($line);
    my (@empoyee_data) = split( "," , $line);    
    eval{
        my $sth = $dbh->prepare("insert into employee (firstname, lastname, age , created_on, comments)
                        values
                       ('$empoyee_data[0]', '$empoyee_data[1]' ,$empoyee_data[2],'$datetime',$empoyee_data[3])");
        $sth->execute() or die $DBI::errstr;
    };
    if($@){
       print $@;
    }
}
