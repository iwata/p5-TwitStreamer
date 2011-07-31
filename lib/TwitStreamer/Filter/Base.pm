package TwitStreamer::Filter::Base;

use strict;
use warnings;
use utf8;
use base qw/Class::Accessor::Fast/;

sub new {
    my $class = shift;

    my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
    return $class->SUPER::new({
        %$args,
    });
}

sub before { }
sub after { }

1;
__END__

=head1 NAME

TwitStreamer::Filter::Base

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
