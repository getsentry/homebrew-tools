class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.14.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.14.0/sentry-cli-Darwin-universal"
    sha256 "6c87ece6e666cff938572a75f0d34cbf356963cafa79e20ed946e845af0a39ee"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.0/sentry-cli-Linux-aarch64"
        sha256 "5dfff8398f4282971a7a4fa2fb18e91d3d27ef23b675d7e2a183468a3db666cb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.0/sentry-cli-Linux-armv7"
        sha256 "5514761280d7fb84a81a97b22f238eb05bcb07702e4f8bc6470268e84be1f233"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.0/sentry-cli-Linux-x86_64"
        sha256 "757baab4990daaac24f989f45108baecc32b37fa72c34fec59f68f7f7e1f30e0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.14.0/sentry-cli-Linux-i686"
        sha256 "e8e29875d2d9152a970d8c667dbc817d76932dc7a017d0a3c8b2e1cb33d59f13"
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
