class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.14.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.14.4/sentry-cli-Darwin-universal"
    sha256 "af6a30deefe29037947f55bcf7903499f28b6c505ab4a63efa59b3a41abb9ace"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.4/sentry-cli-Linux-aarch64"
        sha256 "7e3b5a5b458818dbc60f4cb78b1c7f51e8a0e4b62451e14a8a3c854496b216e5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.4/sentry-cli-Linux-armv7"
        sha256 "ac58c881567f1de0fc347f07ef80a21ad0b15fa5cea7c856a36ae60ba3d89f3b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.4/sentry-cli-Linux-x86_64"
        sha256 "61d1c1a34555920d48f2b3439a34b1825403a2f818d7b698159a7df6f7986b45"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.4/sentry-cli-Linux-i686"
        sha256 "59f4c6e2600b31a9004df921d2fcc2340545155e68b32d6bebaca3bcd3255ee3"
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
