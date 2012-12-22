package Dist::Zilla::Plugin::TestAddStash;

use Moose;
use namespace::autoclean;

use aliased 'Dist::Zilla::Stash::TestStash';

with
    'Dist::Zilla::Role::BeforeRelease',
    'Dist::Zilla::Role::EnsureStash',
    ;

use Test::More;
use Test::Moose::More;

sub our_stash_name  { '%TestStash' }
sub our_stash_class {   TestStash  }

sub before_release {
    my $self = shift @_;

    # add stash
    pass 'in before_release()';

    my $stash = $self->our_stash;
    does_ok $stash, 'Dist::Zilla::Role::Stash';
    isa_ok  $stash, TestStash;

    return;
}


__PACKAGE__->meta->make_immutable;
!!42;
__END__
