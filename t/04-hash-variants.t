use v6;
use Test;
use Template::Mojo;

my %hash_param = (
  fname => 'Foo',
  lname => 'Bar',
);

# hash.tm is example as in doc section 'Passing hash'
# hash-sigilled.tm is the same but with $x changed to %x

my @cases = [
  { name => 'sigilled hash example',
    file => 'eg/hash-sigilled.tm',
  },
  { name => 'docs example',
    file => 'eg/hash.tm',
  },
];

plan @cases.elems;

my $expected = slurp "eg/hash.out";

for @cases -> $c {
  my $tmpl = slurp $c<file>;
  #diag $tmpl;
  my $output = Template::Mojo.new($tmpl).render(%hash_param);
  #diag $output;

  is $output, $expected, $c<name>;
}
