class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.3-alpha0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3-alpha0/sentry-cli-Darwin-universal"
    sha256 "5439d1e170bd44ab70b780cddb754a0e04f8b11a1a8c30a16fa875ec1be0f3c3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3-alpha0/sentry-cli-Linux-aarch64"
        sha256 "dc847900b90b04eb9ae12a342bb68626d6a617f0dd3e806038f8db34a02e438c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3-alpha0/sentry-cli-Linux-armv7"
        sha256 "6293a4e62f0cf12d2882864f71f9d243675b7092cce32eabdbbb404c80dd7809"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3-alpha0/sentry-cli-Linux-x86_64"
        sha256 "d49103860d24e6ba630bc78bdc9da6afab34464c645a7418ff378d23d55628b6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.3-alpha0/sentry-cli-Linux-i686"
        sha256 "306384389c5685cf7174e903a1bacf804080437b89bb9335656b06eeed313e3a"
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
