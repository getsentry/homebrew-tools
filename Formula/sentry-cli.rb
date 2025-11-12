class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.2/sentry-cli-Darwin-universal"
    sha256 "5c893f7bc57dbcb87ec941c08420ef07cf485e931238c83cc8fbbe2ba69fec9f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.2/sentry-cli-Linux-aarch64"
        sha256 "3853e2071623941d96c7b69a99929f1d3222a4b696f4b74c875be340aa75926a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.2/sentry-cli-Linux-armv7"
        sha256 "31fab9396e879ae49cd27aca025caa453ffbd965c2d018bd873f09d8d71a06d9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.2/sentry-cli-Linux-x86_64"
        sha256 "61b1c19345694ce31ac663e9875194d45f4f317f2b9134269605f810132df88b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.2/sentry-cli-Linux-i686"
        sha256 "a995decaad61160bfac84634b280f005003931726e14fd964f8c3cf6ce00aa20"
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
