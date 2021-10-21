class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.70.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.70.1/sentry-cli-Darwin-universal"
    sha256 "6838ba8295dad438f7ec9651460e37e449533c367871b74f4075d1a6bbcfcbf9"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.1/sentry-cli-Linux-aarch64"
        sha256 "464d12dd6ea6cc0b07d446a95ef40803b7a4ca6b1801a6ea6ab71dd6b58b212d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.1/sentry-cli-Linux-armv7"
        sha256 "78bcdad31df27bd45c5bc724293bf512dc09d89a259a530da8c9d222767c89f7"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.1/sentry-cli-Linux-x86_64"
        sha256 "f6011ec24e1ee36f57b4f782bbcd64fa15cce6d145c567be0aacbf882bac14a8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.70.1/sentry-cli-Linux-i686"
        sha256 "914f8fe59c568344f6f644118412271bee5cd0bd20852d86d5e41cdf5c2ac7eb"
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
