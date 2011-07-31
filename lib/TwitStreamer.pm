package TwitStreamer;
use strict;
use warnings;

use Class::Load;
use Config::Pit;
use AnyEvent::Twitter::Stream;
use String::CamelCase qw/camelize/;
use Data::Dumper;

our $VERSION = '0.01';

sub run {
    my ($pit, $view) = @_;

    my $viewer = 'TwitStreamer::View::'.camelize($view);

    Class::Load::load_class( $viewer );
    $viewer = $viewer->new;

    my $auth     = Config::Pit::get($pit, require => {
        consumer_key    => 'consumer key',
        consumer_secret => 'consumer secret',
        token           => 'access token',
        token_secret    => 'access token secret'
    });

    my $cv       = AE::cv;
    my $streamer = AnyEvent::Twitter::Stream->new(
        %$auth,
        method   => 'userstream',
        on_tweet => sub { $viewer->tweet(shift) },
        on_error => sub {
            warn shift;
            $cv->send;
        },
        on_eof => sub {
            $cv->send;
        },
    );

    return $cv->recv;
}

1;
__END__

=head1 NAME

TwitStreamer -

=head1 SYNOPSIS

  use TwitStreamer;

=head1 DESCRIPTION

TwitStreamer is

=head1 AUTHOR

Motonori Iwata E<lt>gootonori@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
