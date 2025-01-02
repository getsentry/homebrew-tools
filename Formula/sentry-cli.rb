class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.40.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.40.0/sentry-cli-Darwin-universal"
    sha256 "9adabb4da300a208cf29e6d2d0afda5c60ee3e8900ab684e4c4cb13308ad5204"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.40.0/sentry-cli-Linux-aarch64"
        sha256 "9bf86f9a4df6d2016b8564f3b6f0eaa1df351fcd6810f25a0f7cb4b408dc16cb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.40.0/sentry-cli-Linux-armv7"
        sha256 "c5aac09afb99d066d99ff67a87c7d43ae52c39cf336ac0124ddd10261da6b0ec"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.40.0/sentry-cli-Linux-x86_64"
        sha256 "342d5440a7e852fc4d7621c3fa5efe302056bf0ada3f9a96fca1006b3eb297ab"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.40.0/sentry-cli-Linux-i686"
        sha256 "cb91f2a0145da32be30b072867db78765e3ff37155cf8b2f249960e067aa91ec"
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
