class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.8.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.8.1/sentry-cli-Darwin-universal"
    sha256 "fb8413278fc45bb0e149db0cb201d6e1a2f20883fde4dc96b45961ab22946c3e"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.1/sentry-cli-Linux-aarch64"
        sha256 "95b4530ca3723d79def0928731534b75db0213130e8681892f19c4e57ab258f9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.1/sentry-cli-Linux-armv7"
        sha256 "a8599f00dc0ecefaaed42927a851f1c77ae8161722087278f6d26a098b63ad3e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.1/sentry-cli-Linux-x86_64"
        sha256 "f08a638e6e979a3c4f9c230bdd496dd88e7a0a0847d3e704ad8a733b189bb029"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.1/sentry-cli-Linux-i686"
        sha256 "a7ecdca1601386b9aa6574d19f7a8032fbd2d30587b1288a61d7cd79a41ca46a"
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
