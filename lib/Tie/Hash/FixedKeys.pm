package Tie::Hash::FixedKeys;

use strict;
use warnings;

use Tie::Hash;
use Carp;
use vars qw(@ISA $VERSION);
require Exporter;

@ISA = qw(Tie::StdHash);

$VERSION = '1.00';

sub TIEHASH {
  my $class = shift;

  my %hash;
  @hash{@_} = (undef) x @_;

  bless \%hash, $class;
}

sub STORE {
  my ($self, $key, $val) = @_;

  unless (exists $self->{$key}) {
    croak "invalid key [$key] in hash\n";
    return;
  }
  $self->{$key} = $val;
}

sub DELETE {
  my ($self, $key) = @_;

  return unless exists $self->{$key};

  $self->{$key} = undef;
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Tie::Hash::FixedKeys - Perl extension for hashes with fixed keys

=head1 SYNOPSIS

  use Tie::Hash::FixedKeys;

  my @keys = qw(forename surename date_of_birth gender);
  my %person;
  tie %person, 'Tie;::Hash::FixedKeys', @keys;

  @person{@keys} = qw(Fred Bloggs 19700101 M);

  $person{height} = "6'"; # generates a warning

=head1 DESCRIPTION

Tie::Hash::FixedKeys is a class which changes the behaviour of Perl hashes.
Any hash which is tied to this class can only contain a fixed set of keys.
This set of keys is given when the hash is tied. For example, after running
the code:

  my @keys = qw(forename surename date_of_birth gender);
  my %person;
  tie %person, 'Tie;::Hash::FixedKeys', @keys;

the hash C<%person> can only contain the keys forename, surname, 
date_of_birth and gender. Any attempt to set a value for another key
will generate a run-time warning.

=head2 CAVEAT

The tied hash will always contain exactly one value for each of the keys
in the list. These values are initialised to C<undef> when the hash is
tied. If you try to C<delete> one if the keys, the effect is that the
value is reset to C<undef>.


=head1 AUTHOR

Dave Cross <dave@dave.org.uk>

=head1 SEE ALSO

perl(1), perltie(1).

=cut
