use inc::Module::Install;
name 'TwitStreamer';
all_from 'lib/TwitStreamer.pm';
readme_from 'lib/TwitStreamer.pm';
readme_markdown_from 'lib/TwitStreamer.pm';
readme_pod_from 'lib/TwitStreamer.pm';
githubmeta;

requires 'AnyEvent';
requires 'AnyEvent::Twitter';
requires 'AnyEvent::Twitter::Stream';
requires 'Growl::Any';
requires 'Plack::Middleware::Log::Minimal';
requires 'Config::Pit';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
