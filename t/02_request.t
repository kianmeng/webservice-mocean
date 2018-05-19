use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my ($response, $expect) = ('', '');

my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

$response = $mocean_api->_request();
$expect = {
    'err_msg' => 'Unknown+request',
    'status' => '34'
};
is_deeply($response, $expect, 'expect unknown request response');

dies_ok {
    $mocean_api->_request(undef, undef, undef, 'gets')
} 'expect die on invalid HTTP verb';

done_testing;