use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Literature' }
BEGIN { use_ok 'Literature::Controller::Productions' }

ok( request('/productions')->is_success, 'Request should succeed' );
done_testing();
