use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Literature' }
BEGIN { use_ok 'Literature::Controller::Works' }

ok( request('/works')->is_success, 'Request should succeed' );
done_testing();
