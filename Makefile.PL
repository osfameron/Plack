sub author_tests  { }
sub use_test_base { warn "You need to install Test::Base to run make test from git clone" }
sub readme_from   { }
sub auto_set_repository { }

use inc::Module::Install;

name 'Plack';
all_from 'lib/Plack.pm';
readme_from 'lib/Plack.pm';

requires 'LWP::UserAgent', 5.814;           # Plack::Test
requires 'HTTP::Message', 5.814;
requires 'URI', 1.36;
requires 'Pod::Usage', 1.36;                # plackup
requires 'File::ShareDir', '1.00';          # Plack::Test::Suite
requires 'Try::Tiny';
requires 'parent';

requires 'Devel::StackTrace', 1.23;         # Middleware::StackTrace
requires 'Devel::StackTrace::AsHTML', 0.11; # Middleware::StackTrace

requires 'Filesys::Notify::Simple';         # plackup -r

requires 'Hash::MultiValue', 0.05;          # Plack::Request
requires 'HTTP::Body', 1.06;                # Plack::Request
requires 'Test::TCP', 0.11;                 # Plack::Test needs to be installed

build_requires 'Test::More', 0.88;
test_requires 'Test::Requires';

tests 't/*.t t/*/*.t';
author_tests 'xt';

install_share 'share';
install_script 'scripts/plackup';

auto_set_repository;

resources
  homepage      => "http://plackperl.org",
  bugtracker    => "https://github.com/miyagawa/plack/issues";

WriteAll;

warn <<RECOMMENDS;

  This is Plack, PSGI toolkit containing servers, middleware and utils.

  To run the default backends faster with XS extensions, as well as run some server
  backends like Prefork and FCGI, you need to install additional Perl module dependencies,
  that are included in Task::Plack bundle. You're recommended to run

    cpan> install Task::Plack

  once this distribution is installed. Enjoy!

RECOMMENDS
