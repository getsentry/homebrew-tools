class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.0.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.0.2/sentry-cli-Darwin-universal"
    sha256 "c127f18911742946ad31cd8480de16d8b7ee2d12e52a5463beb21adc0830eb18"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.2/sentry-cli-Linux-aarch64"
        sha256 "17b9ee40ab2828e783c4b24ebbbff5a60e33efac4fee20aa8cd61facbeb894c9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.2/sentry-cli-Linux-armv7"
        sha256 "e63435a4c8270e7ee69697e814f61e071029cfc7ff288089b308e8a6c367eece"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.2/sentry-cli-Linux-x86_64"
        sha256 "12d43202dea35dc0eac6bb2b43323e6809f09e1795b1b905535e91b5922f8105"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.2/sentry-cli-Linux-i686"
        sha256 "734616d68582b4e3eff496e45701515f2f3194e211dd3e76851c4437e3f32dfa"
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
