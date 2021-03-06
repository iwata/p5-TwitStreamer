package TwitStreamer;
use strict;
use warnings;

use base qw/Class::Accessor::Fast/;
use Object::Container qw/container/;
use Config::Pit;
use AnyEvent::Twitter::Stream;
use Data::Dumper;

use TwitStreamer::Filter;
use TwitStreamer::View;

our $VERSION = '0.01';

__PACKAGE__->mk_accessors( qw/pit viewer filter/ );

sub new {
    my $class = shift;

    my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};

    container->register(filter => sub {
        TwitStreamer::Filter::factory($args->{filter})
    });
    container->register(view => sub {
        TwitStreamer::View::factory($args->{view})
    });

    return $class->SUPER::new({
        %$args,
    });
}

sub run {
    my $class = shift;

    my $auth     = Config::Pit::get($class->pit, require => {
        consumer_key    => 'consumer key',
        consumer_secret => 'consumer secret',
        token           => 'access token',
        token_secret    => 'access token secret'
    });

    my $cv       = AE::cv;
    my $streamer = AnyEvent::Twitter::Stream->new(
        %$auth,
        method   => 'userstream',
        on_tweet => sub {
            my $tweet = shift;
            return unless defined($tweet->{text});
            return unless container('filter')->before($tweet);
            container('view')->tweet($tweet);
            container('filter')->after($tweet);
        },
        on_error => sub {
            warn shift;
            $cv->send;
        },
        on_eof => sub {
            $cv->send;
        },
    );

    $cv->recv;
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
