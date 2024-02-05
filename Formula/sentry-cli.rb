class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.28.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.28.0/sentry-cli-Darwin-universal"
    sha256 "61a7d15b3727d81507af6c4961213590d1146c0942eabe917b2e73b082f5a766"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.0/sentry-cli-Linux-aarch64"
        sha256 "bdba19b5fc33b958cb24d2b0d9b470c95020b05b6afd4b0206cc34cbde540503"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.0/sentry-cli-Linux-armv7"
        sha256 "aeb0d31f283e5a2d1039f9831db7d58e1790ed52258d113bf5238abce20c2d7f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.0/sentry-cli-Linux-x86_64"
        sha256 "d740bce09bf0b93a7f425c05cf27122aa3bad6d2836e650705bdf8f3c99dc039"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.0/sentry-cli-Linux-i686"
        sha256 "e6b067cb91778fcd6785da5f29db769040e8800690352c02e550e7089b242f4d"
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
