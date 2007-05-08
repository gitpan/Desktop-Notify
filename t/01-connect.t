#!perl -T

use Test::More tests => 3;

BEGIN {
    use_ok('Desktop::Notify');
}

my $notify;

eval { $notify = new Desktop::Notify };

ok($notify, 'connect with default options');

$notify = undef;
eval { $notify = new Desktop::Notify
           (bus => Net::DBus->session,
            service => 'org.freedesktop.Notifications',
            objpath => '/org/freedesktop/Notifications',
            objiface => 'org.freedesktop.Notifications') };

ok($notify, 'connect with explicit options');
