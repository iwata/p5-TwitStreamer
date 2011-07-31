package TwitStreamer::View::Base;

use strict;
use warnings;
use base qw/Class::Accessor::Fast/;
use Carp;

__PACKAGE__->mk_accessors( qw/application/ );

sub new {
    my $class = shift;

    my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
    return $class->SUPER::new({
        application => 'TwitStreamer',
        %$args,
    });
}

sub tweet { croak 'must be override' }

1;

__END__

=head1 NAME

TwitStreamer::View::Base

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head1 AUTHOR

Motonori Iwata, E<lt>gootonori@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Motonori Iwata.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
