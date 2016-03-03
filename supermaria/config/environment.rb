require 'bundler'
require 'benchmark'

$stdout.print 'Loading Bundler: '
bm = Benchmark.measure { |_| Bundler.setup }
$stdout.print "loaded in #{bm.total.round(3)}s\n"

require_relative File.dirname(__FILE__) + '/../lib/kata1'
