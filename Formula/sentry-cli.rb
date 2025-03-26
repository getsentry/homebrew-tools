class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5/sentry-cli-Darwin-universal"
    sha256 "4226fb582bd4551dfabf4d58b0713cc66825e6fd8071e9f59c2604373b28048c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5/sentry-cli-Linux-aarch64"
        sha256 "2d4f9df6e567ffaf90aab1a6dd892b1ba9fd580edd8b9ffe7d8484e5530263eb"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5/sentry-cli-Linux-armv7"
        sha256 "79ecfd56f0153e87ca3d4adf68d759d449c2e9af3593a26fd2151d3cf4b98bb3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5/sentry-cli-Linux-x86_64"
        sha256 "ece674996d051b3d236bb3b3e2ae4c315d0aa55373fa3bcde2d6d474b7c6ba96"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.5/sentry-cli-Linux-i686"
        sha256 "61ea5059835bb2d092afbf3193400270978506102700f5ab12f90c0880efbbb8"
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
