class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.66.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.66.0/sentry-cli-Darwin-universal"
    sha256 "83bcfb42a4605ec8077ad584275b90bf340638e76759ee64eeed166543780189"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.66.0/sentry-cli-Linux-aarch64"
        sha256 "6b561fac8921215447275fab4e81bcf94832c1e9430d55fabdaacf0efdaf3a49"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.66.0/sentry-cli-Linux-armv7"
        sha256 "96867faf716976f16e6b3a02741daf3d9ecfdceae34a3615d9cfc0be73f62a95"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.66.0/sentry-cli-Linux-x86_64"
        sha256 "21208b390788ba063c937d8f858947217c625ab17dcdb0a98afdbebb2d23ee0b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.66.0/sentry-cli-Linux-i686"
        sha256 "557ff92f32884f605efa1500009aff7005d45f0ded3563cedffc2c29005efd65"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
