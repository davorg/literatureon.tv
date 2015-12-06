#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Plack::Builder;
 
use JSON;
 
use Plack::Debugger;
use Plack::Debugger::Storage;
 
use Plack::App::Debugger;
 
use Plack::Debugger::Panel::Timer;
use Plack::Debugger::Panel::AJAX;
use Plack::Debugger::Panel::Memory;
use Plack::Debugger::Panel::Warnings;
use Plack::Debugger::Panel::ModuleVersions;
use Plack::Debugger::Panel::Parameters;

my $debugger = Plack::Debugger->new(
    storage => Plack::Debugger::Storage->new(
        data_dir     => '/tmp/debugger_panel',
        serializer   => sub { encode_json( shift ) },
        deserializer => sub { decode_json( shift ) },
        filename_fmt => "%s.json",
    ),
    panels => [
        Plack::Debugger::Panel::Timer->new,     
        Plack::Debugger::Panel::AJAX->new, 
        Plack::Debugger::Panel::Memory->new,
        Plack::Debugger::Panel::Warnings->new,
        Plack::Debugger::Panel::ModuleVersions->new,
        Plack::Debugger::Panel::Parameters->new,
    ]
);
 
my $debugger_app = Plack::App::Debugger->new( debugger => $debugger );

use Literature;
my $app = Literature->to_app;

builder {
    mount $debugger_app->base_url => $debugger_app->to_app;
 
    mount '/' => builder {
        enable $debugger_app->make_injector_middleware;
        enable $debugger->make_collector_middleware;
        $app;
    }
};
