use inc::Module::Install;
name 'TwitStreamer';
all_from 'lib/TwitStreamer.pm';
readme_from 'lib/TwitStreamer.pm';
readme_markdown_from 'lib/TwitStreamer.pm';
readme_pod_from 'lib/TwitStreamer.pm';
githubmeta;

requires 'String::CamelCase';
requires 'Class::Load';
requires 'Config::Pit';
requires 'Object::Container';
requires 'Web::Scraper';
requires 'AnyEvent';
requires 'AnyEvent::Twitter';
requires 'AnyEvent::Twitter::Stream';
requires 'Cocoa::Growl';
requires 'Growl::Any';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
test_requires 'Test::Exception';
auto_set_repository;
auto_include;
WriteAll;
