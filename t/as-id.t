#!perl
use Test::More;
use WebIrc::Plugin::Helpers;

my $h = WebIrc::Plugin::Helpers->new;

is $h->as_id('#foo=123'), ':23foo:3d123', 'as_id #foo';
is $h->as_id('target."', '4' => '#foo'), 'target:2e:22:004:00:23foo', 'as_id target 4 #foo';
is $h->as_id('foo'), 'foo', 'as_id foo';
is $h->as_id('conver:sation', '4' => '#foo'), 'conver:3asation:004:00:23foo', 'as_id target 4 foo';

is_deeply [$h->id_as(':23foo:3d123')], ['#foo=123'], 'id_as g_foo-61123';
is_deeply [$h->id_as('target:2e:22:004:00:23foo')], ['target."', '4', '#foo'], 'id_as g_target-46-34_4_foo';
is_deeply [$h->id_as('conver:3asation:004:00:23foo')], ['conver:sation', '4', '#foo'], 'id_as s_conversation_4_foo';

done_testing;
