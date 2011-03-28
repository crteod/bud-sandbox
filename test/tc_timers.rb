require 'rubygems'
require 'test/unit'
require 'bud'
require 'timers/progress_timer'

class TT
  include Bud
  include ProgressTimer
end

class TestTimers < Test::Unit::TestCase
  def test_besteffort_delivery
    tt = TT.new
    tt.run_bg
    tt.sync_do {
      tt.set_alarm <+ [['foo', 1]]
    }
    tt.delta(:alarm)
    tt.stop_bg
  end
end
