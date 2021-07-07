class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.67.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.67.1/sentry-cli-Darwin-universal"
    sha256 "2d70acdf543cf875f184dfed7010536bafe2ccdf1b25fb672bb3c84206acdcb6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.1/sentry-cli-Linux-aarch64"
        sha256 "0e8039e8eeb5f842a8608295333150168c9a4a50e564a4314e4e5858ced8182b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.1/sentry-cli-Linux-armv7"
        sha256 "64079bee411fe2d7ca0f6ffa8d99b6340ce1249533e71a7edb2a01537d690651"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.1/sentry-cli-Linux-x86_64"
        sha256 "df14f25a45eca6e843f9b3ac5cdb4936b1f4fda88f562611a9449fb429812352"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.1/sentry-cli-Linux-i686"
        sha256 "4666529331b6bcdb89fa6e0d4e6d363ff1519665653dbf2af83e16118f51e410"
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
