require "os"

class HardwareController < ApplicationController
  def index
    @os = OS.report
    @hostname = `hostname`.strip
    @cpu_count = OS.cpu_count
    @memory = `sysctl -n hw.memsize`.to_i / (1024**3) # Memoria en GB
    @disk_info = `df -h`.split("\n").drop(1)
  end
end
