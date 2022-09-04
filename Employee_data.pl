
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
print Dumper $file; 
my $sum = 0;
open(my $data, '<', $file) or die "Could not open '$file' $!\n";
while (my $line = <$data>) {
 chomp($line);
  my (@rd) = split( "," , $line);
  $sum += $fields[2];
  print Dumper $rd[2];
  my $sth = $dbh->prepare("insert into employee (firstname, lastname, age , created_on, comments)
                        values
                       ('$rd[0]', '$rd[1]' ,$rd[2],'$datetime',$rd[3])");
$sth->execute() or die $DBI::errstr;


}
