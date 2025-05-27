class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.46.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0/sentry-cli-Darwin-universal"
    sha256 "8b90c89cbff071230457b80344c6ac7a1d04a76debefb6d702b4509605beba23"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0/sentry-cli-Linux-aarch64"
        sha256 "00b292f4edc9c13b079123b574abe73c012b7357426d34bbbf0bd0a5ab59a491"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0/sentry-cli-Linux-armv7"
        sha256 "a0c2c9eec2d9c25e99c6e9acde8b0cae295d9c9a291a6964340f5f19dd72fa21"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0/sentry-cli-Linux-x86_64"
        sha256 "a55b96a0d5391c5206c2bc028e52dd9797dc3646556291cca09d00a19707f85e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.46.0/sentry-cli-Linux-i686"
        sha256 "a87f426738a3f32dcbb84973d1b5fb6d78bdc2fa4b172236f7b3a72c30bc8c14"
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
